//Librerias
#include <EEPROM.h>
#include <SPI.h>
#include <Wire.h>
#include <MFRC522.h>
#include <EtherCard.h>
#include <LiquidCrystal_SR_LCD3.h>
#include <DS3231.h>

//Opciones de compilacion
#define SERIAL_DEBUG      1

//Pines al arduino NANO
#define PIN_MODO_CONFIG   2
#define PIN_LCD_STROBE    3
#define PIN_LCD_DATA      4
#define PIN_LCD_CLOCK     5
#define PIN_MFRC522_RST   6
#define PIN_MFRC522_SDA   8
#define PIN_BUZZER        9
#define PIN_ETH_SDA       10

// Se usa una enumeracion de modos para definir que proceso
// debe ejecutarse en el dispositivo.
enum Modo {
  MODO_CONFIG,
  MODO_LECTURA,
  MODO_ENVIO,
  MODO_HORA,
  INICIANDO_MODO_LECTURA,
  INICIANDO_MODO_ENVIO,
  INICIANDO_MODO_HORA
};

// El modo actual determina que proceso se debe estar ejecutando.
Modo modoActual=INICIANDO_MODO_HORA;

// Codigos de las ultimas tarjetas RFID leidas.
byte codigo_actual[9];
byte ultimo_codigo[9];

int indice=0;

// Reinicia el sistema por software.
static void reiniciarSistema(){
  asm volatile("jmp 0");
}

// Cambiar el modo actual.
static void cambiarModo(Modo modo){
  modoActual=modo;
}
