--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-04-08 21:21:02

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
-- TOC entry 219 (class 1259 OID 16410)
-- Name: administrativos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrativos (
    idadmin integer NOT NULL,
    titulo character varying(255) NOT NULL,
    turno character varying(6) NOT NULL
);


ALTER TABLE public.administrativos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16416)
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
-- TOC entry 220 (class 1259 OID 16415)
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
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 220
-- Name: clientes_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_idcliente_seq OWNED BY public.clientes.idcliente;


--
-- TOC entry 233 (class 1259 OID 16478)
-- Name: compone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compone (
    idcompone integer NOT NULL,
    helado integer NOT NULL,
    gusto integer NOT NULL
);


ALTER TABLE public.compone OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16477)
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
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 232
-- Name: compone_idcompone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compone_idcompone_seq OWNED BY public.compone.idcompone;


--
-- TOC entry 227 (class 1259 OID 16450)
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
-- TOC entry 226 (class 1259 OID 16449)
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
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 226
-- Name: contiene_idcontiene_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contiene_idcontiene_seq OWNED BY public.contiene.idcontiene;


--
-- TOC entry 216 (class 1259 OID 16389)
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
-- TOC entry 215 (class 1259 OID 16388)
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
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 215
-- Name: empleados_idempleado_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleados_idempleado_seq1 OWNED BY public.empleados.idempleado;


--
-- TOC entry 229 (class 1259 OID 16460)
-- Name: gustos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gustos (
    idgusto integer NOT NULL,
    nombre_g character varying(255) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.gustos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16459)
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
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 228
-- Name: gustos_idgusto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gustos_idgusto_seq OWNED BY public.gustos.idgusto;


--
-- TOC entry 225 (class 1259 OID 16437)
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
-- TOC entry 224 (class 1259 OID 16436)
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
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 224
-- Name: helados_idhelado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.helados_idhelado_seq OWNED BY public.helados.idhelado;


--
-- TOC entry 223 (class 1259 OID 16428)
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
-- TOC entry 222 (class 1259 OID 16427)
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
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 222
-- Name: pedidos_idpedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_idpedido_seq OWNED BY public.pedidos.idpedido;


--
-- TOC entry 217 (class 1259 OID 16398)
-- Name: planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planta (
    idplanta integer NOT NULL,
    turno character varying(6) NOT NULL
);


ALTER TABLE public.planta OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16470)
-- Name: prepara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prepara (
    idprepara integer NOT NULL,
    gusto integer NOT NULL,
    planta integer NOT NULL
);


ALTER TABLE public.prepara OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16469)
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
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 230
-- Name: prepara_idprepara_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prepara_idprepara_seq OWNED BY public.prepara.idprepara;


--
-- TOC entry 218 (class 1259 OID 16403)
-- Name: repartidores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repartidores (
    idrepartidor integer NOT NULL,
    turno character varying NOT NULL
);


ALTER TABLE public.repartidores OWNER TO postgres;

--
-- TOC entry 4736 (class 2604 OID 16552)
-- Name: clientes idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN idcliente SET DEFAULT nextval('public.clientes_idcliente_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16558)
-- Name: compone idcompone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone ALTER COLUMN idcompone SET DEFAULT nextval('public.compone_idcompone_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16555)
-- Name: contiene idcontiene; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene ALTER COLUMN idcontiene SET DEFAULT nextval('public.contiene_idcontiene_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16551)
-- Name: empleados idempleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados ALTER COLUMN idempleado SET DEFAULT nextval('public.empleados_idempleado_seq1'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16556)
-- Name: gustos idgusto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gustos ALTER COLUMN idgusto SET DEFAULT nextval('public.gustos_idgusto_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16554)
-- Name: helados idhelado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helados ALTER COLUMN idhelado SET DEFAULT nextval('public.helados_idhelado_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16553)
-- Name: pedidos idpedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN idpedido SET DEFAULT nextval('public.pedidos_idpedido_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16557)
-- Name: prepara idprepara; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara ALTER COLUMN idprepara SET DEFAULT nextval('public.prepara_idprepara_seq'::regclass);


--
-- TOC entry 4761 (class 2606 OID 16423)
-- Name: clientes idcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT idcliente PRIMARY KEY (idcliente);


--
-- TOC entry 4771 (class 2606 OID 16457)
-- Name: contiene idcontiene; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT idcontiene PRIMARY KEY (idcontiene);


--
-- TOC entry 4756 (class 2606 OID 16414)
-- Name: administrativos iddamin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrativos
    ADD CONSTRAINT iddamin PRIMARY KEY (idadmin);


--
-- TOC entry 4750 (class 2606 OID 16396)
-- Name: empleados idempleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT idempleado PRIMARY KEY (idempleado);


--
-- TOC entry 4780 (class 2606 OID 16483)
-- Name: compone idgusto_idhelado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT idgusto_idhelado PRIMARY KEY (idcompone);


--
-- TOC entry 4774 (class 2606 OID 16467)
-- Name: gustos idgustos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gustos
    ADD CONSTRAINT idgustos PRIMARY KEY (idgusto);


--
-- TOC entry 4768 (class 2606 OID 16446)
-- Name: helados idhelado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helados
    ADD CONSTRAINT idhelado PRIMARY KEY (idhelado);


--
-- TOC entry 4752 (class 2606 OID 16402)
-- Name: planta idplanta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT idplanta PRIMARY KEY (idplanta);


--
-- TOC entry 4777 (class 2606 OID 16475)
-- Name: prepara idprepara; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT idprepara PRIMARY KEY (idprepara);


--
-- TOC entry 4754 (class 2606 OID 16409)
-- Name: repartidores idrepartidor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidores
    ADD CONSTRAINT idrepartidor PRIMARY KEY (idrepartidor);


--
-- TOC entry 4764 (class 2606 OID 16434)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (idpedido);


--
-- TOC entry 4757 (class 1259 OID 16424)
-- Name: ck_clientes_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_clientes_email ON public.clientes USING btree (email);


--
-- TOC entry 4765 (class 1259 OID 16447)
-- Name: ck_codigo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_codigo ON public.helados USING btree (codigo_h);


--
-- TOC entry 4778 (class 1259 OID 16484)
-- Name: ck_compone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_compone ON public.compone USING btree (helado, gusto);


--
-- TOC entry 4769 (class 1259 OID 16458)
-- Name: ck_contiene; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_contiene ON public.contiene USING btree (helado, pedido);


--
-- TOC entry 4758 (class 1259 OID 16426)
-- Name: ck_cuit_clientes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_cuit_clientes ON public.clientes USING btree (cuit);


--
-- TOC entry 4748 (class 1259 OID 16397)
-- Name: ck_empleados_cuil; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_empleados_cuil ON public.empleados USING btree (cuil);


--
-- TOC entry 4766 (class 1259 OID 16448)
-- Name: ck_nombre_h_peso_gramos; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_nombre_h_peso_gramos ON public.helados USING btree (nombre_h, peso_gramos);


--
-- TOC entry 4775 (class 1259 OID 16476)
-- Name: ck_prepara; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ck_prepara ON public.prepara USING btree (gusto, planta);


--
-- TOC entry 4759 (class 1259 OID 16425)
-- Name: clk_clientes_num_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clk_clientes_num_cliente ON public.clientes USING btree (num_cliente);


--
-- TOC entry 4772 (class 1259 OID 16468)
-- Name: gustos_nombre_g_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gustos_nombre_g_key ON public.gustos USING btree (nombre_g);


--
-- TOC entry 4762 (class 1259 OID 16435)
-- Name: pedidos_num_pedido_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pedidos_num_pedido_key ON public.pedidos USING btree (num_pedido);


--
-- TOC entry 4785 (class 2606 OID 16515)
-- Name: pedidos administrativos_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT administrativos_pedidos_fk FOREIGN KEY (administrativo) REFERENCES public.administrativos(idadmin);


--
-- TOC entry 4786 (class 2606 OID 16520)
-- Name: pedidos clientes_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT clientes_pedidos_fk FOREIGN KEY (cliente) REFERENCES public.clientes(idcliente);


--
-- TOC entry 4784 (class 2606 OID 16485)
-- Name: administrativos empleados_administrativos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrativos
    ADD CONSTRAINT empleados_administrativos_fk FOREIGN KEY (idadmin) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4781 (class 2606 OID 16490)
-- Name: empleados empleados_empleados_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_empleados_fk FOREIGN KEY (jefe) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4782 (class 2606 OID 16500)
-- Name: planta empleados_planta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT empleados_planta_fk FOREIGN KEY (idplanta) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4783 (class 2606 OID 16495)
-- Name: repartidores empleados_repartidores_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repartidores
    ADD CONSTRAINT empleados_repartidores_fk FOREIGN KEY (idrepartidor) REFERENCES public.empleados(idempleado);


--
-- TOC entry 4792 (class 2606 OID 16540)
-- Name: compone gustos_compone_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT gustos_compone_fk FOREIGN KEY (gusto) REFERENCES public.gustos(idgusto) ON DELETE CASCADE;


--
-- TOC entry 4790 (class 2606 OID 16545)
-- Name: prepara gustos_prepara_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT gustos_prepara_fk FOREIGN KEY (gusto) REFERENCES public.gustos(idgusto);


--
-- TOC entry 4793 (class 2606 OID 16530)
-- Name: compone helados_compone_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compone
    ADD CONSTRAINT helados_compone_fk FOREIGN KEY (helado) REFERENCES public.helados(idhelado) ON DELETE CASCADE;


--
-- TOC entry 4788 (class 2606 OID 16535)
-- Name: contiene helados_contiene_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT helados_contiene_fk FOREIGN KEY (helado) REFERENCES public.helados(idhelado);


--
-- TOC entry 4789 (class 2606 OID 16525)
-- Name: contiene pedidos_contiene_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contiene
    ADD CONSTRAINT pedidos_contiene_fk FOREIGN KEY (pedido) REFERENCES public.pedidos(idpedido);


--
-- TOC entry 4791 (class 2606 OID 16505)
-- Name: prepara planta_prepara_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prepara
    ADD CONSTRAINT planta_prepara_fk FOREIGN KEY (planta) REFERENCES public.planta(idplanta);


--
-- TOC entry 4787 (class 2606 OID 16510)
-- Name: pedidos repartidores_pedidos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT repartidores_pedidos_fk FOREIGN KEY (repartidor) REFERENCES public.repartidores(idrepartidor);


-- Completed on 2025-04-08 21:21:02

--
-- PostgreSQL database dump complete
--

