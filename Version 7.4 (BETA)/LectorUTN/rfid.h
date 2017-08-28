// Variables de uso de la placa RFID.
MFRC522 rfid(PIN_MFRC522_SDA, PIN_MFRC522_RST);
MFRC522::PICC_Type piccType;

// Verificar que se leyo una tarjeta en la placa RFID.
bool chequearLectura(){
  //Chequea si hay una tarjeta para leer
  if (!rfid.PICC_IsNewCardPresent()||!rfid.PICC_ReadCardSerial()) return false;
  //Chequea el tipo de tarjeta
  piccType = rfid.PICC_GetType(rfid.uid.sak);
  if (piccType != MFRC522::PICC_TYPE_MIFARE_1K) {
    #if SERIAL_DEBUG
      Serial.println(F("Tipo de tarjeta invalido."));
    #endif
    return false;
  }
  return true;
}

// Comparar si dos codigos son iguales.
bool codigo_igual(byte codigo1[],byte codigo2[]){
  for (int i=0;i<=8;i++) if (codigo1[i]!=codigo2[i]) return false;
  return true;
}
