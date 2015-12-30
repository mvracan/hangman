--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-30 15:57:54 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2050 (class 1262 OID 12068)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2051 (class 1262 OID 12068)
-- Dependencies: 2050
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 184 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 183 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

--
-- TOC entry 566 (class 1247 OID 16499)
-- Name: Statistic; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "Statistic" AS (
	"TermID" integer,
	"Hit" integer
);


ALTER TYPE public."Statistic" OWNER TO postgres;

--
-- TOC entry 537 (class 1247 OID 16444)
-- Name: Terms; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "Terms" AS (
	"TermID" integer,
	"Term" text
);


ALTER TYPE public."Terms" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 16445)
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Categories" (
    "CategoriesID" integer NOT NULL,
    "Name" text NOT NULL,
    "Terms" "Terms"[]
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16448)
-- Name: Categories_CategoriesID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Categories_CategoriesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categories_CategoriesID_seq" OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 177
-- Name: Categories_CategoriesID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Categories_CategoriesID_seq" OWNED BY "Categories"."CategoriesID";


--
-- TOC entry 173 (class 1259 OID 16417)
-- Name: Help; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Help" (
    "HelpID" integer NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."Help" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16415)
-- Name: Hint_HintID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Hint_HintID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Hint_HintID_seq" OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 172
-- Name: Hint_HintID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Hint_HintID_seq" OWNED BY "Help"."HelpID";


--
-- TOC entry 180 (class 1259 OID 16487)
-- Name: Hints; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Hints" (
    "Quantity" numeric NOT NULL
)
INHERITS ("Categories");


ALTER TABLE public."Hints" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16457)
-- Name: Money; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Money" (
    "Coins" money
)
INHERITS ("Categories");


ALTER TABLE public."Money" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16479)
-- Name: Skip; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Skip" (
    "Amount" numeric NOT NULL
)
INHERITS ("Categories");


ALTER TABLE public."Skip" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16406)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "User" (
    "UserID" integer NOT NULL,
    "Name" text NOT NULL,
    "Picture" oid,
    "Money" money NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16426)
-- Name: User_Help; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "User_Help" (
    "UserID" integer NOT NULL,
    "HelpID" integer NOT NULL,
    "Amount" integer
);


ALTER TABLE public."User_Help" OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16404)
-- Name: User_UserID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "User_UserID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_UserID_seq" OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 170
-- Name: User_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "User_UserID_seq" OWNED BY "User"."UserID";


--
-- TOC entry 181 (class 1259 OID 16494)
-- Name: Vs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Vs" (
    "UserID" integer NOT NULL,
    "OpponentID" integer NOT NULL,
    "Categorie" integer NOT NULL,
    "Terms" "Statistic"[]
);


ALTER TABLE public."Vs" OWNER TO postgres;

--
-- TOC entry 1911 (class 2604 OID 16450)
-- Name: CategoriesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Categories" ALTER COLUMN "CategoriesID" SET DEFAULT nextval('"Categories_CategoriesID_seq"'::regclass);


--
-- TOC entry 1910 (class 2604 OID 16420)
-- Name: HelpID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Help" ALTER COLUMN "HelpID" SET DEFAULT nextval('"Hint_HintID_seq"'::regclass);


--
-- TOC entry 1914 (class 2604 OID 16490)
-- Name: CategoriesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Hints" ALTER COLUMN "CategoriesID" SET DEFAULT nextval('"Categories_CategoriesID_seq"'::regclass);


--
-- TOC entry 1912 (class 2604 OID 16460)
-- Name: CategoriesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Money" ALTER COLUMN "CategoriesID" SET DEFAULT nextval('"Categories_CategoriesID_seq"'::regclass);


--
-- TOC entry 1913 (class 2604 OID 16482)
-- Name: CategoriesID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Skip" ALTER COLUMN "CategoriesID" SET DEFAULT nextval('"Categories_CategoriesID_seq"'::regclass);


--
-- TOC entry 1909 (class 2604 OID 16409)
-- Name: UserID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "User" ALTER COLUMN "UserID" SET DEFAULT nextval('"User_UserID_seq"'::regclass);


--
-- TOC entry 1923 (class 2606 OID 16535)
-- Name: PKcategories; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Categories"
    ADD CONSTRAINT "PKcategories" PRIMARY KEY ("CategoriesID");


--
-- TOC entry 1918 (class 2606 OID 16425)
-- Name: PKhelp; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Help"
    ADD CONSTRAINT "PKhelp" PRIMARY KEY ("HelpID");


--
-- TOC entry 1929 (class 2606 OID 16527)
-- Name: PKhints; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Hints"
    ADD CONSTRAINT "PKhints" PRIMARY KEY ("CategoriesID");


--
-- TOC entry 1925 (class 2606 OID 16529)
-- Name: PKmoney; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Money"
    ADD CONSTRAINT "PKmoney" PRIMARY KEY ("CategoriesID");


--
-- TOC entry 1927 (class 2606 OID 16531)
-- Name: PKskip; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Skip"
    ADD CONSTRAINT "PKskip" PRIMARY KEY ("CategoriesID");


--
-- TOC entry 1916 (class 2606 OID 16414)
-- Name: PKuser; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "PKuser" PRIMARY KEY ("UserID");


--
-- TOC entry 1920 (class 2606 OID 16430)
-- Name: PKuser_helps; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "User_Help"
    ADD CONSTRAINT "PKuser_helps" PRIMARY KEY ("UserID", "HelpID");


--
-- TOC entry 1931 (class 2606 OID 16525)
-- Name: PKvs; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Vs"
    ADD CONSTRAINT "PKvs" PRIMARY KEY ("UserID", "OpponentID", "Categorie");


--
-- TOC entry 1932 (class 1259 OID 16523)
-- Name: fki_FKcategorie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_FKcategorie" ON "Vs" USING btree ("Categorie");


--
-- TOC entry 1921 (class 1259 OID 16441)
-- Name: fki_FKhintid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_FKhintid" ON "User_Help" USING btree ("HelpID");


--
-- TOC entry 1933 (class 1259 OID 16515)
-- Name: fki_FKopponent; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "fki_FKopponent" ON "Vs" USING btree ("OpponentID");


--
-- TOC entry 1938 (class 2606 OID 16536)
-- Name: FKcategories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Vs"
    ADD CONSTRAINT "FKcategories" FOREIGN KEY ("Categorie") REFERENCES "Categories"("CategoriesID");


--
-- TOC entry 1935 (class 2606 OID 16436)
-- Name: FKhelpid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "User_Help"
    ADD CONSTRAINT "FKhelpid" FOREIGN KEY ("HelpID") REFERENCES "Help"("HelpID");


--
-- TOC entry 1937 (class 2606 OID 16510)
-- Name: FKopponent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Vs"
    ADD CONSTRAINT "FKopponent" FOREIGN KEY ("OpponentID") REFERENCES "User"("UserID");


--
-- TOC entry 1936 (class 2606 OID 16505)
-- Name: FKuser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Vs"
    ADD CONSTRAINT "FKuser" FOREIGN KEY ("UserID") REFERENCES "User"("UserID");


--
-- TOC entry 1934 (class 2606 OID 16431)
-- Name: FKusersid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "User_Help"
    ADD CONSTRAINT "FKusersid" FOREIGN KEY ("UserID") REFERENCES "User"("UserID");


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-12-30 15:57:54 CET

--
-- PostgreSQL database dump complete
--

