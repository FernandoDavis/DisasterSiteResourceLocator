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
            uname, upass, first_name, last_name)
    VALUES ('Javalicious', 'eclipse', 'Eclipse', 'IDE');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Webman', '123', 'Peter', 'Parker');


INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Strongman', 'lift', 'Macho Man', 'Randy Savage');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Rider', 'sword', 'Fury', 'Speedrun');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Botox', 'death', 'Danny', 'Trejo');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Zombies', 'movie', 'George', 'Romero');    

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Savior', 'supply', 'Big', 'Daddy');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Bomb', 'db123', 'Alison', 'DeBou');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('VXDL', 'goya', 'Gabriel', 'Soto');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('purpetty', 'hair', 'Gabriela', 'Sanchez');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('catscratch', 'hairball', 'Anne', 'Wettsburg');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Sniper', 'thereal', 'Chris', 'Kyle');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Taxeslmao', 'smolloan', 'Donald', 'Trump');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Taskforce', 'emails', 'Hillary', 'Clinton');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Screamface', 'phone', 'Jennete', 'Mcquirk');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Mining', 'blocks', 'Minecraft', 'Steve');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Demonslayr', 'motorcyc', 'Dante', 'Sparda');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('CatBah', '12d22ggd', 'Carlos', 'Petardo');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Champion Zerato', 'nojw12h4', 'Fernando', 'Cordero');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Roana', 'dwno12nj', 'Raymond', 'Perez');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Angelica', 'o3kg1102', 'Noel', 'Diaz');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Dingo', 'awdom12j', 'Christian', 'Mellark');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('SSB', 'Qwerty12', 'Jesus', 'Rojas');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('NoName', '00039mm', 'Pedro', 'Velez');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('GodHimself', '12jj42m2', 'Jesus', 'Rosario');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Summer', '12d22ggd', 'Erika', 'Rodriguez');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Lidica', 'dojaCat', 'Shakira', 'Rivera');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Empty', 'password', 'Throwaway', 'Account');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('ML Achates', 'gold4lyf', 'Christina', 'Sanchez');

INSERT INTO users(
            uname, upass, first_name, last_name)
    VALUES ('Vildred', 'Pass1234', 'Fernando', 'Rivera');

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
            caddress, uid)
    VALUES ('190 Elizabeth Set, Bull County, Toronto, United States, 38122', '2');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('3134  Allison Avenue, Virgin Oil, Virginia, US, 23219', '4');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('476  Alexander Avenue, Dublin, California, US, 94568', '6');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('716  Heron Way, Portland, Oregon, US, 97205', '8');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('3975  Randall Drive, Kohala, Hawaii, US, 96755', '10');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('3300  Edwards Street, Greenville, North Carolina, US, 27834', '12');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('Valle Arriba Heights Cll 265 DB23, Carolina, Puerto Rico, 00784', '14');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('Ansgarstr. 4, Wallenhorst, Harweth, Germany, 49134', '16');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('MHA Hood JH Street of Madness, Karten, Great Company, Germany, 125432', '18');

INSERT INTO consumer(
            caddress, uid)
    VALUES ('3103 10th Ste N Suite 201, Arlington, Virginia, US, 22201', '20');

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

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Pain medication', 'Aspirin', '1303  Virgil Street, Lynn Haven, Florida, US, 32444');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Heart medication', 'Coumadin', '1385  Cost Avenue, Bethesda, Maryland, US, 20817');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Anticoagulant', 'Plavix', '2766  Burnside Avenue, Park City, Utah, US, 84060');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'Pacemakers for the heart', 'Pacemakers', '3607  Hillhaven Drive, Independence, Missouri, US, 64058');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'Artificial hearts', 'Total Artificial Hearts', '3607  Hillhaven Drive, Independence, Missouri, US, 64058');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Pain medication', 'Codeine', '1303  Virgil Street, Lynn Haven, Florida, US, 32444');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('2', 'Medication for high blood pressures', 'Norvasc', '2898  Oakwood Circle, San Clemente, California, US, 92672');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'Mercedes Arocs 4142-B Concrete Mixer Truck', 'Concrete Mixer', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'Caterpillar 428F2 4x4 Backhoe Loader - 2017', 'Backhoe Loader', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'Komatsu HD605-8 Rigid Dump Truck', 'Mining Dumptruck', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'Toyota 8FDF30', 'Forklift', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'CY1715 Road Roller', 'Road Roller', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('9', 'Liebherr LFT 1060-4.1 Crane', 'Truck Mounted Crane', '1568  Shadowmar Drive, EOLA, Texas, US, 76937, 394123');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('10','Industrial Electric Drill', 'Electric Power Drill', '4762  Par Drive, Goleta, California, US, 93117');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('10', 'Circular woodworking buzzsaw', 'Electric Buzzsaw', '4762  Par Drive, Goleta, California, US, 93117');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'Powerheart AED G3 PLUS defib unit', 'Defibrillator Unit', '2158  Sharon Lane, Plymouth, Indiana, US, 46563');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('8', 'China AG-HxJ02 Respirator Machine', 'Oxygen Respirator Machine', 'China');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('14', 'All purpose cleaning supply kit for households', 'Cleaning Kits', '476 Alexander Avenue, Dublin, California, US, 94568');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('15', 'Dove Body Wash Deep Moisture', 'Bodywash', 'China');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('12', '8000 Wat Gasoline Powered Portable Generator', 'Portable Electric Generator', '4658 Kerry Way Gardena, California, US, 90248');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('11', 'One size fits all clothes', 'Shirts and pants', '3300  Edwards Street, Greenville, North Carolina, US, 27834');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('11', 'Underwear for men and women', 'Undergarments', '3300  Edwards Street, Greenville, North Carolina, US, 27834');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('13', 'Eveready AA4 12 pack batteries', 'Super Heavy Duty Batteries', '408 Park Ave, Brooklyn, NY 11205, United State, 841452');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('15', 'No bleed pls sanitary products for womanz', 'Pads and tampons', 'Scotland Forever 402 Park, Scotland, Europe, 498313');

INSERT INTO resource(
            catid, resdescription, resname, reslocation)
    VALUES ('15', 'Poopoo cleaning uh oh stinky', 'Butt Wipper', 'Scotland Forever 402 Park, Scotland, Europe, 498313');


END $$;  -- Ends resource data update.

/*--------------------------Request--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'request') THEN
	TRUNCATE TABLE request
	Restart identity
	Cascade;
ELSE
	CREATE TABLE request
		(
		  reqid serial NOT NULL,
		  cid integer NOT NULL,
		  resid integer NOT NULL,
		  is_void boolean NOT NULL DEFAULT false,
		  reqdate date NOT NULL DEFAULT now(),
		  reqquantity integer NOT NULL DEFAULT 1,
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
		ALTER TABLE request
		  OWNER TO postgres;
END IF;

INSERT INTO request(
            cid, resid)
    VALUES ('1', '1');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('2', '1', '3');

INSERT INTO request(
            cid, resid)
    VALUES ('3', '2');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('4', '16', '2');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('4', '27', '10');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('5', '23', '5');

INSERT INTO request(
            cid, resid)
    VALUES ('6', '23');
    
INSERT INTO request(
            cid, resid)
    VALUES ('7', '22');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('8', '24', '150');

INSERT INTO request(
            cid, resid, reqquantity)
    VALUES ('9', '23', '20');

INSERT INTO request(
            cid, resid)
    VALUES ('4', '27');

INSERT INTO request(
            cid, resid)
    VALUES ('2', '24');

END $$;  -- Ends request data update.

/*--------------------------Supply--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'supply') THEN
	TRUNCATE TABLE supply
	Restart identity
	Cascade;
ELSE
	CREATE TABLE supply
		(
		  suid serial NOT NULL,
		  sid integer NOT NULL,
		  resid integer NOT NULL,
		  is_void boolean NOT NULL DEFAULT false,
		  is_available boolean NOT NULL DEFAULT false,
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
		ALTER TABLE supply
		  OWNER TO postgres;
END IF;

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('1', '1', '20.00', '20');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('1', '1', '15.00', '30');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('1', '15', '17.00', '15');

INSERT INTO supply(
            sid, resid, suprice, suquantity)
    VALUES ('5', '23', '150.00', '120');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '22', 't', '10.00', '130');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('1', '1', 't', '20.00', '20');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('9', '17', 't', '50.00', '45');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('2', '16', 't', '350.00', '20');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('5', '18', 't', '50.00', '65');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('2', '19', 't', '5000.00', '500');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('1', '20', 't', '4000.00', '200');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '21', 't', '3000.00', '600');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '22', 't', '350.00', '100');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '23', 't', '1500.00', '50');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '24', 't', '7384.00', '20');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('8', '34', 't', '20.00', '400');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('10', '26', 't', '250.00', '150');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '25', 't', '69.00', '50');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('2', '6', 't', '7.00', '85');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('4', '5', 't', '40.00', '56');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('3', '31', 't', '90.00', '32');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('1', '30', 't', '4.50', '81');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('7', '3', 't', '39.00', '62');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('8', '35', 't', '6.90', '69');

INSERT INTO supply(
            sid, resid, is_available, suprice, suquantity)
    VALUES ('8', '36', 't', '6.90', '69');

END $$;  -- Ends supply data update.

/*--------------------------Order--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'order') THEN
	TRUNCATE TABLE "order"
	Restart identity
	Cascade;
ELSE
	CREATE TABLE "order"
		(
		  onumber integer NOT NULL DEFAULT nextval('orderedsupply_onumber_seq'::regclass),
		  cid integer NOT NULL,
		  uid integer NOT NULL,
		  suid integer NOT NULL,
		  sid integer NOT NULL,
		  odate_ordered date NOT NULL DEFAULT now(),
		  oquantity integer NOT NULL,
		  odate_delivered date,
		  CONSTRAINT orderedsupply_pkey PRIMARY KEY (onumber),
		  CONSTRAINT orderedsupply_cid_fkey FOREIGN KEY (cid, uid)
		      REFERENCES consumer (cid, uid) MATCH SIMPLE
		      ON UPDATE NO ACTION ON DELETE NO ACTION,
		  CONSTRAINT orderedsupply_suid_fkey FOREIGN KEY (suid, sid)
		      REFERENCES supply (suid, sid) MATCH SIMPLE
		      ON UPDATE NO ACTION ON DELETE NO ACTION
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE "order"
		  OWNER TO postgres;
END IF;

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('2', '4', '15', '7', '10', '2020-05-06');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('2', '4', '3', '1', '20', '2020-05-10');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('1', '2', '1', '1', '10', '2020-05-07');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('4', '8', '5', '7', '50', '2020-05-06');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('3', '6', '5', '7', '50', '2020-05-09');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('5', '10', '18', '7', '20', '2020-05-08');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('8', '16', '21', '3', '32', '2020-05-11');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('10', '20', '3', '1', '15', '2020-05-06');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('9', '18', '25', '8', '69', '2020-05-06');

INSERT INTO "order"(
            cid, uid, suid, sid, oquantity, odate_delivered)
    VALUES ('7', '14', '23', '7', '40', '2020-05-06');

END $$;  -- Ends order data update.

/*--------------------------Reservation--------------------------*/

DO $$ BEGIN

-- If table is not found creates it, else truncates it.
IF EXISTS ( SELECT 1 FROM information_schema.tables  WHERE table_schema = 'public' AND table_name = 'reservation') THEN
	TRUNCATE TABLE reservation
	Restart identity
	Cascade;
ELSE
	CREATE TABLE reservation
		(
		  rnumber integer NOT NULL DEFAULT nextval('reservedsupply_rnumber_seq'::regclass),
		  rdate_reserved date NOT NULL DEFAULT now(),
		  rquantity integer NOT NULL,
		  cid integer NOT NULL,
		  uid integer NOT NULL,
		  suid integer NOT NULL,
		  sid integer NOT NULL,
		  rdate_delivered date,
		  CONSTRAINT reservedsupply_pkey PRIMARY KEY (rnumber),
		  CONSTRAINT reservedsupply_cid_fkey FOREIGN KEY (cid, uid)
		      REFERENCES consumer (cid, uid) MATCH SIMPLE
		      ON UPDATE NO ACTION ON DELETE NO ACTION,
		  CONSTRAINT reservedsupply_suid_fkey FOREIGN KEY (suid, sid)
		      REFERENCES supply (suid, sid) MATCH SIMPLE
		      ON UPDATE NO ACTION ON DELETE NO ACTION
		)
		WITH (
		  OIDS=FALSE
		);
		ALTER TABLE reservation
		  OWNER TO postgres;
END IF;

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('20', '1', '2', '2', '1', '2020-05-06');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('50', '2', '4', '17', '10', '2020-05-06');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('20', '3', '6', '9', '5', '2020-05-06');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('10', '4', '8', '11', '1', '2020-05-06');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('5', '4', '8', '16', '8', '2020-05-06');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('30', '6', '12', '21', '3', '2020-05-07');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('400', '9', '18', '13', '7', '2020-05-07');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('150', '9', '18', '25', '8', '2020-05-08');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('40', '9', '18', '23', '7', '2020-05-09');

INSERT INTO reservation(
            rquantity, cid, uid, suid, sid, rdate_delivered)
    VALUES ('69', '10', '20', '1', '1', '2020-05-10');

END $$;  -- Ends reservation data update.

/*--------------------------Transaction--------------------------*/





