-- This file contains the definitions of the tables used in the application.

CREATE TABLE users
(
  uid serial NOT NULL,
  uname character varying(50) NOT NULL,
  upass character(8) NOT NULL,
  first_name character varying(35) NOT NULL,
  last_name character varying(35) NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (uid),
  CONSTRAINT users_email_key UNIQUE (uname)
)WITH (
  OIDS=FALSE
);

CREATE TABLE consumer
(
  cid serial NOT NULL,
  caddress character varying(100) NOT NULL,
  uid integer NOT NULL,
  CONSTRAINT consumer_pkey PRIMARY KEY (cid, uid),
  CONSTRAINT consumer_uid_fkey FOREIGN KEY (uid)
      REFERENCES users (uid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT consumer_cid_key UNIQUE (cid)
)WITH (
  OIDS=FALSE
);

CREATE TABLE supplier
(
  sid serial NOT NULL,
  saddress character varying(100) NOT NULL,
  uid integer NOT NULL,
  CONSTRAINT supplier_pkey PRIMARY KEY (sid, uid),
  CONSTRAINT supplier_uid_fkey FOREIGN KEY (uid)
      REFERENCES users (uid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT supplier_sid_key UNIQUE (sid)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE administrator
(
  aid serial NOT NULL,
  uid integer NOT NULL,
  CONSTRAINT administrator_pkey PRIMARY KEY (aid, uid),
  CONSTRAINT administrator_uid_fkey FOREIGN KEY (uid)
      REFERENCES users (uid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT administrator_aid_key UNIQUE (aid)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE billinginformation
(
  bid serial NOT NULL,
  billing_address character varying(100),
  paypal_account character varying(50) NOT NULL,
  uid integer NOT NULL,
  CONSTRAINT billinginformation_pkey PRIMARY KEY (bid, uid),
  CONSTRAINT billinginformation_uid_fkey FOREIGN KEY (uid)
      REFERENCES users (uid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT billinginformation_bid_key UNIQUE (bid)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE supply
(
  suid serial NOT NULL,
  sid integer NOT NULL,
  resid integer NOT NULL,
  is_void boolean NOT NULL DEFAULT false,
  is_reserved boolean NOT NULL DEFAULT false,
  suprice double precision NOT NULL,
  sudate date NOT NULL DEFAULT now(),
  suquantity integer NOT NULL,
  CONSTRAINT supply_pkey PRIMARY KEY (suid, sid),
  CONSTRAINT supply_resid_fkey FOREIGN KEY (resid)
      REFERENCES resource (resid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT supply_sid_fkey FOREIGN KEY (sid)
      REFERENCES supplier (sid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT supply_suid_key UNIQUE (suid)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE request
(
  reqid serial NOT NULL,
  cid integer NOT NULL,
  resid integer NOT NULL,
  is_void boolean NOT NULL DEFAULT false,
  reqdate date NOT NULL DEFAULT now(),
  CONSTRAINT request_pkey PRIMARY KEY (reqid, cid),
  CONSTRAINT request_cid_fkey FOREIGN KEY (cid)
      REFERENCES consumer (cid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT request_resid_fkey FOREIGN KEY (resid)
      REFERENCES resource (resid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT request_reqid_key UNIQUE (reqid)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE resource
(
  resid serial NOT NULL,
  catid integer NOT NULL,
  resdescription character varying(100),
  resname character varying(35) NOT NULL,
  reslocation character varying(100) NOT NULL,
  is_void boolean NOT NULL DEFAULT false,
  CONSTRAINT resource_pkey PRIMARY KEY (resid),
  CONSTRAINT resource_catid_fkey FOREIGN KEY (catid)
      REFERENCES category (catid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

CREATE TABLE category
(
  catid serial NOT NULL,
  cattype character varying(35) NOT NULL,
  CONSTRAINT category_pkey PRIMARY KEY (catid)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE users OWNER TO postgres;
ALTER TABLE consumer OWNER TO postgres;
ALTER TABLE administrator OWNER TO postgres;
ALTER TABLE supplier OWNER TO postgres;
ALTER TABLE billinginformation OWNER TO postgres;
ALTER TABLE supply OWNER TO postgres;
ALTER TABLE request OWNER TO postgres;
ALTER TABLE resource OWNER TO postgres;
ALTER TABLE category OWNER TO postgres;
ALTER TABLE reservedsupply OWNER TO postgres;
ALTER TABLE orderedsupply OWNER TO postgres;