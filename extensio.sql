
/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS _____________________________
    Mòdul: 0484 Bases de dades. 
    AUTORS: _______________________________
    DATA: ________________
****************************************************** */
-- ------------------------------------------------------
--  Restricciones de la tabla companyia
-- ------------------------------------------------------
ALTER TABLE companyia 
ADD CONSTRAINT pk_companyia PRIMARY KEY (IATA);

ALTER TABLE companyia 
ADD CONSTRAINT unique_companyia_nom UNIQUE (nom);

-- ------------------------------------------------------
--  Restricciones de la tabla hostessa
-- ------------------------------------------------------
ALTER TABLE hostessa 
ADD CONSTRAINT pk_hostessa PRIMARY KEY (num_empleat);

-- ------------------------------------------------------
--  Restricciones de la tabla avio
-- ------------------------------------------------------
ALTER TABLE avio 
ADD CONSTRAINT pk_avio PRIMARY KEY (num_serie);

ALTER TABLE avio 
ADD CONSTRAINT fk_avio_companyia FOREIGN KEY (companyia)
REFERENCES companyia(nom)
ON DELETE CASCADE;

-- ------------------------------------------------------
--  Restricciones de la tabla aeroport
-- ------------------------------------------------------
ALTER TABLE aeroport 
ADD CONSTRAINT pk_aeroport PRIMARY KEY (codi);

-- ------------------------------------------------------
--  Restricciones de la tabla Mostrador
-- ------------------------------------------------------
ALTER TABLE Mostrador 
ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero, codi_aeroport);

ALTER TABLE Mostrador 
ADD CONSTRAINT fk_mostrador_aeroport FOREIGN KEY (codi_aeroport)
REFERENCES aeroport(codi)
ON DELETE CASCADE;

-- ------------------------------------------------------
--  Restricciones de la tabla personal
-- ------------------------------------------------------
ALTER TABLE personal 
ADD CONSTRAINT pk_personal PRIMARY KEY (num_empleat);

ALTER TABLE personal 
ADD CONSTRAINT unique_personal_passaport UNIQUE (passaport);

-- ------------------------------------------------------
--  Restricciones de la tabla vol
-- ------------------------------------------------------
ALTER TABLE vol 
ADD CONSTRAINT pk_vol PRIMARY KEY (codi);

ALTER TABLE vol 
ADD CONSTRAINT fk_vol_aeroport_origen FOREIGN KEY (aeroport_origen)
REFERENCES aeroport(codi);

ALTER TABLE vol 
ADD CONSTRAINT fk_vol_aeroport_desti FOREIGN KEY (aeroport_desti)
REFERENCES aeroport(codi);

ALTER TABLE vol 
ADD CONSTRAINT fk_vol_avio FOREIGN KEY (avio)
REFERENCES avio(num_serie);

ALTER TABLE vol 
ADD CONSTRAINT fk_vol_hostessa FOREIGN KEY (hostessa)
REFERENCES hostessa(num_empleat);

ALTER TABLE vol 
ADD CONSTRAINT fk_vol_pilot FOREIGN KEY (pilot)
REFERENCES pilot(num_empleat);

-- ------------------------------------------------------
--  Restricciones de la tabla passatger
-- ------------------------------------------------------
ALTER TABLE passatger 
ADD CONSTRAINT pk_passatger PRIMARY KEY (passaport);

ALTER TABLE passatger 
ADD CONSTRAINT unique_passatger_email UNIQUE (email);

-- ------------------------------------------------------
--  Restricciones de la tabla pilot
-- ------------------------------------------------------
ALTER TABLE pilot 
ADD CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);

-- ------------------------------------------------------
--  Restricciones de la tabla volar
-- ------------------------------------------------------
ALTER TABLE volar 
ADD CONSTRAINT pk_volar PRIMARY KEY (passatger, vol);

ALTER TABLE volar 
ADD CONSTRAINT fk_volar_passatger FOREIGN KEY (passatger)
REFERENCES passatger(passaport);

ALTER TABLE volar 
ADD CONSTRAINT fk_volar_vol FOREIGN KEY (vol)
REFERENCES vol(codi);

-- ------------------------------------------------------
--  Restricciones de verificación (CHECK)
-- ------------------------------------------------------
ALTER TABLE aeroport 
ADD CONSTRAINT check_any_construccio CHECK (any_construccio >= 1900 AND any_construccio <= YEAR(CURDATE()));

ALTER TABLE vol 
ADD CONSTRAINT check_durada_vol CHECK (durada > 0);

ALTER TABLE passatger 
ADD CONSTRAINT check_genere CHECK (genere IN ('M', 'F', 'O'));

ALTER TABLE volar 
ADD CONSTRAINT check_seient CHECK (seient BETWEEN 1 AND 255);
