--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)
-- Dumped by pg_dump version 11.7 (Ubuntu 11.7-0ubuntu0.19.10.1)

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

SET default_with_oids = false;

--
-- Name: MyApp_billings; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public."MyApp_billings" (
    bill_number integer NOT NULL,
    bill_items text NOT NULL,
    bill_date timestamp with time zone NOT NULL,
    bill_amount numeric(10,4) NOT NULL,
    bill_user_id integer NOT NULL
);


ALTER TABLE public."MyApp_billings" OWNER TO myprojectuser;

--
-- Name: MyApp_billings_bill_number_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public."MyApp_billings_bill_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyApp_billings_bill_number_seq" OWNER TO myprojectuser;

--
-- Name: MyApp_billings_bill_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public."MyApp_billings_bill_number_seq" OWNED BY public."MyApp_billings".bill_number;


--
-- Name: MyApp_compltestockdetails; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public."MyApp_compltestockdetails" (
    id integer NOT NULL,
    batch_num integer NOT NULL,
    item_name character varying(50) NOT NULL,
    company character varying(30) NOT NULL,
    price_per_unit double precision NOT NULL,
    manf_date date NOT NULL,
    exp_date date NOT NULL,
    quantity integer NOT NULL,
    comments character varying(100) NOT NULL,
    margin character varying(20) NOT NULL,
    cgst character varying(20) NOT NULL,
    sgst character varying(20) NOT NULL,
    dealer_id integer NOT NULL
);


ALTER TABLE public."MyApp_compltestockdetails" OWNER TO myprojectuser;

--
-- Name: MyApp_compltestockdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public."MyApp_compltestockdetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyApp_compltestockdetails_id_seq" OWNER TO myprojectuser;

--
-- Name: MyApp_compltestockdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public."MyApp_compltestockdetails_id_seq" OWNED BY public."MyApp_compltestockdetails".id;


--
-- Name: MyApp_dealersinfo; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public."MyApp_dealersinfo" (
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    dl1 character varying(15) NOT NULL,
    dl2 character varying(15) NOT NULL,
    tin character varying(15) NOT NULL,
    person_info_id integer NOT NULL
);


ALTER TABLE public."MyApp_dealersinfo" OWNER TO myprojectuser;

--
-- Name: MyApp_dealersinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public."MyApp_dealersinfo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyApp_dealersinfo_id_seq" OWNER TO myprojectuser;

--
-- Name: MyApp_dealersinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public."MyApp_dealersinfo_id_seq" OWNED BY public."MyApp_dealersinfo".id;


--
-- Name: MyApp_person; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public."MyApp_person" (
    id integer NOT NULL,
    "user" character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    age integer NOT NULL,
    email_id character varying(254) NOT NULL,
    dob date NOT NULL,
    date_created timestamp with time zone NOT NULL,
    phone character varying(10) NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public."MyApp_person" OWNER TO myprojectuser;

--
-- Name: MyApp_person_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public."MyApp_person_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MyApp_person_id_seq" OWNER TO myprojectuser;

--
-- Name: MyApp_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public."MyApp_person_id_seq" OWNED BY public."MyApp_person".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO myprojectuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO myprojectuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO myprojectuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO myprojectuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO myprojectuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myprojectuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO myprojectuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myprojectuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myprojectuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO myprojectuser;

--
-- Name: MyApp_billings bill_number; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_billings" ALTER COLUMN bill_number SET DEFAULT nextval('public."MyApp_billings_bill_number_seq"'::regclass);


--
-- Name: MyApp_compltestockdetails id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_compltestockdetails" ALTER COLUMN id SET DEFAULT nextval('public."MyApp_compltestockdetails_id_seq"'::regclass);


--
-- Name: MyApp_dealersinfo id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo" ALTER COLUMN id SET DEFAULT nextval('public."MyApp_dealersinfo_id_seq"'::regclass);


--
-- Name: MyApp_person id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_person" ALTER COLUMN id SET DEFAULT nextval('public."MyApp_person_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: MyApp_billings; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public."MyApp_billings" (bill_number, bill_items, bill_date, bill_amount, bill_user_id) FROM stdin;
1	[{"batch_num": "4578925", "item_name": "Nicip 10mg", "company": "Cipla", "ppu": "6.8084999999999996", "quantity": "2", "tp": "13.616999999999999"}]	2020-04-18 08:59:26.544019+00	13.6170	2
2	[{"batch_num": "568923", "item_name": "Dolo 650mg", "company": "Cipla", "ppu": "2.2", "quantity": "5", "tp": "11.0"}, {"batch_num": "896574", "item_name": "D Well", "company": "Medplox", "ppu": "27249.453", "quantity": "2", "tp": "54498.906"}]	2020-04-18 14:59:52.441752+00	54509.9060	1
3	[{"batch_num": "4578925", "item_name": "Nicip 10mg", "company": "Cipla", "ppu": "6.8084999999999996", "quantity": "2", "tp": "13.616999999999999"}]	2020-04-18 15:02:51.476978+00	13.6170	1
4	[{"batch_num": "568923", "item_name": "Dolo 650mg", "company": "Cipla", "ppu": "2.2", "quantity": "1", "tp": "2.2"}]	2020-04-18 15:04:53.13454+00	2.2000	2
\.


--
-- Data for Name: MyApp_compltestockdetails; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public."MyApp_compltestockdetails" (id, batch_num, item_name, company, price_per_unit, manf_date, exp_date, quantity, comments, margin, cgst, sgst, dealer_id) FROM stdin;
3	896574	D Well	Medplox	235.620000000000005	2020-01-25	2029-02-02	19	For D Vitamin Defficiency	110.25	2.20	2.20	1
1	4578925	Nicip 10mg	Cipla	2.54999999999999982	2019-07-11	2022-07-10	78	For Body Pains	1.25	0.21	0.21	2
2	568923	Dolo 650mg	Cipla	1.25	2019-12-25	2026-12-01	514	Combination of Paracetamol -- Used for Fever	0.52	0.12	0.12	2
\.


--
-- Data for Name: MyApp_dealersinfo; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public."MyApp_dealersinfo" (id, company_name, dl1, dl2, tin, person_info_id) FROM stdin;
1	Delvis Info	JKUL56897K	KJUHY6589F	123654KHTYB	1
2	Cipla	153HJKDH21	456JGHST12	HFJK2125FG2	2
\.


--
-- Data for Name: MyApp_person; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public."MyApp_person" (id, "user", first_name, last_name, age, email_id, dob, date_created, phone, address) FROM stdin;
1	hari	HariHara	Sarma	31	h.sarma212@gmail.com	1989-07-15	2020-04-17 05:50:57.614817+00	9533977887	Bangalore
2	Ravi	Ravindra	Kumar	28	ravindra.kumar@gmail.com	1992-07-12	2020-04-17 05:51:50.294978+00	9533977885	Hyderabad
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add billings	7	add_billings
26	Can change billings	7	change_billings
27	Can delete billings	7	delete_billings
28	Can view billings	7	view_billings
29	Can add dealers info	8	add_dealersinfo
30	Can change dealers info	8	change_dealersinfo
31	Can delete dealers info	8	delete_dealersinfo
32	Can view dealers info	8	view_dealersinfo
33	Can add complte stock details	9	add_compltestockdetails
34	Can change complte stock details	9	change_compltestockdetails
35	Can delete complte stock details	9	delete_compltestockdetails
36	Can view complte stock details	9	view_compltestockdetails
37	Can add person	10	add_person
38	Can change person	10	change_person
39	Can delete person	10	delete_person
40	Can view person	10	view_person
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$ykthZKwE3aLz$/GVbL/E3Rn6WY3BgIfaqk1xc+PytgObmKK3g6zMobJc=	2020-04-20 06:48:52.881152+00	t	hari			h.sarma212@gmail.com	t	t	2020-04-15 09:00:32.844787+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-04-17 05:50:57.696187+00	1	Person object (1)	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	MyApp	billings
8	MyApp	dealersinfo
9	MyApp	compltestockdetails
10	MyApp	person
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-04-15 08:54:20.622692+00
2	auth	0001_initial	2020-04-15 08:54:21.081209+00
3	admin	0001_initial	2020-04-15 08:54:21.928128+00
4	admin	0002_logentry_remove_auto_add	2020-04-15 08:54:22.063213+00
5	admin	0003_logentry_add_action_flag_choices	2020-04-15 08:54:22.096058+00
6	contenttypes	0002_remove_content_type_name	2020-04-15 08:54:22.130627+00
7	auth	0002_alter_permission_name_max_length	2020-04-15 08:54:22.151749+00
8	auth	0003_alter_user_email_max_length	2020-04-15 08:54:22.185059+00
9	auth	0004_alter_user_username_opts	2020-04-15 08:54:22.217427+00
10	auth	0005_alter_user_last_login_null	2020-04-15 08:54:22.23665+00
11	auth	0006_require_contenttypes_0002	2020-04-15 08:54:22.245643+00
12	auth	0007_alter_validators_add_error_messages	2020-04-15 08:54:22.272535+00
13	auth	0008_alter_user_username_max_length	2020-04-15 08:54:22.349551+00
14	auth	0009_alter_user_last_name_max_length	2020-04-15 08:54:22.39639+00
15	auth	0010_alter_group_name_max_length	2020-04-15 08:54:22.434908+00
16	auth	0011_update_proxy_permissions	2020-04-15 08:54:22.464633+00
17	sessions	0001_initial	2020-04-15 08:54:22.604781+00
18	MyApp	0001_initial	2020-04-15 09:06:55.499701+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myprojectuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wl8pugfd0minuc7yvhqgjh9m0kyz2s52	MmU2ZThhZDg2MWM1NzRlZTJkN2E0MGE2MDUwMDcxZTI3MDkxZDVlODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2E4ZDliNDNhMTkzODM5NWZhZTg0YmZlYTc1ZmY1ZGU0YWNjMWNlIn0=	2020-04-29 09:49:49.077303+00
vshr38pmy1ldvb7a29540m7x7s81gfra	MmU2ZThhZDg2MWM1NzRlZTJkN2E0MGE2MDUwMDcxZTI3MDkxZDVlODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2E4ZDliNDNhMTkzODM5NWZhZTg0YmZlYTc1ZmY1ZGU0YWNjMWNlIn0=	2020-05-04 06:48:52.937509+00
\.


--
-- Name: MyApp_billings_bill_number_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public."MyApp_billings_bill_number_seq"', 4, true);


--
-- Name: MyApp_compltestockdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public."MyApp_compltestockdetails_id_seq"', 3, true);


--
-- Name: MyApp_dealersinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public."MyApp_dealersinfo_id_seq"', 2, true);


--
-- Name: MyApp_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public."MyApp_person_id_seq"', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myprojectuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: MyApp_billings MyApp_billings_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_billings"
    ADD CONSTRAINT "MyApp_billings_pkey" PRIMARY KEY (bill_number);


--
-- Name: MyApp_compltestockdetails MyApp_compltestockdetails_batch_num_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_compltestockdetails"
    ADD CONSTRAINT "MyApp_compltestockdetails_batch_num_key" UNIQUE (batch_num);


--
-- Name: MyApp_compltestockdetails MyApp_compltestockdetails_item_name_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_compltestockdetails"
    ADD CONSTRAINT "MyApp_compltestockdetails_item_name_key" UNIQUE (item_name);


--
-- Name: MyApp_compltestockdetails MyApp_compltestockdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_compltestockdetails"
    ADD CONSTRAINT "MyApp_compltestockdetails_pkey" PRIMARY KEY (id);


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_dl1_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_dl1_key" UNIQUE (dl1);


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_dl2_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_dl2_key" UNIQUE (dl2);


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_person_info_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_person_info_id_key" UNIQUE (person_info_id);


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_pkey" PRIMARY KEY (id);


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_tin_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_tin_key" UNIQUE (tin);


--
-- Name: MyApp_person MyApp_person_email_id_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_person"
    ADD CONSTRAINT "MyApp_person_email_id_key" UNIQUE (email_id);


--
-- Name: MyApp_person MyApp_person_phone_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_person"
    ADD CONSTRAINT "MyApp_person_phone_key" UNIQUE (phone);


--
-- Name: MyApp_person MyApp_person_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_person"
    ADD CONSTRAINT "MyApp_person_pkey" PRIMARY KEY (id);


--
-- Name: MyApp_person MyApp_person_user_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_person"
    ADD CONSTRAINT "MyApp_person_user_key" UNIQUE ("user");


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: MyApp_billings_bill_user_id_59766421; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_billings_bill_user_id_59766421" ON public."MyApp_billings" USING btree (bill_user_id);


--
-- Name: MyApp_compltestockdetails_dealer_id_064a4acb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_compltestockdetails_dealer_id_064a4acb" ON public."MyApp_compltestockdetails" USING btree (dealer_id);


--
-- Name: MyApp_compltestockdetails_item_name_5c111fa5_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_compltestockdetails_item_name_5c111fa5_like" ON public."MyApp_compltestockdetails" USING btree (item_name varchar_pattern_ops);


--
-- Name: MyApp_dealersinfo_dl1_15e4d01f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_dealersinfo_dl1_15e4d01f_like" ON public."MyApp_dealersinfo" USING btree (dl1 varchar_pattern_ops);


--
-- Name: MyApp_dealersinfo_dl2_13dae032_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_dealersinfo_dl2_13dae032_like" ON public."MyApp_dealersinfo" USING btree (dl2 varchar_pattern_ops);


--
-- Name: MyApp_dealersinfo_tin_f4f9fe40_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_dealersinfo_tin_f4f9fe40_like" ON public."MyApp_dealersinfo" USING btree (tin varchar_pattern_ops);


--
-- Name: MyApp_person_email_id_cd86508a_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_person_email_id_cd86508a_like" ON public."MyApp_person" USING btree (email_id varchar_pattern_ops);


--
-- Name: MyApp_person_phone_a727fd7f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_person_phone_a727fd7f_like" ON public."MyApp_person" USING btree (phone varchar_pattern_ops);


--
-- Name: MyApp_person_user_1dc02d84_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX "MyApp_person_user_1dc02d84_like" ON public."MyApp_person" USING btree ("user" varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myprojectuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: MyApp_billings MyApp_billings_bill_user_id_59766421_fk_MyApp_person_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_billings"
    ADD CONSTRAINT "MyApp_billings_bill_user_id_59766421_fk_MyApp_person_id" FOREIGN KEY (bill_user_id) REFERENCES public."MyApp_person"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MyApp_compltestockdetails MyApp_compltestockde_dealer_id_064a4acb_fk_MyApp_dea; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_compltestockdetails"
    ADD CONSTRAINT "MyApp_compltestockde_dealer_id_064a4acb_fk_MyApp_dea" FOREIGN KEY (dealer_id) REFERENCES public."MyApp_dealersinfo"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MyApp_dealersinfo MyApp_dealersinfo_person_info_id_efdf502a_fk_MyApp_person_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public."MyApp_dealersinfo"
    ADD CONSTRAINT "MyApp_dealersinfo_person_info_id_efdf502a_fk_MyApp_person_id" FOREIGN KEY (person_info_id) REFERENCES public."MyApp_person"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myprojectuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

