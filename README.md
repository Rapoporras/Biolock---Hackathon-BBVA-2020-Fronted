# Biolock BBVA 2020 - Frontend App

![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/icon/Logoapp.png)

Hemos desarrollado la parte frontend como una aplicación móvil que utilizaremos para la identificación del cliente con un tercero. Una vez evaluado los distintos lenguajes hemos decidido utilizar flutter por ser capaz de desarrollar apps de manera nativa tanto en ios como en android, decantándonos por este ultimo para codificar nuestra demo.

Para la parte UX hemos usado Adobe XD para hacer los wireframes y prototipados. El logo con Adobe Illustrator y si da tiempo se harán más materia UI con este programa y after effects. Y para videos Adobe Premiere.

La parte backend cuenta con la siguiente arquitectura:

Hemos utilizado para la parte backend un sistema deployado en AWS.

- Función Lambda ---> con un código programado con node JS (reconocimiento facial con Amazon Rekognition)  
- S3 ---> Repositorio donde se almacenan las fotos del los clientes a identificar  
- API gateway --> donde se ha deployado y publicado el endpoint que conectaría el frontend con la parte backend que posteriormente realiza el reconocimiento facial de la imagen enviada junto el id del empleado  



## Descarga App

Link APK: [Biolock.apk](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/Biolock.apk)
> Nota: Al ser una app no firmada por falta de tiempo a veces no solicita el permiso de camara que debera ser concedido por el usuario de manera manual en ajustes de Android

## Mockup 
Estos son los diseños de la app realizados en Adobe Xd por Carolina Martínez Pulido  
-[Mockup Identificación](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/mockup/Identificaci%C3%B3n%201.1.xd)  
-[Mockup Configuración](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/mockup/Configuraci%C3%B3n.xd)  


## Back end - JavaScrip

Back end Realizado en javacrip por [Carlota Lopez](https://github.com/carlota-lopez)  
[Backend JavaScript](https://github.com/carlota-lopez/FaceRecognitionTest/tree/master)  

## Back end - Python

Back end Realizado en Python por [Juan Aparicio](https://github.com/apariciojuan)  
[Backend Python](https://github.com/apariciojuan/Hackathonbbva)  


## Nuestra Idea

Esta solución estaria integrada dentro de la misma app del banco BBVA, ya que es quien tiene la identificacion y los datos de usuario cotidianos.
Cuando vayamos a hacer una compra delicada o que necesite identificación como el alquiler de un coche, el cliente recibira una notificación y podrá identificarse usando los 
metodos biometricos de huella dactilar y reconocimento facial. 

## Explicación

La app consta de dos partes, uno la configuración y la subida de datos al backend de los datos biometricos y dos la gestion de las solicitudes y la identificacion posterior del cliente

 > La creación del usuario y inicio de sesión se realizara utilizando los datos de la app de BBVA junto con la imagen capturada en el apartado de configuración del app , por falta de tiempo no ha sido posible conectar la parte frontend al backend pero pueden ver una simulacion de como seria la configuración en el APP 

## En Desarrollo

Estos dias de desarrollo no se ha podido implementar la conexion con el backend que reconoceria los datos y los guardaria, debido a la complejidad de desarrollar al app completa y el poco uso de Flutter ( el lenguaje usado ) que he tenido estos ultimos meses.
Esto ha complicado el desarrollo de la visualizacion de la camara utilizando la libreria Image_picker y algunos flags que no funcionan bien

## Mejoras 

La app podria incluir en un futuro mas tipos de indentificación biometrica como reconocimiento de voz y tambien desarrollar al app para IOS que no disponemos actualmente

## Capturas de Pantalla 

![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/1.jpeg)
![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/2.jpeg)
![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/3.jpeg)
![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/4.jpeg)
![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/5.jpeg)
![alt text](https://github.com/Rapoporras/Biolock---Hackathon-BBVA-2020-Fronted/blob/master/assets/ScreenShot/6.jpeg)
