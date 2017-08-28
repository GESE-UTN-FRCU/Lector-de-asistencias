//Variables del reloj DS3231.
DS3231 Clock;
int desplazamiento=9;
byte data[9];
byte minutosCalculados;
bool h12,PM;
int timerHora;

void i2c_eeprom_write_byte(int deviceaddress,unsigned int eeaddress,byte data){
  int rdata = data;
  Wire.beginTransmission(deviceaddress);
  Wire.write((int)(eeaddress >> 8)); // MSB
  Wire.write((int)(eeaddress & 0xFF)); // LSB
  Wire.write(rdata);
  Wire.endTransmission();
}

void i2c_eeprom_write_page(int deviceaddress,unsigned int eeaddresspage,byte* data,byte length){
  Wire.beginTransmission(deviceaddress);
  Wire.write((int)(eeaddresspage >> 8)); // MSB
  Wire.write((int)(eeaddresspage & 0xFF)); // LSB
  byte c;
  for ( c = 0; c < length; c++) Wire.write(data[c]);
  Wire.endTransmission();
}

byte i2c_eeprom_read_byte(int deviceaddress,unsigned int eeaddress){
  byte rdata = 0xFF;
  Wire.beginTransmission(deviceaddress);
  Wire.write((int)(eeaddress >> 8)); // MSB
  Wire.write((int)(eeaddress & 0xFF)); // LSB
  Wire.endTransmission();
  Wire.requestFrom(deviceaddress,1);
  if (Wire.available()) rdata = Wire.read();
  return rdata;
}

void i2c_eeprom_read_buffer(int deviceaddress,unsigned int eeaddress,byte *buffer,int length){
  Wire.beginTransmission(deviceaddress);
  Wire.write((int)(eeaddress >> 8)); // MSB
  Wire.write((int)(eeaddress & 0xFF)); // LSB
  Wire.endTransmission();
  Wire.requestFrom(deviceaddress,length);
  int c = 0;
  for ( c = 0; c < length; c++ ) if (Wire.available()) buffer[c] = Wire.read();
}

// Guarda en memoria el ultimo indice.
bool escribirCodigoMemoria(byte codigo[9]){
  int addr=0,i;
  
  Serial.println(F("EscribiendoEnMemoria:"));
  for(i=0;i<9;i++){
    i2c_eeprom_write_byte(0x57,(indice*desplazamiento)+i,codigo[i]);
    Serial.print(codigo[i]);
    delay(10); //add a small delay
  }
  Serial.print('\n');
  return(desplazamiento==i); 
}

//Lee el ultimo codigo en memoria (USA EL INDICE)
bool leerCodigoMemoria(){
  int i,b;
  
  Serial.println("LeyendoEnMemoria:");
  for(i=0;i<9;i++){     
    data[i] = i2c_eeprom_read_byte(0x57, ((indice-1)*desplazamiento)+i); //access an address from the memory
    Serial.print(data[i]); 
    delay(10); 
  }
  Serial.println("");
  return(desplazamiento==i);
}

void fechayHoraActual(byte destino[5]){
  bool h12,PM;
  byte hour,dow,second;
  Clock.getTime(destino[0],destino[1],destino[2],dow,hour,destino[4],second);
  destino[3]=Clock.getHour(h12, PM);
}

bool entreHoras(int hora1, int hora2){
  return ((Clock.getHour(h12,PM)>=hora1) and (Clock.getHour(h12,PM)<=hora2));
}

bool entreMinutos(int minuto1, int minuto2){
  return ((Clock.getMinute()>=minuto1) and (Clock.getMinute()<=minuto2));
}

static void cambiarTiempo(char* tiempo){
  char str[4];
  if(ether.findKeyVal(tiempo,str, sizeof str,"year"))Clock.setYear(atoi(str));
  if(ether.findKeyVal(tiempo,str, sizeof str,"month"))Clock.setMonth(atoi(str));
  if(ether.findKeyVal(tiempo,str, sizeof str,"date"))Clock.setDate(atoi(str));
  if(ether.findKeyVal(tiempo,str, sizeof str,"hour"))Clock.setHour(atoi(str));
  if(ether.findKeyVal(tiempo,str, sizeof str,"minute"))Clock.setMinute(atoi(str));
}

static void mostrarConfiguracionHora(){
  byte fechaYhora[5];
  
  ether.hisport=hisport;

  fechayHoraActual(fechaYhora);

  Serial.print(F("FechaYHora:"));

  for (int i=0;i<sizeof(fechaYhora);i++)
  {
    Serial.print(F("-"));
    Serial.print(fechaYhora[i]);

  }
  Serial.println(F("-"));
}
