# Siivotaan skeema

drop database if exists theborok;
create database theborok;
use theborok;

# Anna oikeudet käyttäjälle dbuser
# Komento luo samalla käyttäjän jos se puuttuu
grant all on theborok.* to 'dbuser'@'localhost' identified by 'dbpass';


# luodaan skeema

CREATE TABLE room (
	id INT NOT NULL,
	description varchar(1000),
	primary key(id)
	);

CREATE TABLE passage (
	id INT NOT NULL,
	fromid int not null,
	toid int not null,
	direction varchar(5),
	primary key(id)
	);
	
insert into room values (1, 'Kirjoita tähän miltä näyttää ensimmäisessä huoneessa.');
insert into room values (2, 'You see a cat.');
insert into passage values (1, 1, 2, 'north'); # Kulku huoneesta 1 => 2 on mahdollinen
insert into passage values (2, 2, 1, 'south'); # Kulku huoneesta 2 => 1 on mahdollinen



/*
CREATE TABLE objecttype (
	objecttypeid INT NOT NULL,
	name VARCHAR(40) NOT NULL,
	PRIMARY KEY (objecttypeid)
	);

CREATE TABLE muuobjekti (
	objecttypeid INT NOT NULL,
	kuntovaikutus INT NOT NULL,
	rahavaikutus INT NOT NULL,
	PRIMARY KEY (objecttypeid),
	FOREIGN KEY (objecttypeid) REFERENCES objecttype(objecttypeid)
	);	
	

CREATE TABLE character (
	characterid INT NULL,
	name VARCHAR(40) NOT NULL,
	taso INT NOT NULL,
	kuntopisteet INT NOT NULL,
	rahat INT NOT NULL,
	xkoord INT NOT NULL,
	ykoord INT NOT NULL,
	PRIMARY KEY (characterid)
	);
	
CREATE TABLE objekti (
	objektiid INT NOT NULL,
	objecttypeid INT NOT NULL,
	xkoord INT NOT NULL,
	ykoord INT NOT NULL,
	characterid INT NULL,
	PRIMARY KEY (objektiid),
	FOREIGN KEY (objecttypeid) REFERENCES objecttype(objecttypeid),
	FOREIGN KEY (characterid) REFERENCES character(characterid)
	);

CREATE TABLE aseobjekti (
	objecttypeid INT NOT NULL,
	hyokkaysvaikutus INT NOT NULL,
	puolustusvaikutus INT NOT NULL,
	PRIMARY KEY (objecttypeid),
	FOREIGN KEY (objecttypeid) REFERENCES objecttype(objecttypeid)
	);

CREATE TABLE maastotyyppi (
	maastotyyppiid INT NOT NULL,
	name VARCHAR(40) NOT NULL,
	taisteluvaikeus INT NOT NULL,
	liikkumisvaikeus INT NOT NULL,
	PRIMARY KEY (maastotyyppiid)
	);
	

	
CREATE TABLE vihollistyyppi (
	vihollistyyppiid INT NOT NULL,
	name VARCHAR(40) NOT NULL,
	hyökkäysvoima INT NOT NULL,
	puolustusvoima INT NOT NULL,
	alkukunto INT NOT NULL,
	PRIMARY KEY (vihollistyyppiid)
	);
	
CREATE TABLE vihollinen (
	vihollinenid INT NOT NULL,
	vihollistyyppiid INT NOT NULL,
	kunto INT NOT NULL,
	xkoord INT NOT NULL,
	ykoord INT NOT NULL,
	PRIMARY KEY (vihollinenid),
	FOREIGN KEY (vihollistyyppiid) REFERENCES vihollistyyppi(vihollistyyppiid)
	);		

# Maastotyypit	
INSERT INTO MAASTOTYYPPI VALUES (1, 'Tie', 3, 2);
INSERT INTO MAASTOTYYPPI VALUES (2, 'Metsä', 4, 3);
INSERT INTO MAASTOTYYPPI VALUES (3, 'Vuoristo', 4, 5);

# Kartta
INSERT INTO room VALUES (1, 1, 3);
INSERT INTO room VALUES (2, 1, 2);
INSERT INTO room VALUES (3, 1, 1);
INSERT INTO room VALUES (4, 1, 2);
INSERT INTO room VALUES (1, 2, 3);
INSERT INTO room VALUES (2, 2, 3);
INSERT INTO room VALUES (3, 2, 1);
INSERT INTO room VALUES (4, 2, 2);
INSERT INTO room VALUES (1, 3, 1);
INSERT INTO room VALUES (2, 3, 1);
INSERT INTO room VALUES (3, 3, 1);
INSERT INTO room VALUES (4, 3, 1);

# Hilfred
INSERT INTO character VALUES (1, 'Hilfred', 1, 70, 0, 1, 3);
# Hilfredin ase
INSERT INTO objecttype VALUES (1, 'Miekka');
INSERT INTO ASEOBJEKTI VALUES (1, 3, 1);
INSERT INTO OBJEKTI VALUES (1, 1, 1, 3, 1);

# Muut objektit
INSERT INTO objecttype VALUES (2, 'Sormus');
INSERT INTO MUUOBJEKTI VALUES (2, 1, 5);
INSERT INTO OBJEKTI VALUES (2, 2, 4, 3, NULL);

INSERT INTO objecttype VALUES (3, 'Rohto');
INSERT INTO MUUOBJEKTI VALUES (3, 4, 3);
INSERT INTO OBJEKTI VALUES (3, 2, 2, 1, NULL);

INSERT INTO objecttype VALUES (4, 'Haarniska');
INSERT INTO ASEOBJEKTI VALUES (4, 2, 6);
INSERT INTO OBJEKTI VALUES (4, 2, 3, 3, NULL);

# Vihollistyyppi
INSERT INTO VIHOLLISTYYPPI VALUES (1, 'Örkki', 1, 1, 1); 
INSERT INTO VIHOLLISTYYPPI VALUES (2, 'Vuorenpeikko', 1, 1, 1);

# Örkki1
INSERT INTO VIHOLLINEN VALUES (1, 1, 1, 3, 3);

# Örkki 2
INSERT INTO VIHOLLINEN VALUES (2, 1, 1, 3, 2);

# Vuorenpeikko
INSERT INTO VIHOLLINEN VALUES (3, 2, 1, 2, 2);

*/