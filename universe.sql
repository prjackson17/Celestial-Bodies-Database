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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_in_light_years integer,
    mass_in_bil_solar_masses integer,
    age_in_mil_years integer
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
    name character varying(40) NOT NULL,
    planet_id integer,
    radius_in_km integer,
    mass_in_kg integer,
    surface_features text,
    orbital_period numeric(4,1)
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
    name character varying(40) NOT NULL,
    star_id integer,
    is_habitable boolean,
    radius_in_solar_radii numeric(5,3),
    mass_in_solar_masses numeric(6,3),
    num_of_moons integer,
    surface_features text,
    orbital_period_in_years numeric(4,1)
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    is_habitable boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    mass_in_solar_masses numeric(4,3),
    radius_in_solar_radii numeric(4,3)
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 52850, 1150, 13610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 110000, 1230, 10010);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 30000, 50, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 7000, 10, 1101);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3500, 7, 13000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 30000, 160, 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'Luna', 1, 1737, 7350, 'Craters, maria, highlands', 27.3);
INSERT INTO public.moon VALUES (21, 'Phobos', 4, 11, 1065, 'Irregular shape, heavily cratered', 0.3);
INSERT INTO public.moon VALUES (22, 'Deimos', 4, 6, 147, 'Irregular shape, less cratered than Phobos', 1.3);
INSERT INTO public.moon VALUES (23, 'Ganymede', 5, 2634, 1481900, 'Icy surface, craters, grooves', 7.2);
INSERT INTO public.moon VALUES (24, 'Callisto', 5, 2410, 107590, 'Heavily cratered, ancient surface', 16.7);
INSERT INTO public.moon VALUES (25, 'Io', 5, 1822, 893190, 'Volcanically active, sulfuric surface', 1.8);
INSERT INTO public.moon VALUES (26, 'Europa', 5, 1561, 479880, 'Smooth surface, icy crust, possible subsurface ocean', 3.5);
INSERT INTO public.moon VALUES (27, 'Titan', 6, 2576, 1345200, 'Thick atmosphere, lakes of hydrocarbons', 15.9);
INSERT INTO public.moon VALUES (28, 'Rhea', 6, 765, 230650, 'Craters, bright wispy streaks', 4.5);
INSERT INTO public.moon VALUES (29, 'Mimas', 6, 198, 37493, 'Large crater Herschel, heavily cratered', 0.9);
INSERT INTO public.moon VALUES (30, 'Triton', 8, 1353, 213900, 'Geysers, nitrogen ice, pink hue', 5.9);
INSERT INTO public.moon VALUES (31, 'Charon', 9, 606, 158660, 'Craters, chasms, reddish coloration', 6.4);
INSERT INTO public.moon VALUES (32, 'Larissa', 9, 194, 4200, 'Craters, relatively smooth surface', 0.5);
INSERT INTO public.moon VALUES (33, 'Proteus', 8, 420, 51984, 'Irregular shape, heavily cratered', 1.1);
INSERT INTO public.moon VALUES (34, 'Nereid', 8, 170, 31000, 'Elliptical orbit, irregular shape', 360.1);
INSERT INTO public.moon VALUES (35, 'Umbriel', 7, 585, 117290, 'Dark surface, cratered, icy plains', 4.1);
INSERT INTO public.moon VALUES (36, 'Miranda', 7, 236, 65900, 'Unusual surface features, cliffs, ridges', 1.4);
INSERT INTO public.moon VALUES (37, 'Ariel', 7, 579, 135300, 'Young surface, fault lines, valleys', 2.5);
INSERT INTO public.moon VALUES (38, 'Parker', 7, 1353, 213900, 'Geysers, nitrogen ice, pink hue', 5.9);
INSERT INTO public.moon VALUES (39, 'Oberon', 7, 761, 301400, 'Cratered, icy, dark patches', 13.5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5, true, 1.000, 1.000, 1, 'Oceans and Mountains', 1.0);
INSERT INTO public.planet VALUES (2, 'Mercury', 5, false, 0.383, 0.055, 0, NULL, 0.2);
INSERT INTO public.planet VALUES (3, 'Venus', 5, false, 0.950, 0.815, 0, 'volcanoes and large impact craters', 0.6);
INSERT INTO public.planet VALUES (4, 'Mars', 5, false, 0.533, 0.107, 2, 'volcanoes and canyons', 1.9);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, false, 11.209, 317.800, 95, NULL, 11.9);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, false, 9.140, 95.159, 146, NULL, 29.4);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, false, 4.007, 14.536, 27, NULL, 84.0);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, false, 3.883, 17.147, 14, NULL, 164.8);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, false, 0.187, 0.002, 5, NULL, 247.9);
INSERT INTO public.planet VALUES (10, 'Aurora Prime', 8, false, 1.200, 0.800, 2, NULL, 1.0);
INSERT INTO public.planet VALUES (11, 'Verdantia', 10, false, 1.400, 1.100, 20, NULL, 2.5);
INSERT INTO public.planet VALUES (12, 'Terra Nova', 12, false, 3.500, 0.700, 3, NULL, 5.7);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'International Space Station', 1, true);
INSERT INTO public.satellite VALUES (2, 'Russian Cosmonaut Station', 1, true);
INSERT INTO public.satellite VALUES (3, 'Hubble Space Telescope', 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sun', 1, 1.000, 1.000);
INSERT INTO public.star VALUES (6, 'Sirius A', 1, 2.063, 1.711);
INSERT INTO public.star VALUES (7, 'Sirius B', 1, 1.018, 0.008);
INSERT INTO public.star VALUES (8, 'Luminara', 2, 2.100, 3.500);
INSERT INTO public.star VALUES (9, 'Stellarion', 3, 5.600, 7.200);
INSERT INTO public.star VALUES (10, 'Celestia', 4, 8.300, 9.800);
INSERT INTO public.star VALUES (11, 'Novaflare', 5, 2.100, 8.400);
INSERT INTO public.star VALUES (12, 'Nebulux', 6, 6.700, 9.300);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

