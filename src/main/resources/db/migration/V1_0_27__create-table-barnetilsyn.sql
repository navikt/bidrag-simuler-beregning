-- Table: barnetilsyn

-- DROP TABLE barnetilsyn;
-- DROP TYPE tilsyntype;
-- DROP TYPE skolealder;

CREATE TYPE tilsyntype AS ENUM('HELTID', 'DELTID');

CREATE TYPE skolealder AS ENUM('UNDER', 'OVER');

CREATE TABLE IF NOT EXISTS barnetilsyn
(
    barnetilsyn_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    grunnlagspakke_id integer NOT NULL,
    part_person_id varchar(50) not null,
    barn_person_id varchar(50) NOT NULL,
    periode_fra date NOT NULL,
    periode_til date,
    aktiv boolean DEFAULT true NOT NULL,
    bruk_fra timestamp DEFAULT now() NOT NULL,
    bruk_til timestamp,
    belop integer,
    tilsyntype varchar(255),
    skolealder varchar(255),
    hentet_tidspunkt timestamp DEFAULT now() NOT NULL,
    CONSTRAINT barnetilsyn_pkey PRIMARY KEY (barnetilsyn_id),
    CONSTRAINT grunnlagspakke_barnetilsyn_fkey FOREIGN KEY (grunnlagspakke_id)
        REFERENCES grunnlagspakke (grunnlagspakke_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    UNIQUE (barnetilsyn_id, grunnlagspakke_id)
)
    TABLESPACE pg_default;