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
    name character varying NOT NULL,
    galaxy_type character varying NOT NULL,
    distance_in_thousands_of_light_years numeric NOT NULL,
    description text
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
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km numeric,
    is_spherical boolean
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
    name character varying NOT NULL,
    star_id integer NOT NULL,
    distance_from_the_sun_in_km numeric,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: spectral_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spectral_class (
    temperature_in_kelvin integer NOT NULL,
    chromaticity character varying NOT NULL,
    description text,
    name character varying,
    spectral_class_id integer NOT NULL
);


ALTER TABLE public.spectral_class OWNER TO freecodecamp;

--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spectral_class_spectral_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectral_class_spectral_class_id_seq OWNER TO freecodecamp;

--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spectral_class_spectral_class_id_seq OWNED BY public.spectral_class.spectral_class_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    distance_in_light_years numeric NOT NULL,
    description text,
    spectral_class_id integer
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
-- Name: spectral_class spectral_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class ALTER COLUMN spectral_class_id SET DEFAULT nextval('public.spectral_class_spectral_class_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 26.9, 'This is galaxy containing Sun and its Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred spiral', 2500, 'The Andromeda galaxy is the nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Small Magelanic Cloud', 'Dwarf', 1500, 'This is dwarf galaxy near the Milky Way.');
INSERT INTO public.galaxy VALUES (4, 'Large Magelanic Cloud', 'Magelanic Spiral', 163, 'This is satelite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 3200, 'This is spiral galaxy 2.73 millions of light years from Earth.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Eliptical', 13000, 'It was discovered in 1826 by Scottisch astronomer James Dunlop from his home in Parramatta, in New South Wales, Australia.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 3189, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.2, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.6, false);
INSERT INTO public.moon VALUES (4, 'Cordelia', 7, 40, false);
INSERT INTO public.moon VALUES (5, 'Ophelia', 7, 43, false);
INSERT INTO public.moon VALUES (6, 'Bianca', 7, 51, false);
INSERT INTO public.moon VALUES (7, 'Cressida', 7, 80, false);
INSERT INTO public.moon VALUES (8, 'Desdemona', 7, 64, false);
INSERT INTO public.moon VALUES (9, 'Juliet', 7, 94, false);
INSERT INTO public.moon VALUES (10, 'Portia', 7, 135, false);
INSERT INTO public.moon VALUES (11, 'Rosalind', 7, 72, true);
INSERT INTO public.moon VALUES (12, 'Cupid', 7, 18, true);
INSERT INTO public.moon VALUES (13, 'Belinda', 7, 90, false);
INSERT INTO public.moon VALUES (14, 'Perdita', 7, 30, true);
INSERT INTO public.moon VALUES (15, 'Puck', 7, 162, true);
INSERT INTO public.moon VALUES (16, 'Mab', 7, 18, true);
INSERT INTO public.moon VALUES (17, 'Naiad', 8, 60.4, false);
INSERT INTO public.moon VALUES (18, 'Thalassa', 8, 81.4, false);
INSERT INTO public.moon VALUES (19, 'Despina', 8, 156, false);
INSERT INTO public.moon VALUES (20, 'Galatea', 8, 174.8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 57909175, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 108208930, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 149597890, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 227936640, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 778412010, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1426725400, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 2870972200, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4498252900, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Tau Ceti g', 6, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Tau Ceti h', 6, NULL, NULL);


--
-- Data for Name: spectral_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spectral_class VALUES (40000, 'Blue', 'Very hot and extremely luminous, with most of their radiated in the ultraviolet range.', 'O', 1);
INSERT INTO public.spectral_class VALUES (20000, 'Deep bluish white', 'Very luminous and blue.', 'B', 2);
INSERT INTO public.spectral_class VALUES (10000, 'Bluish white', 'Amoung the more naked-eye star, and are white or bluish white.', 'A', 3);
INSERT INTO public.spectral_class VALUES (7500, 'White', NULL, 'F', 4);
INSERT INTO public.spectral_class VALUES (5500, 'Yellowish white', NULL, 'G', 5);
INSERT INTO public.spectral_class VALUES (4000, 'Pale yellowish orange', 'Orangish star that are slightly cooler than the Sun.', 'K', 6);
INSERT INTO public.spectral_class VALUES (3000, 'Light orangish red', 'Low luminosities that none are bright enough to be seen with the unaided eye, unless under exceptional conditions.', 'M', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 0.0000158, 'The Sun is the star at the center of Solar System. It is nearly pecfect ball of hot plasma heated by incandescense by nuclear fusion reaction in its core.', 5);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, 4.36, NULL, 5);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 1, 11.75, NULL, 5);
INSERT INTO public.star VALUES (11, 'Capella', 1, 43, NULL, 5);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4.24, 'Proxima Centauri is a red dwarf star with mass about 12.5% of the Sun mass, and average density about 33 times that of the Sun.', 7);
INSERT INTO public.star VALUES (5, 'Bernard Star', 1, 6, NULL, 7);
INSERT INTO public.star VALUES (16, 'Beta Andromedae', 2, 199, NULL, 7);
INSERT INTO public.star VALUES (4, 'Toliman', 1, 4.36, NULL, 6);
INSERT INTO public.star VALUES (9, 'Arcturus', 1, 37, NULL, 6);
INSERT INTO public.star VALUES (17, 'Gamma Andromedae', 2, 355, NULL, 6);
INSERT INTO public.star VALUES (7, 'Sirius', 1, 8.6, NULL, 3);
INSERT INTO public.star VALUES (8, 'Canopus', 1, 310, NULL, 3);
INSERT INTO public.star VALUES (13, 'Procyon', 1, 11, NULL, 4);
INSERT INTO public.star VALUES (12, 'Rigel', 1, 860, NULL, 2);
INSERT INTO public.star VALUES (14, 'Achernar', 1, 139, NULL, 2);
INSERT INTO public.star VALUES (15, 'Alpha Andromedae', 2, 97, NULL, 2);
INSERT INTO public.star VALUES (10, 'Vega', 1, 25, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spectral_class_spectral_class_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 2, true);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: spectral_class spectral_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class
    ADD CONSTRAINT spectral_class_name_key UNIQUE (name);


--
-- Name: spectral_class spectral_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class
    ADD CONSTRAINT spectral_class_pkey PRIMARY KEY (spectral_class_id);


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

