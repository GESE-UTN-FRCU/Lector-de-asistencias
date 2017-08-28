// Lista de caracteres agregados.
#define CHAR_UTN 0

// Variables de la pantalla LCD.
LiquidCrystal_SR_LCD3 lcd(PIN_LCD_DATA, PIN_LCD_CLOCK, PIN_LCD_STROBE);
static byte logo_utn[8] = {0b10101, 0b10101, 0b01110, 0b11111, 0b01110, 0b10101, 0b10101};

// Iniciar pantalla LCD.
static void iniciarLCD(){
  lcd.createChar(CHAR_UTN, logo_utn);
  lcd.home();
  lcd.clear();
  lcd.setCursor(0,0);
}

// Imprimir logo en la pantalla UTN.
static void iniciarLogoLCD(){
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(char(CHAR_UTN));
  lcd.print(F("UTN"));
}

// Cambiar linea de texto de la pantalla LCD.
static void cambiarLineaLCD(const char *linea){
  lcd.setCursor(0,1);
  lcd.print("                ");
  lcd.setCursor(0,1);
  lcd.print(linea);
}
