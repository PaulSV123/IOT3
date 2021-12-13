# IOT3
Actividad calificada
# Creating a REST Interface

Para el desarrollo de “Creating a REST Interface” se levanto los servicios de:

[![N|Node-red](https://i.ibb.co/Q62QZpv/logoigm1.png)](https://nodered.org/) [![N|Postman](https://i.ibb.co/mhFCN4d/postman.png)](https://www.postman.com/) [![N|MySql](https://i.ibb.co/PjLxDCC/logoigm3.png)](https://www.mysql.com/) [![N|phpMyAdmin](https://i.ibb.co/cypsdgy/logoigm4.png)](https://www.phpmyadmin.net/)

## Data Access APIs

Para realizar el primer ejercicio mostrado en la siguiente imagen, tenemos que tener ya los modulos de MySql instalados y haber creado la base de datos ya realizados en los capitulos anteriores, el backup de la Base de Datos esta en el repositorio, ademas el archivo json de los modulos de node-red se encuentran en la carpeta json con el nombre “Cap9_1”.

De la siguiente imagen los proceso mas importantes serian la creacion del query, donde estableceremos las diferentes consultas sobre nuestra base de datos, en la funcion “**prepare response**” se configuro la salida de la consulta en formato json para poder ver los resultados con Postman luego de realizar la petición GET.

![N|Img1](https://lh6.googleusercontent.com/n2C9kPDMgFLcNKGXUvnG1nQ8CAHxQL2rHibci0J7JhmJb7Z4OwHFBVc1vj_t_bg5L-JzrhYEW1Zwenifxbxy2WMI7Lw0P7yeB1GvlfBN16r_EGXNAlsCn-OrbaFRSvKgZ7-fqzkB)

La base de datos se ve de la siguiente manera:

![N|Img2](https://lh5.googleusercontent.com/8LkcL-BjZV1NU9kllBLBRn6KQnlotkqc3OpMLqWwvQLSkxFtrdsu9OqqoAdBZQpb9qux0g3pTfarG5MnRwN3vRaHynfDUw-szjRg9gAzSObo8wat2pdcPKkAU8WJFRfOp18RyeFZ)

Lista de consultas:

  - En la siguiente consulta del libro nos hace una petición para obtener los últimos 5 registros de la base de 
  ```
  localhost:1880/get/topicLike/my*/payloadLike/*/last/5
  ```
  Resultado en Postman:
  ![N|Img3](https://lh3.googleusercontent.com/rfSMK85aD68dhs2VuA-7easC1EDGFJqBg_9YbPC7xTeUpmsuK_nJ9TKH1MwQgT4PrDzIOIqftPpwAdNzh4BzCPScaZgbOOZBcP1Vo1OQzLvZXpJYMIdyzVjFu-e8KEKxUYubU8Iu)
  - Para la siguiente consulta, el objetivo es devolver las 2 ultimas entradas de nuestro topico de nuestra base de datos.
  ```
  localhost:1880/get/topicLike/mytimesta*/payloadLike/*/last/2
  ```
  Resultados en Postman:
  ![N|Img4](https://lh6.googleusercontent.com/KeAerdKU2qN6pH8XLW5BTdNWI0f6_4mrvuHomL79UuJo3r0pnLZaR3cjVkgb-tJLejUg6R7MngPZ9SGrlblf2EKwzz1LRM67yi2EtHdKeb-gfP4zDWhx72CbzewdRPh-FVgZks-l)
  - En esta consulta se buscara un número “36” dentro del campo payload de la base de datos que contengan ese número, los resultados muestran que existe solo 1 elemento que contiene ese valor, debemos ejecutar la siguiente consulta:
  ```
  localhost:1880/get/topicLike/mytimesta*/payloadLike/*36*/last/2
  ```
  Resultado con Postman:
  ![N|Img5](https://lh5.googleusercontent.com/mu3B4-SP0JwUfWOon50u34fr-fYtd8tE3DMQ43Mc6nE20uBDFec6qfn-S02krjcZV_3RXHvutHahG74595g5MtVjM2JEZ6FsTgAR_HXlpzAyBvuTg6sRXNHi_s1wp56wsV25wWNv)


## Adding Time-Based Filters
En la siguiente imagen tenemos los módulos que necesitamos para ejecutar el siguiente ejercicio de filtros, este archivo json tiene el nombre de “Cap9_2”.

![N|Img6](https://lh6.googleusercontent.com/avO6KgZph7HHqkODN9nr85C2i4GuWahsx_km4qI74eDwSDKB6QLzYqJHlNmqHYaQK_HR6qz7Hef4bPDi1x3CHBxOejk0tmKgj40z2n5WqmzCUwSynURpDwgIh3fI-zA4AkZVKNoK)

Lista de consultas:
  - En este ejemplo probaremos el filtro BEFORE, el cual a partir de timestamp buscará términos anteriores que mantengan un rango cercano, en el resultado podrá ver como nos devolvió 2 resultados que tienen valor casi similar en la columna ‘timestamp, el comando es el siguiente:
  ```
  localhost:1880/get/mytimestamp/before/1638067667.769/last/2
  ```
  Resultados en Postman:
  ![N|Img7](https://lh3.googleusercontent.com/5Gd44wb2wTOqj7BREEkojzt4qEk_ydSMTtyW_6hH1uLPuoBsCruUsOJjGGHdCeAKRsmWE4G-Fp_vebw3vMhBKDcU1c5Dk-i97WTbot_qurOFGXiudyip9BbumB51kOg7aZmKq7Um)
  - Para la siguiente prueba, tendremos el comando AFTER el cual a partir de un rango de ‘timestamp’ buscará los siguientes más cercanos, en nuestro resultado al buscar los siguientes del último dato, solo nos muestra ese mismo dato, la url para ejecutar esto es la siguiente:
  ```
  localhost:1880/get/mytimestamp/after/1638067667.769/last/3
  ```
  Resultado en Postman:
  ![N|Img8](https://lh5.googleusercontent.com/3Ztk8KyDDatBDonT6Jy3NjrvcJwqCK1-cq1Ld100iTyR4udaKVCaLSmdQZr4LibP0PhaC7QtznZBLefDGoA4SAJypqVvjHvuLHIAQxBiqV6ZEzlo2kXtlh-pFIaW9224VFM_bSgb)
  - En este último ejercicio tenemos la prueba del filtro ‘during’ el cual envía dos parámetros que serán el menor y mayor valor, donde nos devolverá todos los registros dentro del rango enviado, además de establecer el límite de resultados a 2 según nuestra url, la url es la siguiente:
  ```
  localhost:1880/get/mytimestamp/during/1638066393/1638067667/last/2
  ```
  Resultados en Postman:
  ![N|Img9](https://lh3.googleusercontent.com/dIJ1BBKa5Qk-OAQKNb4p7_w0uEKxcmIOU7arP-RK2K-rCfTTGug51FnSK0hKffpQbW8O4o1Kp1HlZohdml8OegA_Zg-dIa4UXhBWCP6aQWqV41T15cu4rECQPzWSAqXL-AS7UJzz)


## Data Deletion APIs
En esta parte empezaremos a crear nuestras funciones las cuales se encargaran de eliminar datos, como podemos ver en la siguiente imagen se encuentran nuestros módulos en node-red, este archivo lo encuentra con el nombre de “Cap9_3”.

![N|Img10](https://lh6.googleusercontent.com/UmQOLMyuDxbAmqE09ic6WS_KTxWKQUsQ1DnzSunkWMZRiql-HKUms84xB-0FeDS8xjeHljzBUbFkm-XjR5ChBgH8IPENg4POk-vf7KcQFJsGtxfpodA6_vq8nZyE-JoendO0uunX)
Lista de consultas:
  - Ejecutaremos el primer bloque el cual se encarga de cambiar el estado de la columna ‘deleted’ de la base de datos a ‘1 donde estará marcado para ser eliminado en futuros pasos, se mostrará los resultados cuando le mandamos un id valida y otra incorrecta, la url de ejecución es:
  localhost:1880/delete/timestamp/id/34 o /3
  Resultados en Postman:
  
  Incorrecto
  
  ![N|Img11](https://lh5.googleusercontent.com/jgKDja9JZ_555lWAEjQcrwVpYVCcvwTL6BIJjna4tfU5y4nnBtvgMZVjrZYg-rGJYXpDc24_l5Quq1Kbhs-t6Qw96lnNfXzIrCGTEAZH5z_b0Wzk8-Xfa0WzGFqN4Yx1oTldOiPz)
  
  Correcto
  
  ![N|Img12](https://lh5.googleusercontent.com/WV0Il8S7BtDlwUGodxk4GHdY6gyQX9W-P6YxNEzmoSfIONFh9hhdA26RyT8f1ye49TYDv_AfMM2WoUqIKOU91TXrOxpiLFy9cmo6ugZn_PBFHrhJ-5Uq1CjxCDeQNl2QfcofD9F4)
  
  Registro con id=3 cambiado de BD:
  
  ![N|Img13](https://lh3.googleusercontent.com/AuNic3b6uy8FLdSCQh6NaSlmfd-UdNRWFfjbGqSBXhNFban2okm98uYCmHW7w_uPgCTSS_Mij05utMsS1dgB64RXcdfwcHbcPDUJ3eiGFBrsZNmtRLP-f1KzVo3MyXLJDxoBA8xR)

## Removing Data Records Completely
Para este último ejercicio, a continuación presentamos la imagen que describe los módulos para realizar la purga, la estructura la puede encontrar en el archivo ‘Cap9_4’.

![N|Img14](https://lh5.googleusercontent.com/jEs-eu7dhe6RqeklIGsKVjrwPxC6PKuipUAJSa2S25U2iAmJCPLEWQDTmF08fz6hZz8WYGOeVvBbgOI1DI41kF6Lpyo5ev61w4wjDHVEzFThHx1oiiuRAVpLn_b0f1yTGdfa5IV-)

Para realizar la eliminación de un registro, debemos pasar por el anterior ejercicio, el cual marcaba un registro para ser eliminado, ahora con este ejercicio de purga, podemos realizar el proceso de eliminación completamente, la url para ejecutar es :

```
localhost:1880/purge/mytimestamp/id/3
```
Resultado:

El registro 3 marcado como deleted, ahora se elimino, con esto concluimos las actividades.

![N|Img15](https://lh4.googleusercontent.com/VpncIkYVO8CJWBznK_nrRBDBK8DrqUErD0v0wn4NwtxHmDaLDRXrVeLv6RBGGK3mliQ94-f-fvMwtK_mIZ5eF7A-LOdiE0lTA9Fd8lPXmVer4FjGOpZX6pv0MpseBA2fdl73qG_r)
