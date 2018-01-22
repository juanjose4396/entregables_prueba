-- Database: cineDB

-- DROP DATABASE "cineDB";

CREATE DATABASE "cineDB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Colombia.1252'
    LC_CTYPE = 'Spanish_Colombia.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- SCHEMA: cine

-- DROP SCHEMA cine ;

CREATE SCHEMA cine
    AUTHORIZATION postgres;

-- Table: cine.roles

-- DROP TABLE cine.roles;

CREATE TABLE cine.roles
(
    id bigint NOT NULL,
    nombre character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT roles_key PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cine.roles
    OWNER to postgres;

-- Table: cine.usuarios

-- DROP TABLE cine.usuarios;

CREATE TABLE cine.usuarios
(
    id bigint NOT NULL,
    email character varying(150) COLLATE pg_catalog."default",
    password character varying(15) COLLATE pg_catalog."default",
    rol_fk bigint,
    CONSTRAINT usuario_key PRIMARY KEY (id),
    CONSTRAINT usuario_rol_fk FOREIGN KEY (rol_fk)
        REFERENCES cine.roles (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cine.usuarios
    OWNER to postgres;

-- Table: cine.sillas

-- DROP TABLE cine.sillas;

CREATE TABLE cine.sillas
(
    id bigint NOT NULL,
    ubicacion character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT sillas_key PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cine.sillas
    OWNER to postgres;

-- Table: cine.peliculas

-- DROP TABLE cine.peliculas;

CREATE TABLE cine.peliculas
(
    id bigint NOT NULL,
    fecha date,
    nombre character varying(200) COLLATE pg_catalog."default",
    descripcion text COLLATE pg_catalog."default",
    url text COLLATE pg_catalog."default",
    precio integer,
    CONSTRAINT peliculas_key PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cine.peliculas
    OWNER to postgres;

-- Table: cine.boletas

-- DROP TABLE cine.boletas;

CREATE TABLE cine.boletas
(
    id bigint NOT NULL,
    usuario_fk bigint,
    pelicula_fk bigint,
    silla_fk bigint,
    tipo character varying(10) COLLATE pg_catalog."default",
    fecha date,
    CONSTRAINT boletas_key PRIMARY KEY (id),
    CONSTRAINT boleta_pelicula_fk FOREIGN KEY (pelicula_fk)
        REFERENCES cine.peliculas (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT boleta_silla_fk FOREIGN KEY (silla_fk)
        REFERENCES cine.sillas (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT boleta_usuario_fk FOREIGN KEY (usuario_fk)
        REFERENCES cine.usuarios (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cine.boletas
    OWNER to postgres;

--Secuencias

CREATE SEQUENCE cine.boletas_id_seq
    INCREMENT 1
    START 27
    MINVALUE 0
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE cine.boletas_id_seq
    OWNER TO postgres;

CREATE SEQUENCE cine.peliculas_id_seq
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE cine.peliculas_id_seq
    OWNER TO postgres;

CREATE SEQUENCE cine.roles_id_seq
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE cine.roles_id_seq
    OWNER TO postgres;

CREATE SEQUENCE cine.sillas_id_seq
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE cine.sillas_id_seq
    OWNER TO postgres;

CREATE SEQUENCE cine.usuarios_id_seq
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 999999999999999999
    CACHE 1;

ALTER SEQUENCE cine.usuarios_id_seq
    OWNER TO postgres;