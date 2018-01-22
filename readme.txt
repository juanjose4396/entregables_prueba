Instrucciones de despliegue

<!--FRONT END-->

Contiene la aplicacion en produccion del front end:

Construida en Angular utilzando Angular CLI version 1.6.3
Se utilizo Angular 5 y algunos modulos en su version 4

contiene el directorio dist que contiene todo el proyecto compilado para produccion
basta agregarlo en el directorio publico del servidor, considerando que tenga correcta configuracion
sobre las rutas en aplicaciones SPA


<!--BACK END-->

Contiene la aplicacion en produccion del backend

Construida con el framework Spring en su version 4.3.11 RELEASE utilizando
como ID la Spring Suite Tool en su version  3.9.0.RELEASE.

contiene la carpeta target que contiene toda la compilacion del proyecto para produccion
asi mismo como el archivo war para despliegue, compilado con maven.

Se despliega sobre un servidor Tomcat version 9

Se utiliza hibernate 5, el driver jdbc para PostgreSQL y el puglin JBOSS 3.3

Cuando se despliegue si se tiene un error, se debe configurar el archivo config.properties 
modificando la ruta de file.path.properties por la correspondiente al servidor



<!--BASE DE DATOS-->

Base de datos que utiliza como motor PostgreSQL 9.6, manejada con pgAdmin version 4
Contiene los scripts y backups de la base de datos

Se puede ejecutar el script o realizar un restore utilizando cualquiera
de los dos backups (Directory o custom), sugerenca utilizar el restore para la
creacion de los datos previamente creados en la DB 

Se incluye un backup de los datos de las tablas necesarios para el correcto
funcionamiento de la aplicacion


<!-- CODIGO FUENTE-->

Se incluye un archivo de texto con los enlaces a los repositorios del proyecto