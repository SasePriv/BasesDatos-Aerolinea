CREATE SCHEMA IF NOT EXISTS based_aerolinea;
USE based_aerolinea ;

CREATE TABLE IF NOT EXISTS Nacionalidad (
  id_nacionalidad INT NOT NULL,
  nacionalidad VARCHAR(45),
  PRIMARY KEY (id_nacionalidad))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Departamento (
  id_departamento INT NOT NULL,
  departamento VARCHAR(100),
  id_nacionalidad INT NOT NULL,
  PRIMARY KEY (id_departamento),
  nacionalidad_id_nacionalidad INT NOT NULL,
  CONSTRAINT fkdepartamento_nacionalidad
    FOREIGN KEY (nacionalidad_id_nacionalidad)
    REFERENCES nacionalidad(id_nacionalidad)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Ciudad (
  id_ciudad INT NOT NULL AUTO_INCREMENT,
  Ciudad VARCHAR(45) NOT NULL,
  id_departamento INT NOT NULL,
  PRIMARY KEY (id_ciudad),
 CONSTRAINT departamento
    FOREIGN KEY (id_departamento)
    REFERENCES Departamento (id_departamento)
)ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS listanegra (
  id_listanegra INT NOT NULL AUTO_INCREMENT,
  crimen VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_listanegra))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS Personas (
  id_persona INT NOT NULL AUTO_INCREMENT,
  ci_persona VARCHAR(45) NULL,
  nom_persona VARCHAR(100) NULL,
  edad_persona VARCHAR(45) NULL,
  apellidos_persona VARCHAR(100) NULL,
  fechan_persona DATE NULL,
  telefono_persona VARCHAR(10) NULL,
  sexo_persona CHAR NULL,
  id_ciudad INT NOT NULL,
  id_listanegra INT NOT NULL,
  PRIMARY KEY (id_persona),
  ciudad_id_ciudad INT NOT NULL,
  CONSTRAINT fkciudad_persona
  FOREIGN KEY (id_ciudad)
    REFERENCES Ciudad(id_ciudad),
  listanegra_id_listanegra INT NOT NULL,
  CONSTRAINT fklistanegra_persona
    FOREIGN KEY (id_listanegra)
    REFERENCES listanegra (id_listanegra))
    ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS puerta_abordaje (
  id_puerta_abordaje INT NOT NULL AUTO_INCREMENT,
  ubicacion VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_puerta_abordaje))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS maletas (
  id_maletas INT NOT NULL AUTO_INCREMENT,
  cantidad_maleta INT NULL,
  PRIMARY KEY (id_maletas))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS lista_pasajero (
  id_lista_pasajero INT NOT NULL AUTO_INCREMENT,
  cantidad_pasajeros INT NOT NULL,
  PRIMARY KEY (id_lista_pasajero))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pasajeros (
  id_pasajeros INT NOT NULL,
  id_persona INT NULL,
  id_puerta_abordaje INT NOT NULL,
  id_maletas INT NOT NULL,
  id_lista_pasajero INT NOT NULL,
  PRIMARY KEY (id_pasajeros),
  persona_id_persona INT NOT NULL,
  CONSTRAINT fkpasajero_persona
    FOREIGN KEY (id_persona)
    REFERENCES Personas (id_persona),
puerta_de_abordaje_id_puerta_de_abordaje INT NOT NULL,
    CONSTRAINT fkpasajero_puerta_de_abordaje
    FOREIGN KEY (id_puerta_abordaje)
    REFERENCES puerta_abordaje(id_puerta_abordaje),
maletas_id_maletas INT NOT NULL,
  CONSTRAINT fkPasajeros_maletas
    FOREIGN KEY (id_maletas)
    REFERENCES maletas (id_maletas),
lista_pasajero_id_lista_pasajero INT NOT NULL,
  CONSTRAINT fkPasajeros_lista_pasajero
    FOREIGN KEY (lista_pasajero_id_lista_pasajero)
    REFERENCES lista_pasajero (id_lista_pasajero))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS tripulacion (
  id_tripulacion INT NOT NULL AUTO_INCREMENT,
  cantidad_tripu INT NOT NULL,
  PRIMARY KEY (id_tripulacion))
ENGINE = INNODB;
CREATE TABLE IF NOT EXISTS Funcionarios (
  id_funcionarios INT NOT NULL AUTO_INCREMENT,
  id_persona INT NOT NULL,
  id_cargo INT NOT NULL,
  id_tripulacion INT NOT NULL,
  PRIMARY KEY (id_funcionarios),
  personas_id_personas INT NOT NULL,
  CONSTRAINT fkpersonas_funcionarios
    FOREIGN KEY (id_persona)
    REFERENCES Personas(id_persona),
 funcionarios_id_tripulantes INT NOT NULL,
  CONSTRAINT fkfuncionarios_tripulantes
    FOREIGN KEY (id_tripulacion)
    REFERENCES tripulacion (id_tripulacion))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Modelo (
  id_modelo INT NOT NULL AUTO_INCREMENT,
  nom_modelo VARCHAR(45) NULL,
  PRIMARY KEY (id_modelo))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS hangar (
  id_hangar INT NOT NULL AUTO_INCREMENT,
 canti_aviones INT NOT NULL,
  PRIMARY KEY (id_hangar))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Avion (
  cod_avion INT NOT NULL AUTO_INCREMENT,
  descripción VARCHAR(100) NULL,
  capacidad VARCHAR(100) NULL,
  id_modelo INT NOT NULL,
  id_tripulacion INT NOT NULL,
  id_piloto INT NOT NULL,
  id_hangar INT NOT NULL,
  id_lista_pasajero INT NOT NULL,
  id_puerta_abordaje INT NOT NULL,
PRIMARY KEY (cod_avion),
    modelo_id_modelo INT NOT NULL,
 CONSTRAINT fkcodavion_modelo
    FOREIGN KEY (modelo_id_modelo)
    REFERENCES modelo(id_modelo),
    piloto_id_piloto INT NOT NULL,
  CONSTRAINT fkcodavion_piloto
    FOREIGN KEY (piloto_id_piloto)
    REFERENCES funcionarios(id_funcionarios),
     hangar_id_hangar INT NOT NULL,
  CONSTRAINT fkcodavion_hangar
    FOREIGN KEY (hangar_id_hangar)
    REFERENCES hangar(id_hangar),
   puerta_abordaje_id_puerta_abordaje INT NOT NULL, 
  CONSTRAINT fkcodavion_puerta_abordaje
  FOREIGN KEY (puerta_abordaje_id_puerta_abordaje)
    REFERENCES puerta_abordaje(id_puerta_abordaje),
  tripulacion_id_tripulacion INT NOT NULL, 
  CONSTRAINT fkcodavion_tripulacion
  FOREIGN KEY (tripulacion_id_tripulacion)
    REFERENCES tripulacion(id_tripulacion),
  lista_pasajero_id_lista_pasajero INT NOT NULL,
  CONSTRAINT fkcodavion_lista_pasajero
    FOREIGN KEY (lista_pasajero_id_lista_pasajero)
    REFERENCES lista_pasajero(id_lista_pasajero))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Ruta (
  cod_ruta INT NOT NULL AUTO_INCREMENT,
  valor DECIMAL NOT NULL,
  id_Ciudad INT NOT NULL,
  PRIMARY KEY (cod_ruta),
 ciudad_id_ciudad INT NOT NULL,
  CONSTRAINT fkcodruta_ciudad
    FOREIGN KEY (ciudad_id_ciudad)
    REFERENCES Ciudad(id_ciudad))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Estado_Vuelo (
  id_Estado_Vuelo INT NOT NULL AUTO_INCREMENT,
  descripción VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_Estado_Vuelo))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Vuelos (
  cod_vuelos INT NOT NULL AUTO_INCREMENT,
  cod_avion INT NOT NULL,
  cod_ruta INT NOT NULL,
  id_Estado_Vuelo INT NOT NULL,
  fecha_hora DATETIME NOT NULL,
  PRIMARY KEY (cod_vuelos),
  avion_id_avion INT NOT NULL,
  CONSTRAINT fkvuelos_avion
    FOREIGN KEY (avion_id_avion)
    REFERENCES avion (cod_avion),
    ruta_id_ruta INT NOT NULL,
  CONSTRAINT fkvuelos_ruta
    FOREIGN KEY (ruta_id_ruta)
    REFERENCES Ruta(cod_ruta),
    estadov_id_estadov INT NOT NULL,
  CONSTRAINT fkvuelos_estadov
    FOREIGN KEY (estadov_id_estadov)
    REFERENCES Estado_Vuelo(id_Estado_Vuelo))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS precio (
  id_precio INT NOT NULL ,
  monto INT NOT NULL,
  PRIMARY KEY (id_precio))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pasajes (
  id_pasajes INT NOT NULL AUTO_INCREMENT,
  id_pasajero INT NOT NULL,
  id_precio INT NOT NULL,
  cod_vuelo INT NULL,
  hora DATETIME NULL,
  nro_puesto INT NULL,
  tipo_pasaje VARCHAR(100) NULL,
  PRIMARY KEY (id_pasajes),
  precio_id_precio INT NOT NULL, 
  CONSTRAINT fkpasaje_precio 
  FOREIGN KEY(precio_id_precio)
  REFERENCES precio(id_precio),
 pasajero_id_pasajero INT NOT NULL,
  CONSTRAINT fkpasajes_pasajero
    FOREIGN KEY (pasajero_id_pasajero)
    REFERENCES pasajeros (id_pasajeros),
    codvuelo_id_codvuelo INT NOT NULL,
  CONSTRAINT fkpasajes_codvuelo
    FOREIGN KEY (codvuelo_id_codvuelo)
    REFERENCES Vuelos (cod_vuelos))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS profesion (
  id_profesion INT NOT NULL AUTO_INCREMENT,
  descripción VARCHAR(100) NULL,
  PRIMARY KEY (id_profesion))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS profesion_funcionario(
  id_funcionario INT NOT NULL AUTO_INCREMENT,
  id_profesion INT NOT NULL,
  PRIMARY KEY (id_funcionario),
  profesion_id_profesion INT NOT NULL,
  CONSTRAINT fkprofesion_funcionario
    FOREIGN KEY (profesion_id_profesion)
    REFERENCES Funcionarios (id_funcionarios),
    funcionario_id_funcionario INT NOT NULL,
  CONSTRAINT fkfuncionario_profesion
    FOREIGN KEY (funcionario_id_funcionario)
    REFERENCES  profesion (id_profesion))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Cargo (
  id_cargo INT NOT NULL AUTO_INCREMENT,
  id_funcionario INT NOT NULL,
  descripción VARCHAR(45) NULL,
  PRIMARY KEY (id_cargo),
  funcionario_id_funcionario INT NOT NULL,
  CONSTRAINT fkcargo_Funcionario
    FOREIGN KEY (funcionario_id_funcionario)
    REFERENCES funcionarios (id_funcionarios))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS mantenimiento (
  id_mantenimiento INT NOT NULL AUTO_INCREMENT,
  descripcion_daños VARCHAR(200) NOT NULL,
  PRIMARY KEY (id_mantenimiento))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Avion_has_mantenimiento (
  Avion_cod_avion INT NOT NULL,
  mantenimiento_id_mantenimiento INT NOT NULL,
  PRIMARY KEY (Avion_cod_avion, mantenimiento_id_mantenimiento),
 CONSTRAINT fk_Avion_has_mantenimiento_Avion1
    FOREIGN KEY (Avion_cod_avion)
    REFERENCES Avion (cod_avion),
  CONSTRAINT fk_Avion_has_mantenimiento_mantenimiento1
    FOREIGN KEY (mantenimiento_id_mantenimiento)
    REFERENCES mantenimiento(id_mantenimiento))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS condicion_especiales (
  id_condicion_especiales INT NOT NULL AUTO_INCREMENT,
  id_pasajero INT NOT NULL,
  condicion_pasajero VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_condicion_especiales))
 ENGINE = INNODB;
 
 CREATE TABLE IF NOT EXISTS Pasajeros_has_condicion_especiales (
  Pasajeros_id_pasajeros INT NOT NULL,
  condicion_especiales_id_condicion_especiales INT NOT NULL,
  PRIMARY KEY (Pasajeros_id_pasajeros, condicion_especiales_id_condicion_especiales),
 CONSTRAINT fk_Pasajeros_has_condicion_especiales_Pasajeros1
    FOREIGN KEY (Pasajeros_id_pasajeros)
    REFERENCES Pasajeros (id_pasajeros),
  CONSTRAINT fk_Pasajeros_has_condicion_especiales_condicion_especiales1
    FOREIGN KEY (condicion_especiales_id_condicion_especiales)
    REFERENCES condicion_especiales(id_condicion_especiales))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS sanciones (
  id_sanciones INT NOT NULL AUTO_INCREMENT,
  tipo_sancion VARCHAR(100) NULL,
  descripcion VARCHAR(100) NULL,
  PRIMARY KEY (id_sanciones))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pasajeros_has_sanciones (
  Pasajeros_id_pasajeros INT NOT NULL,
  sanciones_id_sanciones INT NOT NULL,
  PRIMARY KEY (Pasajeros_id_pasajeros, sanciones_id_sanciones),
  CONSTRAINT fk_Pasajeros_has_sanciones_Pasajeros1
    FOREIGN KEY (Pasajeros_id_pasajeros)
    REFERENCES Pasajeros(id_pasajeros),
  CONSTRAINT fk_Pasajeros_has_sanciones_sanciones1
    FOREIGN KEY (sanciones_id_sanciones)
    REFERENCES sanciones (id_sanciones))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS multa_retraso (
  id_multa_retraso INT NOT NULL AUTO_INCREMENT,
  descripcion_multa VARCHAR(200) NOT NULL,
  fecha_retraso INT NULL,
  PRIMARY KEY (id_multa_retraso))
ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS Pasajeros_has_multa_retraso (
  Pasajeros_id_pasajeros INT NOT NULL,
  multa_retraso_id_multa_retraso INT NOT NULL,
  PRIMARY KEY (Pasajeros_id_pasajeros, multa_retraso_id_multa_retraso),
 CONSTRAINT fk_Pasajeros_has_multa_retraso_Pasajeros1
    FOREIGN KEY (Pasajeros_id_pasajeros)
    REFERENCES Pasajeros (id_pasajeros),
  CONSTRAINT fk_Pasajeros_has_multa_retraso_multa_retraso1
    FOREIGN KEY (multa_retraso_id_multa_retraso)
    REFERENCES multa_retraso(id_multa_retraso))
ENGINE = INNODB;
