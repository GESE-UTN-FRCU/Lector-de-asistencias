static void activarModoConfig () {
  EEPROM.write(ADDR_MODO_CONFIG,true);
  Serial.print("ModoConfig");
  delay(2000);
  reiniciarSistema();
}

static void desactivarModoConfig () {
  EEPROM.write(ADDR_MODO_CONFIG,false);
  Serial.print("ModoNoConfig");
  delay(2000);
  reiniciarSistema();
}

static void iniciarComponentes(){
  Wire.begin();
  Serial.begin(57600);
  SPI.begin();
  rfid.PCD_Init();  
  lcd.begin(16,2);
  
  pinMode(PIN_ETH_SDA, OUTPUT);
  digitalWrite(PIN_ETH_SDA,HIGH);
  
  pinMode(PIN_MFRC522_SDA, OUTPUT);
  digitalWrite(PIN_MFRC522_SDA,HIGH);

  pinMode(PIN_MODO_CONFIG, INPUT);

  // Obtiene de memoria EEPROM el ultimo numero de la ip.
  byte ultimoValorIp = EEPROM.read(ADDR_MYIP+3);
  // Asignar a "minutos calculados" un numero aleatorio
  // en base al ultimo numero de la ip.
  minutosCalculados=ultimoValorIp/5;

  //Lee el indice guardado en memoria y lo guarda en la varible indice
  leerIndice();
  
  #if SERIAL_DEBUG
    Serial.print(F("Config: "));
    Serial.println(EEPROM.read(ADDR_MODO_CONFIG));
    Serial.print(F("Ind: "));
    Serial.println(indice);
    Serial.print(F("MinCalc: "));
    Serial.println(minutosCalculados);
  #endif


  // Iniciar la pantalla LCD.
  iniciarLCD();
  iniciarLogoLCD();

  // La mac del dispositivo tiene asignado en el ultimo valor
  // el numero del ultimo valor de la direccion ip.
  mymac[5]=ultimoValorIp;

  // Chequear estado del pulsador.
  // Si esta apretado activar MODO_CONFIG.
  byte pulsador;
  delay(2000);
  pulsador=digitalRead(PIN_MODO_CONFIG);
  if (pulsador==HIGH) activarModoConfig();
  
  // Verificar que funcione correctamente la placa Ethernet.
  if (ether.begin(sizeof Ethernet::buffer, mymac, PIN_ETH_SDA) == 0){
    #if SERIAL_DEBUG
      Serial.println(F("FailedEthernetController"));
    #endif
    cambiarLineaLCD("Error de HW");
    while(1);
  }
}

static void iniciarSistema(){
  // Iniciar todos los componentes físicos del sistema.
  iniciarComponentes();
  
  if(chequearModoConfig()){
    #if SERIAL_DEBUG
      Serial.println(F("Modo config activado"));
    #endif
    cambiarLineaLCD("Modo config.");
  }else{
    #if SERIAL_DEBUG
      Serial.println(F("Modo config desactivado"));
    #endif
    cambiarLineaLCD("Iniciando...");
    // Iniciar en 0 los valores de los codigos de las tarjetas.
    for(byte i=0;i<sizeof(codigo_actual);i++){
      codigo_actual[i]=0;
      ultimo_codigo[i]=0;
    }
    // Cargar la configuracion desde la EEPROM.
    cargarDesdeEEPROM();
  }
  
  // Asignar la configuracion de la placa Ethernet usando
  // los valores estaticos extraidos de la EEPROM.
  ether.staticSetup(myip, gwip, dnsip, netmask);
  
  delay(1000);

  // Asignar la ip del servidor a la placa Ethernet.
  ether.copyIp(ether.hisip, hisip);

  #if SERIAL_DEBUG
    mostrarConfiguracionEthernet(true);
    mostrarConfiguracionHora();
  #endif

  if(!chequearModoConfig()){
    // Si el sistema esta en MODO_CONFIG se chequea la conexion
    // haciendo ping al servidor.
    if(chequearConexion(ether.hisip,imprimirIntento)){
      // Si se verifica la conexion al servidor se muestra que el sistema
      // esta conectado y sigue funcionando correctamente.
      while(ether.clientWaitingGw())ether.packetLoop(ether.packetReceive());
      cambiarLineaLCD("Conectado");
    }else{
      // Si el sistema no puede verificar la buena 
      cambiarLineaLCD("Verificar conex.");
      #if SERIAL_DEBUG
        Serial.print(F("NoConex"));
      #endif
      delay(2000);
      reiniciarSistema();
    }
  }else{
    cambiarModo(MODO_CONFIG);
  }
}
