PGDMP     0                     x            dsrldb    9.6.16    9.6.16 p    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    24576    dsrldb    DATABASE     �   CREATE DATABASE dsrldb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE dsrldb;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24577    administrator    TABLE     Z   CREATE TABLE public.administrator (
    aid integer NOT NULL,
    uid integer NOT NULL
);
 !   DROP TABLE public.administrator;
       public         postgres    false    3            �            1259    24580    administrator_aid_seq    SEQUENCE     ~   CREATE SEQUENCE public.administrator_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.administrator_aid_seq;
       public       postgres    false    185    3            �           0    0    administrator_aid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.administrator_aid_seq OWNED BY public.administrator.aid;
            public       postgres    false    186            �            1259    24582    billinginformation    TABLE     �   CREATE TABLE public.billinginformation (
    bid integer NOT NULL,
    billing_address character varying(100),
    paypal_account character varying(50) NOT NULL,
    uid integer NOT NULL
);
 &   DROP TABLE public.billinginformation;
       public         postgres    false    3            �            1259    24585    billinginformation_bid_seq    SEQUENCE     �   CREATE SEQUENCE public.billinginformation_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.billinginformation_bid_seq;
       public       postgres    false    3    187            �           0    0    billinginformation_bid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.billinginformation_bid_seq OWNED BY public.billinginformation.bid;
            public       postgres    false    188            �            1259    24587    category    TABLE     i   CREATE TABLE public.category (
    catid integer NOT NULL,
    cattype character varying(35) NOT NULL
);
    DROP TABLE public.category;
       public         postgres    false    3            �            1259    24590    category_catid_seq    SEQUENCE     {   CREATE SEQUENCE public.category_catid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.category_catid_seq;
       public       postgres    false    3    189            �           0    0    category_catid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.category_catid_seq OWNED BY public.category.catid;
            public       postgres    false    190            �            1259    24592    consumer    TABLE     �   CREATE TABLE public.consumer (
    cid integer NOT NULL,
    caddress character varying(100) NOT NULL,
    uid integer NOT NULL
);
    DROP TABLE public.consumer;
       public         postgres    false    3            �            1259    24595    consumer_cid_seq    SEQUENCE     y   CREATE SEQUENCE public.consumer_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.consumer_cid_seq;
       public       postgres    false    3    191            �           0    0    consumer_cid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.consumer_cid_seq OWNED BY public.consumer.cid;
            public       postgres    false    192            �            1259    24597    order    TABLE       CREATE TABLE public."order" (
    onumber integer NOT NULL,
    cid integer NOT NULL,
    uid integer NOT NULL,
    suid integer NOT NULL,
    sid integer NOT NULL,
    odate_ordered date DEFAULT now() NOT NULL,
    oquantity integer NOT NULL,
    odate_delivered date
);
    DROP TABLE public."order";
       public         postgres    false    3            �            1259    24601    orderedsupply_onumber_seq    SEQUENCE     �   CREATE SEQUENCE public.orderedsupply_onumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.orderedsupply_onumber_seq;
       public       postgres    false    193    3            �           0    0    orderedsupply_onumber_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.orderedsupply_onumber_seq OWNED BY public."order".onumber;
            public       postgres    false    194            �            1259    24603    request    TABLE     �   CREATE TABLE public.request (
    reqid integer NOT NULL,
    cid integer NOT NULL,
    resid integer NOT NULL,
    is_void boolean DEFAULT false NOT NULL,
    reqdate date DEFAULT now() NOT NULL,
    reqquantity integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.request;
       public         postgres    false    3            �            1259    24609    request_reqid_seq    SEQUENCE     z   CREATE SEQUENCE public.request_reqid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.request_reqid_seq;
       public       postgres    false    3    195            �           0    0    request_reqid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.request_reqid_seq OWNED BY public.request.reqid;
            public       postgres    false    196            �            1259    24611    reservation    TABLE       CREATE TABLE public.reservation (
    rnumber integer NOT NULL,
    rdate_reserved date DEFAULT now() NOT NULL,
    rquantity integer NOT NULL,
    cid integer NOT NULL,
    uid integer NOT NULL,
    suid integer NOT NULL,
    sid integer NOT NULL,
    rdate_delivered date
);
    DROP TABLE public.reservation;
       public         postgres    false    3            �            1259    24615    reservedsupply_rnumber_seq    SEQUENCE     �   CREATE SEQUENCE public.reservedsupply_rnumber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reservedsupply_rnumber_seq;
       public       postgres    false    3    197            �           0    0    reservedsupply_rnumber_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.reservedsupply_rnumber_seq OWNED BY public.reservation.rnumber;
            public       postgres    false    198            �            1259    24617    resource    TABLE       CREATE TABLE public.resource (
    resid integer NOT NULL,
    catid integer NOT NULL,
    resdescription character varying(100),
    resname character varying(35) NOT NULL,
    reslocation character varying(100) NOT NULL,
    is_void boolean DEFAULT false NOT NULL
);
    DROP TABLE public.resource;
       public         postgres    false    3            �            1259    24621    resource_resid_seq    SEQUENCE     {   CREATE SEQUENCE public.resource_resid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.resource_resid_seq;
       public       postgres    false    3    199            �           0    0    resource_resid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.resource_resid_seq OWNED BY public.resource.resid;
            public       postgres    false    200            �            1259    24623    supplier    TABLE     �   CREATE TABLE public.supplier (
    sid integer NOT NULL,
    saddress character varying(100) NOT NULL,
    uid integer NOT NULL,
    company_name character varying(50)
);
    DROP TABLE public.supplier;
       public         postgres    false    3            �            1259    24626    supplier_sid_seq    SEQUENCE     y   CREATE SEQUENCE public.supplier_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.supplier_sid_seq;
       public       postgres    false    3    201            �           0    0    supplier_sid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.supplier_sid_seq OWNED BY public.supplier.sid;
            public       postgres    false    202            �            1259    24628    supply    TABLE     <  CREATE TABLE public.supply (
    suid integer NOT NULL,
    sid integer NOT NULL,
    resid integer NOT NULL,
    is_void boolean DEFAULT false NOT NULL,
    is_reserved boolean DEFAULT false NOT NULL,
    suprice double precision NOT NULL,
    sudate date DEFAULT now() NOT NULL,
    suquantity integer NOT NULL
);
    DROP TABLE public.supply;
       public         postgres    false    3            �            1259    24634    supply_suid_seq    SEQUENCE     x   CREATE SEQUENCE public.supply_suid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.supply_suid_seq;
       public       postgres    false    3    203            �           0    0    supply_suid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.supply_suid_seq OWNED BY public.supply.suid;
            public       postgres    false    204            �            1259    24636    transaction    TABLE       CREATE TABLE public.transaction (
    tid integer NOT NULL,
    ttype character(1),
    billing_address character varying(100) NOT NULL,
    paypal_account character varying(50),
    bid integer NOT NULL,
    cid integer NOT NULL,
    sid integer NOT NULL
);
    DROP TABLE public.transaction;
       public         postgres    false    3            �            1259    24639    transaction_tid_seq    SEQUENCE     |   CREATE SEQUENCE public.transaction_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.transaction_tid_seq;
       public       postgres    false    3    205            �           0    0    transaction_tid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.transaction_tid_seq OWNED BY public.transaction.tid;
            public       postgres    false    206            �            1259    24641    users    TABLE     �   CREATE TABLE public.users (
    uid integer NOT NULL,
    uname character varying(50) NOT NULL,
    upass character(8) NOT NULL,
    first_name character varying(35) NOT NULL,
    last_name character varying(35) NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    24644    users_uid_seq    SEQUENCE     v   CREATE SEQUENCE public.users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.users_uid_seq;
       public       postgres    false    207    3            �           0    0    users_uid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.users_uid_seq OWNED BY public.users.uid;
            public       postgres    false    208                       2604    24646    administrator aid    DEFAULT     v   ALTER TABLE ONLY public.administrator ALTER COLUMN aid SET DEFAULT nextval('public.administrator_aid_seq'::regclass);
 @   ALTER TABLE public.administrator ALTER COLUMN aid DROP DEFAULT;
       public       postgres    false    186    185                       2604    24647    billinginformation bid    DEFAULT     �   ALTER TABLE ONLY public.billinginformation ALTER COLUMN bid SET DEFAULT nextval('public.billinginformation_bid_seq'::regclass);
 E   ALTER TABLE public.billinginformation ALTER COLUMN bid DROP DEFAULT;
       public       postgres    false    188    187                       2604    24648    category catid    DEFAULT     p   ALTER TABLE ONLY public.category ALTER COLUMN catid SET DEFAULT nextval('public.category_catid_seq'::regclass);
 =   ALTER TABLE public.category ALTER COLUMN catid DROP DEFAULT;
       public       postgres    false    190    189                       2604    24649    consumer cid    DEFAULT     l   ALTER TABLE ONLY public.consumer ALTER COLUMN cid SET DEFAULT nextval('public.consumer_cid_seq'::regclass);
 ;   ALTER TABLE public.consumer ALTER COLUMN cid DROP DEFAULT;
       public       postgres    false    192    191                       2604    24650    order onumber    DEFAULT     x   ALTER TABLE ONLY public."order" ALTER COLUMN onumber SET DEFAULT nextval('public.orderedsupply_onumber_seq'::regclass);
 >   ALTER TABLE public."order" ALTER COLUMN onumber DROP DEFAULT;
       public       postgres    false    194    193                       2604    24651    request reqid    DEFAULT     n   ALTER TABLE ONLY public.request ALTER COLUMN reqid SET DEFAULT nextval('public.request_reqid_seq'::regclass);
 <   ALTER TABLE public.request ALTER COLUMN reqid DROP DEFAULT;
       public       postgres    false    196    195                       2604    24652    reservation rnumber    DEFAULT     }   ALTER TABLE ONLY public.reservation ALTER COLUMN rnumber SET DEFAULT nextval('public.reservedsupply_rnumber_seq'::regclass);
 B   ALTER TABLE public.reservation ALTER COLUMN rnumber DROP DEFAULT;
       public       postgres    false    198    197                        2604    24653    resource resid    DEFAULT     p   ALTER TABLE ONLY public.resource ALTER COLUMN resid SET DEFAULT nextval('public.resource_resid_seq'::regclass);
 =   ALTER TABLE public.resource ALTER COLUMN resid DROP DEFAULT;
       public       postgres    false    200    199            !           2604    24654    supplier sid    DEFAULT     l   ALTER TABLE ONLY public.supplier ALTER COLUMN sid SET DEFAULT nextval('public.supplier_sid_seq'::regclass);
 ;   ALTER TABLE public.supplier ALTER COLUMN sid DROP DEFAULT;
       public       postgres    false    202    201            %           2604    24655    supply suid    DEFAULT     j   ALTER TABLE ONLY public.supply ALTER COLUMN suid SET DEFAULT nextval('public.supply_suid_seq'::regclass);
 :   ALTER TABLE public.supply ALTER COLUMN suid DROP DEFAULT;
       public       postgres    false    204    203            &           2604    24656    transaction tid    DEFAULT     r   ALTER TABLE ONLY public.transaction ALTER COLUMN tid SET DEFAULT nextval('public.transaction_tid_seq'::regclass);
 >   ALTER TABLE public.transaction ALTER COLUMN tid DROP DEFAULT;
       public       postgres    false    206    205            '           2604    24657 	   users uid    DEFAULT     f   ALTER TABLE ONLY public.users ALTER COLUMN uid SET DEFAULT nextval('public.users_uid_seq'::regclass);
 8   ALTER TABLE public.users ALTER COLUMN uid DROP DEFAULT;
       public       postgres    false    208    207            �          0    24577    administrator 
   TABLE DATA               1   COPY public.administrator (aid, uid) FROM stdin;
    public       postgres    false    185   �       �           0    0    administrator_aid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.administrator_aid_seq', 10, true);
            public       postgres    false    186            �          0    24582    billinginformation 
   TABLE DATA               W   COPY public.billinginformation (bid, billing_address, paypal_account, uid) FROM stdin;
    public       postgres    false    187   7�       �           0    0    billinginformation_bid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.billinginformation_bid_seq', 20, true);
            public       postgres    false    188            �          0    24587    category 
   TABLE DATA               2   COPY public.category (catid, cattype) FROM stdin;
    public       postgres    false    189   �       �           0    0    category_catid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.category_catid_seq', 15, true);
            public       postgres    false    190            �          0    24592    consumer 
   TABLE DATA               6   COPY public.consumer (cid, caddress, uid) FROM stdin;
    public       postgres    false    191   ��       �           0    0    consumer_cid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.consumer_cid_seq', 1, false);
            public       postgres    false    192            �          0    24597    order 
   TABLE DATA               j   COPY public."order" (onumber, cid, uid, suid, sid, odate_ordered, oquantity, odate_delivered) FROM stdin;
    public       postgres    false    193   d�        	           0    0    orderedsupply_onumber_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.orderedsupply_onumber_seq', 20, true);
            public       postgres    false    194            �          0    24603    request 
   TABLE DATA               S   COPY public.request (reqid, cid, resid, is_void, reqdate, reqquantity) FROM stdin;
    public       postgres    false    195   �       	           0    0    request_reqid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.request_reqid_seq', 28, true);
            public       postgres    false    196            �          0    24611    reservation 
   TABLE DATA               o   COPY public.reservation (rnumber, rdate_reserved, rquantity, cid, uid, suid, sid, rdate_delivered) FROM stdin;
    public       postgres    false    197   ��       	           0    0    reservedsupply_rnumber_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.reservedsupply_rnumber_seq', 10, true);
            public       postgres    false    198            �          0    24617    resource 
   TABLE DATA               _   COPY public.resource (resid, catid, resdescription, resname, reslocation, is_void) FROM stdin;
    public       postgres    false    199   4�       	           0    0    resource_resid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.resource_resid_seq', 36, true);
            public       postgres    false    200            �          0    24623    supplier 
   TABLE DATA               D   COPY public.supplier (sid, saddress, uid, company_name) FROM stdin;
    public       postgres    false    201   c�       	           0    0    supplier_sid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.supplier_sid_seq', 10, true);
            public       postgres    false    202            �          0    24628    supply 
   TABLE DATA               e   COPY public.supply (suid, sid, resid, is_void, is_reserved, suprice, sudate, suquantity) FROM stdin;
    public       postgres    false    203   �       	           0    0    supply_suid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.supply_suid_seq', 26, true);
            public       postgres    false    204            �          0    24636    transaction 
   TABLE DATA               a   COPY public.transaction (tid, ttype, billing_address, paypal_account, bid, cid, sid) FROM stdin;
    public       postgres    false    205   �       	           0    0    transaction_tid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transaction_tid_seq', 1, false);
            public       postgres    false    206            �          0    24641    users 
   TABLE DATA               I   COPY public.users (uid, uname, upass, first_name, last_name) FROM stdin;
    public       postgres    false    207   �       	           0    0    users_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_uid_seq', 1, false);
            public       postgres    false    208            )           2606    24659 #   administrator administrator_aid_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_aid_key UNIQUE (aid);
 M   ALTER TABLE ONLY public.administrator DROP CONSTRAINT administrator_aid_key;
       public         postgres    false    185    185            +           2606    24661     administrator administrator_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (aid, uid);
 J   ALTER TABLE ONLY public.administrator DROP CONSTRAINT administrator_pkey;
       public         postgres    false    185    185    185            -           2606    24663 -   billinginformation billinginformation_bid_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_bid_key UNIQUE (bid);
 W   ALTER TABLE ONLY public.billinginformation DROP CONSTRAINT billinginformation_bid_key;
       public         postgres    false    187    187            /           2606    24665 *   billinginformation billinginformation_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_pkey PRIMARY KEY (bid, uid);
 T   ALTER TABLE ONLY public.billinginformation DROP CONSTRAINT billinginformation_pkey;
       public         postgres    false    187    187    187            1           2606    24667    category category_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (catid);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public         postgres    false    189    189            3           2606    24669    consumer consumer_cid_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_cid_key UNIQUE (cid);
 C   ALTER TABLE ONLY public.consumer DROP CONSTRAINT consumer_cid_key;
       public         postgres    false    191    191            5           2606    24671    consumer consumer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_pkey PRIMARY KEY (cid, uid);
 @   ALTER TABLE ONLY public.consumer DROP CONSTRAINT consumer_pkey;
       public         postgres    false    191    191    191            7           2606    24673    order orderedsupply_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderedsupply_pkey PRIMARY KEY (onumber);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderedsupply_pkey;
       public         postgres    false    193    193            9           2606    24675    request request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (reqid, cid);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public         postgres    false    195    195    195            ;           2606    24677    request request_reqid_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_reqid_key UNIQUE (reqid);
 C   ALTER TABLE ONLY public.request DROP CONSTRAINT request_reqid_key;
       public         postgres    false    195    195            =           2606    24679    reservation reservedsupply_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservedsupply_pkey PRIMARY KEY (rnumber);
 I   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservedsupply_pkey;
       public         postgres    false    197    197            ?           2606    24681    resource resource_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resid);
 @   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_pkey;
       public         postgres    false    199    199            A           2606    24683    supplier supplier_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (sid, uid);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public         postgres    false    201    201    201            C           2606    24685    supplier supplier_sid_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_sid_key UNIQUE (sid);
 C   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_sid_key;
       public         postgres    false    201    201            E           2606    24687    supply supply_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_pkey PRIMARY KEY (suid, sid);
 <   ALTER TABLE ONLY public.supply DROP CONSTRAINT supply_pkey;
       public         postgres    false    203    203    203            G           2606    24689    supply supply_suid_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_suid_key UNIQUE (suid);
 @   ALTER TABLE ONLY public.supply DROP CONSTRAINT supply_suid_key;
       public         postgres    false    203    203            I           2606    24691    transaction transaction_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (tid);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public         postgres    false    205    205            K           2606    24693    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (uname);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public         postgres    false    207    207            M           2606    24695    users users_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    207    207            N           2606    24696 $   administrator administrator_uid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);
 N   ALTER TABLE ONLY public.administrator DROP CONSTRAINT administrator_uid_fkey;
       public       postgres    false    185    207    2125            O           2606    24701 .   billinginformation billinginformation_uid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.billinginformation
    ADD CONSTRAINT billinginformation_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);
 X   ALTER TABLE ONLY public.billinginformation DROP CONSTRAINT billinginformation_uid_fkey;
       public       postgres    false    2125    207    187            P           2606    24706    consumer consumer_uid_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);
 D   ALTER TABLE ONLY public.consumer DROP CONSTRAINT consumer_uid_fkey;
       public       postgres    false    191    207    2125            Q           2606    24711    order orderedsupply_cid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);
 H   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderedsupply_cid_fkey;
       public       postgres    false    193    193    191    191    2101            R           2606    24716    order orderedsupply_suid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT orderedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);
 I   ALTER TABLE ONLY public."order" DROP CONSTRAINT orderedsupply_suid_fkey;
       public       postgres    false    203    193    2117    203    193            S           2606    24721    request request_cid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_cid_fkey FOREIGN KEY (cid) REFERENCES public.consumer(cid);
 B   ALTER TABLE ONLY public.request DROP CONSTRAINT request_cid_fkey;
       public       postgres    false    2099    191    195            T           2606    24726    request request_resid_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);
 D   ALTER TABLE ONLY public.request DROP CONSTRAINT request_resid_fkey;
       public       postgres    false    2111    195    199            U           2606    24731 #   reservation reservedsupply_cid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservedsupply_cid_fkey FOREIGN KEY (cid, uid) REFERENCES public.consumer(cid, uid);
 M   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservedsupply_cid_fkey;
       public       postgres    false    191    2101    191    197    197            V           2606    24736 $   reservation reservedsupply_suid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservedsupply_suid_fkey FOREIGN KEY (suid, sid) REFERENCES public.supply(suid, sid);
 N   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservedsupply_suid_fkey;
       public       postgres    false    2117    197    203    203    197            W           2606    24741    resource resource_catid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_catid_fkey FOREIGN KEY (catid) REFERENCES public.category(catid);
 F   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_catid_fkey;
       public       postgres    false    189    2097    199            X           2606    24746    supplier supplier_uid_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(uid);
 D   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_uid_fkey;
       public       postgres    false    2125    201    207            Y           2606    24751    supply supply_resid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_resid_fkey FOREIGN KEY (resid) REFERENCES public.resource(resid);
 B   ALTER TABLE ONLY public.supply DROP CONSTRAINT supply_resid_fkey;
       public       postgres    false    203    2111    199            Z           2606    24756    supply supply_sid_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_sid_fkey FOREIGN KEY (sid) REFERENCES public.supplier(sid);
 @   ALTER TABLE ONLY public.supply DROP CONSTRAINT supply_sid_fkey;
       public       postgres    false    203    201    2115            �   2   x��I�0�w7��w|s1��2$v�d8�t��&�C��\�ћ�S��u      �   �  x�uT�r�8<_�� |�([^+�_e�Ɨ��$DBE�_��d+^W�D������XAɅ�o�R�#*D�l4���ц}D�q���"��A5�!Ƞ���9���Y<z��ʼl���q�YԮGs�X�4FΒ�N�QE�����V���Z�CDx�Y�^^���ּ�J��nR^����1�Ky
�Cw|ƍ8]�ap��G�4f��-/Ʒ��KX��O��ڴ�*/���X �͐F�J�(^���6"����'��H�	jޞ���R��g��1�\+P�<J���` ?"�^�ξCe�&��l�z^$�H�8Eq�%�����������h��$���E�%	�R�O6�V����ι�g(�)%䢙�oPϫy��;m�� �����XN���J۾�&&ޕ�����V�,�ו��uۅ��S�&du����ݨ|p�^��,J�\��I���Bs�U�hi�V�!�(
�l���<����0�򽴠�(�y����4��AUF1��z�$k��}�.qr-�0�郲}d�X�χ�^�'"��/��n�x�em�0��c�1��	�ŝ"7�a�DNY��.m�]�%�CH��۩���+{%mж>"s�8���<��*a�nl�
�ݮAA�\ӌ���Kĩ(���7�3H� 7r��{ݴj�~�n8p�^¶8�j\�l��L`&@Qr��d?�y%m'{(\�(4�)���R���9V&�%(�	ᶁ�ED��݇7ߡe�@�M�5��t#��=kS�R��4'˱� ��MP;��{cƄ@u7�7]v.��aq��\;�
�W�I�
h\����r �7��!��c��y��N���0{?��]�r�&0J5��s���qr�T�M�ww�!�`����o����6�je?)�)��� ��pwp�hYC&�� �)E�6�hi`1�z��[`�z�      �   �   x�-�I�0E��)rD�2l)B�@B��И)�!CQoO�.�`�'�����iT2�"Na�n��3k�A��#�Wl��a�.`���r��BSg��������?�%�c83ۈRBm9=�kQN��o
�%GA%%�e�Y ,)W�"f��Ϭ�T��
��s�"^G����A�      �   �  x�]��n�0D��W� ��Z:v!A��t�]1�,(�n���Qt%Aԙ;3�R&;A7���{WFڹ��z�6i��7�/)�X���7Ю��&N��J1���bZjC��O)�����8��|�|�|�2;NJ+�1�f�����qp�o�}�������LU��ڰF���7��)� NO�R<�kA�LwME�,"n�?b�}m�|oO��3T7UŤ �1�� �N6
�ni��x�!@��Gx�	�?C6�R/2��b��u�~oa��2�T]��Zi��<�\���]����2���t�y*��Gh��1���>��A�r��F�a:�@WF��~M}J��������M����ŏP�`��??$.ZRUF+&Q��ط�$�r_��G�͸��䈈������Ι��W���/�_��      �   �   x���K!C��]Z�	߻���h�	��*,�G���������@]�&vS�-�*��v�U�K<z�@;�գ]|��������yb�*��ϝ�w�m����b��="�.l�>X�6�͝�%�`��SZ9�$S�3�>S�3�?S0� �0�s!X2��SD��|w      �   q   x�e���0kq�$Zr�]���Gx"�"�x6���b����N�x�X ����@\ʧ�ߧ+W�|�q�텃Y��&%�܀$�ø��d%˼?��(���2p=�ކ��)-2'      �   �   x�e�Q!D����q Q����ce�l1��x� �6m��w�'h݇�|�V�'p`V���&ذ���J1�yR�p�n���TT�v��B��2dT�[2L-Z�2��rί�=�S��N��iBjumK꧎XOQ�&���\��?'      �     x��W�r�6=�_ѧ��)n���/��Ǫ�����"a%` P��>�$�)_��"���ׯ�1���x�DI[�eÜ��	�s��'�L?[y<��J�W�����=�4J��4��{�h�����IKm�k�=_$,aSnK�Z�R�K��rB{�U'�Zг��+A��ֳi%5����l{��~_��YѼp���'���"c����K����]��ij��|�#�/��g}v�o%.�%+�f�����e�K��Y�ћ4N3��R�M�Ѝ��ҾHMR�%��E��a�&1�؀}-ռX9v#��f][���D��Vb#Ŗ`|峽�n���$���Aw�DTِ�ɿ	O(5*�px� �Y�z�c����1�ȉ!qs˽w�}O�a3П��}�ύ&�n�uk�Y� ��A���i�>^9Aees^�5_!�����i!�/�NO���a��S!��n��,��q�Պ����[DͲ(G��U( b�Y�����_�I����Y���`4fq��up%F�X.�Cyg�� v\����f	/z�R%��	��?ȃ��ps��߲�Ʈ�VjD�ԕB�*t�ךn9���Z+�#��, @~v��N4Ú���ؚ�ONN�7�=���"�4&Q����������l��F�X2 A��j'KqR�fy*C�=y^u��,DA[�����]��A4$��JU!�c|E�k�]��^:����A�۴`cl�|Y�n����;�m'�/���pjJ�[�*�O��U򥢥
��2D����wK�QN��W�p>��P�w�5M�X��' L��#6�1[�R8�� ��}r9Fta��|H?ڦX����0��xi�kn���z���qיF�!��8IÜ�`v�F�q1K�넲]��-V�tgx�K�I�(=�n��̚{���l�/s�!_����g]���>��Vp�������zv�F8v�R��u�!u��aܧ�~0�-{�|����XV�Z��~�M{�}�ij9����dQv�����M�8L
t����A)vz����!h6�@0G37���iܒW2VBS4g�E�(A��y}u|�fhr�{#��i�͖ih|5����wOL�g������c�{�t�6,��]���	�T��i|����`+ôn��p;i|sy��=J�#��zϋ*p��n�*���8K��c��\�u����"�5u�����c�8QUb?�&��C]�)�,��r���U4�����6�[��K��kd��n�3�xo�(΍�|��-�x�It������7�<X�C��V�(�Z��-��|���	;72f��d�J� ��gv�4��tUn�ٝ��� @����:�l�@�a������S���j� "o�o���n�������j�Dr�c<�(N��tyڞ֜007{�����*� |7�lX���2�.�-$l�eS�n?@�\�bΖ]�=_��ߒEa|�W�*�?eh��
���D�XS�l6ʱ���`{om�曊LE�K�ڳI�=��5b>�ȟ_...� �GM      �   n  x����N�0E�㯘���ΣY�*<D�ݰ1͐X26r�B��LD�����g�<$h�j���a=^c����T&8���v>������$�P'����E{^(�Zg���D�!����l�32�.��m�,���u$��f���o&"�V���s�g�lG~K���ƺ�m�2�JB��m(pi���*G�2��v��p�I�=��i���{�{�MU������M�^���1���1�b��SMX��s�c�*ˋ)�>x�;��NS����ĦG����sL����e��7TN5'��8t��]#�'�*��q7�G�����܆p���|�O�R��G���뭝�s�8B| ���      �   �   x���Ar� ��_�B�����vlj��!��]͌�1J����[�Wql���!�Wd�k _�~e��Ӷu�S`��u�a{��tQ*X6�΃��Mf~
Q����9��tlX�7h��\�[��Z�����9�[k�����(�2ê���9�M��~ȫ�w��X���#�}�6��aGK�~owƴ�|'�d�1���8F���q�lgy�Յ5�ZIX�A�1�n�%=)�6�p���*��&      �      x������ � �      �   �  x�M��R�0��WO�'�DJ��$��R�P��ӛ����HZW�	��wځ�$����~{��_ѻ�q��j�L�|�_����Z���l2~��
%x����fP�ı�m�A�º��J�z�h�I%ERsxtV^�{Nv�]�i��#����\�,ai��%�8�S�-�cx�v�!����85�(�:��X����/\#��T����}8�.s�%-�Wg��syxh��ɑ�J�Qz
]�:*e�]��@���(��ƒ넥n�5z�1��+%���(m��� ��D�'p�&����I�<�e�!���ߒ#z+��)=I�m8���,��8�Q8^xG�����>lPd]��@떤�B���.�>���.6��\�F'y&�aSd��*-���1{�p/Rx�ǵ�O�a���)\`Y`+���4����9�1� <�11t���C��^�vW��$��B1n�Le��>�6q+	�+vIH-T��"�l�h=5pϲ��C96��[�l�	'(W4r�)#���}O���[ʒ�G�bVf.f�����,�1�61<���5�2�����M�pȘ��pU$�D.�ۡlrM?������V�
�	T-�\�{Fʜ�e�$t��u��6��8�y]s�2g�����-�{;������#��)<;o	E��K�������(����I4     