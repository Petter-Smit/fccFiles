--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coolfacts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.coolfacts (
    coolfacts_id integer NOT NULL,
    name character varying(30) NOT NULL,
    thing1 text
);


ALTER TABLE public.coolfacts OWNER TO freecodecamp;

--
-- Name: coolfacts_coolfacts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.coolfacts_coolfacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coolfacts_coolfacts_id_seq OWNER TO freecodecamp;

--
-- Name: coolfacts_coolfacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.coolfacts_coolfacts_id_seq OWNED BY public.coolfacts.coolfacts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric NOT NULL,
    billion_stars integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    sistermoons integer,
    orbital_eccentricity numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    haswater boolean,
    star_id integer,
    comment text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    colour text,
    planets_orbiting integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: coolfacts coolfacts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.coolfacts ALTER COLUMN coolfacts_id SET DEFAULT nextval('public.coolfacts_coolfacts_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: coolfacts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.coolfacts VALUES (1, 'blue', 'is a colour');
INSERT INTO public.coolfacts VALUES (2, 'red', 'is a colour');
INSERT INTO public.coolfacts VALUES (3, 'green', 'is a colour');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Shine', 50.2, 4, false);
INSERT INTO public.galaxy VALUES (2, 'Shimmer', 55.7, 6, false);
INSERT INTO public.galaxy VALUES (3, 'MassiveB', 88.7, 12, true);
INSERT INTO public.galaxy VALUES (4, 'Ministar', 22.1, 3, false);
INSERT INTO public.galaxy VALUES (5, 'Dancer', 33.6, 2, true);
INSERT INTO public.galaxy VALUES (6, 'Oldco', 62.8, 6, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'One', 1, 2, 1.2);
INSERT INTO public.moon VALUES (2, 'Two', 1, 2, 1.2);
INSERT INTO public.moon VALUES (3, 'Three', 1, 2, 1.2);
INSERT INTO public.moon VALUES (4, 'Death', 1, 2, 1.2);
INSERT INTO public.moon VALUES (5, 'Five', 1, 2, 1.2);
INSERT INTO public.moon VALUES (6, 'Six', 1, 2, 1.2);
INSERT INTO public.moon VALUES (7, 'Seven', 1, 2, 1.2);
INSERT INTO public.moon VALUES (8, 'Eigth', 1, 2, 1.2);
INSERT INTO public.moon VALUES (9, 'Nine', 1, 2, 1.2);
INSERT INTO public.moon VALUES (10, 'Like the reference?', 1, 2, 1.2);
INSERT INTO public.moon VALUES (11, 'Eleven', 1, 2, 1.2);
INSERT INTO public.moon VALUES (12, 'Twelve', 1, 2, 1.2);
INSERT INTO public.moon VALUES (13, 'Threeteen', 1, 2, 1.2);
INSERT INTO public.moon VALUES (14, 'Deathteen', 1, 2, 1.2);
INSERT INTO public.moon VALUES (15, 'Fiveteen', 1, 2, 1.2);
INSERT INTO public.moon VALUES (16, 'Sixteen', 1, 2, 1.2);
INSERT INTO public.moon VALUES (17, 'Seventeen', 1, 2, 1.2);
INSERT INTO public.moon VALUES (18, 'Either', 1, 2, 1.2);
INSERT INTO public.moon VALUES (19, 'Neither', 1, 2, 1.2);
INSERT INTO public.moon VALUES (20, 'Glider', 1, 2, 1.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Why', false, 1, 'Must I invent 12 planets?');
INSERT INTO public.planet VALUES (2, 'Flaunder7', true, 3, 'Small planet');
INSERT INTO public.planet VALUES (3, 'Keepo', false, 5, 'is a ttv emote');
INSERT INTO public.planet VALUES (4, 'Spider', false, 1, 'text here');
INSERT INTO public.planet VALUES (5, 'Overgreen', true, 1, 'Most vegetation is copper');
INSERT INTO public.planet VALUES (6, 'Areep', false, 3, 'named after Areep Greep');
INSERT INTO public.planet VALUES (7, 'Why2', false, 1, 'Must 45I invent 12 planets?');
INSERT INTO public.planet VALUES (8, 'Fla50under7', true, 3, 'Small planet!2');
INSERT INTO public.planet VALUES (9, 'Keepklo', false, 5, 'is not a ttv emote');
INSERT INTO public.planet VALUES (10, 'SpiderMan', false, 1, 'text99 here');
INSERT INTO public.planet VALUES (11, 'Overblue', true, 1, 'Most vegetation is copper, and crabs');
INSERT INTO public.planet VALUES (12, 'Areepwoo', false, 3, 'named after Areep Greep and thats 12');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Orbo', 'red', 8, 1);
INSERT INTO public.star VALUES (2, 'Flaunder', 'red', 22, 1);
INSERT INTO public.star VALUES (3, 'Kipper12', 'White', 5, 2);
INSERT INTO public.star VALUES (4, 'Sphinx', 'Orange', 12, 3);
INSERT INTO public.star VALUES (5, 'Atlas_base', 'blue', 20, 2);
INSERT INTO public.star VALUES (6, 'Arbok_is_cool', 'purple', 17, 5);


--
-- Name: coolfacts_coolfacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.coolfacts_coolfacts_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: coolfacts coolfacts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.coolfacts
    ADD CONSTRAINT coolfacts_name_key UNIQUE (name);


--
-- Name: coolfacts coolfacts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.coolfacts
    ADD CONSTRAINT coolfacts_pkey PRIMARY KEY (coolfacts_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

