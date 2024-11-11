-- SCHEMA: sistema

-- DROP SCHEMA IF EXISTS sistema ;

CREATE SCHEMA IF NOT EXISTS sistema
    AUTHORIZATION postgres;
	

CREATE TABLE IF NOT EXISTS sistema.cliente
(
    nome text COLLATE pg_catalog."default",
    senha text COLLATE pg_catalog."default",
    cpf text COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (email)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sistema.cliente
    OWNER to postgres;


	CREATE TABLE IF NOT EXISTS sistema.produto
(
    codigoproduto integer NOT NULL,
    nomeproduto text COLLATE pg_catalog."default",
    tipoproduto text COLLATE pg_catalog."default",
    tamanhoproduto integer,
    preco integer,
    CONSTRAINT produto_pkey PRIMARY KEY (codigoproduto)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sistema.produto
    OWNER to postgres;



	CREATE TABLE IF NOT EXISTS sistema.vendas
(
    email text COLLATE pg_catalog."default",
    codigoproduto integer,
    datavenda date,
    codigovendas integer NOT NULL,
    CONSTRAINT vendas_pkey PRIMARY KEY (codigovendas),
    CONSTRAINT pk_cliente FOREIGN KEY (email)
        REFERENCES sistema.cliente (email) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT pk_produtos FOREIGN KEY (codigoproduto)
        REFERENCES sistema.produto (codigoproduto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sistema.vendas
    OWNER to postgres;