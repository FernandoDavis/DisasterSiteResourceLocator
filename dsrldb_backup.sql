--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.administrator (
    aid integer NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- Name: administrator_aid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrator_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrator_aid_seq OWNER TO postgres;

--
-- Name: administrator_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrator_aid_seq OWNED BY public.administrator.aid;


--
-- Name: billinginformation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.billinginformation (
    bid integer NOT NULL,
    billing_address character varying(100),
    paypal_account character varying(50) NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.billinginformation OWNER TO postgres;

--
-- Name: billinginformation_bid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billinginformation_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billinginformation_bid_seq OWNER TO postgres;

--
-- Name: billinginformation_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billinginformation_bid_seq OWNED BY public.billinginformation.bid;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.category (
    catid integer NOT NULL,
    cattype character varying(35) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_catid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_catid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_catid_seq OWNER TO postgres;

--
-- Name: category_catid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_catid_seq OWNED BY public.category.catid;


--
-- Name: consumer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.consumer (
    cid integer NOT NULL,
    caddress character varying(100) NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.consumer OWNER TO postgres;

--
-- Name: consumer_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consumer_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_cid_seq OWNER TO postgres;

--
-- Name: consumer_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consumer_cid_seq OWNED BY public.consumer.cid;


--
-- Name: orderedsupply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.orderedsupply (
    onumber integer NOT NULL,
    cid integer NOT NULL,
    uid integer NOT NULL,
    suid integer NOT NULL,
    sid integer NOT NULL,
    odate date DEFAULT now() NOT NULL,
    oquantity integer NOT NULL
);


ALTER TABLE public.orderedsupply OWNER TO postgres;

--
-- Name: orderedsupply_onumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderedsupply_onumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderedsupply_onumber_seq OWNER TO postgres;

--
-- Name: orderedsupply_onumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderedsupply_onumber_seq OWNED BY public.orderedsupply.onumber;


--
-- Name: request; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.request (
    reqid integer NOT NULL,
    cid integer NOT NULL,
    resid integer NOT NULL,
    is_void boolean DEFAULT false NOT NULL,
    reqdate date DEFAULT now() NOT NULL
);


ALTER TABLE public.request OWNER TO postgres;

--
-- Name: request_reqid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.request_reqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_reqid_seq OWNER TO postgres;

--
-- Name: request_reqid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.request_reqid_seq OWNED BY public.request.reqid;


--
-- Name: reservedsupply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.reservedsupply (
    rnumber integer NOT NULL,
    rdate date DEFAULT now() NOT NULL,
    rquantity integer NOT NULL,
    cid integer NOT NULL,
    uid integer NOT NULL,
    suid integer NOT NULL,
    sid integer NOT NULL
);


ALTER TABLE public.reservedsupply OWNER TO postgres;

--
-- Name: reservedsupply_rnumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservedsupply_rnumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservedsupply_rnumber_seq OWNER TO postgres;

--
-- Name: reservedsupply_rnumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservedsupply_rnumber_seq OWNED BY public.reservedsupply.rnumber;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.resource (
    resid integer NOT NULL,
    catid integer NOT NULL,
    resdescription character varying(100),
    resname character varying(35) NOT NULL,
    reslocation character varying(100) NOT NULL,
    is_void boolean DEFAULT false NOT NULL
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_resid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resource_resid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_resid_seq OWNER TO postgres;

--
-- Name: resource_resid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resource_resid_seq OWNED BY public.resource.resid;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.supplier (
    sid integer NOT NULL,
    saddress character varying(100) NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_sid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_sid_seq OWNER TO postgres;

--
-- Name: supplier_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_sid_seq OWNED BY public.supplier.sid;


--
-- Name: supply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.supply (
    suid integer NOT NULL,
    sid integer NOT NULL,
    resid integer NOT NULL,
    is_void boolean DEFAULT false NOT NULL,
    is_reserved boolean DEFAULT false NOT NULL,
    suprice double precision NOT NULL,
    sudate date DEFAULT now() NOT NULL,
    suquantity integer NOT NULL
);


ALTER TABLE public.supply OWNER TO postgres;

--
-- Name: supply_suid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supply_suid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supply_suid_seq OWNER TO postgres;

--
-- Name: supply_suid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supply_suid_seq OWNED BY public.supply.suid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    uname character varying(50) NOT NULL,
    upass character(8) NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO postgres;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator ALTER COLUMN aid SET DEFAULT nextval('public.administrator_aid_seq'::regclass);


--
-- Name: bid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billinginformation ALTER COLUMN bid SET DEFAULT nextval('public.billinginformation_bid_seq'::regclass);


--
-- Name: catid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN catid SET DEFAULT nextval('public.category_catid_seq'::regclass);


--
-- Name: cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumer ALTER COLUMN cid SET DEFAULT nextval('public.consumer_cid_seq'::regclass);


--
-- Name: onumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderedsupply ALTER COLUMN onumber SET DEFAULT nextval('public.orderedsupply_onumber_seq'::regclass);


--
-- Name: reqid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request ALTER COLUMN reqid SET DEFAULT nextval('public.request_reqid_seq'::regclass);


--
-- Name: rnumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservedsupply ALTER COLUMN rnumber SET DEFAULT nextval('public.reservedsupply_rnumber_seq'::regclass);


--
-- Name: resid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource ALTER COLUMN resid SET DEFAULT nextval('public.resource_resid_seq'::regclass);


--
-- Name: sid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier ALTER COLUMN sid SET DEFAULT nextval('public.supplier_sid_seq'::regclass);


--
-- Name: suid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply ALTER COLUMN suid SET DEFAULT nextval('public.supply_suid_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator (aid, uid) FROM stdin;
3	17
\.


--
-- Name: administrator_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrator_aid_seq', 3, true);


--
-- Data for Name: billinginformation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billinginformation (bid, billing_address, paypal_account, uid) FROM stdin;
\.


--
-- Name: billinginformation_bid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billinginformation_bid_seq', 1, false);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (catid, cattype) FROM stdin;
1	Water
2	Medications
3	Baby food
4	Canned food
5	Dry food
6	Ice
7	Fuel
8	Medical devices
9	Heavy equipment
10	Tools
11	Clothing
12	Power Generators
13	Batteries
\.


--
-- Name: category_catid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_catid_seq', 14, true);


--
-- Data for Name: consumer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumer (cid, caddress, uid) FROM stdin;
1	anotheraddress	2
2		18
\.


--
-- Name: consumer_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consumer_cid_seq', 2, true);


--
-- Data for Name: orderedsupply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderedsupply (onumber, cid, uid, suid, sid, odate, oquantity) FROM stdin;
\.


--
-- Name: orderedsupply_onumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderedsupply_onumber_seq', 1, false);


--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request (reqid, cid, resid, is_void, reqdate) FROM stdin;
1	1	2	f	2020-03-22
2	1	5	f	2020-03-23
\.


--
-- Name: request_reqid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.request_reqid_seq', 2, true);


--
-- Data for Name: reservedsupply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservedsupply (rnumber, rdate, rquantity, cid, uid, suid, sid) FROM stdin;
\.


--
-- Name: reservedsupply_rnumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservedsupply_rnumber_seq', 1, false);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource (resid, catid, resdescription, resname, reslocation, is_void) FROM stdin;
1	1	Water for your family available	Bottled water	Calle tal	f
2	1	Water for your family here	1 Gallon bottles	Calle some	f
3	3	Baby food for your family here	Banana flavor	Calle some	f
4	1	bottled water available for sale	Bottled Water	an address	f
5	1	bottled water requested, please	Bottled Water	another address	f
\.


--
-- Name: resource_resid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resource_resid_seq', 5, true);


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (sid, saddress, uid) FROM stdin;
1	someaddress	1
4	an address	13
\.


--
-- Name: supplier_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_sid_seq', 4, true);


--
-- Data for Name: supply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supply (suid, sid, resid, is_void, is_reserved, suprice, sudate, suquantity) FROM stdin;
1	1	1	f	f	1.5	2020-03-22	15
2	1	3	f	f	4.5	2020-03-22	3
3	1	4	f	f	1	2020-03-22	50
\.


--
-- Name: supply_suid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supply_suid_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (uid, uname, upass, first_name, last_name) FROM stdin;
2	another@gmail.com	Password	Jose	Tua
1	fdavis	password	Fernando	Davis
13	test	password	test	test
17	somename	password	awdafad	awdafea
18	a name	password	some	last
\.


--
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_uid_seq', 18, true);


--
-- Name: administrator_aid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_aid_key UNIQUE (aid);


--
-- Name: administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (aid, uid);


--
-- Name: billinginformation_bid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_bid_key UNIQUE (bid);


--
-- Name: billinginformation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_pkey PRIMARY KEY (bid, uid);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (catid);


--
-- Name: consumer_cid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_cid_key UNIQUE (cid);


--
-- Name: consumer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_pkey PRIMARY KEY (cid, uid);


--
-- Name: orderedsupply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_pkey PRIMARY KEY (onumber);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (reqid, cid);


--
-- Name: request_reqid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_reqid_key UNIQUE (reqid);


--
-- Name: reservedsupply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_pkey PRIMARY KEY (rnumber);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resid);


--
-- Name: supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (sid, uid);


--
-- Name: supplier_sid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_sid_key UNIQUE (sid);


--
-- Name: supply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_pkey PRIMARY KEY (suid, sid);


--
-- Name: supply_suid_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_suid_key UNIQUE (suid);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (uname);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- Name: administrator_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: billinginformation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: consumer_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: orderedsupply_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);


--
-- Name: orderedsupply_suid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);


--
-- Name: request_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_cid_fkey FOREIGN KEY (cid) REFERENCES public.consumer(cid);


--
-- Name: request_resid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);


--
-- Name: reservedsupply_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);


--
-- Name: reservedsupply_suid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);


--
-- Name: resource_catid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_catid_fkey FOREIGN KEY (catid) REFERENCES public.category(catid);


--
-- Name: supplier_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: supply_resid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);


--
-- Name: supply_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_sid_fkey FOREIGN KEY (sid) REFERENCES public.supplier(sid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

