--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-07 22:24:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16407)
-- Name: login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.login OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 217
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    titulo character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16417)
-- Name: proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyectos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyectos_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyectos_id_seq OWNED BY public.proyectos.id;


--
-- TOC entry 4748 (class 2604 OID 16410)
-- Name: login id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16421)
-- Name: proyectos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos ALTER COLUMN id SET DEFAULT nextval('public.proyectos_id_seq'::regclass);


--
-- TOC entry 4904 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login (id, username, password, email) FROM stdin;
\.


--
-- TOC entry 4906 (class 0 OID 16418)
-- Dependencies: 220
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyectos (id, id_usuario, titulo, descripcion) FROM stdin;
\.


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 217
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_id_seq', 12, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 219
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyectos_id_seq', 27, true);


--
-- TOC entry 4751 (class 2606 OID 16412)
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- TOC entry 4755 (class 2606 OID 16425)
-- Name: proyectos proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 16414)
-- Name: login unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 4756 (class 2606 OID 16426)
-- Name: proyectos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.login(id) ON DELETE CASCADE;


--
-- TOC entry 4757 (class 2606 OID 16446)
-- Name: proyectos proyectos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.login(id) ON DELETE CASCADE;


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE proyectos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.proyectos TO oliver;


--
-- TOC entry 2049 (class 826 OID 16416)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO oliver;


-- Completed on 2025-04-07 22:24:23

--
-- PostgreSQL database dump complete
--

