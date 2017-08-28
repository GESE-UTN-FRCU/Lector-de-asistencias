
/*
 * Lector - UTN 
 * 
 * Grupo de investigacion
 * 
 * Version 7.4 - 28/08 - 
 * 
 * Alfaro Diego
 * Chichi Manuel
 * Garcia Alejo
 * Venditti Juan Pablo
 * 
 */

#include "main.h"

void setup () {
  // Iniciar todos los componentes
  // fisicos del sistema.
  iniciarSistema();
}

void loop () {
  // Si se recibe un paquete y el sistema esta en modo configuracion se envia la
  // pagina de configuracion al cliente. De lo contrario, accede al modo normal.
  routerModo(paqueteEthernet());
}
