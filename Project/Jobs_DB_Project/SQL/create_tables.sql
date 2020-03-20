
--
-- Name: restaurant table
--
CREATE TABLE restaurant (
    restaurant_id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    chain_id integer,
    rating integer,
    price integer
);

CREATE SEQUENCE restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE restaurant_id_seq OWNED BY restaurant.restaurant_id;

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (restaurant_id);

--
-- Name: chain table
--

CREATE TABLE chain (
    chain_id integer NOT NULL,
    name character varying(255),
    description character varying(255)
);

CREATE SEQUENCE chain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE chain_id_seq OWNED BY chain.chain_id;

ALTER TABLE ONLY chain
    ADD CONSTRAINT chain_pkey PRIMARY KEY (chain_id);

--
-- Name: restaurant_business table
--

CREATE TABLE restaurant_business (
	restaurant_business_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    hours character varying(255),
    attire character varying(255)
);

CREATE SEQUENCE restaurant_business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE restaurant_business_id_seq OWNED BY restaurant_business.restaurant_business_id;

ALTER TABLE ONLY restaurant_business
    ADD CONSTRAINT restaurant_business_pkey PRIMARY KEY (restaurant_business_id);
--
-- Name: restaurant_contact table
--

CREATE TABLE restaurant_contact (
    restaurant_contact_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    address_id integer,
    phone character varying(255),
    website character varying(255),
    email character varying(255)
);

CREATE SEQUENCE restaurant_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE restaurant_contact_id_seq OWNED BY restaurant_contact.restaurant_contact_id;

ALTER TABLE ONLY restaurant_contact
    ADD CONSTRAINT restaurant_contact_pkey PRIMARY KEY (restaurant_contact_id);

--
-- Name: address table
--

CREATE TABLE address (
	address_id integer NOT NULL,
	address_1 character varying(255),
    address_2 character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255)
);

CREATE SEQUENCE address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE address_id_seq OWNED BY address.address_id;

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);

--
-- Name: restaurant_food table
--

CREATE TABLE restaurant_food (
	restaurant_food_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    breakfast boolean,
    lunch boolean,
    dinner boolean,
    takeout boolean,
    deliver boolean,
    lowfat boolean,
    healthy boolean,
    organic boolean,
    gluten_free boolean,
    vegan boolean,
    vegetarian boolean
);

CREATE SEQUENCE restaurant_food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE restaurant_food_id_seq OWNED BY restaurant_food.restaurant_food_id;

ALTER TABLE ONLY restaurant_food
    ADD CONSTRAINT restaurant_food_pkey PRIMARY KEY (restaurant_food_id);

