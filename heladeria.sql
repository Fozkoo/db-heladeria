--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-08 22:24:27

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

--
-- TOC entry 891 (class 1247 OID 32932)
-- Name: turno_tipo; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.turno_tipo AS character varying(20)
	CONSTRAINT turno_tipo_check CHECK (((VALUE)::text = ANY ((ARRAY['mañana'::character varying, 'tarde'::character varying, 'noche'::character varying])::text[])));


ALTER DOMAIN public.turno_tipo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 32769)
-- Name: administrativos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrativos (
    idadmin integer NOT NULL,
    titulo character varying(255) NOT NULL,
    turno public.turno_tipo NOT NULL
);


ALTER TABLE public.administrativos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32772)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    idcliente integer NOT NULL,
    num_cliente integer NOT NULL,
    nombre_c character varying NOT NULL,
    cuit character varying(13) NOT NULL,
    email character varying(255) NOT NULL,
    telefon character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    fecha_alta date NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32777)
-- Name: clientes_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_idcliente_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_idcliente_seq OWNED BY public.clientes.idcliente;


--
-- TOC entry 218 (class 1259 OID 32778)
-- Name: compone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compone (
    idcompone integer NOT NULL,
    helado integer NOT NULL,
    gusto integer NOT NULL
);


ALTER TABLE public.compone OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32781)
-- Name: compone_idcompone_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compone_idcompone_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compone_idcompone_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 219
-- Name: compone_idcompone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compone_idcompone_seq OWNED BY public.compone.idcompone;


--
-- TOC entry 220 (class 1259 OID 32782)
-- Name: contiene; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contiene (
    idcontiene integer NOT NULL,
    helado integer NOT NULL,
    pedido integer NOT NULL,
    cantidad integer DEFAULT 0 NOT NULL,
    precio numeric(10,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public.contiene OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32787)
-- Name: contiene_idcontiene_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contiene_idcontiene_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contiene_idcontiene_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 221
-- Name: contiene_idcontiene_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contiene_idcontiene_seq OWNED BY public.contiene.idcontiene;


--
-- TOC entry 222 (class 1259 OID 32788)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    idempleado integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    dni character varying(8) NOT NULL,
    cuil character varying(12) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    fecha_alta date NOT NULL,
    fecha_baja date,
    jefe integer
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32793)
-- Name: empleados_idempleado_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleados_idempleado_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleados_idempleado_seq1 OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleados_idempleado_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_idempleado_seq1 OWNED BY public.empleados.idempleado;


--
-- TOC entry 224 (class 1259 OID 32794)
-- Name: gustos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gustos (
    idgusto integer NOT NULL,
    nombre_g character varying(255) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.gustos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32799)
-- Name: gustos_idgusto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gustos_idgusto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gustos_idgusto_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 225
-- Name: gustos_idgusto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gustos_idgusto_seq OWNED BY public.gustos.idgusto;


--
-- TOC entry 226 (class 1259 OID 32800)
-- Name: helados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helados (
    idhelado integer NOT NULL,
    codigo_h character varying(255) NOT NULL,
    nombre_h character varying(255) NOT NULL,
    peso_gramos character(4) NOT NULL,
    fecha_vencimiento date NOT NULL,
    precio numeric(10,2) DEFAULT 0 NOT NULL,
    cant_ingredientes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.helados OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32807)
-- Name: helados_idhelado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.helados_idhelado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.helados_idhelado_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 227
-- Name: helados_idhelado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helados_idhelado_seq OWNED BY public.helados.idhelado;


--
-- TOC entry 228 (class 1259 OID 32808)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    idpedido integer NOT NULL,
    num_pedido integer NOT NULL,
    fecha date NOT NULL,
    total numeric(10,2) DEFAULT 0 NOT NULL,
    cliente integer NOT NULL,
    administrativo integer NOT NULL,
    repartidor integer NOT NULL
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32812)
-- Name: pedidos_idpedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_idpedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_idpedido_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 229
-- Name: pedidos_idpedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_idpedido_seq OWNED BY public.pedidos.idpedido;


--
-- TOC entry 230 (class 1259 OID 32813)
-- Name: planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planta (
    idplanta integer NOT NULL,
    turno character varying(6) NOT NULL
);


ALTER TABLE public.planta OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32816)
-- Name: prepara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prepara (
    idprepara integer NOT NULL,
    gusto integer NOT NULL,
    planta integer NOT NULL
);


ALTER TABLE public.prepara OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 32819)
-- Name: prepara_idprepara_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prepara_idprepara_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prepara_idprepara_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 232
-- Name: prepara_idprepara_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prepara_idprepara_seq OWNED BY public.prepara.idprepara;


--
-- TOC entry 233 (class 1259 OID 32820)
-- Name: repartidores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repartidores (
    idrepartidor integer NOT NULL,
    turno public.turno_tipo NOT NULL
);


ALTER TABLE public.repartidores OWNER TO postgres;

--
-- TOC entry 4685 (class 2604 OID 32825)
-- Name: clientes idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN idcliente SET DEFAULT nextval('public.clientes_idcliente_seq'::regclass);


--
-- TOC entry 4686 (class 2604 OID 32826)
-- Name: compone idcompone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone ALTER COLUMN idcompone SET DEFAULT nextval('public.compone_idcompone_seq'::regclass);


--
-- TOC entry 4687 (class 2604 OID 32827)
-- Name: contiene idcontiene; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene ALTER COLUMN idcontiene SET DEFAULT nextval('public.contiene_idcontiene_seq'::regclass);


--
-- TOC entry 4690 (class 2604 OID 32828)
-- Name: empleados idempleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN idempleado SET DEFAULT nextval('public.empleados_idempleado_seq1'::regclass);


--
-- TOC entry 4691 (class 2604 OID 32829)
-- Name: gustos idgusto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gustos ALTER COLUMN idgusto SET DEFAULT nextval('public.gustos_idgusto_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 32830)
-- Name: helados idhelado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helados ALTER COLUMN idhelado SET DEFAULT nextval('public.helados_idhelado_seq'::regclass);


--
-- TOC entry 4695 (class 2604 OID 32831)
-- Name: pedidos idpedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN idpedido SET DEFAULT nextval('public.pedidos_idpedido_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 32832)
-- Name: prepara idprepara; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara ALTER COLUMN idprepara SET DEFAULT nextval('public.prepara_idprepara_seq'::regclass);


--
-- TOC entry 4887 (class 0 OID 32769)
-- Dependencies: 215
-- Data for Name: administrativos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrativos (idadmin, titulo, turno) FROM stdin;
1	Abogado	tarde
\.


--
-- TOC entry 4888 (class 0 OID 32772)
-- Dependencies: 216
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (idcliente, num_cliente, nombre_c, cuit, email, telefon, direccion, fecha_alta) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 32778)
-- Dependencies: 218
-- Data for Name: compone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compone (idcompone, helado, gusto) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 32782)
-- Dependencies: 220
-- Data for Name: contiene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contiene (idcontiene, helado, pedido, cantidad, precio) FROM stdin;
\.


--
-- TOC entry 4894 (class 0 OID 32788)
-- Dependencies: 222
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (idempleado, nombre, apellido, dni, cuil, direccion, telefono, fecha_alta, fecha_baja, jefe) FROM stdin;
1	Tiziano	Martinelli	4545454	34343323	Alsina	232541232	2025-08-04	2025-09-04	1
3	juan	cacho	45425454	33333	aaaa	23211541232	2025-08-04	2025-09-04	1
5	Juan	pedro	45435454	3111123	Alem 22	232541232	2025-08-04	2025-09-04	1
\.


--
-- TOC entry 4896 (class 0 OID 32794)
-- Dependencies: 224
-- Data for Name: gustos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gustos (idgusto, nombre_g, descripcion) FROM stdin;
2	Dulce de leche	Rico
\.


--
-- TOC entry 4898 (class 0 OID 32800)
-- Dependencies: 226
-- Data for Name: helados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helados (idhelado, codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 32808)
-- Dependencies: 228
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (idpedido, num_pedido, fecha, total, cliente, administrativo, repartidor) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 32813)
-- Dependencies: 230
-- Data for Name: planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planta (idplanta, turno) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 32816)
-- Dependencies: 231
-- Data for Name: prepara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prepara (idprepara, gusto, planta) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 32820)
-- Dependencies: 233
-- Data for Name: repartidores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repartidores (idrepartidor, turno) FROM stdin;
5	tarde
\.


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_idcliente_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 219
-- Name: compone_idcompone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compone_idcompone_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: contiene_idcontiene_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contiene_idcontiene_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: empleados_idempleado_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleados_idempleado_seq1', 5, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 225
-- Name: gustos_idgusto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gustos_idgusto_seq', 2, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 227
-- Name: helados_idhelado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.helados_idhelado_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 229
-- Name: pedidos_idpedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_idpedido_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 232
-- Name: prepara_idprepara_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prepara_idprepara_seq', 1, false);


--
-- TOC entry 4704 (class 2606 OID 32834)
-- Name: clientes idcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT idcliente PRIMARY KEY (idcliente);


--
-- TOC entry 4710 (class 2606 OID 32836)
-- Name: contiene idcontiene; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT idcontiene PRIMARY KEY (idcontiene);


--
-- TOC entry 4699 (class 2606 OID 32838)
-- Name: administrativos iddamin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrativos
    ADD CONSTRAINT iddamin PRIMARY KEY (idadmin);


--
-- TOC entry 4713 (class 2606 OID 32840)
-- Name: empleados idempleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT idempleado PRIMARY KEY (idempleado);


--
-- TOC entry 4707 (class 2606 OID 32842)
-- Name: compone idgusto_idhelado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT idgusto_idhelado PRIMARY KEY (idcompone);


--
-- TOC entry 4716 (class 2606 OID 32844)
-- Name: gustos idgustos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gustos
    ADD CONSTRAINT idgustos PRIMARY KEY (idgusto);


--
-- TOC entry 4720 (class 2606 OID 32846)
-- Name: helados idhelado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helados
    ADD CONSTRAINT idhelado PRIMARY KEY (idhelado);


--
-- TOC entry 4725 (class 2606 OID 32848)
-- Name: planta idplanta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT idplanta PRIMARY KEY (idplanta);


--
-- TOC entry 4728 (class 2606 OID 32850)
-- Name: prepara idprepara; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT idprepara PRIMARY KEY (idprepara);


--
-- TOC entry 4730 (class 2606 OID 32852)
-- Name: repartidores idrepartidor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidores
    ADD CONSTRAINT idrepartidor PRIMARY KEY (idrepartidor);


--
-- TOC entry 4723 (class 2606 OID 32854)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (idpedido);


--
-- TOC entry 4700 (class 1259 OID 32855)
-- Name: ck_clientes_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_clientes_email ON public.clientes USING btree (email);


--
-- TOC entry 4717 (class 1259 OID 32856)
-- Name: ck_codigo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_codigo ON public.helados USING btree (codigo_h);


--
-- TOC entry 4705 (class 1259 OID 32857)
-- Name: ck_compone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_compone ON public.compone USING btree (helado, gusto);


--
-- TOC entry 4708 (class 1259 OID 32858)
-- Name: ck_contiene; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_contiene ON public.contiene USING btree (helado, pedido);


--
-- TOC entry 4701 (class 1259 OID 32859)
-- Name: ck_cuit_clientes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_cuit_clientes ON public.clientes USING btree (cuit);


--
-- TOC entry 4711 (class 1259 OID 32860)
-- Name: ck_empleados_cuil; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_empleados_cuil ON public.empleados USING btree (cuil);


--
-- TOC entry 4718 (class 1259 OID 32861)
-- Name: ck_nombre_h_peso_gramos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_nombre_h_peso_gramos ON public.helados USING btree (nombre_h, peso_gramos);


--
-- TOC entry 4726 (class 1259 OID 32862)
-- Name: ck_prepara; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_prepara ON public.prepara USING btree (gusto, planta);


--
-- TOC entry 4702 (class 1259 OID 32863)
-- Name: clk_clientes_num_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clk_clientes_num_cliente ON public.clientes USING btree (num_cliente);


--
-- TOC entry 4714 (class 1259 OID 32864)
-- Name: gustos_nombre_g_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gustos_nombre_g_key ON public.gustos USING btree (nombre_g);


--
-- TOC entry 4721 (class 1259 OID 32865)
-- Name: pedidos_num_pedido_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pedidos_num_pedido_key ON public.pedidos USING btree (num_pedido);


--
-- TOC entry 4737 (class 2606 OID 32866)
-- Name: pedidos administrativos_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT administrativos_pedidos_fk FOREIGN KEY (administrativo) REFERENCES public.administrativos(idadmin);


--
-- TOC entry 4738 (class 2606 OID 32871)
-- Name: pedidos clientes_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT clientes_pedidos_fk FOREIGN KEY (cliente) REFERENCES public.clientes(idcliente);


--
-- TOC entry 4731 (class 2606 OID 32876)
-- Name: administrativos empleados_administrativos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrativos
    ADD CONSTRAINT empleados_administrativos_fk FOREIGN KEY (idadmin) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4736 (class 2606 OID 32881)
-- Name: empleados empleados_empleados_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_empleados_fk FOREIGN KEY (jefe) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4740 (class 2606 OID 32886)
-- Name: planta empleados_planta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT empleados_planta_fk FOREIGN KEY (idplanta) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4743 (class 2606 OID 32891)
-- Name: repartidores empleados_repartidores_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidores
    ADD CONSTRAINT empleados_repartidores_fk FOREIGN KEY (idrepartidor) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4732 (class 2606 OID 32896)
-- Name: compone gustos_compone_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT gustos_compone_fk FOREIGN KEY (gusto) REFERENCES public.gustos(idgusto) ON DELETE CASCADE;


--
-- TOC entry 4741 (class 2606 OID 32901)
-- Name: prepara gustos_prepara_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT gustos_prepara_fk FOREIGN KEY (gusto) REFERENCES public.gustos(idgusto);


--
-- TOC entry 4733 (class 2606 OID 32906)
-- Name: compone helados_compone_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT helados_compone_fk FOREIGN KEY (helado) REFERENCES public.helados(idhelado) ON DELETE CASCADE;


--
-- TOC entry 4734 (class 2606 OID 32911)
-- Name: contiene helados_contiene_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT helados_contiene_fk FOREIGN KEY (helado) REFERENCES public.helados(idhelado);


--
-- TOC entry 4735 (class 2606 OID 32916)
-- Name: contiene pedidos_contiene_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT pedidos_contiene_fk FOREIGN KEY (pedido) REFERENCES public.pedidos(idpedido);


--
-- TOC entry 4742 (class 2606 OID 32921)
-- Name: prepara planta_prepara_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT planta_prepara_fk FOREIGN KEY (planta) REFERENCES public.planta(idplanta);


--
-- TOC entry 4739 (class 2606 OID 32926)
-- Name: pedidos repartidores_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT repartidores_pedidos_fk FOREIGN KEY (repartidor) REFERENCES public.repartidores(idrepartidor);


-- Completed on 2025-04-08 22:24:27

--
-- PostgreSQL database dump complete
--

