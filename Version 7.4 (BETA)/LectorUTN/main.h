#include "setup.h"
#include "lcd.h"
#include "ethernet.h"
#include "memoria.h"
#include "reloj.h"
#include "rfid.h"
#include "init.h"

// Rutear el proceso a ejecutar dependiendo
// de la peticion de entrada.
static void routerHTTP(char* cbuffer){
  if(strstr(cbuffer, "GET / ") != 0){
    memcpy_P(ether.tcpOffset(), pagina, sizeof pagina);
    ether.httpServerReply(sizeof pagina - 1);
  }else if(strstr(cbuffer, "GET /config?") != 0){
    actualizarDatosDesdeURI(cbuffer+6);
    memcpy_P(ether.tcpOffset(), pagina_config, sizeof pagina_config);
    ether.httpServerReply(sizeof pagina_config - 1);
    #if SERIAL_DEBUG
      Serial.println("Nueva config:");
      ether.printIp("IP:       ", myip);
      ether.printIp("GW:       ", gwip);
      ether.printIp("SRV:      ", hisip);
      ether.printIp("DNS:      ", dnsip);
      ether.printIp("NETMASK:  ", netmask);
    #endif
    Serial.println(cbuffer);
    
    guardarEnEEPROM();

    //CONFIGURA EL INDICE EN 0 (BORRAR TODOS LOS DATOS)
    indice = 0;
    guardarIndice();
    desactivarModoConfig();
  }
}

static void procesarLectura(){
  byte codigo_aux[4];
  byte fecha_aux[5];

  for (int i = 0; i < rfid.uid.size; i++) 
  {
    codigo_aux[i] = rfid.uid.uidByte[i];
    Serial.print(codigo_aux[i], HEX);
  }
  Serial.println();
  
  fechayHoraActual(fecha_aux);

  memcpy(&codigo_actual,&fecha_aux,5);
  memcpy(&codigo_actual[5],&codigo_aux,4);

  rfid.PICC_HaltA();
  rfid.PCD_StopCrypto1();

  // Si la tarjeta es la misma que fue leida la ultima vez se hace un "continue" del loop.
  if(codigo_igual(codigo_actual,ultimo_codigo))
  {
    #if SERIAL_DEBUG
      Serial.println(F("La tarjeta es la ultima leida."));
    #endif
    return;
  }

  //Si la tarjeta no fue la ultima leida.
  #if SERIAL_DEBUG
    Serial.println(F("Lectura exitosa. Guardando en memoria."));
  #endif

  memcpy(&ultimo_codigo,&codigo_actual,9);
  
  if (escribirCodigoMemoria(ultimo_codigo))
  {
    indice++;
    guardarIndice();
  
    tone(PIN_BUZZER,880,500);
    
    #if SERIAL_DEBUG
      Serial.print(F("Indice: "));
      Serial.println(indice);
    #endif
    
    cambiarLineaLCD("ASISTENCIA OK");
  }
  else
  {
    tone(PIN_BUZZER,440,2000);
    cambiarLineaLCD("ERROR");
  }
}

char paqueteEthernet(){
  return ether.packetLoop(ether.packetReceive());
}

static void routerModo(char pos){
  static uint32_t timerHora;
  static uint32_t timerEnvio;
  static uint32_t timerConfHora;
  static uint8_t intentosHora=0;
  static uint8_t intentosEnvio=0;

  //Maquina de estados principal
  switch(modoActual){
    case MODO_CONFIG:
      {
        // Si el sistema esta en "modo config" y no se recibio nada,
        // se cierra la funcion.
        if(!pos)return;
        // Si se recibio algo, se rutea en base a la ruta recibida en la peticion HTTP.
        routerHTTP((char*)Ethernet::buffer + pos);
      }
      break;
    case INICIANDO_MODO_LECTURA:
      {
        cambiarLineaLCD("Pase una tarjeta");
        cambiarModo(MODO_LECTURA);
      }
    case MODO_LECTURA:
      {
        if (millis()-timerConfHora>7200000){
          timerConfHora=millis();    
          cambiarModo(INICIANDO_MODO_HORA);
        } 
   
        if ((indice>0) and entreHoras(2,3) and entreMinutos(minutosCalculados,minutosCalculados+5)){
          cambiarModo(INICIANDO_MODO_ENVIO);
          return;
        }
        if(!chequearLectura())return;

        procesarLectura();
        
        delay(500);
        cambiarModo(INICIANDO_MODO_LECTURA);
      }
      break;
    case INICIANDO_MODO_ENVIO:
      {
        #if SERIAL_DEBUG
          Serial.println(F("Modo envio de datos activado."));
        #endif
        cambiarLineaLCD("NO DISPONIBLE");
        intentosEnvio++;
        if(leerCodigoMemoria()){
          enviarAlServidor(data);
          #if SERIAL_DEBUG
            Serial.println(F("EnviarAlServidor"));
          #endif
        }
        cambiarModo(MODO_ENVIO);
      }
    case MODO_ENVIO:
      {
        if(indice==0){
          intentosEnvio=0;
          cambiarModo(INICIANDO_MODO_LECTURA);
          return;
        }
        const char* reply = ether.tcpReply(session);
        if(reply!=0){
          Serial.println(reply);
          if(strstr(reply,"SI")!=0){
            indice--;
            guardarIndice();
          }
          return;
        }
        if(millis()-timerEnvio>2000){
          timerEnvio=millis();
          if(intentosEnvio>3){
            intentosEnvio=0;
            cambiarModo(INICIANDO_MODO_LECTURA);
            return;
          }
          cambiarModo(INICIANDO_MODO_ENVIO);
        }
      }
      break;
    case INICIANDO_MODO_HORA:
      {
        #if SERIAL_DEBUG
          Serial.println(F("Obteniendo tiempo"));
        #endif
        cambiarLineaLCD("Actualizando...");
        pedirTiempo();
        intentosHora++;
        cambiarModo(MODO_HORA);
      }
    case MODO_HORA:
      {
        const char* reply = ether.tcpReply(session);
        if(reply!=0){
          char* url = strstr(reply, "TARGET");
          if(url!=0){
            cambiarTiempo(url+6);
            intentosHora=0;
            cambiarModo(INICIANDO_MODO_LECTURA);
            #if SERIAL_DEBUG
              Serial.println(F("HoraActualizada"));
            #endif
            return;
          }
        }
        if(millis()-timerHora>1000){
          timerHora=millis();
          if(intentosHora>6){
            intentosHora=0;
            cambiarModo(INICIANDO_MODO_LECTURA);
             #if SERIAL_DEBUG
              Serial.println(F("FalloAlActualizaHora"));
            #endif
            return;
          }else{
            cambiarModo(INICIANDO_MODO_HORA);
            return;
          }
        }
      }
      break;
    default:
      cambiarModo(INICIANDO_MODO_LECTURA);
      break;
  }
}
