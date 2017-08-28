// Variables Ethernet.
byte mymac[] = { 0x74,0x69,0x69,0xAA,0x30,0x20};
byte myip[] = { 192,168,8,152 };
byte gwip[] = { 192,168,8,1 };
byte hisip[] = { 192,168,8,222 };
byte dnsip[] = { 8,8,8,8 };
byte netmask[] = { 255,255,255,0 };
byte hisport=80;
static byte session;
Stash stash;
byte Ethernet::buffer[514];

char RUTA_ENVIO[] = "enviarpost.php";
char RUTA_TIEMPO[] = "tiempo.php";

// Pagina web de configuracion.
const char pagina[] PROGMEM =
"HTTP/1.1 200 OK\r\n"
"Content-Type: text/html\r\n"
"Retry-After: 600\r\n"
"\r\n"
"<!DOCTYPE HTML>"
"<html>"
"<body>"
"<form action='config'>"
"<table>"
"<tr>"
"<td>Gateway</td>"
"<td>IP asignada</td>"
"<td>Mascara</td>"
"<td>IP del Servidor</td>"
"<td>Puerto</td>"
"</tr>"
"<tr>"
"<td><input name=gwip type=text></td>"
"<td><input name=myip type=text></td>"
"<td><input name=netmask type=text></td>"
"<td><input name=hisip type=text></td>"
"<td><input name=port type=number></td>"
"</tr>"
"</table>"
"<input type=submit value=Guardar>"
"</form>"
"</body>"
"</html>"
;

//Cuando se finaliza la configuracion se muestra esto
const char pagina_config[] PROGMEM =
"HTTP/1.1 200 OK\r\n"
"Content-Type: text/html\r\n"
"\r\n"
"Configuraci&oacute;n exitosa. No reinicie esta p&aacute;gina."
;

void imprimirIntento(byte intentos){
  lcd.setCursor(9,1);
  lcd.print(F("("));
  lcd.print(intentos);
  lcd.print(F(")..."));
  #if SERIAL_DEBUG
    Serial.println(F("Haciendo ping..."));
  #endif
}

// Chequear la conexion a una ip
// mediante el uso de pings.
bool chequearConexion(byte *ip,void (*callBack)(byte)){
  uint32_t timer=0;
  uint8_t intentos=1;

  while(intentos<=10){
    word len = ether.packetReceive();
    ether.packetLoop(len);

    // Si recibe algo del ping, se cierra el bucle.
    if (len > 0 && ether.packetLoopIcmpCheckReply(ip)) break;
    
    // Si pasaron mas de 5 segundos del ultimo intento,
    // intenta nuevamente.
    if (millis() - timer >= 5000) {
      callBack(intentos);
      ether.clientIcmpRequest(ip);
      timer = millis();
      intentos++;
    }
  }
  if(intentos<=10)return true;
  return false;
}

// Actualizar datos del dispositivo desde una URI.
// Nota: el formato de la uri es parametro1=valor1&parametro2=valor2
static void actualizarDatosDesdeURI(char* uri){
  char str[16];
  if(ether.findKeyVal(uri,str, sizeof str,"myip"))ether.parseIp(myip,str);
  if(ether.findKeyVal(uri,str, sizeof str,"gwip"))ether.parseIp(gwip,str);
  if(ether.findKeyVal(uri,str, sizeof str,"hisip"))ether.parseIp(hisip,str);
  if(ether.findKeyVal(uri,str, sizeof str,"netmask"))ether.parseIp(netmask,str);
  if(ether.findKeyVal(uri,str, sizeof str,"port"))hisport=atoi(str);
}

static void enviarAlServidor(byte codigo[9]){
  byte sd = stash.create();
  
  // Imprime el tiempo en el Stash.
  stash.print("tiempo=");
  if(codigo[2]<10)stash.print("0");
  stash.print(codigo[2]);
  stash.print("/");
  if(codigo[1]<10)stash.print("0");
  stash.print(codigo[1]);
  stash.print("/");
  stash.print(codigo[0]);
  stash.print("-");
  if(codigo[3]<10)stash.print("0");
  stash.print(codigo[3]);
  stash.print(":");
  if(codigo[4]<10)stash.print("0");
  stash.print(codigo[4]);

  // Imprime el codigo de la tarjeta en el Stash.
  stash.print("&codigo=");
  for(int i=5;i<8;i++){
    stash.print(codigo[i]);
    stash.print("-");
  }
  stash.print(codigo[8]);

  // Imprime la IP en el Stash.
  stash.print("&ip=");
  stash.println(myip[3]);
  
  // Guarda el Stash y obtiene su tamaño.
  stash.save();
  int stash_size = stash.size();
  
  // Formatea el Stash como una peticion POST de HTTP.
  Stash::prepare(PSTR(
    "POST http://$D.$D.$D.$D/$S HTTP/1.0" "\r\n"
    "Content-Type: application/x-www-form-urlencoded" "\r\n"
    "Content-Length: $D" "\r\n"
    "\r\n"
    "$H"),
  hisip[0], hisip[1], hisip[2], hisip[3], RUTA_ENVIO, stash_size, sd);
  
  session = ether.tcpSend();
}

// Enviar una peticion al servidor para obtener la fecha actual.
static void pedirTiempo(){
  byte sd = stash.create();
  stash.save();
  
  // Formatea el Stash como una peticion GET de HTTP
  Stash::prepare(PSTR(
    "GET http://$D.$D.$D.$D/$S HTTP/1.0" "\r\n"
    "\r\n"), hisip[0], hisip[1], hisip[2], hisip[3], RUTA_TIEMPO, sd);

  session = ether.tcpSend();
}

// Mostrar la configuracion de la placa Ethernet.
static void mostrarConfiguracionEthernet(bool mostrarMac){
  ether.printIp("IP:       ", myip);
  ether.printIp("GW:       ", gwip);
  ether.printIp("SRV:      ", hisip);
  ether.printIp("DNS:      ", dnsip);
  ether.printIp("NETMASK:  ", netmask);
  if(!mostrarMac)return;
  Serial.print(F("MAC:   "));
  for(byte i=0; i<=4; i++){
    Serial.print(ether.mymac[i],HEX);
    Serial.print(F(":"));
  }
  Serial.println(ether.mymac[5],HEX);
}
