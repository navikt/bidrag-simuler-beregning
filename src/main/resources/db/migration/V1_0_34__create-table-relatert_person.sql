-- Table: relatert_person

-- DROP TABLE relatert_person;

CREATE TABLE IF NOT EXISTS relatert_person
(
    relatert_person_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    grunnlagspakke_id integer NOT NULL,
    part_person_id varchar(50) NOT NULL,
    relatert_person_person_id varchar(50),
    navn varchar(255),
    fodselsdato date,
    er_barn_av_bm_bp boolean,
    husstandsmedlem_periode_fra date,
    husstandsmedlem_periode_til date,
    aktiv boolean DEFAULT true NOT NULL,
    bruk_fra timestamp DEFAULT now() NOT NULL,
    bruk_til timestamp,
    hentet_tidspunkt timestamp DEFAULT now() NOT NULL,
    CONSTRAINT relatert_person_id_pkey PRIMARY KEY (relatert_person_id),
    UNIQUE (relatert_person_id, grunnlagspakke_id)
)
    TABLESPACE pg_default;

CREATE INDEX idx_relatert_person_1 ON relatert_person(grunnlagspakke_id, aktiv);

