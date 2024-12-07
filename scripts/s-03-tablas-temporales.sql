--@Autor(es): Aldo Sebastian Altamirano Vázquez
--            Carlo Kiliano Ferrera Guadarrama              
--@Fecha creación: 27/11/2024
--@Descripción: Implementacion de tablas temporales

/*
-----Escenario donde puede ser util una tabla temporal-----
Se crea una tabla temporal pensando en el escenario donde se necesita 
registrar nuevos autos que aun no tienen placa de modo que la tabla 
temporal sirva para que esos autos en lo que no tienen placa esperen para ser ingresados
a la tabla vehiculo ya con una placa asignada
*/

whenever sqlerror exit;
connect af_proy_admin/af@afbd_s2
--Tabla para realizar reportes 
create global temporary table vehiculos_sin_placa_temporal (
  vehiculo_id number(10,0),
  numero_serie varchar2(40),
  anio varchar(4),
  es_transporte_publico boolean,
  es_carga boolean,
  es_particular boolean,
  num_serie_dispo_medicion  char(18),
  fecha_status date,
  placa_id number(10,0),
  status_vehiculo_id number(10,0),
  modelo_id number(10,0),
  propietario_id number(10,0)
) on commit preserve rows; 

--Modelo: Tabla para realizar reportes de cuantas coches hay por marca

create global temporary table reporte_marca_temporal(
  modelo_id   number(10, 0)  not null, 
  nombre      varchar2(40)   not null,
  marca_id    number(10, 0)  not null
) on commit preserve rows;