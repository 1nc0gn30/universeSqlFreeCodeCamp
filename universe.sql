--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_dangerous boolean,
    composition text,
    distance_from_earth numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean,
    galaxy_type character varying(100),
    distance_from_earth integer,
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
    name character varying(255) NOT NULL,
    is_spherical boolean DEFAULT true,
    planet_id integer,
    surface_features text,
    orbital_period numeric
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
    name character varying(255) NOT NULL,
    has_life boolean,
    planet_type character varying(100),
    star_id integer,
    radius numeric,
    atmosphere text
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    is_spherical boolean DEFAULT true,
    age_in_millions_of_years integer,
    galaxy_id integer,
    temperature numeric,
    mass numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', false, 'Rock and ice', 2.77);
INSERT INTO public.asteroid VALUES (2, 'Vesta', false, 'Basaltic rock', 2.36);
INSERT INTO public.asteroid VALUES (3, 'Pallas', false, 'Silicate rock', 2.77);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Spiral', 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'Spiral', 2537000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 'Spiral', 3000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', false, 'Spiral', 21000, 'Known for its pronounced spiral arms.');
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', false, 'Irregular', 160000, 'Two irregular, dwarf galaxies near the Milky Way.');
INSERT INTO public.galaxy VALUES (7, 'Lenticular Galaxy', false, 'Lenticular', 14000000, 'Located 14 million light-years away, characterized by a prominent central bulge and no spiral arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 1, 'Mare, highlands, craters', 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, 'Stickney crater, grooves', 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, 'Craters, dust', 1.3);
INSERT INTO public.moon VALUES (4, 'Io', true, 5, 'Volcanoes, sulfur surface', 1.8);
INSERT INTO public.moon VALUES (5, 'Europa', true, 5, 'Ice surface, possible subsurface ocean', 3.5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 5, 'Largest moon, icy surface', 7.2);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, 'Heavily cratered ice surface', 16.7);
INSERT INTO public.moon VALUES (8, 'Titan', true, 6, 'Thick nitrogen atmosphere, lakes of methane', 15.9);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 6, 'Icy surface, thin atmosphere', 4.5);
INSERT INTO public.moon VALUES (10, 'Triton', true, 8, 'Cryovolcanoes and nitrogen geysers', 5.9);
INSERT INTO public.moon VALUES (11, 'Charon', true, 9, 'Red polar regions, mountain ridges', 6.4);
INSERT INTO public.moon VALUES (12, 'Oberon', true, 7, 'Impact craters and mountain peaks', 13.5);
INSERT INTO public.moon VALUES (13, 'Titania', true, 7, 'Canyons and small craters', 8.7);
INSERT INTO public.moon VALUES (14, 'Umbriel', true, 7, 'Dark and heavily cratered', 4.1);
INSERT INTO public.moon VALUES (15, 'Ariel', true, 7, 'Canyons and ridges', 2.5);
INSERT INTO public.moon VALUES (16, 'Dione', true, 6, 'Ice cliffs and bright wisps', 2.7);
INSERT INTO public.moon VALUES (17, 'Tethys', true, 6, 'Large crater Odysseus', 1.9);
INSERT INTO public.moon VALUES (18, 'Enceladus', true, 6, 'Icy surface with water-ice geysers', 1.4);
INSERT INTO public.moon VALUES (19, 'Mimas', true, 6, 'Giant crater Herschel', 0.9);
INSERT INTO public.moon VALUES (20, 'Miranda', true, 7, 'Giant cliffs, varied geology', 1.4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 1, 6371, 'Nitrogen and Oxygen rich');
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 1, 3389, 'Thin, mostly Carbon Dioxide');
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Terrestrial', 1, 6051, 'Thick, toxic with sulfuric acid clouds');
INSERT INTO public.planet VALUES (4, 'Mercury', false, 'Terrestrial', 1, 2440, 'Negligible atmosphere');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Gas giant', 2, 69911, 'Hydrogen and Helium');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Gas giant', 2, 58232, 'Hydrogen and Helium');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Ice giant', 3, 25362, 'Hydrogen, Helium, and Water');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Ice giant', 3, 24622, 'Hydrogen, Helium, and Methane');
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Dwarf', 4, 1188, 'Thin nitrogen, methane, and carbon monoxide');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', false, 'Exoplanet', 5, 15400, 'Unknown');
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', false, 'Exoplanet', 6, 7500, 'Unknown');
INSERT INTO public.planet VALUES (12, 'Ross 128 b', false, 'Exoplanet', 6, 5600, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 4600, 1, 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 242, 1, 9940, 2.1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', true, 5400, 1, 5790, 1.1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', true, 10000, 1, 3500, 20);
INSERT INTO public.star VALUES (5, 'Rigel', true, 8000, 1, 12100, 23);
INSERT INTO public.star VALUES (6, 'Vega', true, 455, 1, 9602, 2.1);
INSERT INTO public.star VALUES (7, 'Procyon', true, 2100, 1, 6530, 1.5);
INSERT INTO public.star VALUES (8, 'Achernar', true, 1250, 1, 15000, 6.7);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

