# Lector-de-asistencias

Este proyecto es un lector de tarjetas RFID que envia el codigo leido junto a una fecha y hora y la IP del dispositivo. Este sistema fue diseñado para implementarse en la UTN-FRCU.

Componentes utilizados:
+Arduino nano
+DS3231
+ENC28J60
+RC522
+LCD 16x2

Alumnos:

+Alfaro Diego

+Chichi Manuel

+Garcia Alejo

+Venditti Juan Pablo

Profesor:

+Hoet Leonardo

Secciones:

+LectorUTN      - Contiene el codigo arduino en C del lector (este se sube en .

+Diagramas PCB  - Contiene los diagramas de las conexiones fisicas del lector.

+Pagina web     - Contiene la pagina web a la que enviara datos el lector.

MANUAL DE USUARIO

Configuración del dispositivo

Para el funcionamiento del sistema, primero es necesario establecer su configuración inicial. En esta, se tendrá que asignar al dispositivo un gateway (dirección IP del modem), una dirección ip del dispositivo, una dirección ip del servidor, una máscara de subred y un puerto (80 por defecto). 
Para realizar esta configuración se debe ingresar al modo de configuración del dispositivo. Para entrar al modo de configuración el usuario tiene que presionar el botón correspondiente al iniciar el sistema, cuando la pantalla está vacía.
Una vez que el dispositivo se encuentra en modo de configuración, es necesario acceder a través de un navegador web a la ip por defecto del modo de configuración “192.168.8.152”, y asi podrá acceder a la siguiente página web.


Una vez dentro de la página web, se deberá completar los campos correspondientes y oprimir el botón “Guardar”. Posteriormente, el sistema se reiniciará y los valores ingresados a través de la página de configuración quedarán asignados.


ADVERTENCIA: Una vez pasado el dispositivo a modo configuración, todas las lecturas guardadas en memoria serán eliminadas.


Modo lector de tarjetas
Para llevar a cabo el proceso de lectura de tarjetas, solo es necesario pasar la tarjeta a corta distancia por delante del dispositivo.


Es necesario tener en cuenta ciertos criterios para que el dispositivo se encuentre disponible para la lectura de tarjetas:
El dispositivo tiene que haber sido previamente configurado (Ver sección “Configuración del dispositivo” para más información).
El dispositivo se debe encontrar disponible para leer tarjetas, mostrando en su pantalla el mensaje “Pasar tarjeta”.
El dispositivo debe estar fuera de horario de envío de datos, en este caso se mostrará en su pantalla el mensaje “No disponible”.
El dispositivo no se debe encontrar en modo configuración, mostrando en pantalla “Modo config.”
El dispositivo actualizará su fecha y hora realizando una petición al servidor cada dos horas. Cuando esto sucede, se mostrará un mensaje “Actualizando...” en la pantalla.


Modo envío de datos
Este modo consiste en el envío al servidor de los datos recolectados en las últimas lecturas y que no hayan sido enviados y confirmados por el servidor previamente.
Este modo se encuentra disponible en el horario entre las 2 a.m. y las 4 a.m. a lo largo de todos los días del año.

