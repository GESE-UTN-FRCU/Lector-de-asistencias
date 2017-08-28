//Direcciones de la EEPROM ARDUINO
#define ADDR_MODO_CONFIG  0
#define ADDR_MYIP         2
#define ADDR_GWIP         6
#define ADDR_HISIP        10
#define ADDR_NETMASK      14
#define ADDR_HISPORT      18
#define ADDR_INDICE       19

static void leerIndice(){
  int B;

  indice = EEPROM.read(ADDR_INDICE) << 8; //BYTE ALTO
  B = EEPROM.read(ADDR_INDICE + 1); //BYTE BAJO
  indice = indice | B;
}

static void guardarIndice(){
  byte H,L;

  H = highByte(indice);
  L = lowByte(indice);
  EEPROM.write(ADDR_INDICE, H);
  EEPROM.write(ADDR_INDICE + 1, L);
}

bool chequearModoConfig(){
  static bool verificado=false;
  static bool estado=false;
  if(!verificado)estado=EEPROM.read(ADDR_MODO_CONFIG);
  return estado;
}

// Cargar datos de memoria EEPROM.
static void cargarDesdeEEPROM () {
  for(uint8_t i=0; i<4; i++){
    myip[i]=EEPROM.read(ADDR_MYIP+i);
    gwip[i]=EEPROM.read(ADDR_GWIP+i);
    hisip[i]=EEPROM.read(ADDR_HISIP+i);
    netmask[i]=EEPROM.read(ADDR_NETMASK+i);
  }
  hisport=EEPROM.read(ADDR_HISPORT);
}

static void guardarEnEEPROM () {
  for(uint8_t i=0; i<4; i++){
      EEPROM.write(ADDR_MYIP+i,myip[i]);
      EEPROM.write(ADDR_GWIP+i,gwip[i]);
      EEPROM.write(ADDR_HISIP+i,hisip[i]);
      EEPROM.write(ADDR_NETMASK+i,netmask[i]);
  }
  EEPROM.write(ADDR_HISPORT,hisport);
}
