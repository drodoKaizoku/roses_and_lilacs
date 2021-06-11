DROP SCHEMA IF EXISTS project CASCADE;
CREATE SCHEMA project;
CREATE TABLE project.clients (
	id_client SERIAL PRIMARY KEY,
	lastname VARCHAR(100) NOT NULL,
	firstname VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,	
	street_name VARCHAR(100) NOT NULL,
	street_number VARCHAR(100) NOT NULL,
	phone_number VARCHAR(100) NOT NULL,
	postcode VARCHAR(100) NOT NULL,
	postbox VARCHAR(100) NOT NULL,
	city VARCHAR(100) NOT NULL
);
CREATE TABLE project.users (
	id_user SERIAL PRIMARY KEY,
	username VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	firstname VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,	
	city VARCHAR(100) NOT NULL,
	psw VARCHAR(100) NOT NULL,
	worker BOOLEAN NOT NULL,
	client INTEGER REFERENCES project.clients(id_client),
	confirmed BOOLEAN NOT NULL,
	registration_date DATE NOT NULL
);

CREATE TABLE project.project_types(
	id_project_type SERIAL PRIMARY KEY,
	project_type_name VARCHAR(100) NOT NULL
);

CREATE TABLE project.quotes(
	id_quote SERIAL PRIMARY KEY,
	date_quote DATE NOT NULL,
	client INTEGER REFERENCES project.clients(id_client) NOT NULL,
	work_period VARCHAR(100) NOT NULL,
	favorite_picture INTEGER,	
	status VARCHAR(100) NOT NULL,
	full_amount INTEGER NOT NULL,
	date_start_work DATE
);

CREATE TABLE project.project_quote(
	id_quote INTEGER REFERENCES project.quotes(id_quote) NOT NULL,
	id_project_type INTEGER REFERENCES project.project_types(id_project_type) NOT NULL,
	CONSTRAINT id_project_quote PRIMARY KEY (id_quote, id_project_type)
);

CREATE TABLE project.pictures (
	id_picture SERIAL PRIMARY KEY,
	src TEXT NOT NULL,
	quote INTEGER REFERENCES project.quotes(id_quote) NOT NULL,
	showed BOOLEAN NOT NULL,
	project_type INTEGER REFERENCES project.project_types(id_project_type)
);
ALTER TABLE project.quotes 
ADD FOREIGN KEY (favorite_picture) REFERENCES project.pictures(id_picture);
/*GRANT*/
GRANT CONNECT on DATABASE dbpierre_bertholet TO antoine_honinckx;
/* password = azerty123*/
INSERT INTO project.clients VALUES (DEFAULT ,'Dupont','Benoit','benoit@gmail.com','Clos Chapelle-aux-Champs', '43','0465237956','1200','6','Brussels');
INSERT INTO project.users VALUES (DEFAULT ,'benoit_dupont','Dupont','Benoit','benoit@gmail.com','Brussels','$2a$10$xTjPf8392g4yzfGzsA.QhOnUNqkuVe4ZQJynKOetHrKJLT8e/epUK
',false,1,true,'19-03-2020');
INSERT INTO project.users VALUES (DEFAULT ,'test','Test','Test','test@gmail.com','Brussels','$2a$12$HVP8lYGebd/vCxmYGWJWAuyhYPjjQVCXpkrFQdE.45WVeSNIDpSVW',false,NULL,true,'19-03-2020');
INSERT INTO project.users VALUES (DEFAULT ,'test1','Test','Test','test1@gmail.com','Brussels','$2a$12$HVP8lYGebd/vCxmYGWJWAuyhYPjjQVCXpkrFQdE.45WVeSNIDpSVW',true,NULL,true,'19-03-2020');
INSERT INTO project.project_types VALUES (DEFAULT,'city garden layout');
INSERT INTO project.project_types VALUES (DEFAULT,'garden layout');
INSERT INTO project.project_types VALUES (DEFAULT,'landscape park development');
INSERT INTO project.project_types VALUES (DEFAULT,'vegetable garden creation');
INSERT INTO project.project_types VALUES (DEFAULT,'maintenance of high-stem orchard');
INSERT INTO project.project_types VALUES (DEFAULT,'Dwarf-Tree Orchard');
INSERT INTO project.project_types VALUES (DEFAULT,'pond development');
INSERT INTO project.project_types VALUES (DEFAULT,'installation of automatic sprinkler system');
INSERT INTO project.project_types VALUES (DEFAULT,'wooden terraces');
INSERT INTO project.project_types VALUES (DEFAULT,'natural stone terraces');