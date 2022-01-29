# rickandmorthy


Consumo para de la API Rick and Morty.
Esta app cuenta con diseño básico de dos pantallas separadas en Personajes y Detalles
# Personajes 
- En esta pantalla podras encontrar un ListView Build que despliega una lista de contianers, los cuales tienen dentro un card para la imagen, un columna de textos, un row de buttontex y un icon


## Detalles
- En esta pantalla pueden visualizar un container el cual lleva por dentro un card para la imagen y un colum para los texto de los detalles


## Paquetes utilizados 
- http: este paquete se utilizo para hacer las peticiones a la api con la finalidad de traer y consumir toda la información de la misma
- provider: Este paquete se utilizo para gestionar estados en la app haciendo el consumo de la data un poco más cómoda, direccionando todo hacia su método ChangeNotifier


## Instalación de paquetes 
- Si quieres descargar todos los paquetes utilizados en la App dirígete a la terminal del proyecto escribe el siguiente comando: *flutter packages get* y presiona Enter


### Nota: En caso tal que quieras instalar los paquetes de forma manual, puedes seguir estos pasos
- [http](https://pub.dev/packages/http) Para la instalación de este paquete dirígete al link adjunto y ve a la sección installing copias la siguiente dependencia 
  http: ^0.13.4 y luego vas a tu proyecto abres el archivo pubspec.yaml y lo pegas debajo de la dependencia cupertino_icons
- [provider](https://pub.dev/packages/provider/install) Para la instalación de este paquete dirígete al link adjunto y copia la dependencia provider: ^6.0.2 después de copiada la pegas debajo de la dependencia http pegada anteriormente.

