--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sarumhymnal; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sarumhymnal;


ALTER SCHEMA sarumhymnal OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: common; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.common (
    catagory character varying NOT NULL,
    abbrev character varying NOT NULL,
    vespers1 character varying,
    vespers1_melody character varying,
    matins character varying,
    matins_melody character varying,
    lauds character varying,
    lauds_melody character varying,
    vespers2 character varying,
    vespers2_melody character varying
);


ALTER TABLE sarumhymnal.common OWNER TO postgres;

--
-- Name: entry; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.entry (
    image character varying NOT NULL,
    folio character varying NOT NULL,
    stave character varying NOT NULL,
    hymn character varying,
    first_line character varying,
    melody character varying,
    cycle character varying
);


ALTER TABLE sarumhymnal.entry OWNER TO postgres;

--
-- Name: hymn; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.hymn (
    name character varying NOT NULL
);


ALTER TABLE sarumhymnal.hymn OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.image (
    filename character varying NOT NULL
);


ALTER TABLE sarumhymnal.image OWNER TO postgres;

--
-- Name: psalter; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.psalter (
    matins character varying,
    lauds character varying,
    prime character varying,
    terce character varying,
    sext character varying,
    "none" character varying,
    vespers character varying,
    "desc" character varying NOT NULL
);


ALTER TABLE sarumhymnal.psalter OWNER TO postgres;

--
-- Name: sanctoral; Type: TABLE; Schema: sarumhymnal; Owner: postgres
--

CREATE TABLE sarumhymnal.sanctoral (
    month integer NOT NULL,
    day integer NOT NULL,
    common character varying,
    vespers1 character varying,
    matins character varying,
    lauds character varying,
    vespers2 character varying,
    "ID" integer NOT NULL
);


ALTER TABLE sarumhymnal.sanctoral OWNER TO postgres;

--
-- Name: sanctoral_ID_seq; Type: SEQUENCE; Schema: sarumhymnal; Owner: postgres
--

CREATE SEQUENCE sarumhymnal."sanctoral_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sarumhymnal."sanctoral_ID_seq" OWNER TO postgres;

--
-- Name: sanctoral_ID_seq; Type: SEQUENCE OWNED BY; Schema: sarumhymnal; Owner: postgres
--

ALTER SEQUENCE sarumhymnal."sanctoral_ID_seq" OWNED BY sarumhymnal.sanctoral."ID";


--
-- Name: sanctoral ID; Type: DEFAULT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.sanctoral ALTER COLUMN "ID" SET DEFAULT nextval('sarumhymnal."sanctoral_ID_seq"'::regclass);


--
-- Data for Name: common; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.common (catagory, abbrev, vespers1, vespers1_melody, matins, matins_melody, lauds, lauds_melody, vespers2, vespers2_melody) FROM stdin;
﻿Apostle(s)	Ap	Annue Christe	DAB.G.AB.C.BA.D.C.BA	Annue Christe	DAB.G.AB.C.BA.D.C.BA	Exultet celum laudibus	G.GCCB.AG.AF.AC.CB.AG.FG.G	Exultet celum laudibus	G.GCCB.AG.AF.AC.CB.AG.FG.G
Martyr, Per annum	Ma	Martyr dei	CD.DAB.A.AG.GA.G.GF	Martyr dei	CD.DAB.A.AG.GA.G.GF	Deus tuorum militum	CD.DAB.A.AG.GA.G.GF	Deus tuorum militum	CD.DAB.A.AG.GA.G.GF
Martyrs, Per annum	Mas	Sanctorum meritis	G.B.C.DE.C.D	Sanctorum meritis	D.E.F.G.A.GA	Rex gloriose martyrum	CD.DAB.A.AG.GA.G.GF	Rex gloriose martyrum	CD.DAB.A.AG.GA.G.GF
Confessor	Co	Iste confessor	DF.D.D.C.D	Iste confessor	GAGG.E.F.ED.DE	Jesu redemptor omnium	CD.DAB.A.AG.GA.G.GF	Jesu redemptor omnium	CD.DAB.A.AG.GA.G.GF
Virgin	Vi	Virginis proles	DF.D.D.C.D	Virginis proles	GAGG.E.F.ED.DE	Jesu corona virginum	CD.DAB.A.AG.GA.G.GF	Jesu corona virginum	G.AB.C.BA.G.A.F.G
\.


--
-- Data for Name: entry; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.entry (image, folio, stave, hymn, first_line, melody, cycle) FROM stdin;
﻿001r	001r	4-9	Conditor alme syderum	F3	E.C.E.G.A.A.F.G	Temporal
001v	001v	1-7	Conditor alme syderum	F3	E.C.E.G.A.A.F.G	Temporal
001v	001v	8-9	Verbum supernum	C4	E.C.E.G.A.B.A.A	Temporal
002r	002r	1-9	Verbum supernum	C4	E.C.E.G.A.B.A.A	Temporal
002r	002r	9	Vox clara ecce intonat	F3	E.C.E.G.A.B.A.A	Temporal
002v	002v	1-8	Vox clara ecce intonat	F3/C4	E.C.E.G.A.B.A.A	Temporal
002v	002v	8-9	Iam lucis orto sydere	F3/C4	E.C.E.G.A.B.A.A	Temporal
003r	003r	1-9	Iam lucis orto sydere	F3/C4	E.C.E.G.A.B.A.A	Temporal
003v	003v	1	Iam lucis orto sydere	F3	E.C.E.G.A.B.A.A	Temporal
003v	003v	1-9	Iam lucis orto sydere	C4	G.G.A.G.F.G.A.GA	Temporal
004r	004r	1-2	Iam lucis orto sydere	C4	G.G.A.G.F.G.A.GA	Temporal
004r	004r	3-9	Veni redemptor gentium	Bfa4/F4	CD.DAB.A.A.AG.GA.G.GF	Temporal
004v	004v	1-9	Veni redemptor gentium	Bfa4/F4	CD.DAB.A.A.AG.GA.G.GF	Temporal
005r	005r	1-9	Salvator mundi domine	C3	G.A.GF.G.AG.C.DC.C	Temporal
005v	005v	1	Salvator mundi domine	C3	G.A.GF.G.AG.C.DC.C	Temporal
005v	005v	2-9	Christe redemptor omnium	C4/F3	C.D.EG.GF.ED.F.EDC.D	Temporal
006r	006r	1-8	Christe redemptor omnium	C4/F3	C.D.EG.GF.ED.F.EDC.D	Temporal
006r	006r	8-9	A solis ortus cardine	C4	D.E.F.GA.D.EFG.FE.E	Temporal
006v	006v	1-9	A solis ortus cardine	C4	D.E.F.GA.D.EFG.FE.E	Temporal
007r	007r	1-6	A solis ortus cardine	C4	D.E.F.GA.D.EFG.FE.E	Temporal
007r	007r	7-9	Iam lucis orto sydere	C3/Bfa	D.DCBC.AG.C.D.DE.DC.CD	Temporal
007v	007v	1-7	Iam lucis orto sydere	C3/Bfa	D.DCBC.AG.C.D.DE.DC.CD	Temporal
007v	007v	8-9	Iam lucis orto sydere	C4	D.E.F.GA.D.EFG.FE.E	Temporal
008r	008r	1-8	Iam lucis orto sydere	C4	D.E.F.GA.D.EFG.FE.E	Temporal
008r	008r	9	Iam lucis orto sydere	F3/C4	C.D.EG.GF.ED.F.EDC.D	Temporal
008v	008v	1-8	Iam lucis orto sydere	C4/F3	C.D.EG.GF.ED.F.EDC.D	Temporal
008v	008v	9	Martyr dei qui vnicum	F3	C.D.EG.GF.ED.F.EDC.D	Temporal
009r	009r	1-8	Sancte dei preciose	F3	A.A.A.GF.G.A.A.D	Temporal
009r	009r	9	Bina caelestis aulae	C4	DAAB.G.AB.C.BA.D.C.BA.G.C.BAG.A	Temporal
009v	009v	1-4	Bina caelestis aulae	C4	DAAB.G.AB.C.BA.D.C.BA.G.C.BAG.A	Temporal
009v	009v	5	Exultet caelum laudibus	\N	unnoted	Temporal
009v	009v	6-7	Rex gloriose martyrum	Bfa3	CD.DAB.A.A.AG.[GA.G.GF]	Temporal
009v	009v	6	Sanctorum meritis	C4	D.E.F.G.A.GA	Temporal
009v	009v	7	Rex gloriose martyrum	C4	D.E.F.GA.D.[EFG.FE.E]	Temporal
009v	009v	8-9	\N	\N	.	Temporal
010r	010r	1-2	\N	\N	.	Temporal
010r	010r	3-9	Iam lucis orto sydere	F4	A.CD.D.DF.D.CD.D.D	Temporal
010v	010v	1-4	Iam lucis orto sydere	F4	A.CD.D.DF.D.CD.D.D	Temporal
010v	010v	5-9	Hostis herodes	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
011r	011r	1-5	Hostis herodes	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
011r	011r	6-9	Hostis herodes	C4/Bfa3	G.G.F.E.D.FAG.FG.G	Temporal
011v	011v	1-8	Hostis herodes	C4/Bfa3/Bmi	G.G.F.E.D.FAG.FG.G	Temporal
011v	011v	9	A patre vnigenitus	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
012r	012r	1-9	A patre vnigenitus	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
012v	012v	1-2	A patre vnigenitus	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
012v	012v	3-9	Iam lucis orto sydere	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
013r	013r	1-4	Iam lucis orto sydere	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
013r	013r	4-5	Hostis herodes	C4	G.G.F.E.D.FAG.FG.G	Temporal
013r	013r	5-9	Iam lucis orto sydere	C4	G.G.F.E.D.FAG.FG.G	Temporal
013v	013v	1-5	Iam lucis orto sydere	C4	G.G.F.E.D.FAG.FG.G	Temporal
013v	013v	6	Hostis herodes	C4	G.GABCA.G.FE.D.DFE.FG.G	Temporal
013v	013v	8-9	Deus creator omnium	C4	F.E.G.AG.F.GAGFE.E	Temporal
014r	014r	1-9	Deus creator omnium	C4	F.E.G.AG.F.GAGFE.E	Temporal
014v	014v	1-6	Deus creator omnium	C4	F.E.G.AG.F.GAGFE.E	Temporal
014v	014v	7-9	Primo dierum omnium	F3/Bfa4	D.E.F.G.EG.F.E.F	Temporal
015r	015r	1-9	Primo dierum omnium	F3/Bfa4	D.E.F.G.EG.F.E.F	Temporal
015v	015v	1-8	Primo dierum omnium+	F3/Bfa4	D.E.F.G.EG.F.E.F	Temporal
015v	015v	8-9	Primo dierum omnium+	F3/Bfa4	D.E.F.G.EG.F.E.F	Temporal
016r	016r	1-2	Primo dierum omnium	F3/Bfa4	D.E.F.G.EG.F.E.F	Temporal
016r	016r	2-9	Aeterne rerum conditor	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
016v	016v	1-9	Aeterne rerum conditor	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
017r	017r	1	Aeterne rerum conditor	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
017r	017r	2-3	Aeterne rerum conditor+	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
017r	017r	4-9	Iam lucis orto sydere	C4	F.E.G.AG.F.GAGFE.E	Temporal
017v	017v	1-5	Iam lucis orto sydere	C4	F.E.G.AG.F.GAGFE.E	Temporal
017v	017v	6	Iam lucis orto sydere+	C4	F.E.G.AG.F.GAGFE.E	Temporal
017v	017v	7-9	Lucis creator optime	C3	GAGG.F.AC.C.G.AG.FG.G	Temporal
018r	018r	1-7	Lucis creator optime	C3	GAGG.F.AC.C.G.AG.FG.G	Temporal
018r	018r	8-9	Lucis creator optime+	C3	GAGG.F.AC.C.G.AG.FG.G	Temporal
018v	018v	1-9	Somno refectis artibus	C4	D.E.F.G.EG.F.E.F	Temporal
019r	019r	1	Somno refectis artibus	C4	D.E.F.G.EG.F.E.F	Temporal
019r	019r	2-9	Splendor paternae gloriae	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
019v	019v	1-9	Splendor paternae gloriae	Bfa3	F.F.G.A.B.A.G.A	Temporal
019v	019v	9	Splendor paternae gloriae+	Bfa3	F.F.G.A.B.A.G.A	Temporal
020r	020r	1-2	Splendor paternae gloriae+	Bfa3	F.F.G.A.B.A.G.A	Temporal
020r	020r	2-9	Immense caeli conditor	F3	F.F.G.A.G.G.F.E	Temporal
020v	020v	1-2	Immense caeli conditor	F3	F.F.G.A.G.G.F.E	Temporal
020v	020v	2-4	Immense caeli conditor+	F3	F.F.G.A.G.G.F.E	Temporal
020v	020v	4-9	Consors paterni luminis	C4	D.E.F.G.EG.F.E.F	Temporal
021r	021r	1-2	Consors paterni luminis	C4	D.E.F.G.EG.F.E.F	Temporal
021r	021r	2	Consors paterni luminis+	C4	D.E.F.G.EG.F.E.F	Temporal
021r	021r	2-9	Ales diei nuncius	C4/Bfa3	F.F.G.A.B.A.G.A	Temporal
021v	021v	1	Ales diei nuncius	Bfa3	F.F.G.A.B.A.G.A	Temporal
021v	021v	2-3	Ales diei nuncius+	Bfa3	F.F.G.A.B.A.G.A	Temporal
021v	021v	4-9	Telluris ingens conditor	F3	F.F.G.A.G.G.F.E	Temporal
022r	022r	1-3	Telluris ingens conditor	F3	F.F.G.A.G.G.F.E	Temporal
022r	022r	3	Telluris ingens conditor+	F3	F.F.G.A.G.G.F.E	Temporal
022r	022r	4-9	Rerum creator optime	C4/Bfa3/F3	D.E.F.G.EG.F.E.F	Temporal
022v	022v	1-3	Rerum creator optime	F3	D.E.F.G.EG.F.E.F	Temporal
022v	022v	3	Rerum creator optime+	F3	D.E.F.G.EG.F.E.F	Temporal
022v	022v	4	Nox et tenebrae et nubila	Bfa3	F.F.F.G.A.B.A.G.A	Temporal
023r	023r	1-3	Nox et tenebrae et nubila	Bfa3	F.F.F.G.A.B.A.G.A	Temporal
023r	023r	3	Nox et tenebrae et nubila+	Bfa3	F.F.F.G.A.B.A.G.A	Temporal
023r	023r	4-9	Caeli deus sanctissime	F3	F.F.G.A.G.G.F.E	Temporal
023v	023v	1-3	Caeli deus sanctissime	F3	F.F.G.A.G.G.F.E	Temporal
023v	023v	3	Caeli deus sanctissime+	F3	F.F.G.A.G.G.F.E	Temporal
023v	023v	4-9	Nox atra rerum contigit	F3	D.E.F.G.EG.F.E.F	Temporal
024r	024r	1-3	Nox atra rerum contigit	F3	D.E.F.G.EG.F.E.F	Temporal
024r	024r	3	Nox atra rerum contigit+	F3	D.E.F.G.EG.F.E.F	Temporal
024r	024r	4-9	Lux ecce surgit aurea	Bfa3	F.F.G.A.B.A.G.A	Temporal
024v	024v	1-3	Lux ecce surgit aurea	Bfa3	F.F.G.A.B.A.G.A	Temporal
024v	024v	4	Lux ecce surgit aurea+	C4	F.F.G.A.B.A.G.A	Temporal
024v	024v	4-9	Magne deus potentiae	F3	F.F.G.A.G.G.F.E	Temporal
025r	025r	1-4	Magne deus potentiae	F3	F.F.G.A.G.G.F.E	Temporal
025r	025r	4	Magne deus potentiae+	F3	F.F.G.A.G.G.F.E	Temporal
025r	025r	5-9	Tui trinitatis vnitas	Bfa3	D.E.F.G.EG.F.E.F	Temporal
025v	025v	1-6	Tui trinitatis vnitas	Bfa3	D.E.F.G.EG.F.E.F	Temporal
025v	025v	6	Tui trinitatis vnitas+	Bfa3	D.E.F.G.EG.F.E.F	Temporal
025v	025v	7-9	Aeterna caeli gloria	Bfa3	F.F.G.A.B.A.G.A	Temporal
026r	026r	1-7	Aeterna caeli gloria	Bfa3	F.F.G.A.B.A.G.A	Temporal
026r	026r	8	Aeterna caeli gloria+	Bfa3	F.F.G.A.B.A.G.A	Temporal
026r	026r	8-9	Plasmator hominis deus	C4	F.F.G.A.G.G.F.E	Temporal
026v	026v	1-7	Plasmator hominis deus	F3	F.F.G.A.G.G.F.E	Temporal
026v	026v	7	Plasmator hominis deus+	F3	F.F.G.A.G.G.F.E	Temporal
026v	026v	8-9	Summe deus clementiae	Bfa3	D.E.F.G.EG.F.E.F	Temporal
027r	027r	1-7	Summe deus clementiae	Bfa3	D.E.F.G.EG.F.E.F	Temporal
027r	027r	7	Summe deus clementiae+	Bfa3	D.E.F.G.EG.F.E.F	Temporal
027r	027r	8-9	Aurora iam spargit polum	Bfa3	F.F.G.A.B.A.G.A	Temporal
027v	027v	1-5	Aurora iam spargit polum	Bfa3	F.F.G.A.B.A.G.A	Temporal
027v	027v	5	Aurora iam spargit polum+	Bfa3	F.F.G.A.B.A.G.A	Temporal
027v	027v	6-9	Ex more docti mistico	F3	E.G.GA.A.GF.G.G.A	Temporal
028r	028r	1-9	Ex more docti mistico	F3	E.G.GA.A.GF.G.G.A	Temporal
028v	028v	1-6	Ex more docti mistico	F3	E.G.GA.A.GF.G.G.A	Temporal
028v	028v	6-9	Christe qui lux es et dies	F3	E.E.DC.D.E.F.D.D	Temporal
029r	029r	1-9	Christe qui lux es et dies	F3	E.E.DC.D.E.F.D.D	Temporal
029v	029v	1-2	Christe qui lux es et dies	F3	E.E.DC.D.E.F.D.D	Temporal
029v	029v	3-9	Summi largitor premii	F3	CD.D.DF.C.DF.FE.DE.E	Temporal
030r	030r	1-4	Summi largitor premii	F3	CD.D.DF.C.DF.FE.DE.E	Temporal
030r	030r	5-9	Audi benigne conditor	F3	Dc.D.FE.F.DE.ED.CD.D	Temporal
030v	030v	1-5	Audi benigne conditor	F3	Dc.D.FE.F.DE.ED.CD.D	Temporal
030v	030v	5-9	Ecce tempus ydoneum	C4	G.AB.B.C.BA.G.A.B	Temporal
031r	031r	1-5	Ecce tempus ydoneum	C4/F3	G.AB.B.C.BA.G.A.B	Temporal
031r	031r	6-9	Clarum decus ieiunii	F3	CD.D.DF.C.DF.FE.DE.E	Temporal
031v	031v	1-7	Clarum decus ieiunii	F3	CD.D.DF.C.DF.FE.DE.E	Temporal
031v	031v	7-9	Iesu quadragenarie	F3	F.EFGA.G.FD.F.EF.E.E	Temporal
032r	032r	1-9	Iesu quadragenarie	F3	F.EFGA.G.FD.F.EF.E.E	Temporal
032v	032v	1	Iesu quadragenarie	F3	F.EFGA.G.FD.F.EF.E.E	Temporal
032v	032v	1-9	Iam lucis orto sydere	F3	E.G.GA.A.GF.G.G.A	Temporal
033r	033r	1-2	Iam lucis orto sydere	F3	E.G.GA.A.GF.G.G.A	Temporal
033r	033r	3-9	Iam lucis orto sydere	C4	G.AB.BA.C.BA.G.A.B	Temporal
033v	033v	1-3	Iam lucis orto sydere	C4	G.AB.BA.C.BA.G.A.B	Temporal
033v	033v	4-9	Vexilla regis prodeunt	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Temporal
034r	034r	1-9	Vexilla regis prodeunt	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Temporal
034v	034v	1-3	Vexilla regis prodeunt	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Temporal
034v	034v	4-9	Cultor dei memento	C4	C.C.C.B.A.BC.A	Temporal
035r	035r	1-9	Cultor dei memento	C4	C.C.C.B.A.BC.A	Temporal
035v	035v	1	Cultor dei memento	C4	C.C.C.B.A.BC.A	Temporal
035v	035v	1-9	Pange lingua gloriose	C3/C2	A.A.A.G.C.C.DF.F	Temporal
036r	036r	1-7	Pange lingua gloriose	C3/C2/Bfa2	A.A.A.G.C.C.DF.F	Temporal
036r	036r	8-9	Lustra sex qui iam peracta	C2/C3	A.A.A.G.C.C.DF.F	Temporal
036v	036v	1-9	Lustra sex qui iam peracta	C3/Bfa1/C2	A.A.A.G.C.C.DF.F	Temporal
037r	037r	1-5	Lustra sex qui iam peracta	C3/Bfa1	A.A.A.G.C.C.DF.F	Temporal
037r	037r	6-9	Iam lucis orto sydere	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Temporal
037v	037v	1-7	Iam lucis orto sydere	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Temporal
037v	037v	8-9	Chorus novae hierusalem	C4	EFG.FE.DE.E.DC.D.FED.EFE	Temporal
038r	038r	1-9	Chorus novae hierusalem	C4	EFG.FE.DE.E.DC.D.FED.EFE	Temporal
038v	038v	1-3	Chorus novae hierusalem	C4	EFG.FE.DE.E.DC.D.FED.EFE	Temporal
038v	038v	3-9	Iesu salvator seculi	C3/C4	A.C.A.A.B.C.A.A	Temporal
039r	039r	1-6	Iesu salvator seculi	C3/C4	A.C.A.A.B.C.A.A	Temporal
039r	039r	6-9	Aurora lucis rutilat	Bfa3	F.F.G.A.B.A.G.F	Temporal
039v	039v	1-9	Aurora lucis rutilat	Bfa3	F.F.G.A.B.A.G.F	Temporal
040r	040r	1	Aurora lucis rutilat	Bfa3	F.F.G.A.B.A.G.F	Temporal
040r	040r	2-9	Sermone blando angelus	Bfa3	F.F.G.A.B.A.G.F	Temporal
040v	040v	1-3	Sermone blando angelus	Bfa3	F.F.G.A.B.A.G.F	Temporal
040v	040v	4-9	Iam lucis orto sydere	F3/C4	EFG.FE.DE.E.DC.D.FED.EFE	Temporal
041r	041r	1-6	Iam lucis orto sydere	F3/C4	EFG.FE.DE.E.DC.D.FED.EFE	Temporal
041r	041r	7	Iam lucis orto sydere	F4	A.CD.D.DF.D.CD.D.D	Temporal
041r	041r	8-9	Iam lucis orto sydere	F4	A.CD.D.DF.D.CD.D.D	Temporal
041v	041v	1	Iam lucis orto sydere	F4	A.CD.D.DF.D.CD.D.D	Temporal
041v	041v	2-9	Ad cenam agni providi	C4	F.FFE.D.E.G.A.F.E	Temporal
042r	042r	1-8	Ad cenam agni providi	C4	F.FFE.D.E.G.A.F.E	Temporal
042r	042r	8-9	Ad cenam agni providi	C4	A.C.AG.CB.CD.C.B.A	Temporal
042v	042v	1-9	Ad cenam agni providi	C4	A.C.AG.CB.CD.C.B.A	Temporal
043r	043r	1-4	Ad cenam agni providi	C4	A.C.AG.CB.CD.C.B.A	Temporal
043r	043r	5-9	Aeterne rex altissime	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
043v	043v	1-7	Aeterne rex altissime	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
043v	043v	7-9	Iesu nostra redemptio	F3	F.EFGA.G.FD.F.EF.E.E	Temporal
044r	044r	1-8	Iesu nostra redemptio	F3	F.EFGA.G.FD.F.EF.E.E	Temporal
044r	044r	9	Tu christe nostrum gaudium	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
044v	044v	1-7	Tu christe nostrum gaudium	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
044v	044v	8-9	Iam lucis orto sydere	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
045r	045r	1-8	Iam lucis orto sydere	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
045r	045r	8-9	Iam christus astra ascenderat	C4	D.D.F.D.DC.F.G.A	Temporal
045v	045v	1-9	Iam christus astra ascenderat	C4	D.D.F.D.DC.F.G.A	Temporal
046r	046r	1	iam christus astra ascenderat	C4	D.D.F.D.DC.F.G.A	Temporal
046r	046r	2-9	Impleta gaudent viscera	C4	D.D.F.D.DC.F.G.A	Temporal
046v	046v	1-8	Iam lucis orto sydere	C4	D.D.F.D.DC.F.G.A	Temporal
046v	046v	9	Veni creator spiritus	C3	G.A.GF.G.AG.C.DC.C	Temporal
047r	047r	1-9	Veni creator spiritus	C3	G.A.GF.G.AG.C.DC.C	Temporal
047v	047v	1-3	Veni creator spiritus	C3	G.A.GF.G.AG.C.DC.C	Temporal
047v	047v	3-9	Beata nobis gaudia	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Temporal
048r	048r	1-7	Beata nobis gaudia	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Temporal
048r	048r	8-9	Alma chorus domini	C4	G.G.G.A.G.F.A	Temporal
048v	048v	1-9	Alma chorus domini	C3/C4	G.G.G.A.G.F.A	Temporal
049r	049r	1	Alma chorus domini	F3/C4	G.G.G.A.G.F.A	Temporal
049r	049r	2-9	Adesto sancta trinitas	C4	ED.G.AC.CCB.AG.A.GF.E	Temporal
049v	049v	1-2	Adesto sancta trinitas	C4	ED.G.AC.CCB.AG.A.GF.E	Temporal
049v	049v	2-9	O pater sancte mitis	F3	F.D.E.E.E.E.E	Temporal
050r	050r	1-2	O pater sancte mitis	F3	F.D.E.E.E.E.E	Temporal
050r	050r	2-9	Sacris solemniis	C3/F3/C2	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Temporal
050v	050v	1-9	Sacris solemniis	C3/C2	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Temporal
051r	051r	1	Sacris solemniis	C3	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Temporal
051r	051r	2-9	Pange lingua gloriose	C2/Bfa1/Bmi1	A.A.A.G.C.C.DF.F	Temporal
051v	051v	1-7	Pange lingua gloriose	C2/Bf1	A.A.A.G.C.C.DF.F	Temporal
051v	051v	7-9	Verbum supernum prodiens	C3	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
052r	052r	1-7	Verbum supernum prodiens	C3	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Temporal
052r	052r	8-9	Iam lucis orto sydere	F3/Bfa3	F.GA.A.AG.F.A.F.F	Temporal
052v	052v	1-6	Iam lucis orto sydere	Bfa3	F.GA.A.AG.F.A.F.F	Temporal
052v	052v	7-9	O lux beata trinitas	C4	GA.GFEF.D.E.F.GA.AG.G	Temporal
053r	053r	1-3	O lux beata trinitas	C4	GA.GFEF.D.E.F.GA.AG.G	Temporal
053r	053r	4-9	Nocte surgentes vigilemus omnes	F3	D.F.Ed.F.F.D.E.C.D.F.F	Temporal
053v	053v	1	Nocte surgentes vigilemus omnes	F3	D.F.Ed.F.F.D.E.C.D.F.F	Temporal
053v	053v	1-7	Nocte surgentes vigilemus omnes	F3	E.F.E.D.E.E.D.C.D.E.E	Temporal
053v	053v	8-9	Ecce iam noctis tenuatur	F3	D.F.Ed.F.F.D.E.C.D.F.F	Temporal
054r	054r	1-3	Ecce iam noctis tenuatur	F3	D.F.Ed.F.F.D.E.C.D.F.F	Temporal
054r	054r	4-8	Ecce iam noctis tenuatur	F3	E.F.E.D.E.E.D.C.D.E.E	Temporal
054r	054r	9	Iam lucis orto sydere	C4	ED.G.AC.CCB.AG.A.GF.E	Temporal
054v	054v	1-9	Iam lucis orto sydere	C4	ED.G.AC.CCB.AG.A.GF.E	Temporal
054v	054v	9	Urbs beata hierusalem	F3	A.A.A.GF.G.A.A.D	Temporal
055r	055r	1-9	Urbs beata hierusalem	F3	A.A.A.GF.G.A.A.D	Temporal
055v	055v	1-3	Urbs beata hierusalem	F3	A.A.A.GF.G.A.A.D	Temporal
055v	055v	3-9	Angulare fundamentum	F3	A.A.A.GF.G.A.A.D	Temporal
056r	056r	1-4	Angulare fundamentum	F3	A.A.A.GF.G.A.A.D	Temporal
056r	056r	5	Iam lucis orto sydere	C3	D.DCBC.AG.C.D.DE.DC.CD	Temporal
056r	056r	6	Iam lucis orto sydere	F3	F.GA.A.[AG.F.A.F.F]	Temporal
056r	056r	7	rubrics	\N	.	Common
056r	056r	8-9	Iam lucis orto sydere	C4	G.GCCB.AG.AF.AC.CB.AG.FG.G	PSALTER
056v	056v	1-9	Iam lucis orto sydere	C4	F.FE.D.E.G.A.F.E	PSALTER
056v	056v	2-9	Iam lucis orto sydere	C4	G.GCCB.AG.AF.AC.CB.AG.FG.G	PSALTER
057r	057r	1-9	Iam lucis orto sydere	C4	F.FE.D.E.G.A.F.E	PSALTER
057v	057v	1	Iam lucis orto sydere	C4	F.FE.D.E.G.A.F.E	PSALTER
057v	057v	3	Iam lucis orto sydere	C3	D.DCBC.AG.C.D.DE.DC.CD	PSALTER
057v	057v	4	Iam lucis orto sydere	F3	C.D.EG.GF.ED.F.EDC.D	PSALTER
057v	057v	6-9	Iam lucis orto sydere	Bfa3	G.GFEF.DC.F.GB.BA.G.A	PSALTER
058r	058r	1-6	Iam lucis orto sydere	Bfa3	G.GFEF.DC.F.GB.BA.G.A	PSALTER
058r	058r	7-9	Nunc sancte nobis spiritus	C4	E.E.ED.E.DC.C.CD.D	PSALTER
058v	058v	1-4	Nunc sancte nobis spiritus	C4	E.E.ED.E.DC.C.CD.D	PSALTER
058v	058v	5-9	Nunc sancte nobis spiritus	C3	G.A.GF.G.AG.C.DC.C	PSALTER
059r	059r	1-8	Nunc sancte nobis spiritus	F3	FGF.E.G.GA.AG.F.D.E	PSALTER
059r	059r	9	Nunc sancte nobis spiritus	C4	A.A.A.A.A.A.A.G	PSALTER
059v	059v	1-5	Nunc sancte nobis spiritus	C4	A.A.A.A.A.A.A.G	PSALTER
059v	059v	6-9	Rector potens verax deus	C4	A.G.A.C.D.C.B.A	PSALTER
060r	060r	1-2	Rector potens verax deus	C3	A.G.A.C.D.C.B.A	PSALTER
060r	060r	4-9	Rector potens verax deus	F3	D.C.D.DF.FE.DE.D.C.	PSALTER
060v	060v	1-5	Rector potens verax deus	C4	A.A.A.A.A.A.A.G	PSALTER
060v	060v	6-9	Rerum deus tenax vigor	F3	FGF.E.G.GA.AG.F.D.E	PSALTER
061r	061r	1	Rerum deus tenax vigor	C4	FGF.E.G.GA.AG.F.D.E	PSALTER
061r	061r	2-5	Rerum deus tenax vigor	C3/C4	A.G.A.C.D.C.B.A	PSALTER
061r	061r	6-9	Rerum deus tenax vigor	F3	FGF.E.G.GA.AG.F.D.E	PSALTER
061v	061v	1-9	Lucis creator optime	C3/C4/Bfa2	GAGG.F.AC.C.G.AG.FG.G	Common
062r	062r	1	Lucis creator optime	C4	GAGG.F.AC.C.G.AG.FG.G	Common
062r	062r	1-7	Te lucis ante terminum	C4	A.C.A.A.B.C.A.A	Common
062r	062r	7-9	Te lucis ante terminum	C4	A.C.C.C.C.D.C.B	Common
062v	062v	1-3	Te lucis ante terminum	C4	A.C.C.C.C.D.C.B	Common
062v	062v	4	Salvator mundi domine	C3	G.A.GF.G.AG.C.DC.C	Common
062v	062v	5	Heading: St Andrew	\N	.	Sanctoral
062v	062v	6-8	Andrea pie sanctorum	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
062v	062v	9	Andrea pie sanctorum	F3	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
063r	063r	1-2	Andrea pie sanctorum	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
063r	063r	3-5	O thoma christi perlustrator	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
063r	063r	6-8	Doctor egregie paule mores	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
063r	063r	9	Christi miles gloriose	F3	A.A.A.GF.G.A.A.D	Sanctoral
063v	063v	1-5	Christi miles gloriose	F3	A.A.A.GF.G.A.A.D	Sanctoral
063v	063v	6-9	Quod chorus vatum	C4/F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
064r	064r	1-7	Quod chorus vatum	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
064r	064r	8-9	Quem terra ponthus ethera	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
064v	064v	1-8	Quem terra ponthus ethera	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
064v	064v	8-9	O gloriosa femina	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
065r	065r	1-5	O gloriosa femina	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
065r	065r	5	(Letabundus)	\N	.	Sanctoral
065r	065r	6	(Quod chorus)	\N	.	Sanctoral
065r	065r	6-9	Laetabundus	Bfa1	F.GF.GA.F	Sanctoral
065v	065v	1-9	Laetabundus	Bfa1	F.GF.GA.F	Sanctoral
066r	066r	1	Laetabundus	Bfa1	F.GF.GA.F	Sanctoral
066r	066r	2-5	Iam bone pastor petre	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
066r	066r	5-8	Iam bone pastor petre	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
066r	066r	9	Mathia iuste duodeno solio	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
066v	066v	1-2	Mathia iuste duodeno solio	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
066v	066v	3	rubrics	\N	.	Sanctoral
066v	066v	4-9	Ave maris stella 	C4	DAA.G.AB.D.CBAG	Sanctoral
067r	067r	1-5	Ave maris stella 	C4	DAA.G.AB.D.CBAG	Sanctoral
067r	067r	5-9	Ave maris stella 	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
067v	067v	1-6	Ave maris stella 	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
067v	067v	6-9	Impleta sunt quae conciuit	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Sanctoral
068r	068r	1-6	Impleta sunt quae conciuit	Bfa3	F.GB.B.AGF.G.GAG.F.ED	Sanctoral
068r	068r	7	(Pange lingua)	\N	.	Sanctoral
068r	068r	7-9	Crux fidelis inter omnes	F3	A.A.A.GF.G.A.A.D	Sanctoral
068v	068v	1-4	Crux fidelis inter omnes	F3	A.A.A.GF.G.A.A.D	Sanctoral
068v	068v	5-9	Ut queant laxis	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
069r	069r	1-6	Ut queant laxis	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
069r	069r	7-9	Ut queant laxis	F3	D.C.DF.FE.DE	Sanctoral
069v	069v	1-8	Ut queant laxis	F3	D.C.DF.FE.DE	Sanctoral
069v	069v	8-9	Antra deserti teneris	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
070r	070r	1-8	Antra deserti teneris	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
070r	070r	8-9	Antra deserti teneris	F3	D.C.DF.FE.DE	Sanctoral
070v	070v	1-8	Antra deserti teneris	F3	D.C.DF.FE.DE	Sanctoral
070v	070v	8-9	O nimis felix meritique	F2	F.D.E.E.E.E.E.G.A	Sanctoral
071r	071r	1-9	O nimis felix meritique	F2	F.D.E.E.E.E.E.G.A	Sanctoral
071v	071v	1-9	Aurea luce et decore	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
072r	072r	1-6	Aurea luce et decore	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
072r	072r	7-9	Aurea luce et decore	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
072v	072v	1-9	Aurea luce et decore	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
073r	073r	1-4	Aurea luce et decore	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
073r	073r	4-7	Doctor egregie paule mores	F3	F.FE.DC.DFD.E.E.F.DC.FEFG	Sanctoral
073r	073r	8-9	Festum matris gloriose	F3	C.CD.D.DC.F.E.D.C	Sanctoral
073v	073v	1-9	Festum matris gloriose	F3	C.CD.D.DC.F.E.D.C	Sanctoral
074r	074r	1-3	Festum matris gloriose	F3	C.CD.D.DC.F.E.D.C	Sanctoral
074r	074r	4-9	Mundi salus affutura	F3	A.A.A.GF.G.A.A.D	Sanctoral
074v	074v	1-9	Mundi salus affutura	F3	A.A.A.GF.G.A.A.D	Sanctoral
075r	075r	1-2	Mundi salus affutura	F3	A.A.A.GF.G.A.A.D	Sanctoral
075r	075r	2-9	O salutaris fulgens	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
075v	075v	1-5	O salutaris fulgens	F3	DF.D.D.C.D.F.F.D.E.E.D	Sanctoral
075v	075v	6-9	Collaudemus magdalene	F3	A.A.A.GF.G.A.A.D	Sanctoral
076r	076r	1-9	Collaudemus magdalene	F3	A.A.A.GF.G.A.A.D	Sanctoral
076v	076v	1-2	Collaudemus magdalene	F3	A.A.A.GF.G.A.A.D	Sanctoral
076v	076v	2-9	Estimavit hortolanum	F3	C.CD.D.DC.F.E.D.C	Sanctoral
077r	077r	1-9	Estimavit hortolanum	F3	C.CD.D.DC.F.E.D.C	Sanctoral
077v	077v	1-9	O maria noli flere	F3	A.A.A.GF.G.A.A.D	Sanctoral
078r	078r	1-9	O maria noli flere	F3	A.A.A.GF.G.A.A.D	Sanctoral
078r	078r	9	Bina celestis aule lumina	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
078v	078v	1-3	Bina celestis aule lumina	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
078v	078v	4-9	In anne puerperio	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
079r	079r	2-6	In anne puerperio	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
079r	079r	6-9	Ave mater anna	C4	D.AA.G.AB.D..CBAG	Sanctoral
079v	079v	1-6	Ave mater anna	C4	D.AA.G.AB.D..CBAG	Sanctoral
079v	079v	6-9	Felix anna prae aliis	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
080r	080r	1-8	Felix anna prae aliis	Bfa3	G.GFEF.DC.F.GB.BA.G.A	Sanctoral
080r	080r	8-9	Iam bone pastor petre	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
080v	080v	1-2	Iam bone pastor petre	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
080v	080v	3-9	Caelestis formam glorie	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
081r	081r	1-5	Caelestis formam glorie	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
081r	081r	5-9	O sator rerum reparator eui	Bfa3	F.D.E.E.E.E.E.G.A	Sanctoral
081v	081v	1-7	O sator rerum reparator eui	Bfa3	F.D.E.E.E.E.E.G.A	Sanctoral
081v	081v	7-9	O nata lux de lumine	C3	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Sanctoral
082r	082r	1-9	O nata lux de lumine	C3	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Sanctoral
082v	082v	1-3	O nata lux de lumine	C3	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Sanctoral
082v	082v	3-9	Exultet cor precordiis	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Sanctoral
083r	083r	1-7	Exultet cor precordiis	F3	CD.DAB.A.A.AG.GA.G.GF	Sanctoral
083r	083r	8-9	Iesu dulcis memoria	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
083v	083v	1-9	Iesu dulcis memoria	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
084r	084r	1-2	Iesu dulcis memoria	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
084r	084r	3-9	Iesu auctor clementie	C4	D.E.F.GA.D.EFG.FE.E	Sanctoral
084v	084v	1-7	Iesu auctor clementie	C4	D.E.F.GA.D.EFG.FE.E	Sanctoral
084v	084v	8-9	O quam glorifica	F3	D.C.DF.FE.DE	Sanctoral
085r	085r	1-9	O quam glorifica	F3	D.C.DF.FE.DE	Sanctoral
085v	085v	1-4	Bartholomee caeli sydes	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
085v	085v	5-8	Matthee sancte bino	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
085v	085v	8-9	Tibi christe splendor patris	F3	C.CD.D.DC.F.E.D.C	Sanctoral
086r	086r	1-9	Tibi christe splendor patris	F3	C.CD.D.DC.F.E.D.C	Sanctoral
086v	086v	1-9	Christe sanctorum	Bfa3	A.G.A.GFFEF.DC.G.G	Sanctoral
087r	087r	1-4	Christe sanctorum	Bfa3	A.G.A.GFFEF.DC.G.G	Sanctoral
087r	087r	5-8	Beate symon et thadee	C4	DAB.G.AB.C.BA.D.C.BA	Sanctoral
087r	087r	8-9	Iesu salvator seculi	F3	CD.DAB.A.A.AG.GA.G.GF	Sanctoral
087v	087v	1-9	Iesu salvator seculi	F3	CD.DAB.A.A.AG.GA.G.GF	Sanctoral
088r	088r	1-2	Iesu salvator seculi	F3	CD.DAB.A.A.AG.GA.G.GF	Sanctoral
088r	088r	2-9	Christe redemptor omnium	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
088v	088v	1-5	Christe redemptor omnium	C4	C.D.EG.GF.ED.F.EDC.D	Sanctoral
088v	088v	6-9	Tristes erant apostoli	C4	F.FE.D.E.G.A.F.E	Common-Ap
089r	089r	1	Tristes erant apostoli	C4	F.FE.D.E.G.A.F.E	Common-Ap
089r	089r	1-8	Claro paschali gaudio	C4	F.FFE.D.E.G.A.F.E	Common-Ap
089r	089r	8-9	Tristes erant apostoli	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Ap
089v	089v	1	Tristes erant apostoli	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Ap
089v	089v	2-8	Claro paschali gaudio	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Ap
089v	089v	9	Annue christe seculorum	C4	DAB.G.AB.C.BA.D.C.BA	Common-Ap
090r	090r	1-9	Annue christe seculorum	C4	DAB.G.AB.C.BA.D.C.BA	Common-Ap
090v	090v	1-2	Annue christe seculorum	C4	DAB.G.AB.C.BA.D.C.BA	Common-Ap
090v	090v	2-9	Annue christe seculorum	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Common-Ap
091r	091r	1-5	Annue christe seculorum	C4	F.FE.DC.DFD.E.E.F.DC.FEFG	Common-Ap
091r	091r	5-9	Exultet caelum laudibus	F3	G.GCCB.AG.AF.AC.CB.AG.FG.G	Common-Ap
091v	091v	1-7	Exultet caelum laudibus	F3	G.GCCB.AG.AF.AC.CB.AG.FG.G	Common-Ap
091v	091v	8-9	Exultet celum laudibus	C4	G.AB.C.BA.G.A.F.G	Common-Ap
092r	092r	1-9	Exultet celum laudibus	C4	G.AB.C.BA.G.A.F.G	Common-Ap
092v	092v	1	Exultet celum laudibus	C4	G.AB.C.BA.G.A.F.G	Common-Ap
092v	092v	1-9	Exultet celum laudibus	F3	F.FG.F.FE.DC.DE.EE	Common-Ap
093r	093r	1-3	Exultet celum laudibus	F3	F.FG.F.FE.DC.DE.EE	Common-Ap
093r	093r	4-9	Exultet celum laudibus	C4	D.E.F.GA.D.EFG.FE.E	Common-Ap
093v	093v	1-5	Exultet celum laudibus	C4	D.E.F.GA.D.EFG.FE.E	Common-Ap
093v	093v	6-9	Martyr dei qui vnicum	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
094r	094r	1-4	Martyr dei qui vnicum	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
094r	094r	4-9	Martyr dei qui vnicum	C4	C.D.EG.GF.ED.F.EDC.D	Common-Ma
094v	094v	1-3	Martyr dei qui vnicum	C4	C.D.EG.GF.ED.F.EDC.D	Common-Ma
094v	094v	4-9	Martyr dei qui vnicum	C4	F.FFE.D.E.G.A.F.E	Common-Ma
095r	095r	1	Martyr dei qui vnicum	C4	F.FFE.D.E.G.A.F.E	Common-Ma
095r	095r	2-8	Martyr dei qui vnicum	C4	FGF.E.G.GA.AG.F.D.E	Common-Ma
095r	095r	9	Deus tuorum militum	Bfa3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
095v	095v	1-9	Deus tuorum militum	Bfa3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
096r	096r	1	Deus tuorum militum	Bfa3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
096r	096r	2-9	Deus tuorum militum	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Ma
096v	096v	1-3	Deus tuorum militum	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Ma
096v	096v	4-9	Deus tuorum militum	C4	G.AB.C.BA.G.A.F.G	Common-Ma
097r	097r	1-5	Deus tuorum militum	C4	G.AB.C.BA.G.A.F.G	Common-Ma
097r	097r	5-9	Deus tuorum militum	C4	D.E.F.GA.D.EFG.FE.E	Common-Ma
097v	097v	1-5	Deus tuorum militum	C4	D.E.F.GA.D.EFG.FE.E	Common-Ma
097v	097v	6-9	Deus tuorum militum	C4	F.FFE.D.E.G.A.F.E	Common-Ma
098r	098r	1-5	Deus tuorum militum	C4	F.FFE.D.E.G.A.F.E	Common-Ma
098r	098r	6-9	Sanctorum meritis	C3/C2	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Common-Ma
098v	098v	1-9	Sanctorum meritis	C3/C2	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Common-Ma
099r	099r	1-5	Sanctorum meritis	C3/C2	G.B.C.DE.C.D.G.AB.C.BAG.A.G	Common-Ma
099r	099r	5-9	Sanctorum meritis	C4	D.E.F.G.A.GA	Common-Ma
099v	099v	1-9	Sanctorum meritis	C4	D.E.F.G.A.GA	Common-Ma
100r	100r	1-4	Sanctorum meritis	C4	D.E.F.G.A.GA	Common-Ma
100r	100r	4-9	Sanctorum meritis	F2	DAB.A.AG.AC.AG.GA	Common-Ma
100v	100v	1-9	Sanctorum meritis	F2	DAB.A.AG.AC.AG.GA	Common-Ma
101r	101r	1-3	Sanctorum meritis	F2	DAB.A.AG.AC.AG.GA	Common-Ma
101r	101r	4-9	Sanctorum meritis	C3/C4	Ga.A.ACCB.G.A.C	Common-Ma
101v	101v	1-9	Sanctorum meritis	C3/C4	Ga.A.ACCB.G.A.C	Common-Ma
102r	102r	1	Sanctorum meritis	C3/C4	Ga.A.ACCB.G.A.C	Common-Ma
102r	102r	2-9	Rex gloriose martyrum	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Common-Ma
102v	102v	1-8	Rex gloriose martyrum	C4	G.AB.C.BA.G.A.F.G	Common-Ma
102v	102v	8-9	Rex gloriose martyrum	C4	D.E.F.GA.D.EFG.FE.E	Common-Ma
103r	103r	1-6	Rex gloriose martyrum	C4	D.E.F.GA.D.EFG.FE.E	Common-Ma
103r	103r	6-9	Rex gloriose martyrum	C4	FGF.E.G.GA.AG.F.D.E	Common-Ma
103v	103v	1-3	Rex gloriose martyrum	C4	FGF.E.G.GA.AG.F.D.E	Common-Ma
103v	103v	4-9	Rex gloriose martyrum	C4	DE.C.EG.GA.GE.F.E	Common-Ma
104r	104r	1-2	Rex gloriose martyrum	C4	DE.C.EG.GA.GE.F.E	Common-Ma
104r	104r	2-9	Rex gloriose martyrum	C4	F.FFE.D.E.G.A.F.E	Common-Ma
104v	104v	1-9	Iste confessor	Bfa3	DF.D.D.C.D.F.F.D.E.E.D	Common-Co
105r	105r	1-4	Iste confessor	Bfa3	DF.D.D.C.D.F.F.D.E.E.D	Common-Co
105r	105r	5-9	Iste confessor	C4	GAGG.E.F.ED.DE	Common-Co
105v	105v	1-7	Iste confessor	C4	GAGG.E.F.ED.DE	Common-Co
105v	105v	8-9	Iste confessor	F3	D.C.DF.FE.DE	Common-Co
106r	106r	1-9	Iste confessor	F3	D.C.DF.FE.DE	Common-Co
106v	106v	1	Iste confessor	F3	D.C.DF.FE.DE	Common-Co
106v	106v	2-8	Iste confessor	C4	A.G.A.GF.E	Common-Co
107r	107r	1-6	Iste confessor	C4	A.G.A.GF.E	Common-Co
107r	107r	6	empty space for missing rubrics	\N	.	Common-Co
107r	107r	6-9	Iste confessor	C4/Bfa3	A.G.A.GFFEF.DC.G.G	Common-Co
107v	107v	1-9	Iste confessor	C4/Bfa3	A.G.A.GFFEF.DC.G.G	Common-Co
107v	107v	9	Iesu redemptor omnium	Bfa3	CD.DAB.A.A.AG.GA.G.GF	Common-Co
108r	108r	1-9	Iesu redemptor omnium	F3/Bfa3	CD.DAB.A.A.AG.GA.G.GF	Common-Co
108v	108v	1	Iesu redemptor omnium	C4	CD.DAB.A.A.AG.GA.G.GF	Common-Co
108v	108v	2-9	Iesu redemptor omnium	C4	G.AB.C.BA.G.A.F.G	Common-Co
109r	109r	1	Iesu redemptor omnium	C4	G.AB.C.BA.G.A.F.G	Common-Co
109r	109r	2-9	Iesu redemptor omnium	C4	C.D.EG.GF.ED.F.EDC.D	Common-Co
109v	109v	1	Iesu redemptor omnium	C4	C.D.EG.GF.ED.F.EDC.D	Common-Co
109v	109v	2-9	Iesu redemptor omnium	C4	F.FFE.D.E.G.A.F.E	Common-Co
110r	110r	1-9	Iesu redemptor omnium	C4	G.GABCA.GF.AG.ABCBAG.AG.FG.G	Common-Co
110v	110v	1-9	Iesu redemptor omnium	C4	.	Common-Co
111r	111r	1-9	Virginis proles	F3	DF.D.D.C.D.F.F.D.E.E.D	Common-Vi
111v	111v	1-3	Virginis proles	F3/Bfa3	DF.D.D.C.D.F.F.D.E.E.D	Common-Vi
111v	111v	4-9	Virginis proles	C4	GAGG.E.F.ED.DE	Common-Vi
112r	112r	1-6	Virginis proles	C4	GAGG.E.F.ED.DE	Common-Vi
112r	112r	6-9	Virginis proles	C4	A.G.A.GFFEF.DC.G.G	Common-Vi
112v	112v	1-8	Virginis proles	C4	A.G.A.GFFEF.DC.G.G	Common-Vi
112v	112v	9	Virginis proles	C4	A.G.A.GF.E	Common-Vi
113r	113r	1-9	Virginis proles	C4	A.G.A.GF.E	Common-Vi
113v	113v	1-2	Virginis proles	C4	A.G.A.GF.E	Common-Vi
113v	113v	2-9	Virginis proles	C4/Bfa3	F.E.F.GA.G.E.D.E.F.E.D	Common-Vi
114r	114r	1-5	Virginis proles	C4/Bfa3	F.E.F.GA.G.E.D.E.F.E.D	Common-Vi
114r	114r	5-9	Iesu corona virginum	Bfa3/F3	CD.DAB.A.A.AG.GA.G.GF	Common-Vi
114v	114v	1-6	Iesu corona virginum	F3	CD.DAB.A.A.AG.GA.G.GF	Common-Vi
114v	114v	6-9	Iesu corona virginum	C4	G.AB.C.BA.G.A.F.G	Common-Vi
115r	115r	1-6	Iesu corona virginum	C4	G.AB.C.BA.G.A.F.G	Common-Vi
115r	115r	7-9	Iesu corona virginum	C4	C.D.EG.GF.ED.F.EDC.D	Common-Vi
115v	115v	1-6	Iesu corona virginum	C4	C.D.EG.GF.ED.F.EDC.D	Common-Vi
115v	115v	7-9	Iesu corona virginum	C4	E.E.ED.G.GA.C.C.BA	Common-Vi
116r	116r	1-7	Iesu corona virginum	C4	E.E.ED.G.GA.C.C.BA	Common-Vi
\.


--
-- Data for Name: hymn; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.hymn (name) FROM stdin;
﻿Primo dierum omnium
Somno refectis
Consors paterne
Rerum creator
Nox atra rerum
Tu trinitatis unitas
Summe deus clementiae
Eterne rerum conditor
Splendor paterne
Ales diei nuntius
Nox et tenebrae
Lux ecce surgit
Eterna celi gloria
Aurora iam spargit
Jam lucis
Nunc sancte nobis
Rector potens
Rerum deus tenax
Lucis creator optime
Immense celi
Tellurus ingeris
Celi deus sanctissime
Magne deus potentiee
Plasmator hominis
Deus creator omnium
O lux beata trinitas
Conditor alme syderum
Verbum supernum
Vox clara ecce intonat
Iam lucis orto sydere
Veni redemptor gentium
Salvator mundi domine
Christe redemptor omnium
A solis ortus cardine
Martyr dei qui vnicum
Sancte dei preciose
Bina caelestis aulae
Exultet caelum laudibus
Rex gloriose martyrum
Sanctorum meritis
Hostis herodes
A patre vnigenitus
Primo dierum omnium+
Aeterne rerum conditor
Aeterne rerum conditor+
Iam lucis orto sydere+
Lucis creator optime+
Somno refectis artibus
Somno refectis artibus+
Splendor paternae gloriae
Splendor paternae gloriae+
Immense caeli conditor
Immense caeli conditor+
Consors paterni luminis
Consors paterni luminis+
Ales diei nuncius
Ales diei nuncius+
Telluris ingens conditor
Telluris ingens conditor+
Rerum creator optime
Rerum creator optime+
Nox et tenebrae et nubila
Nox et tenebrae et nubila+
Caeli deus sanctissime
Caeli deus sanctissime+
Nox atra rerum contigit
Nox atra rerum contigit+
Lux ecce surgit aurea
Lux ecce surgit aurea+
Magne deus potentiae
Magne deus potentiae+
Tui trinitatis vnitas
Tui trinitatis vnitas+
Aeterna caeli gloria
Aeterna caeli gloria+
Plasmator hominis deus
Plasmator hominis deus+
Summe deus clementiae+
Aurora iam spargit polum
Aurora iam spargit polum+
Ex more docti mistico
Christe qui lux es et dies
Summi largitor premii
Audi benigne conditor
Ecce tempus ydoneum
Clarum decus ieiunii
Iesu quadragenarie
Vexilla regis prodeunt
Cultor dei memento
Pange lingua gloriose
Lustra sex qui iam peracta
Chorus novae hierusalem
Iesu salvator seculi
Aurora lucis rutilat
Sermone blando angelus
Ad cenam agni providi
Aeterne rex altissime
Iesu nostra redemptio
Tu christe nostrum gaudium
Iam christus astra ascenderat
Impleta gaudent viscera
Veni creator spiritus
Beata nobis gaudia
Alma chorus domini
Adesto sancta trinitas
O pater sancte mitis
Sacris solemniis
Verbum supernum prodiens
Nocte surgentes vigilemus omnes
Ecce iam noctis tenuatur
Urbs beata hierusalem
Angulare fundamentum
Nunc sancte nobis spiritus
Rector potens verax deus
Rerum deus tenax vigor
Te lucis ante terminum
Andrea pie sanctorum
O thoma christi perlustrator
Doctor egregie paule mores
Christi miles gloriose
Quod chorus vatum
Quem terra ponthus ethera
O gloriosa femina
(Letabundus)
(Quod chorus)
Laetabundus
Iam bone pastor petre
Mathia iuste duodeno solio
Ave maris stella 
Impleta sunt quae conciuit
(Pange lingua)
Crux fidelis inter omnes
Ut queant laxis
Antra deserti teneris
O nimis felix meritique
Aurea luce et decore
Festum matris gloriose
Mundi salus affutura
O salutaris fulgens
Collaudemus magdalene
Estimavit hortolanum
O maria noli flere
Bina celestis aule lumina
In anne puerperio
Ave mater anna
Felix anna prae aliis
Caelestis formam glorie
O sator rerum reparator eui
O nata lux de lumine
Exultet cor precordiis
Iesu dulcis memoria
Iesu auctor clementie
O quam glorifica
Bartholomee caeli sydes
Matthee sancte bino
Tibi christe splendor patris
Christe sanctorum
Beate symon et thadee
Tristes erant apostoli
Claro paschali gaudio
Annue christe seculorum
Exultet celum laudibus
Deus tuorum militum
Iste confessor
empty space for missing rubrics
Iesu redemptor omnium
Virginis proles
Iesu corona virginum
Bina celestis aule
Annue christe
Primo dierum omnium: Gloria
Primo dierum omnium: Presta
Eterne rerum conditor: Gloria
Eterne rerum conditor: Deo patri
Lucis creator optime: Gloria
Lucis creator optime: Presta
Splendor paterne glorie
Immense celi conditor
Nox et tenebre et nubila
Nox atra rerum contegit
Magne deus potentie
Summe deus clementie
Ex more docti mystico
Chorus noue hierusalem
Ad cenam agni prouidi
Eterne rex altissime
Sacris solenniis
Felix anna pre aliis
Celestis formam glorie
Letabundus
Bartholomee celi sydes
Mathee sancte bino
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.image (filename) FROM stdin;
﻿001r
001v
002r
002v
003r
003v
004r
004v
005r
005v
006r
006v
007r
007v
008r
008v
009r
009v
010r
010v
011r
011v
012r
012v
013r
013v
014r
014v
015r
015v
016r
016v
017r
017v
018r
018v
019r
019v
020r
020v
021r
021v
022r
022v
023r
023v
024r
024v
025r
025v
026r
026v
027r
027v
028r
028v
029r
029v
030r
030v
031r
031v
032r
032v
033r
\.


--
-- Data for Name: psalter; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.psalter (matins, lauds, prime, terce, sext, "none", vespers, "desc") FROM stdin;
﻿Primo dierum omnium	Eterne rerum conditor	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Lucis creator optime	SUNDAY
Somno refectis	Splendor paterne	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Immense celi	Monday
Consors paterne	Ales diei nuntius	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Tellurus ingeris	Tuesday
Rerum creator	Nox et tenebrae	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Celi deus sanctissime	Wednesday
Nox atra rerum	Lux ecce surgit	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Magne deus potentiee	Thursday
Tu trinitatis unitas	Eterna celi gloria	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Plasmator hominis	Friday
Summe deus clementiae	Aurora iam spargit	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	Deus creator omnium	Saturday, Advent to Lent
Summe deus clementiae	Aurora iam spargit	Jam lucis	Nunc sancte nobis	Rector potens	Rerum deus tenax	O lux beata trinitas	Saturday Trinity to 
\.


--
-- Data for Name: sanctoral; Type: TABLE DATA; Schema: sarumhymnal; Owner: postgres
--

COPY sarumhymnal.sanctoral (month, day, common, vespers1, matins, lauds, vespers2, "ID") FROM stdin;
12	4	Co	Iste confessor	Common	Common	Common	2
12	6	Co	Iste confessor	Iste confessor	Jesu redemptor	Jesu redemptor	3
12	7	Apost	\N	Andrea pie/Annue	Exultet celum	\N	4
12	8	2Min	Ave maris stella	Quem terra pontus	O gloriosa femina	Ave maris stella	5
12	13	ViMa	Virginis proles	Common	Jesu corona	Jesu corona	6
12	21	Ap	O thoma christi	Common	Common	Common	7
1	19	Co	Common	Common	Common	Common	8
1	20	Ma	Sanctorum meritis	Sanctorum meritis	Rex gloriose	Rex gloriose	9
1	21	ViMa	Virginis proles	Virginis proles	Jesu corona	Jesu corona	10
1	22	Ma	Martyr dei	Martyr dei	Christi miles	Christi miles	11
1	25	Ap	Doctor egregie/Annue	Doctor egregie/Annue	Exultet celum	Exultet celum	12
1	27	EpMa	\N	Common	Common	Common	13
1	28	Vi	Virginis proles	Common	Common	Common	14
1	30	Vi-nonMa	\N	Common	Common	Common	15
2	1	Vi-nonMa	\N	Common	Common	\N	16
2	2	\N	Quod chorus vatum	Quem terra pontus	O gloriosa femina	Letabundus	17
2	2	\N	Quod chorus vatum	Quem terra pontus	O gloriosa femina	Inviolata(prose)	18
2	3	EpMa	\N	Common	Common	Common	19
2	5	ViMa	Virginis proles	Virginis proles	Jesu corona	Jesu corona	20
2	6	Co	Common	Common	Common	Common	21
2	10	Vi-nonMa	\N	Common	Common	Common	22
2	14	Ma	\N	Common	Common	Common	23
2	16	Vi-nonMa	\N	Common	Common	Common	24
2	22	Ap	Jam bone/Annue	Jam bone/Annue	Jesu redemptor	Jesu redemptor	25
2	24	Ap	Mathias juste	Common	Common	Common	26
3	1	Co	Iste confessor	Common	Common	Common	27
3	2	Co	Iste confessor	Iste confessor	Jesu redemptor	Jesu redemptor	28
3	7	ViMa	\N	Jesu corona	Common	Common	29
3	12	Co	Common	Common	Common	Common	30
3	18	Ma	Common	Common	Common	Common	31
3	20	Co	Common	Common	Common	Common	32
3	21	Co	Common	Common	Common	Common	33
3	25	\N	Common	Common	Common	Common	34
3	27	\N	\N	\N	\N	\N	35
4	3	Co	Common	Common	Common	Common	36
4	3	\N	\N	Common	Common	Common	37
4	3	Co	\N	Common	Common	Common	38
4	4	Co	Common	Common	Common	Common	39
4	14	Mas	\N	Common	Common	Common	40
4	19	EpMa	\N	Common	Common	Common	41
4	23	Ma	Common	Common	Common	Common	42
4	25	Ev(TP)	Common	Common	Common	Common	43
4	28	Ma(TP)	\N	Common	Common	Common	44
4	30	Co	\N	Common	Common	Common	45
5	1	Aps	Tristes erant	Tristes erant	Claro paschali	Claro paschali	46
5	3	\N	Impleta sunt	Pange lingua	Crux fidelis	Crux fidelis	47
5	6	Ap(TP)	\N	Common	Common	Common	48
5	7	Co	\N	Common	Common	Common	49
5	10	Mas(TP)	\N	Common	Common	Common	50
5	12	Mas(TP)	\N	Common	Common	Common	51
5	19	EpCo(TP)	\N	Common	Common	Common	52
5	19	Co	Common	Common	Common	Common	53
5	25	EpCo(TP)	\N	Common	Common	Common	54
5	25	Co	Common	Common	Common	Common	55
5	26	EpCo(TP)	\N	Common	Common	Common	56
5	26	Co	Common	Common	Common	Common	57
5	28	Co	\N	Common	Common	Common	58
5	31	Vi-nonMa	Common	Common	Common	Common	59
6	1	Ma	\N	Common	Common	Common	60
6	2	Mas	\N	Common	Common	Common	61
6	5	Mas	\N	Common	Common	Common	62
6	8	Co	\N	Common	Common	Common	63
6	9	Co	\N	Common	Common	Common	64
6	9	Co	Common	Common	Common	Common	65
6	11	Ap	Common	Common	Common	Common	66
6	12	Mas	\N	Common	Common	Common	67
6	14	Co	\N	Common	Common	Common	68
6	15	Mas	\N	Common	Common	\N	69
6	16	Co	Common	Common	Common	Common	70
6	18	Mas	Common	Common	Common	Common	71
6	19	Mas	Common	Common	Common	Common	72
6	20	Ma	Common	Common	Common	Common	73
6	20	Ma	\N	Common	Common	Common	74
6	22	Ma	Common	Common	Common	Common	75
6	23	\N	\N	Common	Common	Common	76
6	24	\N	Ut queant laxis	Antra deserti	O nimis felix	Ut queant laxis	77
6	26	Mas	Sanctorum meritis	Sanctorum meritis	Rex gloriose	Sanctorum meritis	78
6	26	Mas	Sanctorum meritis	Sanctorum meritis	Rex gloriose	Rex gloriose	79
6	28	Co	Common	Common	Common	Common	80
6	29	Aps	Aurea luce	Aurea luce	Exultet celum	Exultet celum	81
6	30	Ap	\N	Doctor egregie/Annue	Exultet celum	Aurea luce	82
7	1	\N	\N	Antra deserti	O nimis felix	Ut queant laxis	83
7	2	\N	Festum matris	Mundi salus	O salutaris	Festum matris	84
7	4	Co	Common	Common	Common	Common	86
7	6	Aps	Aurea luce	Aurea luce	Exultet celum	\N	87
7	7	Ma	Martyr dei	Martyr dei	Deus tuorum	Deus tuorum	88
7	9	\N	Festum matris	Mundi salus	O salutaris	Festum matris	89
7	10	Mas	\N	Common	Common	Common	90
7	11	Co	Common	Common	Common	Common	91
7	11	Co	\N	Common	Common	Common	92
7	24	Co	Common	Common	Common	\N	93
7	16	Co	Iste confessor	Iste confessor	Jesu redemptor	Jesu redemptor	94
7	17	Ma	\N	Common	Common	Common	95
7	18	Ma	\N	Common	Common	Common	96
7	20	ViMa	Common	Common	Common	Common	97
7	21	Vi-nonMa	\N	Common	Common	\N	98
7	22	\N	Collaudemus magdalenae	Estimavit ortolanum	O maria noli flere	O maria noli flere	99
7	23	Ma	\N	Common	Common	Common	100
7	24	Vi-nonMa	\N	Common	Common	Common	101
7	25	Ap	Bina celestis..Jacobe necna	Common	Common	Common	102
7	26	\N	Ave mater Anna	In Anne puerperio	Felix Anna	Ave mater anna	103
7	27	Mas	\N	Common	Common	Common	104
7	28	Co	\N	Common	Common	Common	105
7	29	Mas	\N	Common	Common	Common	106
7	30	Mas	\N	Common	Common	Common	107
7	31	Co	\N	Common	Common	\N	108
8	1	Ma	Jam bone/Annue	Jam bone/Annue	Exultet celum	Exultet celum	109
8	2	Ma	\N	Common	Common	Common	110
8	3	Ma	Sanctorum meritis	Sanctorum meritis	Rex gloriose	Rex gloriose	111
8	5	Ma	\N	Common	Common	Common	112
8	6	\N	Celestis formam	O sator rerum	O nata lux	O nata lux	113
8	7	\N	Exultet cor	Jesu dulcis	Jesu auctor	Exultet cor	114
8	8	\N	\N	Jesu dulcis	Jesu auctor	Exultet cor	115
8	10	Ma	Martyr dei	Martyr dei	Deus tuorum	Deus tuorum	116
8	13	Mas	Common	Common	Rex gloriose	Common	117
8	14	\N	Exultet cor	Jesu dulcis	Jesu auctor	Exultet cor	118
8	15	\N	O quam glorifica	Quem terra pontus	O gloriosa femina	Letabundus	119
8	16	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	120
8	17	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	121
8	18	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	122
8	19	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	123
8	20	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	124
8	21	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	125
8	22	\N	\N	Quem terra pontus	O gloriosa femina	O quam glorifica	126
8	23	Ma	\N	Common	Common	\N	127
8	24	Ma	Bartholomee/Annue	Common	Common	Common	128
8	27	Ma	Common	Common	Common	\N	129
8	28	Co	Common	Common	Common	Martyr dei	130
8	29	Ma	\N	Martyr dei	Deus tuorum	Deus tuorum	131
8	30	Ma	\N	Common	Common	Common	132
8	31	Vi	\N	Common	Common	\N	133
9	1	Co	Common	Common	Common	Common	134
9	4	Co	Common	Common	Common	Common	135
9	4	Co	Common	Common	Common	Common	136
9	5	Co	\N	Common	Common	Common	137
9	8	\N	Ave maris stella	Quem terra pontus	O gloriosa femina	Letabundus	138
9	9	\N	\N	Quem terra pontus	O gloriosa femina	Ave maris stella	139
9	10	\N	\N	Quem terra pontus	O gloriosa femina	Ave maris stella	140
9	11	\N	\N	Quem terra pontus	O gloriosa femina	Ave maris stella	141
9	12	\N	\N	Quem terra pontus	O gloriosa femina	Ave maris stella	142
9	13	\N	\N	Quem terra pontus	O gloriosa femina	\N	143
9	14	\N	Impleta sunt	Pange lingua	Crux fidelis	Crux fidelis	144
9	15	\N	\N	Quem terra pontus	O gloriosa femina	Letabundus	145
9	16	Vi	\N	Common	Common	Common	146
9	17	Ma	\N	Common	Common	Common	147
9	21	Ap	Mathee sancte/Annue	Mathee sancte/Annue	Exultet celum	Exultet celum	148
9	22	Mas	\N	Common	Common	Common	149
9	23	Vi	\N	Common	Common	Common	150
9	25	Ma	\N	Common	Common	Common	151
9	26	Mas	\N	Common	Common	Common	152
9	27	Mas	\N	Common	Common	Common	153
9	29	\N	Tibi Christe	Tibi Christe	Christe sanctorum	\N	154
9	30	Co	Iste confessor	Common	Common	Jesu redemptor	155
10	1	Ma	\N	Common	Common	Common	156
10	2	Ma	\N	Common	Common	Common	157
10	6	Vi	Common	Common	Common	Common	158
10	7	Ma	\N	Common	Common	Common	159
10	9	Ma	Sanctorum meritis	Sanctorum meritis	Rex gloriose	Rex gloriose	160
10	10	Ma	\N	Common	Common	Common	161
10	11	Ma	\N	Common	Common	Common	162
10	13	Co	Iste confessor	Iste confessor	Jesu redemptor	Jesu redemptor	163
10	14	Ma	\N	Common	Common	\N	164
10	15	Co	Common	Common	Common	Common	165
10	16	\N	Tibi Christe	Tibi Christe	Christe sanctorum	Jesu redemptor	166
10	17	Vi	\N	Common	Common	\N	167
10	18	Ap	Annue Christe	Common	Common	Common	168
10	19	Vi	\N	Common	Common	Common	169
10	21	Ma	Common	Common	Common	Common	170
10	23	Co	Common	Common	Common	Common	171
10	25	Mas	Common	Common	Common	Common	172
10	28	Aps	Beate Symon/Annue	Beate Symon/Annue	\N	\N	173
10	31	Ma	Common	Common	Common	Common	174
11	1	\N	Jesu salvator…redemptis	Jesu salvator…redemptis	Christe redemptor	Christe redemptor	175
11	2	\N	\N	\N	\N	\N	176
11	3	Ma	\N	Common	Common	Common	177
11	6	Co	Common	Common	Common	Common	178
11	8	Mas	Common	Common	Common	Common	179
11	9	Ma	Common	Common	Common	Common	180
11	11	Co	Iste confessor	Iste confessor	Jesu redemptor	Jesu redemptor	181
11	13	Co	Common	Common	Jesu redemptor	Common	182
11	15	Co	Common	Common	Common	Common	183
11	16	Co	Common	Common	Common	Common	184
11	17	Co	Common	Common	Common	Common	185
11	18	Co	\N	Iste confessor	Jesu redemptor	Jesu redemptor	186
11	20	Ma	Martyr dei	Common	Common	Common	187
11	22	Ma	Virginis proles	Virginis proles	Jesu corona virginum	\N	188
11	23	Ma	Martyr dei	Common	Common	Common	189
11	24	Ma	\N	Common	Common	\N	190
11	25	Ma	Virginis proles	Virginis proles	Jesu corona virginum	Jesu corona virginum	191
11	26	Ma	\N	Common	Common	\N	192
11	29	Ma	Common	Common	Common	Common	193
\.


--
-- Name: sanctoral_ID_seq; Type: SEQUENCE SET; Schema: sarumhymnal; Owner: postgres
--

SELECT pg_catalog.setval('sarumhymnal."sanctoral_ID_seq"', 1, false);


--
-- Name: common common_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.common
    ADD CONSTRAINT common_pkey PRIMARY KEY (catagory, abbrev);


--
-- Name: entry entry_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.entry
    ADD CONSTRAINT entry_pkey PRIMARY KEY (stave, folio, image);


--
-- Name: hymn hymn_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.hymn
    ADD CONSTRAINT hymn_pkey PRIMARY KEY (name);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (filename);


--
-- Name: psalter psalter_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_pkey PRIMARY KEY ("desc");


--
-- Name: sanctoral sanctoral_pkey; Type: CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.sanctoral
    ADD CONSTRAINT sanctoral_pkey PRIMARY KEY ("ID");


--
-- Name: psalter psalter_lauds_fkey; Type: FK CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_lauds_fkey FOREIGN KEY (lauds) REFERENCES sarumhymnal.hymn(name);


--
-- Name: psalter psalter_matins_fkey; Type: FK CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_matins_fkey FOREIGN KEY (matins) REFERENCES sarumhymnal.hymn(name);


--
-- Name: psalter psalter_prime_fkey; Type: FK CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_prime_fkey FOREIGN KEY (prime) REFERENCES sarumhymnal.hymn(name);


--
-- Name: psalter psalter_sext_fkey; Type: FK CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_sext_fkey FOREIGN KEY (sext) REFERENCES sarumhymnal.hymn(name);


--
-- Name: psalter psalter_terce_fkey; Type: FK CONSTRAINT; Schema: sarumhymnal; Owner: postgres
--

ALTER TABLE ONLY sarumhymnal.psalter
    ADD CONSTRAINT psalter_terce_fkey FOREIGN KEY (terce) REFERENCES sarumhymnal.hymn(name);


--
-- PostgreSQL database dump complete
--

