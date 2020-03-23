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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.administrator (
    aid integer NOT NULL,
    uid integer NOT NULL
);


--
-- Name: administrator_aid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.administrator_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: administrator_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.administrator_aid_seq OWNED BY public.administrator.aid;


--
-- Name: billinginformation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.billinginformation (
    bid integer NOT NULL,
    billing_address character varying(100) NOT NULL,
    paypal_account character varying(50) NOT NULL,
    uid integer NOT NULL
);


--
-- Name: billinginformation_bid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.billinginformation_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: billinginformation_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.billinginformation_bid_seq OWNED BY public.billinginformation.bid;


--
-- Name: category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.category (
    catid integer NOT NULL,
    cattype character varying(35) NOT NULL
);


--
-- Name: category_catid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_catid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_catid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_catid_seq OWNED BY public.category.catid;


--
-- Name: consumer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.consumer (
    cid integer NOT NULL,
    caddress character varying(100) NOT NULL,
    uid integer NOT NULL
);


--
-- Name: consumer_cid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.consumer_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consumer_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.consumer_cid_seq OWNED BY public.consumer.cid;


--
-- Name: orderedsupply; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: orderedsupply_onumber_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderedsupply_onumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orderedsupply_onumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderedsupply_onumber_seq OWNED BY public.orderedsupply.onumber;


--
-- Name: request; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.request (
    reqid integer NOT NULL,
    cid integer NOT NULL,
    resid integer NOT NULL,
    is_void boolean DEFAULT false NOT NULL,
    reqdate date DEFAULT now() NOT NULL
);


--
-- Name: request_reqid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.request_reqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: request_reqid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.request_reqid_seq OWNED BY public.request.reqid;


--
-- Name: reservedsupply; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: reservedsupply_rnumber_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservedsupply_rnumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservedsupply_rnumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservedsupply_rnumber_seq OWNED BY public.reservedsupply.rnumber;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.resource (
    resid integer NOT NULL,
    catid integer NOT NULL,
    resdescription character varying(100),
    resname character varying(35) NOT NULL,
    reslocation character varying(100) NOT NULL,
    is_void boolean DEFAULT false NOT NULL
);


--
-- Name: resource_resid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_resid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_resid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_resid_seq OWNED BY public.resource.resid;


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.supplier (
    sid integer NOT NULL,
    saddress character varying(100) NOT NULL,
    uid integer NOT NULL
);


--
-- Name: supplier_sid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supplier_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supplier_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supplier_sid_seq OWNED BY public.supplier.sid;


--
-- Name: supply; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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


--
-- Name: supply_suid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.supply_suid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supply_suid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.supply_suid_seq OWNED BY public.supply.suid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.users (
    uid integer NOT NULL,
    email character varying(50) NOT NULL,
    pass character(8) NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL
);


--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrator ALTER COLUMN aid SET DEFAULT nextval('public.administrator_aid_seq'::regclass);


--
-- Name: bid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.billinginformation ALTER COLUMN bid SET DEFAULT nextval('public.billinginformation_bid_seq'::regclass);


--
-- Name: catid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN catid SET DEFAULT nextval('public.category_catid_seq'::regclass);


--
-- Name: cid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumer ALTER COLUMN cid SET DEFAULT nextval('public.consumer_cid_seq'::regclass);


--
-- Name: onumber; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderedsupply ALTER COLUMN onumber SET DEFAULT nextval('public.orderedsupply_onumber_seq'::regclass);


--
-- Name: reqid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.request ALTER COLUMN reqid SET DEFAULT nextval('public.request_reqid_seq'::regclass);


--
-- Name: rnumber; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservedsupply ALTER COLUMN rnumber SET DEFAULT nextval('public.reservedsupply_rnumber_seq'::regclass);


--
-- Name: resid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource ALTER COLUMN resid SET DEFAULT nextval('public.resource_resid_seq'::regclass);


--
-- Name: sid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier ALTER COLUMN sid SET DEFAULT nextval('public.supplier_sid_seq'::regclass);


--
-- Name: suid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply ALTER COLUMN suid SET DEFAULT nextval('public.supply_suid_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);


--
-- Name: administrator_aid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_aid_key UNIQUE (aid);


--
-- Name: administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (aid, uid);


--
-- Name: billinginformation_bid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_bid_key UNIQUE (bid);


--
-- Name: billinginformation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_pkey PRIMARY KEY (bid, uid);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (catid);


--
-- Name: consumer_cid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_cid_key UNIQUE (cid);


--
-- Name: consumer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_pkey PRIMARY KEY (cid, uid);


--
-- Name: orderedsupply_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_pkey PRIMARY KEY (onumber);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (reqid, cid);


--
-- Name: request_reqid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_reqid_key UNIQUE (reqid);


--
-- Name: reservedsupply_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_pkey PRIMARY KEY (rnumber);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resid);


--
-- Name: supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (sid, uid);


--
-- Name: supplier_sid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_sid_key UNIQUE (sid);


--
-- Name: supply_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_pkey PRIMARY KEY (suid, sid);


--
-- Name: supply_suid_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_suid_key UNIQUE (suid);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- Name: administrator_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: billinginformation_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: consumer_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: orderedsupply_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);


--
-- Name: orderedsupply_suid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderedsupply
    ADD CONSTRAINT orderedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);


--
-- Name: request_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_cid_fkey FOREIGN KEY (cid) REFERENCES public.consumer(cid);


--
-- Name: request_resid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);


--
-- Name: reservedsupply_cid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);


--
-- Name: reservedsupply_suid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservedsupply
    ADD CONSTRAINT reservedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);


--
-- Name: resource_catid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_catid_fkey FOREIGN KEY (catid) REFERENCES public.category(catid);


--
-- Name: supplier_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);


--
-- Name: supply_resid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);


--
-- Name: supply_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_sid_fkey FOREIGN KEY (sid) REFERENCES public.supplier(sid);


--
-- PostgreSQL database dump complete
--

