/*--------------------------Users--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'users') THEN
	TRUNCATE TABLE users
	Restart identity
	Cascade;
ELSE
	CREATE TABLE users
		(
		  uid serial NOT NULL,
		  uname character varying(50) NOT NULL,
		  upass character(8) NOT NULL,
		  first_name character varying(35) NOT NULL,
		  last_name character varying(35) NOT NULL,
		  CONSTRAINT users_pkey PRIMARY KEY (uid),
		  CONSTRAINT users_email_key UNIQUE (uname)
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE users
		  OWNER TO postgres;
END IF;

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (1, 'Javalicious', 'eclipse', 'Eclipse', 'IDE');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (2, 'Webman', '123', 'Peter', 'Parker');


INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (3, 'Strongman', 'lift', 'Macho Man', 'Randy Savage');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (4, 'Rider', 'sword', 'Fury', 'Speedrun');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (5, 'Botox', 'death', 'Danny', 'Trejo');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (6, 'Zombies', 'movie', 'George', 'Romero');    

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (7, 'Savior', 'supply', 'Big', 'Daddy');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (8, 'Bomb', 'db123', 'Alison', 'DeBou');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (9, 'VXDL', 'goya', 'Gabriel', 'Soto');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (10, 'purpetty', 'hair', 'Gabriela', 'Sanchez');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (11, 'catscratch', 'hairball', 'Anne', 'Wettsburg');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (12, 'Sniper', 'thereal', 'Chris', 'Kyle');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (13, 'Taxeslmao', 'smolloan', 'Donald', 'Trump');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (14, 'Taskforce', 'emails', 'Hillary', 'Clinton');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (15, 'Screamface', 'phone', 'Jennete', 'Mcquirk');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (16, 'Mining', 'blocks', 'Minecraft', 'Steve');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (17, 'Demonslayr', 'motorcyc', 'Dante', 'Sparda');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (18, 'CatBah', '12d22ggd', 'Carlos', 'Petardo');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (19, 'Champion Zerato', 'nojw12h4', 'Fernando', 'Cordero');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (20, 'Roana', 'dwno12nj', 'Raymond', 'Perez');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (21, 'Angelica', 'o3kg1102', 'Noel', 'Diaz');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (22, 'Dingo', 'awdom12j', 'Christian', 'Mellark');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (23, 'SSB', 'Qwerty12', 'Jesus', 'Rojas');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (24, 'NoName', '00039mm', 'Pedro', 'Velez');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (25, 'GodHimself', '12jj42m2', 'Jesus', 'Rosario');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (26, 'Summer', '12d22ggd', 'Erika', 'Rodriguez');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (27, 'Lidica', 'dojaCat', 'Shakira', 'Rivera');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (28,  'Empty', 'password', 'Throwaway', 'Account');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (29, 'ML Achates', 'gold4lyf', 'Christina', 'Sanchez');

INSERT INTO users(
            uid, uname, upass, first_name, last_name)
    VALUES (30, 'Vildred', 'Pass1234', 'Fernando', 'Rivera');

END $$;  -- Ends users data update.



/*--------------------------Administrators--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'administrator') THEN
	TRUNCATE TABLE administrator
	Restart identity
	Cascade;
ELSE
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
	ALTER TABLE administrator
	  OWNER TO postgres;
END IF;

INSERT INTO administrator(uid)
    VALUES (1);

INSERT INTO administrator(uid)
    VALUES (22);

INSERT INTO administrator(uid)
    VALUES (23);

INSERT INTO administrator(uid)
    VALUES (24);

INSERT INTO administrator(uid)
    VALUES (25);

INSERT INTO administrator(uid)
    VALUES (26);

INSERT INTO administrator(uid)
    VALUES (27);

INSERT INTO administrator(uid)
    VALUES (28);

INSERT INTO administrator(uid)
    VALUES (29);

INSERT INTO administrator(uid)
    VALUES (30);

END $$;  -- Ends administrator data update.

/*--------------------------Category--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'category') THEN
	TRUNCATE TABLE category
	Restart identity
	Cascade;
ELSE
	CREATE TABLE category
		(
		  catid serial NOT NULL,
		  cattype character varying(35) NOT NULL,
		  CONSTRAINT category_pkey PRIMARY KEY (catid)
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE category
		  OWNER TO postgres;

END IF;

INSERT INTO category(cattype)
    VALUES ('Water');

INSERT INTO category(cattype)
    VALUES ('Medications');

INSERT INTO category(cattype)
    VALUES ('Baby food');

INSERT INTO category(cattype)
    VALUES ('Canned food');  

INSERT INTO category(cattype)
    VALUES ('Dry food');

INSERT INTO category(cattype)
    VALUES ('Ice');

INSERT INTO category(cattype)
    VALUES ('Fuel');

INSERT INTO category(cattype)
    VALUES ('Medical devices');

INSERT INTO category(cattype)
    VALUES ('Heavy equipment');

INSERT INTO category(cattype)
    VALUES ('Tools');

INSERT INTO category(cattype)
    VALUES ('Clothing');

INSERT INTO category(cattype)
    VALUES ('Power generators');

INSERT INTO category(cattype)
    VALUES ('Batteries');

INSERT INTO category(cattype)
    VALUES ('Cleaning supplies');

INSERT INTO category(cattype)
    VALUES ('Sanitary products');
END $$;  -- Ends category data update.

/*--------------------------Billing Information--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'billinginformation') THEN
	TRUNCATE TABLE billinginformation
	Restart identity
	Cascade;
ELSE
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
		ALTER TABLE billinginformation
		  OWNER TO postgres;

END IF;

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('190 Elizabeth Set, Bull County, Toronto, United States, 38122', 'qy13urnjja8@groupbuff.com', '2');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('3134  Allison Avenue, Virgin Oil, Virginia, US, 23219', 'qqjx3jlq6ee@powerencry.com', '3');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('1626  Ash Avenue, Stlouis, Missouri, US, 63101', 'j29uzkdh51@fakemailgenerator.net', '4');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('476  Alexander Avenue, Dublin, California, US, 94568', '40lzklyx002@powerencry.com', '5');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('716  Heron Way, Portland, Oregon, US, 97205', 'hbn8em295h@fakemailgenerator.net', '6');

INSERT INTO public.billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('3975  Randall Drive, Kohala, Hawaii, US, 96755', 'b6oy5fygioc@yahoo.com', '7');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('3300  Edwards Street, Greenville, North Carolina, US, 27834', 'abinmdj5l3v@gmail.com', '8');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('Valle Arriba Heights Cll 265 DB23, Carolina, Puerto Rico, 00784', 'wd51lh39i2l@powerencry.com', '9');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('Ansgarstr. 4, Wallenhorst, Harweth, Germany, 49134', 'gnsstrld0l@fakemailgenerator.net', '10');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('MHA Hood JH Street of Madness, Karten, Great Company, Germany, 125432', '0cqux4jfn4xn@classesmail.com', '11');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('3103 10th Ste N Suite 201, Arlington, Virginia, US, 22201', '19sc2nwdbmwh@meantinc.com', '12');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('7 Wood Street, Willoughby, OH, 44094', 'oddusaher-4364@yopmail.com', '13');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('14 N. Leeton Ridge Court, Boston, MA, 02127', 'dodong@gmail.com', '14');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('10 Brown Drive, Lanham, MD, 20706', 'fluffy@icloud.com', '15');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('325 2nd Dr., Irvington, NJ, 07111', 'fbriere@outlook.com', '16');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('8068 Augusta Lane, Severn, MD, 21144', 'chunzi@hotmail.com', '17');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('344 Dogwood Lane, Dekalb, IL, 60115', 'mastinfo@att.net', '18');

INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('575 Grove Street, Elyria, OH, 44035', 'bowmanbs@hotmail.com', '19');
    
INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('2 Beechwood Street, Grand Haven, MI, 49417', 'jdhedden@gmail.com', '20');
    
INSERT INTO billinginformation(
            billing_address, paypal_account, uid)
    VALUES ('49 Wagon Street, Pompano Beach, FL, 33060', 'milton@live.com', '21');

END $$;  -- Ends billinginformation data update.

/*--------------------------Consumer--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'consumer') THEN
	TRUNCATE TABLE consumer
	Restart identity
	Cascade;
ELSE
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
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE consumer
		  OWNER TO postgres;

END IF;

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('134', '190 Elizabeth Set, Bull County, Toronto, United States, 38122', '2');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('135', '3134  Allison Avenue, Virgin Oil, Virginia, US, 23219', '4');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('136', '476  Alexander Avenue, Dublin, California, US, 94568', '6');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('137', '716  Heron Way, Portland, Oregon, US, 97205', '8');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('138', '3975  Randall Drive, Kohala, Hawaii, US, 96755', '10');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('139', '3300  Edwards Street, Greenville, North Carolina, US, 27834', '12');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('140', 'Valle Arriba Heights Cll 265 DB23, Carolina, Puerto Rico, 00784', '14');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('141', 'Ansgarstr. 4, Wallenhorst, Harweth, Germany, 49134', '16');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('142', 'MHA Hood JH Street of Madness, Karten, Great Company, Germany, 125432', '18');

INSERT INTO consumer(
            cid, caddress, uid)
    VALUES ('143', '3103 10th Ste N Suite 201, Arlington, Virginia, US, 22201', '20');

END $$;  -- Ends consumer data update.   


/*--------------------------Supplier--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'supplier') THEN
	TRUNCATE TABLE supplier
	Restart identity
	Cascade;
ELSE

	CREATE TABLE supplier
		(
		  sid serial NOT NULL,
		  saddress character varying(100) NOT NULL,
		  uid integer NOT NULL,
		  company_name character varying(50),
		  CONSTRAINT supplier_pkey PRIMARY KEY (sid, uid),
		  CONSTRAINT supplier_uid_fkey FOREIGN KEY (uid)
		      REFERENCES users (uid) MATCH SIMPLE
		      ON UPDATE NO ACTION ON DELETE NO ACTION,
		  CONSTRAINT supplier_sid_key UNIQUE (sid)
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE supplier
		  OWNER TO postgres;

END IF;

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('3103 10th Ste N Suite 201, Arlington, Virginia, US, 22201', '3', 'Verizon');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('1334  Wyatt Street, Boynton Beach, Florida, US, 33436', '5', 'Google');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('1334  Wyatt Street, Boynton Beach, Florida, US, 33436', '7', 'Cats Inc.');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('3134  Allison Avenue, Virgin Oil, Virginia, US, 374321', '9', 'Spiderz Galore');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('595  Mapleview Drive, Dyersburg, Tennesse, US, 38204', '11', 'Who Cares');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('476  Alexander Avenue, Dublin, California, US, 94568', '13', 'Dublin Roolz');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('3300  Edwards Street, Greenville, North Carolina, US, 27834', '15', 'Green the World');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('476  Alexander Avenue, Dublin, California, US, 94568', '17', 'Dublin Roolz');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('3103 10th Ste N Suite 201, Arlington, Virginia, US, 22201', '19', 'Verizon');

INSERT INTO supplier(
            saddress, uid, company_name)
    VALUES ('2656  Pooz Street, Pratts, Virginia, 22731, US', '21', 'Demon Slaying');

END $$;  -- Ends supplier data update.

/*--------------------------Resource--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'resource') THEN
	TRUNCATE TABLE resource
	Restart identity
	Cascade;
ELSE
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
		ALTER TABLE resource
		  OWNER TO postgres;

END IF;

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('1', 'Bottled water', '78 Case Pallet of Water', '190 Elizabeth Set, Bull County, Toronto, United States');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Cardiac medications', 'Esential medicine for the heart', 'China');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('3', 'Baby food & formula', '80 Pcs of baby food & formula', 'United States');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('4', 'Canned food items', 'Beans, soup, spam, etc.', '190 Elizabeth Set, Bull County, Toronto, United States');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('5', 'Food with water removed to prolong food', 'Dried food items', '3134  Allison Avenue, Virgin Oil, Virginia, US, 374321');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('6', 'Ice packs', 'Gel ice pack compress', '595  Mapleview Drive, Dyersburg, Tennesse, US, 38204');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('7', 'Liquid fuel for diesel engines', 'Diesel Fuel', '2656  Pooz Street, Pratts, Virginia, 22731, US');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'Infusion pump for fluids, medications or nutrients', 'Infusion pump', 'China');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'Pacemakers', 'Pacemakers for those in need.', 'China');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('13', 'Alkaline Batteries', 'Battery cells for external devices', '408 Park Ave, Brooklyn, NY 11205, United State, 841452');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('15', 'Diapers', '156 Pcs of dry diapers', '476 Alexander Avenue, Dublin, California, US, 94568');

END $$;  -- Ends resource data update.

/*--------------------------Request--------------------------*/
INSERT INTO request(
            cid, resid)
    VALUES ('134', '1');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('135', '1', '3');

INSERT INTO request(
            cid, resid)
    VALUES ('136', '2');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('137', '16', '2');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('137', '27', '10');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('138', '23', '5');

INSERT INTO request(
            cid, resid)
    VALUES ('142', '23');
    
INSERT INTO request(
            cid, resid)
    VALUES ('144', '22');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('137', '24', '150');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('134', '23', '20');

INSERT INTO request(
            cid, resid)
    VALUES ('141', '27');

INSERT INTO request(
            cid, resid)
    VALUES ('142', '24');

/*--------------------------Supply--------------------------*/
INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('13', '1', '20.00', '20');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('15', '1', '15.00', '30');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('5', '15', '17.00', '15');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('8', '23', '150.00', '120');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('7', '22', '10.00', '130');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('10', '22', '7.00', '200');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('9', '15', '45.00', '90');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('8', '14', '20.00', '50');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('14', '19', '25.00', '400');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('6', '24', '250.00', '25');
    
INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('15', '26', '10.00', '220');

/*--------------------------Order--------------------------*/
select * from users natural inner join consumer;

INSERT INTO Order(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('18', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('29', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('18', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('35', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('44', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('25', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('2', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('40', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('23', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('35', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('1', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('36', ?, ?, ?, ?, ?);

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('44', ?, ?, ?, ?, ?);


/*--------------------------Reservation--------------------------*/


/*--------------------------Transaction--------------------------*/





