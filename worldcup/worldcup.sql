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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 4, 2, 193, 194);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 2, 0, 195, 196);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 2, 1, 194, 196);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 1, 0, 193, 195);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 3, 2, 194, 197);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 2, 0, 196, 198);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 2, 1, 195, 199);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 2, 0, 193, 200);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 2, 1, 196, 201);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 1, 0, 198, 202);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 3, 2, 195, 203);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 2, 0, 199, 204);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 2, 1, 194, 205);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 2, 1, 197, 206);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 2, 1, 200, 207);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 4, 3, 193, 208);
INSERT INTO public.games VALUES (17, 2014, 'Final', 1, 0, 209, 208);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 3, 0, 210, 199);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 1, 0, 208, 210);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 7, 1, 209, 199);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 1, 0, 210, 211);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 1, 0, 208, 195);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 2, 1, 199, 201);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 1, 0, 209, 193);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 2, 1, 199, 212);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 2, 0, 201, 200);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 2, 0, 193, 213);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 2, 1, 209, 214);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 2, 1, 210, 204);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 2, 1, 211, 215);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 1, 0, 208, 202);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 2, 1, 195, 216);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (193, 'France');
INSERT INTO public.teams VALUES (194, 'Croatia');
INSERT INTO public.teams VALUES (195, 'Belgium');
INSERT INTO public.teams VALUES (196, 'England');
INSERT INTO public.teams VALUES (197, 'Russia');
INSERT INTO public.teams VALUES (198, 'Sweden');
INSERT INTO public.teams VALUES (199, 'Brazil');
INSERT INTO public.teams VALUES (200, 'Uruguay');
INSERT INTO public.teams VALUES (201, 'Colombia');
INSERT INTO public.teams VALUES (202, 'Switzerland');
INSERT INTO public.teams VALUES (203, 'Japan');
INSERT INTO public.teams VALUES (204, 'Mexico');
INSERT INTO public.teams VALUES (205, 'Denmark');
INSERT INTO public.teams VALUES (206, 'Spain');
INSERT INTO public.teams VALUES (207, 'Portugal');
INSERT INTO public.teams VALUES (208, 'Argentina');
INSERT INTO public.teams VALUES (209, 'Germany');
INSERT INTO public.teams VALUES (210, 'Netherlands');
INSERT INTO public.teams VALUES (211, 'Costa Rica');
INSERT INTO public.teams VALUES (212, 'Chile');
INSERT INTO public.teams VALUES (213, 'Nigeria');
INSERT INTO public.teams VALUES (214, 'Algeria');
INSERT INTO public.teams VALUES (215, 'Greece');
INSERT INTO public.teams VALUES (216, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 216, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

