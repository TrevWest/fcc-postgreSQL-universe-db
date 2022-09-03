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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_centuries integer NOT NULL,
    type text,
    visible_from_earth boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_km numeric(20,1),
    has_rover boolean,
    distance_from_planet_in_km numeric(20,1),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_in_km numeric(20,1) NOT NULL,
    m_class boolean,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_notes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_notes (
    atmosphere text NOT NULL,
    biomes text,
    planet_id integer NOT NULL,
    planet_notes_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.planet_notes OWNER TO freecodecamp;

--
-- Name: planet_notes_planet_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_notes_planet_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_notes_planet_notes_id_seq OWNER TO freecodecamp;

--
-- Name: planet_notes_planet_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_notes_planet_notes_id_seq OWNED BY public.planet_notes.planet_notes_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_centuries integer,
    size_in_km numeric(20,1),
    color text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_notes planet_notes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_notes ALTER COLUMN planet_notes_id SET DEFAULT nextval('public.planet_notes_planet_notes_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 136100000, 'barred spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100100000, 'SA', true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 100011000, 'E0', true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 1001000010, 'SA', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 8, 'SA', true);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 6, 'SA', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (14, 'You', 100.0, true, 100000.0, 10);
INSERT INTO public.moon VALUES (15, 'Are', 100.0, false, 10000.0, 10);
INSERT INTO public.moon VALUES (16, 'My', 100.0, true, 1000000.0, 10);
INSERT INTO public.moon VALUES (17, 'Fire', 100.0, false, 1000.0, 10);
INSERT INTO public.moon VALUES (18, 'The', 100.0, true, 100000.0, 10);
INSERT INTO public.moon VALUES (19, 'One', 100.0, false, 10000.0, 10);
INSERT INTO public.moon VALUES (20, 'Desire', 100.0, true, 100.0, 10);
INSERT INTO public.moon VALUES (21, 'Believe', 100.0, false, 1.0, 10);
INSERT INTO public.moon VALUES (22, 'When', 100.0, false, 1000.0, 10);
INSERT INTO public.moon VALUES (23, 'I', 100.0, true, 10000000.0, 10);
INSERT INTO public.moon VALUES (24, 'Say', 100.0, false, 10000.0, 10);
INSERT INTO public.moon VALUES (25, 'That', 100.0, true, 10000.0, 10);
INSERT INTO public.moon VALUES (26, 'I2', 100.0, false, 1000000.0, 10);
INSERT INTO public.moon VALUES (27, 'Want', 100.0, true, 10000.0, 10);
INSERT INTO public.moon VALUES (28, 'It', 100.0, false, 100000.0, 10);
INSERT INTO public.moon VALUES (29, 'That2', 100.0, true, 10000.0, 10);
INSERT INTO public.moon VALUES (30, 'Way', 100.0, false, 10000.0, 10);
INSERT INTO public.moon VALUES (31, 'Tell', 100.0, true, 10000.0, 10);
INSERT INTO public.moon VALUES (32, 'Me', 100.0, false, 100000.0, 10);
INSERT INTO public.moon VALUES (33, 'Why', 100.0, true, 100000.0, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earf', 12742.0, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (7, 'Venus', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 100.0, false, 1, 1);
INSERT INTO public.planet VALUES (10, 'Eric', 100.0, false, 1, 3);
INSERT INTO public.planet VALUES (11, 'John', 100.0, false, 1, 4);
INSERT INTO public.planet VALUES (12, 'Screw', 100.0, false, 1, 6);


--
-- Data for Name: planet_notes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_notes VALUES ('Nitrogen, Oxygen', 'Jungle, Forest, Desert, Plains, etc', 1, 1, 'Earf');
INSERT INTO public.planet_notes VALUES ('None', 'Red dirt', 3, 2, 'Mars');
INSERT INTO public.planet_notes VALUES ('Helium', 'Eric', 10, 3, 'Eric');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 100, 100.0, 'yellow', 1);
INSERT INTO public.star VALUES (2, 'Zorb', 100, 100.0, 'blue', 2);
INSERT INTO public.star VALUES (3, 'Pingus', 100, 100.0, 'green', 3);
INSERT INTO public.star VALUES (4, 'asdf', 100, 100.0, 'purple', 4);
INSERT INTO public.star VALUES (5, 'boof', 100, 100.0, 'red', 5);
INSERT INTO public.star VALUES (6, 'frank', 100, 100.0, 'blue', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_notes_planet_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_notes_planet_notes_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_notes planet_notes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_notes
    ADD CONSTRAINT planet_notes_name_key UNIQUE (name);


--
-- Name: planet_notes planet_notes_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_notes
    ADD CONSTRAINT planet_notes_pk PRIMARY KEY (planet_notes_id);


--
-- Name: planet_notes planet_notes_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_notes
    ADD CONSTRAINT planet_notes_planet_id_key UNIQUE (planet_id);


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
-- Name: planet_notes planet_notes_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_notes
    ADD CONSTRAINT planet_notes_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

