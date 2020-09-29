--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: account_account; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.account_account (
    id integer NOT NULL,
    about text NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    user_pic character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(10) NOT NULL,
    user_id integer NOT NULL,
    gender integer NOT NULL
);


ALTER TABLE public.account_account OWNER TO advertiser;

--
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.account_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_account_id_seq OWNER TO advertiser;

--
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account_account.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO advertiser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO advertiser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO advertiser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO advertiser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO advertiser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO advertiser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: advertiser
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


ALTER TABLE public.auth_user OWNER TO advertiser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO advertiser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO advertiser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO advertiser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO advertiser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO advertiser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: company_company; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.company_company (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    members integer[] NOT NULL,
    date_created timestamp with time zone NOT NULL,
    description text NOT NULL,
    status integer NOT NULL,
    theme integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.company_company OWNER TO advertiser;

--
-- Name: company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.company_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_company_id_seq OWNER TO advertiser;

--
-- Name: company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.company_company_id_seq OWNED BY public.company_company.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: advertiser
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


ALTER TABLE public.django_admin_log OWNER TO advertiser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO advertiser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO advertiser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO advertiser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO advertiser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO advertiser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO advertiser;

--
-- Name: task_link; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.task_link (
    id integer NOT NULL,
    link character varying(200) NOT NULL,
    title character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.task_link OWNER TO advertiser;

--
-- Name: task_link_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.task_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_link_id_seq OWNER TO advertiser;

--
-- Name: task_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.task_link_id_seq OWNED BY public.task_link.id;


--
-- Name: task_note; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.task_note (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    files integer[] NOT NULL,
    description text NOT NULL,
    status integer NOT NULL,
    date_start timestamp with time zone NOT NULL,
    date_end timestamp with time zone NOT NULL,
    task_id integer NOT NULL,
    user_id integer NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.task_note OWNER TO advertiser;

--
-- Name: task_note_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.task_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_note_id_seq OWNER TO advertiser;

--
-- Name: task_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.task_note_id_seq OWNED BY public.task_note.id;


--
-- Name: task_task; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.task_task (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    description text NOT NULL,
    status integer NOT NULL,
    date_start timestamp with time zone NOT NULL,
    date_end timestamp with time zone NOT NULL,
    company_id integer,
    auto_join boolean NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.task_task OWNER TO advertiser;

--
-- Name: task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.task_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_task_id_seq OWNER TO advertiser;

--
-- Name: task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.task_task_id_seq OWNED BY public.task_task.id;


--
-- Name: task_task_links; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.task_task_links (
    id integer NOT NULL,
    task_id integer NOT NULL,
    link_id integer NOT NULL
);


ALTER TABLE public.task_task_links OWNER TO advertiser;

--
-- Name: task_task_links_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.task_task_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_task_links_id_seq OWNER TO advertiser;

--
-- Name: task_task_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.task_task_links_id_seq OWNED BY public.task_task_links.id;


--
-- Name: upload_file; Type: TABLE; Schema: public; Owner: advertiser
--

CREATE TABLE public.upload_file (
    id integer NOT NULL,
    file character varying(100),
    status integer NOT NULL
);


ALTER TABLE public.upload_file OWNER TO advertiser;

--
-- Name: upload_file_id_seq; Type: SEQUENCE; Schema: public; Owner: advertiser
--

CREATE SEQUENCE public.upload_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_id_seq OWNER TO advertiser;

--
-- Name: upload_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: advertiser
--

ALTER SEQUENCE public.upload_file_id_seq OWNED BY public.upload_file.id;


--
-- Name: account_account id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.account_account ALTER COLUMN id SET DEFAULT nextval('public.account_account_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: company_company id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.company_company ALTER COLUMN id SET DEFAULT nextval('public.company_company_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: task_link id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_link ALTER COLUMN id SET DEFAULT nextval('public.task_link_id_seq'::regclass);


--
-- Name: task_note id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_note ALTER COLUMN id SET DEFAULT nextval('public.task_note_id_seq'::regclass);


--
-- Name: task_task id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task ALTER COLUMN id SET DEFAULT nextval('public.task_task_id_seq'::regclass);


--
-- Name: task_task_links id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task_links ALTER COLUMN id SET DEFAULT nextval('public.task_task_links_id_seq'::regclass);


--
-- Name: upload_file id; Type: DEFAULT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.upload_file ALTER COLUMN id SET DEFAULT nextval('public.upload_file_id_seq'::regclass);


--
-- Data for Name: account_account; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.account_account (id, about, updated_on, user_pic, phone, status, role, user_id, gender) FROM stdin;
1	Admin manager and CEO	2020-08-13 11:18:10.79769+03	user/advertiser/image.webp		1	admin	1	1
3	Programmer and ingeneer	2020-08-13 11:20:47.082815+03	user/userman/unnamed.png		1	user	3	1
4	Software developer	2020-08-13 11:21:32.321235+03	user/superman/images_4.jpg		1	user	4	1
5		2020-08-13 11:21:50.164915+03	user/login/man-icon-png-18.png		1	user	5	1
7	Some text for about me...	2020-08-13 11:22:08.460307+03	user/robert/robert-kiyosaki.jpg-2.jpg	+7 (920) 596-24	1	user	7	1
22	Бухгалтер компании	2020-08-13 11:23:13.637062+03	user/ritam/images_3.jpg		1	user	22	2
23	Операционистка компании	2020-08-13 11:23:38.752983+03	user/Marina/images_1.jpg		1	user	23	2
24	Служба поддержки	2020-08-13 11:24:02.484463+03	user/electra/images_1.jpg		1	user	24	2
8		2020-08-13 11:31:29.841432+03	user_pic_male.png		0	user	8	2
2	Developer of this CRM System	2020-08-13 11:52:59.87263+03	user/websofter/3089dc3ea0fa2c913372334d9aa5197b.jpg		1	admin	2	1
27		2020-08-13 17:09:45.757621+03	user_pic_male.png		1	user	27	1
28		2020-08-13 17:39:12.245292+03	user_pic_male.png		1	user	28	1
29		2020-08-13 17:40:44.588375+03	user_pic_male.png		1	user	29	1
30		2020-08-13 17:41:40.617925+03	user_pic_male.png		1	user	30	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: advertiser
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
25	Can add account	7	add_account
26	Can change account	7	change_account
27	Can delete account	7	delete_account
28	Can view account	7	view_account
29	Can add company	8	add_company
30	Can change company	8	change_company
31	Can delete company	8	delete_company
32	Can view company	8	view_company
33	Can add task	9	add_task
34	Can change task	9	change_task
35	Can delete task	9	delete_task
36	Can view task	9	view_task
37	Can add note	10	add_note
38	Can change note	10	change_note
39	Can delete note	10	delete_note
40	Can view note	10	view_note
41	Can add file	11	add_file
42	Can change file	11	change_file
43	Can delete file	11	delete_file
44	Can view file	11	view_file
45	Can add link	12	add_link
46	Can change link	12	change_link
47	Can delete link	12	delete_link
48	Can view link	12	view_link
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
5	pbkdf2_sha256$180000$bDiat2k07nCt$g6/8BwB3Kb6JGVCgPnu4CNqF9DJOxplUkm60MLh0IVg=	\N	f	login	Martin	Luter	mail.beeway@yandex.ru	f	t	2020-08-01 11:29:09+03
7	pbkdf2_sha256$180000$EgYWtmQ3pq4k$7P8wPRYMIlgyQ54GRxtScw8O1AWFBebMP0TLE/K+7N8=	\N	f	robert	Роберт	Кийосаки		t	t	2020-08-10 08:38:13+03
3	pbkdf2_sha256$180000$KfT0awQcvaud$Fzz8Pgqspn7VzjsyCnrL+YFYE4JtxNfv/Y9PPkGWcGk=	\N	f	userman	Алексей	Иванов		f	t	2020-07-20 00:41:18+03
2	pbkdf2_sha256$180000$kO7MxWNoGLhE$L2jfKu0uGEAerluv01eE0uD9uD81k+pPZ7nMI1DH6Yc=	2020-08-11 19:46:08+03	f	websofter	Марк	Каменский		f	t	2020-07-20 00:40:27+03
4	pbkdf2_sha256$180000$OwixvU5wMdyv$LZ2eMG3ttluoV+xqUVYC75F7LgOyIp4XgqGaoinyfbA=	\N	f	superman	Виталий	Алексеев		f	t	2020-07-20 00:41:45+03
8	pbkdf2_sha256$180000$uRKbbsoO3iNM$TOIPIeXoEkPfu2Tzu2XKluz4O3skALREa7MOi7uVb78=	\N	f	mylogin	Иван	Долгов		f	t	2020-08-10 21:49:29+03
12	pbkdf2_sha256$180000$jcOaEcVdhxHk$0AJXLWbu3GVUz8oQzni9zB08I+GCQ21lvhwkdduuuE0=	\N	f	mylogin9	Григорий	Березнов		f	t	2020-08-11 04:40:23+03
11	pbkdf2_sha256$180000$Mbs0R3PFDDjP$8Fp2OpbEGinpzWhQFCokBLfTkXxKhCNyNEje5aUdcso=	\N	f	mylogin8	Илья	Салевич		f	t	2020-08-11 04:39:00+03
20	pbkdf2_sha256$180000$54MxTCJ8EED4$bn7+y76i+7iSAipIuiHo/PJlxCNXYDKvT4xRCNX4n+4=	\N	f	mylogin19	Мэри	Гудман		f	t	2020-08-12 08:07:10+03
21	pbkdf2_sha256$180000$aARI2eWdq949$EOR+Ij5iMZW3d1mZnQ3JcZ83ZcU47SUEURQcBk5VBn4=	\N	f	helloWorld				f	t	2020-08-13 08:13:33.698427+03
22	pbkdf2_sha256$180000$nnbBB5sZX3XA$9tP064ZVR+PapQz7YJhAbkPxK0iSLEAUtCL78jZDbFQ=	\N	f	ritam				f	t	2020-08-13 08:15:39.156382+03
23	pbkdf2_sha256$180000$mcWlepUGtIkn$GYMhV3mm0xGMSMU2Num57dQ8IuZYlv6SaiC2TEGUkJg=	\N	f	Marina				f	t	2020-08-13 08:18:47.778529+03
24	pbkdf2_sha256$180000$e6LrWRcpEBBc$faKRw8QZrG/Ut1bsLLpYe52MsXcar0sgIPx+blEqHeo=	\N	f	electra				f	t	2020-08-13 10:26:04.597192+03
25	pbkdf2_sha256$180000$3yALloPkMld2$iHBKJJV33codzTe18PulI/qh1PSuDUdJ+mP6Hvf4T0o=	\N	f	electra1				f	t	2020-08-13 10:28:07.17539+03
26	pbkdf2_sha256$180000$h3QHpp3NYiLe$vJfIZOXMZrpptAgjU35Bf8ez9JeiiXjGjus3VrCtqfQ=	\N	f	electra2				f	t	2020-08-13 10:29:29.672282+03
27	pbkdf2_sha256$180000$hJHGWh83fFuK$q0aTjcg1CgdQd3SKDNERzfy4ZtqNzvKTIeevnABn1O4=	\N	f	electra21				f	t	2020-08-13 17:09:45.597706+03
28	pbkdf2_sha256$180000$gPaj6z6WXDY5$+//W5HDMlj5Dzsycqg/Grhc+rFAaI1qni2omr90cQig=	\N	f	electra22				f	t	2020-08-13 17:39:12.092969+03
29	pbkdf2_sha256$180000$vpgz8gCK7oPz$u53ngAS54gd/41KEq2JRjNE0p1yLCJuzR6K9SqQK2AI=	\N	f	electra23				f	t	2020-08-13 17:40:44.434359+03
30	pbkdf2_sha256$180000$kxE5REPS1v4V$ZzIRvfVLyjSae+aBVdLVY3dHw/+w1G3yTLdiwmiyhzQ=	\N	f	electra24				f	t	2020-08-13 17:41:40.452788+03
31	pbkdf2_sha256$180000$ADwPWMpAUkQT$t6r2/l2XpMT1/M+Uq/8nftkfJddqV3qJkO8RH06xpfc=	\N	f	electra25				f	t	2020-08-13 17:41:50.579241+03
32	pbkdf2_sha256$180000$l1N5MKaGPfOk$lvfAIxpAsRryl1yF8p4fbReK31GdcVsyDbtMjsr9WDA=	\N	f	electra26				f	t	2020-08-13 17:52:28.640313+03
1	pbkdf2_sha256$180000$572gTzH7VQ9s$LbG0Rjv3Mw8Twi1wFM8Vt977ZF+Hib+jAJe6BAvH9B8=	2020-08-27 07:19:18.728661+03	t	advertiser	Main	Admin	mail.websofter@gmail.com	t	t	2020-07-20 00:36:05+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: company_company; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.company_company (id, name, members, date_created, description, status, theme, user_id) FROM stdin;
19	Yandex LCC	{1,2}	2020-07-21 00:27:02.692255+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	2	3	4
21	Mercedes	{1,2,3}	2020-07-21 00:27:57.026099+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	1	4	3
23	Sony	{1,2,3}	2020-07-21 00:28:53.887613+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	1	3	1
24	Google inc	{1,2,3}	2020-07-21 00:29:22.24439+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	1	1	4
25	Apple	{1,2,3}	2020-07-21 00:29:45.290891+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	2	2	4
36	New Comp LCC	{1,2,3}	2020-08-06 13:26:39.547454+03	Description	1	2	1
64	My Company	{2,3}	2020-08-08 19:55:49.620283+03	My desc	2	2	3
65	My Company	{2,3}	2020-08-08 21:20:47.336023+03	My desc	2	2	3
66	My Company	{2,3}	2020-08-08 21:23:16.884777+03	My desc	2	2	3
67	My Company	{2,3}	2020-08-08 21:28:28.950038+03	My desc	2	2	3
74	fhghfgh	{3}	2020-08-10 08:45:10.639104+03	fghfghfg	1	1	7
75	mers	{2,3}	2020-08-10 15:10:34.873857+03	sdfdg	2	2	1
80	3	{7}	2020-08-11 15:21:50.433142+03	3	1	1	2
81	4	{7}	2020-08-11 15:22:01.758041+03	4	1	2	2
82	5	{7}	2020-08-12 10:08:58.557818+03	5	2	3	2
87	Новая компания	{3,2,8,5}	2020-08-14 14:20:41.029814+03	Описание компании ...	1	1	2
86	тест	{4,3,2,7,1,5}	2020-08-14 14:33:18.680459+03	апвпвапва	1	4	2
88	Моя новая компания	{5,3}	2020-08-17 00:44:34.232069+03	Описание компании	1	4	2
89	1	{30}	2020-08-17 10:10:46.448287+03	1	1	1	1
90	2	{23}	2020-08-17 10:11:31.678533+03	2	1	1	1
91	Рабочая компания	{8}	2020-09-03 14:41:39.547206+03	Описание компании	1	1	1
118	Привет мир	{5,3}	2020-09-03 15:09:41.807577+03	Привет мир	1	2	1
26	Adobe 222	{3,4,2}	2020-09-03 14:33:04.423222+03	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.	1	1	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-07-20 00:40:27.665763+03	2	websofter	1	[{"added": {}}]	4	1
2	2020-07-20 00:41:19.02222+03	3	userman	1	[{"added": {}}]	4	1
3	2020-07-20 00:41:45.396648+03	4	superman	1	[{"added": {}}]	4	1
4	2020-07-20 00:42:45.181905+03	1	Microsoft LCC	1	[{"added": {}}]	8	1
5	2020-07-20 00:43:05.321426+03	2	Tinkoff Mobile	1	[{"added": {}}]	8	1
6	2020-07-20 00:43:31.534262+03	3	Google inc	1	[{"added": {}}]	8	1
7	2020-07-20 00:43:52.057717+03	4	Tesla	1	[{"added": {}}]	8	1
8	2020-07-20 00:44:14.696636+03	5	Sberbank	1	[{"added": {}}]	8	1
9	2020-07-20 00:44:44.374714+03	6	Sony	1	[{"added": {}}]	8	1
10	2020-07-20 00:45:05.908875+03	7	Samsung	1	[{"added": {}}]	8	1
11	2020-07-20 00:45:26.143388+03	8	BMW	1	[{"added": {}}]	8	1
12	2020-07-20 00:45:48.417957+03	9	Adobe	1	[{"added": {}}]	8	1
13	2020-07-20 00:46:09.672496+03	10	Apple	1	[{"added": {}}]	8	1
14	2020-07-20 00:48:03.121686+03	1	Task number 1	1	[{"added": {}}]	9	1
15	2020-07-20 00:48:34.023866+03	2	Task number 2	1	[{"added": {}}]	9	1
16	2020-07-20 00:48:40.443632+03	1	Task number 1	2	[{"changed": {"fields": ["User"]}}]	9	1
17	2020-07-20 00:49:00.174593+03	3	Task number 3	1	[{"added": {}}]	9	1
18	2020-07-20 00:52:06.847102+03	1	Note for task number 2	1	[{"added": {}}]	10	1
19	2020-07-20 00:52:39.73236+03	2	Note for task number 2	1	[{"added": {}}]	10	1
20	2020-07-20 00:53:05.23343+03	3	Note for number task 3	1	[{"added": {}}]	10	1
21	2020-07-20 13:34:59.421935+03	11	Google inc	1	[{"added": {}}]	8	1
22	2020-07-20 13:35:16.436661+03	12	Sony	1	[{"added": {}}]	8	1
23	2020-07-20 13:35:37.291214+03	13	Tesla	1	[{"added": {}}]	8	1
24	2020-07-20 13:36:04.963968+03	14	Mercedes	1	[{"added": {}}]	8	1
25	2020-07-20 13:36:54.100272+03	15	Jeep	1	[{"added": {}}]	8	1
26	2020-07-20 13:37:14.058257+03	16	Yandex LCC	1	[{"added": {}}]	8	1
27	2020-07-20 13:37:27.887539+03	17	Sberbank	1	[{"added": {}}]	8	1
28	2020-07-21 00:26:32.047087+03	18	Sberbank	1	[{"added": {}}]	8	1
29	2020-07-21 00:27:02.694493+03	19	Yandex LCC	1	[{"added": {}}]	8	1
30	2020-07-21 00:27:28.588391+03	20	Jeep	1	[{"added": {}}]	8	1
31	2020-07-21 00:27:57.027876+03	21	Mercedes	1	[{"added": {}}]	8	1
32	2020-07-21 00:28:19.865086+03	22	Tesla	1	[{"added": {}}]	8	1
33	2020-07-21 00:28:53.890065+03	23	Sony	1	[{"added": {}}]	8	1
34	2020-07-21 00:29:22.246311+03	24	Google inc	1	[{"added": {}}]	8	1
35	2020-07-21 00:29:45.293472+03	25	Apple	1	[{"added": {}}]	8	1
36	2020-07-21 00:30:09.763876+03	26	Adobe	1	[{"added": {}}]	8	1
37	2020-07-21 00:30:32.153799+03	27	BMW	1	[{"added": {}}]	8	1
38	2020-07-27 00:01:37.807709+03	4	Zadacha 1	1	[{"added": {}}]	9	1
39	2020-07-27 00:02:09.047424+03	5	Zadacha 2	1	[{"added": {}}]	9	1
40	2020-07-27 13:36:43.17707+03	6	Zadacha 1	1	[{"added": {}}]	9	1
41	2020-07-27 13:37:12.739314+03	7	Zadacha 2	1	[{"added": {}}]	9	1
42	2020-07-27 16:26:11.697961+03	4	Call for clietn	1	[{"added": {}}]	10	1
43	2020-07-27 16:26:42.74562+03	4	Call for client	2	[{"changed": {"fields": ["Title"]}}]	10	1
44	2020-07-27 16:29:46.025017+03	4	Call for client	2	[{"changed": {"fields": ["Task"]}}]	10	1
45	2020-07-27 18:38:07.793547+03	4	Call for client	2	[{"changed": {"fields": ["Description"]}}]	10	1
46	2020-07-27 18:39:40.054571+03	7	Task 2 of JEEP Company	2	[{"changed": {"fields": ["Name", "Description"]}}]	9	1
47	2020-07-27 18:40:19.036288+03	6	Task 1 of JEEP Company	2	[{"changed": {"fields": ["Name", "Description"]}}]	9	1
48	2020-07-27 18:41:08.939019+03	5	Task 2 of Yandex Company	2	[{"changed": {"fields": ["Name"]}}]	9	1
49	2020-07-27 18:41:22.542205+03	4	Task 1 of Yandex Company	2	[{"changed": {"fields": ["Name"]}}]	9	1
50	2020-07-27 18:46:27.488908+03	8	Task 1 of Mercedes Company	1	[{"added": {}}]	9	1
51	2020-07-27 18:47:18.728374+03	9	Task 2 of Mercedes Company	1	[{"added": {}}]	9	1
52	2020-07-30 16:50:36.641281+03	5	Jeep note 2	1	[{"added": {}}]	10	1
53	2020-08-01 11:19:16.632489+03	34	GitHub Inc	2	[{"changed": {"fields": ["Members"]}}]	8	1
54	2020-08-01 11:19:30.018277+03	35	My Company	2	[{"changed": {"fields": ["Members"]}}]	8	1
55	2020-08-01 11:19:40.774531+03	27	BMW MM	2	[{"changed": {"fields": ["Members"]}}]	8	1
56	2020-08-01 11:27:51.745635+03	34	GitHub Inc	2	[{"changed": {"fields": ["Members"]}}]	8	1
57	2020-08-01 11:28:14.474688+03	34	GitHub Inc	2	[{"changed": {"fields": ["Members"]}}]	8	1
58	2020-08-01 11:29:09.453043+03	5	login	1	[{"added": {}}]	4	1
59	2020-08-01 13:20:21.95456+03	5	login	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
60	2020-08-01 16:48:03.496255+03	2	websofter	2	[]	7	1
61	2020-08-01 17:12:29.282345+03	2	websofter	2	[{"changed": {"fields": ["Role"]}}]	7	1
62	2020-08-01 17:12:39.029061+03	1	advertiser	2	[{"changed": {"fields": ["Role"]}}]	7	1
63	2020-08-03 15:26:03.875616+03	35	BBC INC	2	[{"changed": {"fields": ["Members"]}}]	8	1
64	2020-08-03 17:37:39.525141+03	35	BBC INC	2	[{"changed": {"fields": ["User", "Status", "Theme"]}}]	8	1
65	2020-08-03 17:37:47.488998+03	35	BBC INC	2	[{"changed": {"fields": ["User"]}}]	8	1
66	2020-08-03 17:37:55.968418+03	35	BBC INC	2	[{"changed": {"fields": ["User"]}}]	8	1
67	2020-08-04 16:52:02.326249+03	36	New Comp LCC	1	[{"added": {}}]	8	1
68	2020-08-04 17:12:47.720189+03	1	My New Task	1	[{"added": {}}]	9	1
69	2020-08-04 17:13:31.736608+03	1	Calling for client	1	[{"added": {}}]	10	1
70	2020-08-05 12:02:17.437293+03	6	baron	1	[{"added": {}}]	4	1
71	2020-08-05 12:02:59.935566+03	6	baron	2	[]	4	1
72	2020-08-05 12:41:28.708071+03	6	baron	2	[{"changed": {"fields": ["Active", "Staff status"]}}]	4	1
73	2020-08-05 12:49:45.569097+03	3	credi TV	1	[{"added": {}}]	9	1
74	2020-08-05 13:29:28.694366+03	4	superman	2	[{"changed": {"fields": ["User pic"]}}]	7	1
75	2020-08-05 13:30:19.656695+03	4	superman	2	[{"changed": {"fields": ["User pic"]}}]	7	1
76	2020-08-06 10:08:30.94352+03	33	file/2020/08/05/keukeukekuee_xowRc18.png	3		11	1
77	2020-08-06 10:08:30.957131+03	32	file/2020/08/05/keukeukekuee_PMPRDuB.png"	3		11	1
78	2020-08-06 10:08:30.963205+03	30	file/2020/08/05/keukeukekuee_KpNchNx.png"	3		11	1
79	2020-08-06 10:08:30.967763+03	29	file/2020/08/05/keukeukekuee_Tvx1I0d.png"	3		11	1
80	2020-08-06 10:08:30.971929+03	28	file/2020/08/05/keukeukekuee_9BiRZnX.png"	3		11	1
81	2020-08-06 10:08:30.979048+03	27	file/2020/08/05/keukeukekuee.png"	3		11	1
82	2020-08-06 10:08:30.994251+03	11	file/2020/08/05/keukeukekuee.png	3		11	1
83	2020-08-06 10:08:45.655572+03	35	file/2020/08/06/Arhiv s kirillicheskim nazvaniem.zip	3		11	1
84	2020-08-06 10:08:45.662069+03	34	file/2020/08/05/Vuex Crash Course Vladilen.zip	3		11	1
164	2020-08-16 15:21:31.786401+03	4	Моя ссылка	1	[{"added": {}}]	12	1
85	2020-08-06 10:08:45.666699+03	31	file/2020/08/05/Kupibilet_order_ru_6193085721 (1).pdf	3		11	1
86	2020-08-06 10:08:45.676937+03	26	file/2020/08/05/8iMAX2fvg1Y_OcT48mq.jpg	3		11	1
87	2020-08-06 10:08:45.6818+03	25	file/8iMAX2fvg1Y.jpg	3		11	1
88	2020-08-06 10:08:45.705032+03	10	file/2020/08/05/8iMAX2fvg1Y_IZCyyIV.jpg	3		11	1
89	2020-08-06 10:08:45.731719+03	9	file/2020/08/05/8iMAX2fvg1Y_Eagy9vI.jpg	3		11	1
90	2020-08-06 10:08:45.736815+03	8	file/2020/08/05/8iMAX2fvg1Y.jpg	3		11	1
91	2020-08-06 10:08:45.757773+03	7	file/% Y/% m/% d/8iMAX2fvg1Y.jpg	3		11	1
92	2020-08-06 10:08:45.772949+03	6	1385452056_718031351_JdnSWFk.jpg	3		11	1
93	2020-08-06 10:08:45.786792+03	5	1385452056_718031351.jpg	3		11	1
94	2020-08-06 10:08:45.799149+03	4	9f7bea46670ffcc656accfb2e282ded1_XL.jpg	3		11	1
95	2020-08-06 10:08:45.805243+03	3	Screenshot_2020-08-03-21-56-28_ru.yandex.money.png	3		11	1
96	2020-08-06 10:08:45.81839+03	2	b7HIKN8r9m4.jpg	3		11	1
97	2020-08-06 10:08:45.823042+03	1	my-image.jpg	3		11	1
98	2020-08-06 13:26:39.550997+03	36	New Comp LCC	2	[{"changed": {"fields": ["User", "Members"]}}]	8	1
99	2020-08-06 14:40:42.747133+03	49	New Company 222	1	[{"added": {}}]	8	1
100	2020-08-06 21:21:33.070255+03	6	baron	3		4	1
101	2020-08-10 08:38:13.844841+03	7	robert	1	[{"added": {}}]	4	1
102	2020-08-10 08:38:38.007546+03	7	robert	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
103	2020-08-10 10:09:50.061356+03	15	DNS	2	[{"changed": {"fields": ["Name"]}}]	9	1
104	2020-08-10 20:26:18.05831+03	7	robert	2	[{"changed": {"fields": ["First name", "Second name", "Description", "User pic", "Phone"]}}]	7	1
105	2020-08-10 20:26:26.640152+03	7	robert	2	[{"changed": {"fields": ["First name"]}}]	7	1
106	2020-08-11 21:51:44.003937+03	35	Сбор данных	1	[{"added": {}}]	9	1
107	2020-08-12 09:21:06.007471+03	1	Новая задача	1	[{"added": {}}]	9	1
108	2020-08-12 09:21:43.218748+03	2	Шаблон задачи 1	1	[{"added": {}}]	9	1
109	2020-08-12 09:21:59.340719+03	1	Шаблон задачи 2	2	[{"changed": {"fields": ["Name"]}}]	9	1
110	2020-08-12 09:22:36.308784+03	3	Шаблон задачи 3	1	[{"added": {}}]	9	1
111	2020-08-12 09:22:53.182375+03	4	Шаблон задачи 4	1	[{"added": {}}]	9	1
112	2020-08-12 09:24:55.674926+03	5	Шаблон задачи 5	1	[{"added": {}}]	9	1
113	2020-08-12 16:18:15.449758+03	6	Yandex task	1	[{"added": {}}]	9	1
114	2020-08-12 17:44:36.643456+03	16	Шаблон задачи 6	1	[{"added": {}}]	9	1
115	2020-08-13 04:10:25.717014+03	1	advertiser	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
116	2020-08-13 04:10:49.840742+03	7	robert	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
117	2020-08-13 04:11:14.041014+03	3	userman	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
118	2020-08-13 04:11:38.219034+03	2	websofter	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
119	2020-08-13 04:11:54.948842+03	4	superman	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
120	2020-08-13 04:12:19.34385+03	8	mylogin	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
121	2020-08-13 04:13:37.985145+03	12	mylogin9	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
122	2020-08-13 04:13:55.108127+03	11	mylogin8	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
123	2020-08-13 04:14:17.636279+03	20	mylogin19	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
124	2020-08-13 04:16:31.955483+03	9	mylogin1	3		4	1
125	2020-08-13 04:16:31.963577+03	13	mylogin10	3		4	1
126	2020-08-13 04:16:31.967584+03	14	mylogin11	3		4	1
127	2020-08-13 04:16:31.971424+03	15	mylogin12	3		4	1
128	2020-08-13 04:16:31.975532+03	16	mylogin13	3		4	1
129	2020-08-13 04:16:31.980757+03	17	mylogin14	3		4	1
130	2020-08-13 04:16:31.98635+03	18	mylogin15	3		4	1
131	2020-08-13 04:16:31.990915+03	19	mylogin16	3		4	1
132	2020-08-13 04:16:32.00159+03	10	mylogin2	3		4	1
133	2020-08-13 09:29:00.723673+03	17	ДН	1	[{"added": {}}]	9	1
134	2020-08-13 11:03:04.632381+03	12	mylogin9	2	[{"changed": {"fields": ["Status", "Role"]}}]	7	1
135	2020-08-13 11:03:15.449804+03	25	electra1	2	[{"changed": {"fields": ["Status", "Role"]}}]	7	1
136	2020-08-13 11:03:22.658895+03	24	electra	2	[{"changed": {"fields": ["Status", "Role"]}}]	7	1
137	2020-08-13 11:03:29.010163+03	22	ritam	2	[{"changed": {"fields": ["Status", "Role"]}}]	7	1
138	2020-08-13 11:03:38.35001+03	23	Marina	2	[{"changed": {"fields": ["Status", "Gender", "Role"]}}]	7	1
139	2020-08-13 11:03:53.542993+03	26	electra2	2	[{"changed": {"fields": ["Status", "Gender", "Role"]}}]	7	1
140	2020-08-13 11:08:20.404296+03	25	electra1	2	[{"changed": {"fields": ["Gender", "Role"]}}]	7	1
141	2020-08-13 11:09:01.257053+03	1	advertiser	2	[{"changed": {"fields": ["About", "Status"]}}]	7	1
142	2020-08-13 11:11:17.26102+03	2	websofter	2	[{"changed": {"fields": ["About", "User pic", "Status", "Role"]}}]	7	1
143	2020-08-13 11:18:10.802381+03	1	advertiser	2	[{"changed": {"fields": ["User pic"]}}]	7	1
144	2020-08-13 11:20:47.095134+03	3	userman	2	[{"changed": {"fields": ["User pic", "Status", "Role"]}}]	7	1
145	2020-08-13 11:21:32.329051+03	4	superman	2	[{"changed": {"fields": ["User pic", "Status", "Role"]}}]	7	1
146	2020-08-13 11:21:50.172605+03	5	login	2	[{"changed": {"fields": ["User pic", "Status", "Role"]}}]	7	1
147	2020-08-13 11:22:08.462403+03	7	robert	2	[{"changed": {"fields": ["Status", "Role"]}}]	7	1
148	2020-08-13 11:22:39.197133+03	21	helloWorld	3		7	1
149	2020-08-13 11:22:39.20186+03	20	mylogin19	3		7	1
150	2020-08-13 11:22:39.205191+03	12	mylogin9	3		7	1
151	2020-08-13 11:22:39.208473+03	11	mylogin8	3		7	1
152	2020-08-13 11:22:53.580876+03	22	ritam	2	[{"changed": {"fields": ["User pic", "Gender", "Role"]}}]	7	1
153	2020-08-13 11:23:13.639954+03	22	ritam	2	[{"changed": {"fields": ["About"]}}]	7	1
154	2020-08-13 11:23:38.760384+03	23	Marina	2	[{"changed": {"fields": ["About", "User pic", "Status"]}}]	7	1
155	2020-08-13 11:24:02.487887+03	24	electra	2	[{"changed": {"fields": ["About", "User pic", "Gender", "Role"]}}]	7	1
156	2020-08-13 11:24:18.643711+03	25	electra1	2	[{"changed": {"fields": ["User pic"]}}]	7	1
157	2020-08-13 11:24:47.456534+03	26	electra2	2	[{"changed": {"fields": ["User pic"]}}]	7	1
158	2020-08-13 11:25:11.44936+03	26	electra2	3		7	1
159	2020-08-13 11:25:11.455648+03	25	electra1	3		7	1
160	2020-08-13 11:26:13.111624+03	8	mylogin	2	[{"changed": {"fields": ["Status", "Gender", "Role"]}}]	7	1
161	2020-08-13 11:31:29.844261+03	8	mylogin	2	[]	7	1
162	2020-08-13 11:52:59.877953+03	2	websofter	2	[{"changed": {"fields": ["Role"]}}]	7	1
163	2020-08-16 15:21:04.158697+03	3	Задача компании 1	1	[{"added": {}}]	12	1
165	2020-08-16 15:21:44.476135+03	29	Шаблон задачи 6	2	[{"changed": {"fields": ["Links"]}}]	9	1
166	2020-08-16 15:23:00.749644+03	3	Моя новая ссылка	2	[{"changed": {"fields": ["Title"]}}]	12	1
167	2020-08-16 15:31:51.923599+03	18	Шаблон задачи 1	2	[{"changed": {"fields": ["Links"]}}]	9	1
168	2020-08-16 15:32:05.81974+03	18	Шаблон задачи 1	2	[]	9	1
169	2020-08-16 15:55:44.80047+03	5	Ссылка на что-то важное	1	[{"added": {}}]	12	1
170	2020-08-16 15:55:51.845437+03	18	Шаблон задачи 1	2	[{"changed": {"fields": ["Links"]}}]	9	1
171	2020-08-16 19:54:32.58898+03	6	My new link	1	[{"added": {}}]	12	1
172	2020-08-17 00:42:38.735365+03	12	Ссылка к шаблонной задаче	1	[{"added": {}}]	12	1
173	2020-08-17 00:42:46.657746+03	17	ДН	2	[{"changed": {"fields": ["Links"]}}]	9	1
174	2020-08-17 00:43:15.943066+03	16	Шаблон задачи 6	2	[{"changed": {"fields": ["Links"]}}]	9	1
175	2020-08-17 00:43:30.929679+03	5	Шаблон задачи 5	2	[{"changed": {"fields": ["Links"]}}]	9	1
176	2020-08-17 00:43:38.459272+03	4	Шаблон задачи 4	2	[{"changed": {"fields": ["Links"]}}]	9	1
177	2020-09-02 18:44:56.992962+03	122	Hello World	3		9	1
178	2020-09-02 18:44:57.005105+03	121	Hello World	3		9	1
179	2020-09-02 18:44:57.009131+03	120	Шаблон задачи 6	3		9	1
180	2020-09-02 18:44:57.013075+03	119	Шаблон задачи 6	3		9	1
181	2020-09-02 18:44:57.016873+03	118	Шаблон задачи 5	3		9	1
182	2020-09-02 18:44:57.021174+03	117	Шаблон задачи 3	3		9	1
183	2020-09-02 18:44:57.025435+03	116	Шаблон задачи 1	3		9	1
184	2020-09-02 18:44:57.030823+03	115	Шаблон задачи 6	3		9	1
185	2020-09-02 18:44:57.034958+03	114	Шаблон задачи 6	3		9	1
186	2020-09-02 18:44:57.038846+03	113	Шаблон задачи 2	3		9	1
187	2020-09-02 18:44:57.043519+03	112	Шаблон задачи 6	3		9	1
188	2020-09-02 18:44:57.049976+03	111	Шаблон задачи 5	3		9	1
189	2020-09-02 18:44:57.054342+03	110	Шаблон задачи 3	3		9	1
190	2020-09-02 18:44:57.059126+03	109	Шаблон задачи 1	3		9	1
191	2020-09-02 18:44:57.062634+03	108	Шаблон задачи 2	3		9	1
192	2020-09-02 18:44:57.066399+03	107	ДН	3		9	1
193	2020-09-02 18:44:57.070762+03	106	Шаблон задачи 1	3		9	1
194	2020-09-02 18:44:57.077253+03	105	Шаблон задачи 6	3		9	1
195	2020-09-02 18:44:57.083424+03	104	Шаблон задачи 6	3		9	1
196	2020-09-02 18:44:57.089365+03	103	Шаблон задачи 5	3		9	1
197	2020-09-02 18:44:57.093759+03	102	Шаблон задачи 3	3		9	1
198	2020-09-02 18:44:57.097537+03	101	Шаблон задачи 1	3		9	1
199	2020-09-02 18:44:57.101139+03	100	Шаблон задачи 2	3		9	1
200	2020-09-02 18:44:57.104775+03	99	Шаблон задачи 6	3		9	1
201	2020-09-02 18:44:57.109522+03	98	Шаблон задачи 6	3		9	1
202	2020-09-03 07:05:46.79535+03	86		3		10	1
203	2020-09-03 07:17:15.406376+03	89	Programmer	1	[{"added": {}}]	10	1
204	2020-09-03 14:06:52.986561+03	141	Шаблон задачи 2	3		9	1
205	2020-09-03 14:06:53.000407+03	140	Шаблон новой задачи	3		9	1
206	2020-09-03 14:06:53.005298+03	139	Шаблон задачи 6	3		9	1
207	2020-09-03 14:06:53.008992+03	138	Шаблон задачи 5	3		9	1
208	2020-09-03 14:06:53.013111+03	137	Шаблон задачи 3	3		9	1
209	2020-09-03 14:06:53.01717+03	136	Шаблон задачи 2	3		9	1
210	2020-09-03 14:06:53.021491+03	135	Шаблон задачи 1	3		9	1
211	2020-09-03 14:06:53.025791+03	134	Шаблон задачи 1	3		9	1
212	2020-09-03 14:06:53.030518+03	133	Шаблон задачи 6	3		9	1
213	2020-09-03 14:06:53.03488+03	17	ДН	3		9	1
214	2020-09-03 14:06:53.03981+03	16	Шаблон задачи 6	3		9	1
215	2020-09-03 14:06:53.046026+03	5	Шаблон задачи 5	3		9	1
216	2020-09-03 14:06:53.050424+03	3	Шаблон задачи 3	3		9	1
217	2020-09-03 14:06:53.058216+03	2	Шаблон задачи 1	3		9	1
218	2020-09-05 08:26:12.467909+03	33	tytytytytytyy	2	[{"changed": {"fields": ["User pic"]}}]	7	1
219	2020-09-05 08:26:41.07255+03	33	tytytytytytyy	2	[]	7	1
220	2020-09-05 08:28:24.249555+03	33	tytytytytytyy	2	[{"changed": {"fields": ["User pic"]}}]	7	1
221	2020-09-05 08:28:51.478416+03	33	tytytytytytyy	2	[{"changed": {"fields": ["User pic"]}}]	7	1
222	2020-09-08 09:37:24.998726+03	34	tytytytytytyy2	3		7	1
223	2020-09-08 09:37:25.021524+03	33	tytytytytytyy	3		7	1
224	2020-09-08 09:37:39.688718+03	33	tytytytytytyy	3		4	1
225	2020-09-08 09:37:39.698004+03	34	tytytytytytyy2	3		4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	account	account
8	company	company
9	task	task
10	task	note
11	upload	file
12	task	link
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-07-19 21:51:56.648585+03
2	auth	0001_initial	2020-07-19 21:51:56.758448+03
4	admin	0001_initial	2020-07-19 21:51:56.946331+03
5	admin	0002_logentry_remove_auto_add	2020-07-19 21:51:56.996236+03
6	admin	0003_logentry_add_action_flag_choices	2020-07-19 21:51:57.01865+03
7	contenttypes	0002_remove_content_type_name	2020-07-19 21:51:57.052717+03
8	auth	0002_alter_permission_name_max_length	2020-07-19 21:51:57.066191+03
9	auth	0003_alter_user_email_max_length	2020-07-19 21:51:57.090249+03
10	auth	0004_alter_user_username_opts	2020-07-19 21:51:57.119521+03
11	auth	0005_alter_user_last_login_null	2020-07-19 21:51:57.139702+03
12	auth	0006_require_contenttypes_0002	2020-07-19 21:51:57.145104+03
13	auth	0007_alter_validators_add_error_messages	2020-07-19 21:51:57.163118+03
14	auth	0008_alter_user_username_max_length	2020-07-19 21:51:57.186021+03
15	auth	0009_alter_user_last_name_max_length	2020-07-19 21:51:57.201935+03
16	auth	0010_alter_group_name_max_length	2020-07-19 21:51:57.218684+03
17	auth	0011_update_proxy_permissions	2020-07-19 21:51:57.238826+03
18	company	0001_initial	2020-07-19 21:51:57.270842+03
19	company	0002_auto_20200715_1247	2020-07-19 21:51:57.311338+03
20	company	0003_task	2020-07-19 21:51:57.341686+03
21	company	0004_delete_task	2020-07-19 21:51:57.37175+03
22	sessions	0001_initial	2020-07-19 21:51:57.417028+03
32	upload	0001_initial	2020-07-30 14:41:46.002645+03
37	upload	0002_auto_20200806_1018	2020-08-06 13:18:53.012926+03
46	task	0001_initial	2020-08-12 09:20:21.634123+03
47	task	0002_auto_20200806_1018	2020-08-12 09:20:21.700025+03
48	task	0003_auto_20200810_1701	2020-08-12 09:20:21.722003+03
49	task	0004_auto_20200811_1234	2020-08-12 09:20:21.765075+03
50	task	0005_auto_20200811_1838	2020-08-12 09:20:21.793277+03
51	task	0006_auto_20200811_1838	2020-08-12 09:20:21.818506+03
52	task	0007_auto_20200811_1839	2020-08-12 09:20:21.841796+03
53	task	0008_auto_20200812_0557	2020-08-12 09:20:21.913058+03
54	task	0009_auto_20200812_0620	2020-08-12 09:20:21.957469+03
55	task	0010_auto_20200812_0623	2020-08-12 09:24:00.354101+03
57	task	0011_auto_20200813_0017	2020-08-13 03:18:03.854094+03
59	task	0012_auto_20200813_0509	2020-08-13 08:09:24.750301+03
61	task	0013_auto_20200813_0529	2020-08-13 08:29:24.137989+03
62	account	0001_initial	2020-08-13 11:02:11.487656+03
63	task	0014_auto_20200813_0751	2020-08-13 11:02:11.495534+03
64	task	0015_auto_20200813_0753	2020-08-13 11:02:11.501484+03
65	task	0016_auto_20200813_0754	2020-08-13 11:02:11.507862+03
66	task	0017_auto_20200813_0755	2020-08-13 11:02:11.514578+03
67	task	0018_auto_20200813_0801	2020-08-13 11:02:11.522077+03
68	task	0019_auto_20200814_1245	2020-08-14 15:45:56.397245+03
69	upload	0003_file_status	2020-08-14 15:45:56.41989+03
70	task	0020_auto_20200816_1202	2020-08-16 15:02:52.067293+03
71	task	0021_auto_20200816_1208	2020-08-16 15:08:38.078011+03
72	task	0022_auto_20200816_1217	2020-08-16 15:17:32.715717+03
73	task	0023_auto_20200816_1220	2020-08-16 15:20:31.470496+03
74	task	0024_auto_20200903_0403	2020-09-03 07:03:23.456445+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
v56tgm3p1p5c9j2pozebkynf5mfgtk0v	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-08-03 00:39:29.189323+03
z3yjz06ak1kk2rqr4mvjxjgrf6400kex	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-08-19 12:01:08.193244+03
4rzfa4eng14tj1s422x05glcrph87f73	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-08-26 08:58:15.753146+03
d4cr61aztfoicqcmo59a4r1h8ayvrpfi	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-08-27 09:28:33.422162+03
3yeos5rhbgjztjsc43tv7xe23i4vjjwy	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-09-02 23:24:34.692315+03
1v9o1kzwe6arruld68jmv7bgaq3ihcod	MTQ4OTY4MzRjNDIyZjY0OWEzMjY5M2M2ZDZjMzFlY2NkOTZlNzliYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YzAxNTM3MTIyMjRhYzdmM2VmN2QyZjVmOWNiZjI4NWQwNzk1YmVmIn0=	2020-09-10 07:19:18.749078+03
\.


--
-- Data for Name: task_link; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.task_link (id, link, title, date) FROM stdin;
4	https://www.google.com/search?q=%D0%B3%D0%BA%D0%B4+%D0%B0%D1%88%D1%83%D0%B4%D0%B2+%D0%B2%D0%BE%D1%84%D1%82%D0%BF%D1%89&oq=%D0%B3%D0%BA%D0%B4+%D0%B0%D1%88%D1%83%D0%B4%D0%B2+%D0%B2%D0%BE%D1%84%D1%82%D0%	Моя ссылка	2020-08-16 15:21:31.783375+03
3	https://www.geeksforgeeks.org/slugfield-django-models/	Моя новая ссылка	2020-08-16 15:21:04.155292+03
5	https://www.phpclasses.org/browse/class/130.html	Ссылка на что-то важное	2020-08-16 15:55:44.797167+03
6	https://stackoverflow.com/questions/52607950/pass-variable-non-model-field-to-serializer-in-django-rest-framework	My new link	2020-08-16 19:54:32.586708+03
7	https://crm.wsofter.ru:8000/api/link/	New link	2020-08-16 23:54:08.346827+03
8	https://www.phpclasses.org/post_forum_message.html?blog=PHP-Classes-blog&post=793	Еще одна ссылочка	2020-08-17 00:07:09.028979+03
9	https://docs.github.com/en/enterprise/2.21/admin	Новая ссылка	2020-08-17 00:13:53.559873+03
10	https://docs.github.com/en/enterprise/2.21/admin	Ссылка на GitHub	2020-08-17 00:16:38.798971+03
11	https://docs.github.com/en/enterprise/2.21/admin	Ссылка на GitHub	2020-08-17 00:18:04.843411+03
12	https://crm.wsofter.ru:8000/admin/task/task/17/change/	Ссылка к шаблонной задаче	2020-08-17 00:42:38.731146+03
13	https://docs.google.com/document/d/1zhAfPYj1d4uNy4WQPmQuWSRgxNNjSUoU/edit	отчет	2020-08-17 18:16:46.774943+03
14	http://test.com	test link	2020-08-27 10:56:19.855573+03
15	http://tes.com	test	2020-08-27 10:57:58.796812+03
16	http://tes.com	test	2020-08-27 10:57:58.943679+03
\.


--
-- Data for Name: task_note; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.task_note (id, title, files, description, status, date_start, date_end, task_id, user_id, date_created) FROM stdin;
11		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:31.116227+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
3		{}	<p>ркпрварвпрвпр</p>	1	2020-08-14 09:43:13.895339+03	2020-08-21 09:00:24.370594+03	23	2	2020-09-03 07:03:23.364161+03
2		{}	блаблаблабла	1	2020-08-14 11:05:49.268514+03	2020-08-21 09:00:24.370594+03	18	2	2020-09-03 07:03:23.364161+03
12		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:34.641411+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
13		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:37.682708+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
14		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:44.570372+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
15		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:48.240003+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
44		{}	Hi my dear 1212	1	2020-08-28 09:37:16.971706+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
5		{}	<p>вапвапвапва</p>	1	2020-08-15 03:10:25.767882+03	2020-08-21 21:59:11.623435+03	19	1	2020-09-03 07:03:23.364161+03
42		{1567}	Your notye 13	1	2020-08-28 09:27:28.943714+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
46		{}	Me is 25 252 5	1	2020-08-28 09:37:30.29983+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
50		{1611,1612}	Ok, do you think YES?	1	2020-09-01 12:20:11.691196+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
4		{1540,1541,1558,1559}	Привет, это новая заметка	1	2020-08-17 09:05:05.495112+03	2020-08-21 10:59:41.291071+03	18	2	2020-09-03 07:03:23.364161+03
6		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:12.045528+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
7		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:16.829778+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
8		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:20.133793+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
9		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:23.636712+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
10		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:27.51552+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
16		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:51.725493+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
17		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:55.470897+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
18		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:27:58.53625+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
19		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:01.773744+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
20		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:04.965068+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
21		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:09.0168+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
22		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:12.587555+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
23		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:15.993225+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
24		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:20.881032+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
25		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:29.929335+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
26		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:32.632046+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
43		{}	<p>It is my note</p>	1	2020-08-27 07:48:38.918877+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
45		{}	<p>How old are you Jack?</p>	1	2020-08-27 07:49:08.083748+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
47		{}	<p>Nice, good boy</p>	1	2020-08-27 07:49:24.999178+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
49		{}	<p>I am from New York</p>	1	2020-08-27 07:49:43.474937+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
27		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:36.109992+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
28		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:39.757362+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
29		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:43.120725+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
30		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:50.473578+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
31		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:28:53.422913+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
32		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:00.189779+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
33		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:04.644204+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
34		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:07.988334+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
35		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:16.016107+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
36		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:19.714634+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
37		{}	<p><span style="color: rgb(0, 0, 0);">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст..&nbsp;</span></p>	1	2020-08-17 09:29:23.355537+03	2020-08-24 00:49:25.760329+03	18	2	2020-09-03 07:03:23.364161+03
38		{}	<p><strong><em>gfhfghfghfghfgh</em></strong></p>	1	2020-08-17 11:39:43.476459+03	2020-08-24 00:49:25.760329+03	41	2	2020-09-03 07:03:23.364161+03
40		{1563}	New Note 4	1	2020-08-31 09:21:31.721448+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
41		{1564,1569,1570}	Hello note 5 6	1	2020-08-28 15:18:31.566522+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
52		{}	<p>I am working</p>	1	2020-08-27 07:50:36.258057+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
53		{}	<p>I am walking</p>	1	2020-08-27 07:50:46.852973+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
54		{}	<p>Ok ok ok</p>	1	2020-08-27 07:50:57.169545+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
55		{}	<p>I do not think</p>	1	2020-08-27 07:51:06.860323+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
58		{}	<p>Lets me go</p>	1	2020-08-27 07:51:29.573539+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
59		{}	<p>No i fine</p>	1	2020-08-27 07:51:40.041362+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
60		{}	<p>Hi patty</p>	1	2020-08-27 07:51:50.439718+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
61		{}	<p>Hello</p>	1	2020-08-27 09:12:12.377994+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
62		{}	<p>Hello</p>	1	2020-08-27 13:57:10.561488+03	2020-09-03 07:28:20.695719+03	64	2	2020-09-03 07:03:23.364161+03
48		{1566}	Where you live 666	1	2020-08-28 09:19:22.378269+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
64		{1568}	<p>New NOTE REDMI 10</p>	1	2020-08-28 09:40:32.217542+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
65		{1571}	<p>Note 9 PRO</p>	1	2020-08-28 15:20:37.348709+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
66		{1573}	<p>Hello World</p>	1	2020-08-28 16:53:49.364351+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
67		{1574}	<p>New note added XXXXXXX</p>	1	2020-08-31 09:29:42.246579+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
68		{1575}	<p>It is my note 9999999999</p>	1	2020-08-31 09:46:35.440338+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
69		{1576}	<p>Hello world! New Note</p>	1	2020-08-31 09:49:51.597704+03	2020-09-04 09:38:59.508125+03	55	2	2020-09-03 07:03:23.364161+03
70		{1577,1578}	<p>Ту аааа</p>	1	2020-08-31 11:25:16.797326+03	2020-09-07 10:55:46.362302+03	55	2	2020-09-03 07:03:23.364161+03
71		{1579}	<p>New note 89898989</p>	1	2020-08-31 11:27:43.50525+03	2020-09-07 10:55:46.362302+03	55	2	2020-09-03 07:03:23.364161+03
72		{1580,1581}	<p>New note EEEEEEEEEEEE</p>	1	2020-08-31 11:31:17.923449+03	2020-09-07 10:55:46.362302+03	55	2	2020-09-03 07:03:23.364161+03
73		{1585,1586,1588}	<p>Новая заметка 787878787</p>	1	2020-08-31 11:47:40.362076+03	2020-09-07 11:45:50.708702+03	55	2	2020-09-03 07:03:23.364161+03
74		{1589,1590}	<p>ПРвиет Мир!</p>	1	2020-08-31 11:53:44.868589+03	2020-09-07 11:45:50.708702+03	55	2	2020-09-03 07:03:23.364161+03
75		{1591,1592}	<p>Hello World!!!!</p>	1	2020-08-31 12:02:41.550873+03	2020-09-07 11:45:50.708702+03	55	2	2020-09-03 07:03:23.364161+03
76		{1593,1594}	<p>It is new note</p>	1	2020-08-31 12:08:25.973122+03	2020-09-07 11:45:50.708702+03	55	2	2020-09-03 07:03:23.364161+03
77		{1596,1597}	<p>DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD</p>	1	2020-08-31 12:25:45.925344+03	2020-09-07 11:45:50.708702+03	55	2	2020-09-03 07:03:23.364161+03
78		{1605,1607}	<p>eeeeeeeeeffef</p>	1	2020-08-31 12:33:10.944792+03	2020-09-07 12:32:54.468561+03	55	2	2020-09-03 07:03:23.364161+03
79		{1608,1609}	<p>ew5yt4y445y56y</p>	1	2020-08-31 12:39:15.323482+03	2020-09-07 12:37:23.021998+03	55	2	2020-09-03 07:03:23.364161+03
80		{1610}	<p>Hello World! RRRRRRRRRRR</p>	1	2020-08-31 14:15:52.99086+03	2020-09-07 13:38:20.547991+03	55	2	2020-09-03 07:03:23.364161+03
81		{1613,1614}	<p>New <strong style="color: rgb(230, 0, 0);">Note<span class="ql-cursor">﻿</span></strong></p>	1	2020-09-01 12:28:14.570185+03	2020-09-08 06:49:44.301829+03	55	2	2020-09-03 07:03:23.364161+03
82		{1625}	<p>Hello</p>	1	2020-09-01 14:49:11.086662+03	2020-09-08 06:49:44.301829+03	55	2	2020-09-03 07:03:23.364161+03
83		{1626,1627}	<p>New Note Hello!</p>	1	2020-09-01 14:57:43.001136+03	2020-09-08 06:49:44.301829+03	55	2	2020-09-03 07:03:23.364161+03
84		{1628}	<p>NEW NOTEEEEEEEEEEEEEEEEEEEEEEEEEE</p>	1	2020-09-01 18:03:18.799863+03	2020-09-08 06:49:44.301829+03	55	2	2020-09-03 07:03:23.364161+03
85		{}	<p>Yessssssss</p>	1	2020-09-01 18:07:31.657397+03	2020-09-08 06:49:44.301829+03	55	2	2020-09-03 07:03:23.364161+03
56		{}	It is not good idea 12	1	2020-09-03 06:36:05.2191+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
57		{}	I am sure 12	1	2020-09-03 06:36:57.277073+03	2020-09-03 07:28:20.695719+03	55	2	2020-09-03 07:03:23.364161+03
87		{}	New note on 03.09.2020 UPT	1	2020-09-03 07:10:59.713865+03	2020-09-10 07:06:13.821421+03	55	2	2020-09-03 07:10:59.7139+03
89	Programmer	{}	HHHHHHHHHHHHH	1	2020-09-03 07:17:15.398978+03	2020-09-10 07:08:17+03	55	1	2020-09-03 07:17:15.39903+03
90		{}	<p>Hello</p>	1	2020-09-03 08:02:55.460673+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:02:55.46571+03
91		{}	<p>New Hello!</p>	1	2020-09-03 08:13:08.588386+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:13:08.588802+03
92		{}	<p>Ok this Note</p>	1	2020-09-03 08:19:11.39688+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:19:11.39706+03
93		{}	<p>End fixed</p>	1	2020-09-03 08:25:03.398607+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:25:03.398891+03
94		{}	<p>New fixed note</p>	1	2020-09-03 08:30:20.698641+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:30:20.698797+03
95		{}	<p>Как дела у нас?</p>	1	2020-09-03 08:33:18.526731+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:33:18.526899+03
96		{}	<p>Все хорошо там?</p>	1	2020-09-03 08:34:21.797543+03	2020-09-10 07:08:17.973587+03	55	2	2020-09-03 08:34:21.797654+03
\.


--
-- Data for Name: task_task; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.task_task (id, name, description, status, date_start, date_end, company_id, auto_join, date_created) FROM stdin;
6	Yandex task	Описание таска	1	2020-08-12 16:18:15.446826+03	2020-08-12 16:18:15.446857+03	19	f	2020-09-03 07:03:23.425478+03
1	Шаблон задачи 1	Описание новой задачи	1	2020-09-03 15:15:44.125872+03	2020-09-03 15:15:44.125897+03	\N	t	2020-09-03 15:15:44.125904+03
29	Шаблон задачи 6	Описание шаблона задачи 6	3	2020-08-16 23:34:02.529193+03	2020-08-16 23:34:02.529207+03	87	t	2020-09-03 07:03:23.425478+03
54	Шаблон задачи 2	Описание новой задачи	1	2020-08-18 15:32:58.039478+03	2020-08-18 15:32:58.039525+03	90	t	2020-09-03 07:03:23.425478+03
27	Шаблон задачи 3	Описание новой задачи	3	2020-08-16 23:34:47.794925+03	2020-08-16 23:34:47.794938+03	87	t	2020-09-03 07:03:23.425478+03
21	Шаблон задачи 3	Описание новой задачи	1	2020-08-14 09:06:55.689132+03	2020-08-14 09:06:55.689174+03	86	t	2020-09-03 07:03:23.425478+03
22	Шаблон задачи 5	Шаблон задачи	1	2020-08-14 09:06:55.69516+03	2020-08-14 09:06:55.695202+03	86	t	2020-09-03 07:03:23.425478+03
23	Шаблон задачи 6	Описание шаблона задачи 6	1	2020-08-14 09:06:55.80225+03	2020-08-14 09:06:55.802286+03	86	t	2020-09-03 07:03:23.425478+03
57	Шаблон задачи 3	Описание новой задачи	1	2020-08-18 16:37:47.411622+03	2020-08-18 16:37:47.411655+03	91	t	2020-09-03 07:03:23.425478+03
58	Шаблон задачи 6	Описание шаблона задачи 6	1	2020-08-18 19:14:19.153403+03	2020-08-18 19:14:19.15347+03	91	t	2020-09-03 07:03:23.425478+03
59	ДН		1	2020-08-18 19:14:19.154796+03	2020-08-18 19:14:19.154821+03	91	t	2020-09-03 07:03:23.425478+03
18	Шаблон задачи 1	Описание новой задачи	3	2020-08-17 00:12:30.067323+03	2020-08-17 00:12:30.067342+03	86	t	2020-09-03 07:03:23.425478+03
20	Шаблон задачи 4	Описание новой задачи	2	2020-08-17 00:18:59.97878+03	2020-08-17 00:18:59.978799+03	86	t	2020-09-03 07:03:23.425478+03
26	Шаблон задачи 1	Описание новой задачи	3	2020-08-14 14:27:28.142343+03	2020-08-14 14:27:28.14236+03	87	t	2020-09-03 07:03:23.425478+03
25	Шаблон задачи 4	Описание новой задачи	1	2020-08-14 14:27:49.254437+03	2020-08-14 14:27:49.25446+03	87	t	2020-09-03 07:03:23.425478+03
24	Шаблон задачи 2	Описание новой задачи	3	2020-08-14 14:28:15.378811+03	2020-08-14 14:28:15.378825+03	87	t	2020-09-03 07:03:23.425478+03
28	Шаблон задачи 5	Шаблон задачи	3	2020-08-14 14:28:32.012151+03	2020-08-14 14:28:32.012165+03	87	t	2020-09-03 07:03:23.425478+03
19	Шаблон задачи 2	Описание новой задачи	3	2020-08-15 03:11:08.530308+03	2020-08-15 03:11:08.530327+03	86	t	2020-09-03 07:03:23.425478+03
66	Шаблон задачи 22	Описание новой задачи	1	2020-08-21 14:42:24.901944+03	2020-08-21 14:42:24.90204+03	91	t	2020-09-03 07:03:23.425478+03
67	Шаблон задачи 21	Описание новой задачи	1	2020-08-21 14:42:24.907193+03	2020-08-21 14:42:24.90722+03	91	t	2020-09-03 07:03:23.425478+03
68	Шаблон задачи 23	Описание новой задачи	1	2020-08-21 14:42:24.909097+03	2020-08-21 14:42:24.909126+03	91	t	2020-09-03 07:03:23.425478+03
69	Шаблон задачи 25	Шаблон задачи	1	2020-08-21 14:42:24.959543+03	2020-08-21 14:42:24.959572+03	91	t	2020-09-03 07:03:23.425478+03
30	Шаблон задачи 2	Описание новой задачи	1	2020-08-17 00:44:35.765643+03	2020-08-17 00:44:35.765671+03	88	t	2020-09-03 07:03:23.425478+03
31	Шаблон задачи 1	Описание новой задачи	1	2020-08-17 00:44:35.784277+03	2020-08-17 00:44:35.784314+03	88	t	2020-09-03 07:03:23.425478+03
70	ДН 222		1	2020-08-21 14:42:24.978961+03	2020-08-21 14:42:24.978988+03	91	t	2020-09-03 07:03:23.425478+03
32	Шаблон задачи 3	Описание новой задачи	1	2020-08-17 00:44:35.824265+03	2020-08-17 00:44:35.824301+03	88	t	2020-09-03 07:03:23.425478+03
33	Шаблон задачи 6	Описание шаблона задачи 6	1	2020-08-17 00:44:35.854938+03	2020-08-17 00:44:35.854966+03	88	t	2020-09-03 07:03:23.425478+03
34	Шаблон задачи 5	Шаблон задачи	1	2020-08-17 00:44:36.002743+03	2020-08-17 00:44:36.002793+03	88	t	2020-09-03 07:03:23.425478+03
35	Шаблон задачи 4	Описание новой задачи	1	2020-08-17 00:44:36.013556+03	2020-08-17 00:44:36.013599+03	88	t	2020-09-03 07:03:23.425478+03
36	Шаблон задачи 1	Описание новой задачи	1	2020-08-17 10:11:32.80737+03	2020-08-17 10:11:32.807397+03	90	t	2020-09-03 07:03:23.425478+03
37	Шаблон задачи 2	Описание новой задачи	1	2020-08-17 10:11:32.90617+03	2020-08-17 10:11:32.906205+03	90	t	2020-09-03 07:03:23.425478+03
38	ДН		1	2020-08-17 10:11:32.959499+03	2020-08-17 10:11:32.959525+03	90	t	2020-09-03 07:03:23.425478+03
39	Шаблон задачи 3	Описание новой задачи	1	2020-08-17 10:11:32.964599+03	2020-08-17 10:11:32.964624+03	90	t	2020-09-03 07:03:23.425478+03
40	Шаблон задачи 6	Описание шаблона задачи 6	1	2020-08-17 10:11:33.025022+03	2020-08-17 10:11:33.025059+03	90	t	2020-09-03 07:03:23.425478+03
41	Шаблон задачи 5	Шаблон задачи	1	2020-08-17 10:11:33.038685+03	2020-08-17 10:11:33.03871+03	90	t	2020-09-03 07:03:23.425478+03
42	Шаблон задачи 4	Описание новой задачи	1	2020-08-17 10:11:33.081907+03	2020-08-17 10:11:33.081941+03	90	t	2020-09-03 07:03:23.425478+03
43	55	5	1	2020-08-17 18:16:49.040428+03	2020-08-17 18:16:49.04046+03	90	f	2020-09-03 07:03:23.425478+03
71	Шаблон задачи 26	Описание шаблона задачи 66	1	2020-08-21 14:42:25.019552+03	2020-08-21 14:42:25.019599+03	91	t	2020-09-03 07:03:23.425478+03
45	Шаблон задачи 1	Описание новой задачи	1	2020-08-18 11:14:22.216305+03	2020-08-18 11:14:22.21641+03	90	t	2020-09-03 07:03:23.425478+03
72	Шаблон задачи 32	Описание новой задачи	1	2020-08-22 08:40:31.041661+03	2020-08-22 08:40:31.041765+03	91	t	2020-09-03 07:03:23.425478+03
60	Шаблон задачи 11	Описание новой задачи	1	2020-08-21 14:13:24.579944+03	2020-08-21 14:13:24.58004+03	91	t	2020-09-03 07:03:23.425478+03
61	Шаблон задачи 12	Описание новой задачи	1	2020-08-21 14:13:24.583888+03	2020-08-21 14:13:24.583916+03	91	t	2020-09-03 07:03:23.425478+03
62	Шаблон задачи 13	Описание новой задачи	1	2020-08-21 14:13:24.601058+03	2020-08-21 14:13:24.601106+03	91	t	2020-09-03 07:03:23.425478+03
63	Шаблон задачи 15	Шаблон задачи	1	2020-08-21 14:13:24.652181+03	2020-08-21 14:13:24.652211+03	91	t	2020-09-03 07:03:23.425478+03
64	Шаблон задачи 16	Описание шаблона задачи 66	1	2020-08-21 14:13:24.653717+03	2020-08-21 14:13:24.653751+03	91	t	2020-09-03 07:03:23.425478+03
65	ДН 1		1	2020-08-21 14:13:24.657592+03	2020-08-21 14:13:24.657625+03	91	t	2020-09-03 07:03:23.425478+03
73	Шаблон задачи 31	Описание новой задачи	1	2020-08-22 08:40:31.047343+03	2020-08-22 08:40:31.047375+03	91	t	2020-09-03 07:03:23.425478+03
76	Шаблон задачи 36	Описание шаблона задачи 66	1	2020-08-22 08:40:31.110318+03	2020-08-22 08:40:31.110355+03	91	t	2020-09-03 07:03:23.425478+03
77	ДН 333		1	2020-08-22 08:40:31.13398+03	2020-08-22 08:40:31.134007+03	91	t	2020-09-03 07:03:23.425478+03
78	Шаблон задачи 42	Описание новой задачи	1	2020-08-22 08:40:58.652055+03	2020-08-22 08:40:58.65217+03	91	t	2020-09-03 07:03:23.425478+03
79	Шаблон задачи 446	Описание шаблона задачи 66	1	2020-08-22 08:40:58.662634+03	2020-08-22 08:40:58.662661+03	91	t	2020-09-03 07:03:23.425478+03
80	Шаблон задачи 43	Описание новой задачи	1	2020-08-22 08:40:58.669868+03	2020-08-22 08:40:58.669893+03	91	t	2020-09-03 07:03:23.425478+03
81	Шаблон задачи 41	Описание новой задачи	1	2020-08-22 08:40:58.679472+03	2020-08-22 08:40:58.679496+03	91	t	2020-09-03 07:03:23.425478+03
83	ДН 444		1	2020-08-22 08:40:58.692479+03	2020-08-22 08:40:58.692539+03	91	t	2020-09-03 07:03:23.425478+03
84	Шаблон задачи 53	Описание новой задачи	1	2020-08-22 08:41:20.795156+03	2020-08-22 08:41:20.795236+03	91	t	2020-09-03 07:03:23.425478+03
74	Шаблон задачи 33	Описание новой задачи	1	2020-08-27 10:58:11.165313+03	2020-08-27 10:58:11.165329+03	91	t	2020-09-03 07:03:23.425478+03
75	Шаблон задачи 35	Шаблон задачи	1	2020-08-27 10:56:21.869234+03	2020-08-27 10:56:21.869247+03	91	t	2020-09-03 07:03:23.425478+03
85	Шаблон задачи 52	Описание новой задачи	1	2020-08-22 08:41:20.797078+03	2020-08-22 08:41:20.797109+03	91	t	2020-09-03 07:03:23.425478+03
143	Шаблон задачи 2	Описание новой задачи	1	2020-09-03 14:12:12.296329+03	2020-09-03 14:12:12.296369+03	\N	t	2020-09-03 14:12:12.29638+03
149	Шаблон задачи 5555555555	Описание новой задачи	1	2020-09-03 15:09:42.420608+03	2020-09-03 15:09:42.420638+03	118	t	2020-09-03 15:09:42.420646+03
147	Шаблон задачи 3	Описание новой задачи	1	2020-09-03 15:16:09.7549+03	2020-09-03 15:16:09.754914+03	\N	t	2020-09-03 15:16:09.754918+03
145	Шаблон задачи 4	Описание новой задачи	1	2020-09-03 15:16:30.459846+03	2020-09-03 15:16:30.459873+03	\N	t	2020-09-03 15:16:30.459877+03
86	ДН 555		1	2020-08-22 08:41:20.800282+03	2020-08-22 08:41:20.800318+03	91	t	2020-09-03 07:03:23.425478+03
87	Шаблон задачи 51	Описание новой задачи	1	2020-08-22 08:41:20.806974+03	2020-08-22 08:41:20.806999+03	91	t	2020-09-03 07:03:23.425478+03
88	Шаблон задачи 56	Описание шаблона задачи 66	1	2020-08-22 08:41:20.813344+03	2020-08-22 08:41:20.813371+03	91	t	2020-09-03 07:03:23.425478+03
89	Шаблон задачи 55	Шаблон задачи	1	2020-08-22 08:41:20.81594+03	2020-08-22 08:41:20.815963+03	91	t	2020-09-03 07:03:23.425478+03
90	Новая задача 8888888888888888	Описание новой задачи	1	2020-08-28 07:47:57.493891+03	2020-08-28 07:47:57.493915+03	91	t	2020-09-03 07:03:23.425478+03
91	Шаблон задачи 12121212	Описание новой задачи	1	2020-08-28 07:59:24.724948+03	2020-08-28 07:59:24.725017+03	91	t	2020-09-03 07:03:23.425478+03
93	Tasssssssk	Description	1	2020-08-28 08:00:47.656832+03	2020-08-28 08:00:47.656952+03	91	f	2020-09-03 07:03:23.425478+03
94	Новая задача	Описание задачи	1	2020-08-28 08:16:09.488288+03	2020-08-28 08:16:09.488335+03	91	f	2020-09-03 07:03:23.425478+03
95	Шаблон задачи 1	Описание новой задачи	1	2020-08-28 08:18:15.680993+03	2020-08-28 08:18:15.681053+03	91	t	2020-09-03 07:03:23.425478+03
55	Проверяемый	Описание новой задачи	3	2020-09-03 06:53:34.664459+03	2020-09-03 06:53:34.664481+03	91	t	2020-09-03 07:03:23.425478+03
148	Шаблон задачи 4444444444	Описание новой задачи	1	2020-09-03 15:09:42.286673+03	2020-09-03 15:09:42.286705+03	118	t	2020-09-03 15:09:42.286714+03
142	Шаблон задачи 5	Описание новой задачи	1	2020-09-03 15:16:44.460159+03	2020-09-03 15:16:44.46018+03	\N	t	2020-09-03 15:16:44.460185+03
146	Шаблон задачи 6	Описание новой задачи	1	2020-09-03 15:16:59.564938+03	2020-09-03 15:16:59.565065+03	\N	t	2020-09-03 15:16:59.565072+03
144	Шаблон задачи 7	Описание новой задачи	1	2020-09-03 15:17:15.918274+03	2020-09-03 15:17:15.918288+03	\N	t	2020-09-03 15:17:15.918292+03
\.


--
-- Data for Name: task_task_links; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.task_task_links (id, task_id, link_id) FROM stdin;
114	1	7
115	145	14
3	18	4
4	18	5
5	18	3
116	147	14
117	142	7
8	18	8
9	20	11
118	146	6
119	144	14
120	144	7
18	33	12
19	34	8
20	34	10
21	34	12
22	35	9
23	35	5
24	35	7
25	38	12
26	40	12
27	41	8
28	41	10
29	41	12
30	42	9
31	42	5
32	42	7
33	43	13
39	59	12
40	58	12
41	64	12
42	65	12
43	63	8
44	63	10
45	63	12
46	69	8
47	69	10
48	69	12
49	70	12
50	71	12
51	75	8
52	75	10
53	75	12
54	76	12
55	77	12
56	79	12
60	83	12
61	89	8
62	89	10
63	89	12
64	88	12
65	86	12
66	75	14
67	74	16
68	74	15
69	93	6
70	94	4
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: advertiser
--

COPY public.upload_file (id, file, status) FROM stdin;
36	file/2020/08/06/Vuex Crash Course Vladilen (1).zip	1
37	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uQeMLLS.zip	1
38	file/2020/08/06/sistema-peredachi-energii.jpg	1
39	file/2020/08/06/8iMAX2fvg1Y.jpg	1
40	file/2020/08/06/Foto s kirillicheskim nazvaniem.jpg	1
41	file/2020/08/06/Video.mp4	1
42	file/2020/08/06/Zapchasti_ijul' (1).xlsx	1
43	file/2020/08/06/Kupibilet_order_ru_6193085721 (1).pdf	1
44	file/2020/08/06/Zapchasti_ijul' (1)_x9I85bj.xlsx	1
45	file/2020/08/06/Annotatsiya 2020-08-06 133102.png	1
46	file/2020/08/06/Annotatsiya 2020-08-06 125703.png	1
47	file/2020/08/06/Annotatsiya 2020-08-06 133102_4eoLDXa.png	1
48	file/2020/08/06/Annotatsiya 2020-08-06 133102_lDr4qzK.png	1
49	file/2020/08/06/Annotatsiya 2020-08-06 133102_ZR5DKBW.png	1
50	file/2020/08/06/Annotatsiya 2020-08-06 133102_urj8QG7.png	1
51	file/2020/08/06/Annotatsiya 2020-08-06 133102_YjspsN9.png	1
52	file/2020/08/06/Annotatsiya 2020-08-06 133102_smzUVWp.png	1
53	file/2020/08/06/Annotatsiya 2020-08-06 133102_3diU125.png	1
54	file/2020/08/06/Annotatsiya 2020-08-06 133102_AsbqYYf.png	1
55	file/2020/08/06/Annotatsiya 2020-08-06 133102_EzeSVc4.png	1
56	file/2020/08/06/Annotatsiya 2020-08-06 133102_wc2AVBG.png	1
57	file/2020/08/06/Annotatsiya 2020-08-06 133102_BhqJpiH.png	1
58	file/2020/08/06/Annotatsiya 2020-08-06 133102_4sxetmX.png	1
59	file/2020/08/06/Annotatsiya 2020-08-06 133102_wmxIWJ3.png	1
60	file/2020/08/06/Annotatsiya 2020-08-06 133102_vRf8ZfW.png	1
61	file/2020/08/06/Annotatsiya 2020-08-06 133102_7o4LxUl.png	1
62	file/2020/08/06/Annotatsiya 2020-08-06 133102_hv1Oc4U.png	1
63	file/2020/08/06/Annotatsiya 2020-08-06 133102_iQdLg6d.png	1
64	file/2020/08/06/Annotatsiya 2020-08-06 133102_xn8nn2o.png	1
65	file/2020/08/06/Annotatsiya 2020-08-06 133102_MoaCCG7.png	1
66	file/2020/08/06/Annotatsiya 2020-08-06 133102_AtTS0Nk.png	1
67	file/2020/08/06/Annotatsiya 2020-08-06 133102_dP147Sy.png	1
68	file/2020/08/06/Annotatsiya 2020-08-06 133102_fGjtt5l.png	1
69	file/2020/08/06/Annotatsiya 2020-08-06 133102_T0kECCb.png	1
70	file/2020/08/06/Annotatsiya 2020-08-06 133102_eznjBUH.png	1
71	file/2020/08/06/Annotatsiya 2020-08-06 133102_5H4rdMs.png	1
72	file/2020/08/06/Annotatsiya 2020-08-06 133102_T8F46p9.png	1
73	file/2020/08/06/Annotatsiya 2020-08-06 133102_IAGf3wG.png	1
74	file/2020/08/06/Annotatsiya 2020-08-06 133102_8LMcNkr.png	1
75	file/2020/08/06/Annotatsiya 2020-08-06 133102_sL1LlXG.png	1
76	file/2020/08/06/Annotatsiya 2020-08-06 133102_BWhTuO0.png	1
77	file/2020/08/06/Annotatsiya 2020-08-06 133102_qZ8HJQJ.png	1
78	file/2020/08/06/Annotatsiya 2020-08-06 133102_1YMAhYk.png	1
79	file/2020/08/06/Annotatsiya 2020-08-06 133102_CJXaw65.png	1
80	file/2020/08/06/Annotatsiya 2020-08-06 133102_yUhhF7U.png	1
81	file/2020/08/06/Annotatsiya 2020-08-06 133102_dddg3kL.png	1
82	file/2020/08/06/Annotatsiya 2020-08-06 133102_6kRNiIk.png	1
83	file/2020/08/06/Annotatsiya 2020-08-06 133102_skvadHN.png	1
84	file/2020/08/06/Annotatsiya 2020-08-06 133102_DrORJZw.png	1
85	file/2020/08/06/Annotatsiya 2020-08-06 133102_30HOumh.png	1
86	file/2020/08/06/Annotatsiya 2020-08-06 133102_v87yDv7.png	1
87	file/2020/08/06/Annotatsiya 2020-08-06 133102_s33FgKW.png	1
88	file/2020/08/06/Annotatsiya 2020-08-06 133102_4sAexWt.png	1
89	file/2020/08/06/Annotatsiya 2020-08-06 133102_UdVsNp9.png	1
90	file/2020/08/06/Annotatsiya 2020-08-06 133102_fHPFNtx.png	1
91	file/2020/08/06/Annotatsiya 2020-08-06 133102_QBRWpbM.png	1
92	file/2020/08/06/Annotatsiya 2020-08-06 133102_X8lid7i.png	1
93	file/2020/08/06/Annotatsiya 2020-08-06 133102_XNhV6O7.png	1
94	file/2020/08/06/Annotatsiya 2020-08-06 133102_Guq5cIf.png	1
95	file/2020/08/06/Annotatsiya 2020-08-06 133102_0Y5A2sG.png	1
96	file/2020/08/06/Annotatsiya 2020-08-06 133102_7H9J4Bj.png	1
97	file/2020/08/06/Annotatsiya 2020-08-06 133102_r3wHnKe.png	1
98	file/2020/08/06/Annotatsiya 2020-08-06 133102_jfsNqmD.png	1
99	file/2020/08/06/Annotatsiya 2020-08-06 133102_k6OewGN.png	1
100	file/2020/08/06/Annotatsiya 2020-08-06 133102_QkCokup.png	1
101	file/2020/08/06/Annotatsiya 2020-08-06 133102_cTn2PHS.png	1
102	file/2020/08/06/Annotatsiya 2020-08-06 133102_q7KRC7I.png	1
103	file/2020/08/06/Annotatsiya 2020-08-06 133102_DNh6lNX.png	1
104	file/2020/08/06/Annotatsiya 2020-08-06 133102_qOiukha.png	1
105	file/2020/08/06/Annotatsiya 2020-08-06 133102_f16VVdU.png	1
106	file/2020/08/06/Annotatsiya 2020-08-06 133102_I1XDX31.png	1
107	file/2020/08/06/Annotatsiya 2020-08-06 133102_do6lLhL.png	1
108	file/2020/08/06/Annotatsiya 2020-08-06 133102_Vu0e5gg.png	1
109	file/2020/08/06/Annotatsiya 2020-08-06 133102_i2n6UoL.png	1
110	file/2020/08/06/Annotatsiya 2020-08-06 133102_eL7C9TM.png	1
111	file/2020/08/06/Annotatsiya 2020-08-06 133102_GTNJMCd.png	1
112	file/2020/08/06/Annotatsiya 2020-08-06 133102_a1vvj4B.png	1
113	file/2020/08/06/Annotatsiya 2020-08-06 133102_ImDqXRh.png	1
114	file/2020/08/06/Annotatsiya 2020-08-06 133102_hDd53VS.png	1
115	file/2020/08/06/Annotatsiya 2020-08-06 133102_2cJQkAh.png	1
116	file/2020/08/06/Annotatsiya 2020-08-06 133102_X1n4nCJ.png	1
117	file/2020/08/06/Annotatsiya 2020-08-06 133102_RVhtaNQ.png	1
118	file/2020/08/06/Annotatsiya 2020-08-06 133102_Y0NImOm.png	1
119	file/2020/08/06/Annotatsiya 2020-08-06 133102_Xx2W42I.png	1
120	file/2020/08/06/Annotatsiya 2020-08-06 133102_I18BijT.png	1
121	file/2020/08/06/Annotatsiya 2020-08-06 133102_GMZugBp.png	1
122	file/2020/08/06/Annotatsiya 2020-08-06 133102_3ibWVnO.png	1
123	file/2020/08/06/Annotatsiya 2020-08-06 133102_vtBbSih.png	1
124	file/2020/08/06/Annotatsiya 2020-08-06 133102_l6xZ5tt.png	1
125	file/2020/08/06/Annotatsiya 2020-08-06 133102_UC7VPeq.png	1
126	file/2020/08/06/Annotatsiya 2020-08-06 133102_owwGpmk.png	1
127	file/2020/08/06/Annotatsiya 2020-08-06 133102_ffgn1tJ.png	1
128	file/2020/08/06/Annotatsiya 2020-08-06 133102_OBW1iQc.png	1
129	file/2020/08/06/Annotatsiya 2020-08-06 133102_KUqwPJ9.png	1
130	file/2020/08/06/Annotatsiya 2020-08-06 133102_xqSG6Og.png	1
131	file/2020/08/06/Annotatsiya 2020-08-06 133102_S7J42oM.png	1
132	file/2020/08/06/Annotatsiya 2020-08-06 133102_pRx8H8S.png	1
133	file/2020/08/06/Annotatsiya 2020-08-06 133102_5ERbMBd.png	1
134	file/2020/08/06/Annotatsiya 2020-08-06 133102_dBo8T82.png	1
135	file/2020/08/06/Annotatsiya 2020-08-06 133102_Huayazf.png	1
136	file/2020/08/06/Annotatsiya 2020-08-06 133102_F8iO3pb.png	1
137	file/2020/08/06/Annotatsiya 2020-08-06 133102_aLoB00u.png	1
138	file/2020/08/06/Annotatsiya 2020-08-06 133102_ixbc5CU.png	1
139	file/2020/08/06/Annotatsiya 2020-08-06 133102_vnsxzuT.png	1
140	file/2020/08/06/Annotatsiya 2020-08-06 133102_9ZIkvyt.png	1
141	file/2020/08/06/Annotatsiya 2020-08-06 133102_BX7fkq7.png	1
142	file/2020/08/06/Annotatsiya 2020-08-06 133102_SA3Cgmp.png	1
143	file/2020/08/06/Annotatsiya 2020-08-06 133102_rXfc3iM.png	1
144	file/2020/08/06/Annotatsiya 2020-08-06 133102_g6MJkiP.png	1
145	file/2020/08/06/Annotatsiya 2020-08-06 133102_AN4R093.png	1
146	file/2020/08/06/Annotatsiya 2020-08-06 133102_qom3Zow.png	1
147	file/2020/08/06/Annotatsiya 2020-08-06 133102_WpzWK4C.png	1
148	file/2020/08/06/Annotatsiya 2020-08-06 133102_6wkERP1.png	1
149	file/2020/08/06/Annotatsiya 2020-08-06 133102_aO152bl.png	1
150	file/2020/08/06/Annotatsiya 2020-08-06 133102_SmxORou.png	1
151	file/2020/08/06/Annotatsiya 2020-08-06 133102_1GpQkbr.png	1
152	file/2020/08/06/Annotatsiya 2020-08-06 133102_LeKKDIA.png	1
153	file/2020/08/06/Annotatsiya 2020-08-06 133102_ezN2UkB.png	1
154	file/2020/08/06/Annotatsiya 2020-08-06 133102_6VdT8Eu.png	1
155	file/2020/08/06/Annotatsiya 2020-08-06 133102_Zp1ntSc.png	1
156	file/2020/08/06/Annotatsiya 2020-08-06 133102_Nl0hTW2.png	1
157	file/2020/08/06/Annotatsiya 2020-08-06 133102_9Soi7tt.png	1
158	file/2020/08/06/Annotatsiya 2020-08-06 133102_gEb04SY.png	1
159	file/2020/08/06/Annotatsiya 2020-08-06 133102_xtfw6pw.png	1
160	file/2020/08/06/Annotatsiya 2020-08-06 133102_2hIcrVc.png	1
161	file/2020/08/06/Annotatsiya 2020-08-06 133102_hBDMLXS.png	1
162	file/2020/08/06/Annotatsiya 2020-08-06 133102_qr8qlZO.png	1
163	file/2020/08/06/Annotatsiya 2020-08-06 133102_oMiHfEq.png	1
164	file/2020/08/06/Annotatsiya 2020-08-06 133102_fzKcxeg.png	1
165	file/2020/08/06/Annotatsiya 2020-08-06 133102_7Hddxrm.png	1
166	file/2020/08/06/Annotatsiya 2020-08-06 133102_VtQQbeY.png	1
167	file/2020/08/06/Annotatsiya 2020-08-06 133102_eoX8cyg.png	1
168	file/2020/08/06/Annotatsiya 2020-08-06 133102_OGcWmpd.png	1
169	file/2020/08/06/Annotatsiya 2020-08-06 133102_snc0PY2.png	1
170	file/2020/08/06/Annotatsiya 2020-08-06 133102_zIZRLsd.png	1
171	file/2020/08/06/Annotatsiya 2020-08-06 133102_e16jE0r.png	1
172	file/2020/08/06/Annotatsiya 2020-08-06 133102_hEFDufw.png	1
173	file/2020/08/06/8iMAX2fvg1Y_RjxtL8C.jpg	1
174	file/2020/08/06/8iMAX2fvg1Y_AVNNzop.jpg	1
175	file/2020/08/06/8iMAX2fvg1Y_JzMmsFZ.jpg	1
176	file/2020/08/06/8iMAX2fvg1Y_QsoEeSa.jpg	1
177	file/2020/08/06/8iMAX2fvg1Y_11OWKFE.jpg	1
178	file/2020/08/06/8iMAX2fvg1Y_NNHuOm1.jpg	1
179	file/2020/08/06/8iMAX2fvg1Y_Ve83ca3.jpg	1
180	file/2020/08/06/8iMAX2fvg1Y_KwvmMxR.jpg	1
181	file/2020/08/06/8iMAX2fvg1Y_dIZMTHg.jpg	1
182	file/2020/08/06/8iMAX2fvg1Y_iqy9ExQ.jpg	1
183	file/2020/08/06/8iMAX2fvg1Y_iOgtEwq.jpg	1
184	file/2020/08/06/8iMAX2fvg1Y_Hrs6yDX.jpg	1
185	file/2020/08/06/8iMAX2fvg1Y_XPexnwK.jpg	1
186	file/2020/08/06/8iMAX2fvg1Y_XzplArw.jpg	1
187	file/2020/08/06/8iMAX2fvg1Y_vdAp07d.jpg	1
188	file/2020/08/06/8iMAX2fvg1Y_gPI22DS.jpg	1
189	file/2020/08/06/8iMAX2fvg1Y_LZjHo1R.jpg	1
190	file/2020/08/06/8iMAX2fvg1Y_wZETHLE.jpg	1
191	file/2020/08/06/8iMAX2fvg1Y_0HfYaM5.jpg	1
192	file/2020/08/06/8iMAX2fvg1Y_sYenitf.jpg	1
193	file/2020/08/06/8iMAX2fvg1Y_RI0cVSp.jpg	1
194	file/2020/08/06/8iMAX2fvg1Y_tXWYYdZ.jpg	1
195	file/2020/08/06/8iMAX2fvg1Y_Ees1yxe.jpg	1
196	file/2020/08/06/8iMAX2fvg1Y_Tf1g4Pe.jpg	1
197	file/2020/08/06/8iMAX2fvg1Y_Hh2dkvS.jpg	1
198	file/2020/08/06/8iMAX2fvg1Y_pFHS32L.jpg	1
199	file/2020/08/06/8iMAX2fvg1Y_KTKtxrE.jpg	1
200	file/2020/08/06/8iMAX2fvg1Y_SC7QA27.jpg	1
201	file/2020/08/06/8iMAX2fvg1Y_1aZwQCd.jpg	1
202	file/2020/08/06/8iMAX2fvg1Y_XztClRT.jpg	1
203	file/2020/08/06/8iMAX2fvg1Y_xC70LRO.jpg	1
204	file/2020/08/06/8iMAX2fvg1Y_lubKBCy.jpg	1
205	file/2020/08/06/8iMAX2fvg1Y_6Vn8CAR.jpg	1
206	file/2020/08/06/8iMAX2fvg1Y_5SMJlI5.jpg	1
207	file/2020/08/06/8iMAX2fvg1Y_i3MbS3b.jpg	1
208	file/2020/08/06/8iMAX2fvg1Y_FHUZBza.jpg	1
209	file/2020/08/06/8iMAX2fvg1Y_zL55CWz.jpg	1
210	file/2020/08/06/8iMAX2fvg1Y_BQDSsEc.jpg	1
211	file/2020/08/06/8iMAX2fvg1Y_fuHJOmb.jpg	1
212	file/2020/08/06/8iMAX2fvg1Y_MvIdM9X.jpg	1
213	file/2020/08/06/8iMAX2fvg1Y_SySts5d.jpg	1
214	file/2020/08/06/8iMAX2fvg1Y_iGOvAEP.jpg	1
215	file/2020/08/06/8iMAX2fvg1Y_m0RQokq.jpg	1
216	file/2020/08/06/8iMAX2fvg1Y_C4NfWba.jpg	1
217	file/2020/08/06/8iMAX2fvg1Y_1jMiOzX.jpg	1
218	file/2020/08/06/8iMAX2fvg1Y_iG1h2cI.jpg	1
219	file/2020/08/06/8iMAX2fvg1Y_Xzlsytz.jpg	1
220	file/2020/08/06/8iMAX2fvg1Y_C1ng0Ri.jpg	1
221	file/2020/08/06/8iMAX2fvg1Y_tPf6I65.jpg	1
222	file/2020/08/06/8iMAX2fvg1Y_YQXuwKL.jpg	1
223	file/2020/08/06/8iMAX2fvg1Y_Taakn5S.jpg	1
224	file/2020/08/06/8iMAX2fvg1Y_weo9IpA.jpg	1
225	file/2020/08/06/8iMAX2fvg1Y_7In9DNQ.jpg	1
226	file/2020/08/06/8iMAX2fvg1Y_YAummNA.jpg	1
227	file/2020/08/06/8iMAX2fvg1Y_vqnXVoF.jpg	1
228	file/2020/08/06/8iMAX2fvg1Y_LaGiNUx.jpg	1
229	file/2020/08/06/8iMAX2fvg1Y_6tRs64l.jpg	1
230	file/2020/08/06/8iMAX2fvg1Y_xUMWa2O.jpg	1
231	file/2020/08/06/8iMAX2fvg1Y_hQuKPSy.jpg	1
232	file/2020/08/06/8iMAX2fvg1Y_lV7CBqx.jpg	1
233	file/2020/08/06/8iMAX2fvg1Y_jI3ewXt.jpg	1
234	file/2020/08/06/8iMAX2fvg1Y_Y2lLGer.jpg	1
235	file/2020/08/06/8iMAX2fvg1Y_2bD6Mbw.jpg	1
236	file/2020/08/06/8iMAX2fvg1Y_P1uhj8a.jpg	1
237	file/2020/08/06/8iMAX2fvg1Y_Ton5z8K.jpg	1
238	file/2020/08/06/8iMAX2fvg1Y_IDDfjz1.jpg	1
239	file/2020/08/06/8iMAX2fvg1Y_Ewy2BmE.jpg	1
240	file/2020/08/06/8iMAX2fvg1Y_NknHidz.jpg	1
241	file/2020/08/06/8iMAX2fvg1Y_wbmmf8D.jpg	1
242	file/2020/08/06/8iMAX2fvg1Y_Zv5VRkv.jpg	1
243	file/2020/08/06/8iMAX2fvg1Y_O80empF.jpg	1
244	file/2020/08/06/8iMAX2fvg1Y_B5OhLtZ.jpg	1
245	file/2020/08/06/8iMAX2fvg1Y_3gO1YSN.jpg	1
246	file/2020/08/06/8iMAX2fvg1Y_7J4puYl.jpg	1
247	file/2020/08/06/8iMAX2fvg1Y_dsstkAy.jpg	1
248	file/2020/08/06/8iMAX2fvg1Y_HV2dk3B.jpg	1
249	file/2020/08/06/8iMAX2fvg1Y_FIAxyH0.jpg	1
250	file/2020/08/06/8iMAX2fvg1Y_lXEJHnW.jpg	1
251	file/2020/08/06/8iMAX2fvg1Y_2THqJVq.jpg	1
252	file/2020/08/06/8iMAX2fvg1Y_K8GbfNd.jpg	1
253	file/2020/08/06/8iMAX2fvg1Y_zTnkptg.jpg	1
254	file/2020/08/06/8iMAX2fvg1Y_mrF2ROI.jpg	1
255	file/2020/08/06/8iMAX2fvg1Y_6GQIEep.jpg	1
256	file/2020/08/06/8iMAX2fvg1Y_VGbtMzo.jpg	1
257	file/2020/08/06/8iMAX2fvg1Y_osQ4zYa.jpg	1
258	file/2020/08/06/8iMAX2fvg1Y_VDzoIkb.jpg	1
259	file/2020/08/06/8iMAX2fvg1Y_KEJ6BOf.jpg	1
260	file/2020/08/06/8iMAX2fvg1Y_cpyVSxz.jpg	1
261	file/2020/08/06/8iMAX2fvg1Y_3659IOV.jpg	1
262	file/2020/08/06/8iMAX2fvg1Y_63v0Xjm.jpg	1
263	file/2020/08/06/8iMAX2fvg1Y_B6icIiq.jpg	1
264	file/2020/08/06/8iMAX2fvg1Y_5DRocDM.jpg	1
265	file/2020/08/06/8iMAX2fvg1Y_pkuOY24.jpg	1
266	file/2020/08/06/8iMAX2fvg1Y_HjrlTJe.jpg	1
267	file/2020/08/06/8iMAX2fvg1Y_bF6gsqC.jpg	1
268	file/2020/08/06/8iMAX2fvg1Y_qAv4mwY.jpg	1
269	file/2020/08/06/8iMAX2fvg1Y_ijYJ3JT.jpg	1
270	file/2020/08/06/8iMAX2fvg1Y_4uo0MgK.jpg	1
271	file/2020/08/06/8iMAX2fvg1Y_TnMu8Ko.jpg	1
272	file/2020/08/06/8iMAX2fvg1Y_nIKHvej.jpg	1
273	file/2020/08/06/8iMAX2fvg1Y_N4xuv4U.jpg	1
274	file/2020/08/06/8iMAX2fvg1Y_Go8ALLB.jpg	1
275	file/2020/08/06/8iMAX2fvg1Y_dXcvKzi.jpg	1
276	file/2020/08/06/8iMAX2fvg1Y_O4HLIu1.jpg	1
277	file/2020/08/06/8iMAX2fvg1Y_cBiE2bI.jpg	1
278	file/2020/08/06/8iMAX2fvg1Y_OoHHovl.jpg	1
279	file/2020/08/06/8iMAX2fvg1Y_ojNpa39.jpg	1
280	file/2020/08/06/8iMAX2fvg1Y_DOZECsD.jpg	1
281	file/2020/08/06/8iMAX2fvg1Y_GTkpDY8.jpg	1
282	file/2020/08/06/8iMAX2fvg1Y_hMA3UrX.jpg	1
283	file/2020/08/06/8iMAX2fvg1Y_eUGXMA1.jpg	1
284	file/2020/08/06/8iMAX2fvg1Y_7EHR1wV.jpg	1
285	file/2020/08/06/8iMAX2fvg1Y_nCOy0ZU.jpg	1
286	file/2020/08/06/8iMAX2fvg1Y_g3sy3Jq.jpg	1
287	file/2020/08/06/8iMAX2fvg1Y_Ga81ifk.jpg	1
288	file/2020/08/06/8iMAX2fvg1Y_its5MLp.jpg	1
289	file/2020/08/06/8iMAX2fvg1Y_g48YakA.jpg	1
290	file/2020/08/06/8iMAX2fvg1Y_9JfRQm4.jpg	1
291	file/2020/08/06/8iMAX2fvg1Y_yYEGKuL.jpg	1
292	file/2020/08/06/8iMAX2fvg1Y_f8qMNS5.jpg	1
293	file/2020/08/06/8iMAX2fvg1Y_XLY5LxF.jpg	1
294	file/2020/08/06/8iMAX2fvg1Y_I7ZRh1P.jpg	1
295	file/2020/08/06/8iMAX2fvg1Y_2IlTM0b.jpg	1
296	file/2020/08/06/8iMAX2fvg1Y_YTS2iwK.jpg	1
297	file/2020/08/06/8iMAX2fvg1Y_216fI7D.jpg	1
298	file/2020/08/06/8iMAX2fvg1Y_4GiSzMH.jpg	1
299	file/2020/08/06/8iMAX2fvg1Y_IKyiMGl.jpg	1
300	file/2020/08/06/8iMAX2fvg1Y_K5JngAn.jpg	1
301	file/2020/08/06/8iMAX2fvg1Y_C0XDDc1.jpg	1
302	file/2020/08/06/8iMAX2fvg1Y_7onGxX8.jpg	1
303	file/2020/08/06/8iMAX2fvg1Y_KixmEfQ.jpg	1
304	file/2020/08/06/8iMAX2fvg1Y_OjrWRkt.jpg	1
305	file/2020/08/06/8iMAX2fvg1Y_AS0HExX.jpg	1
306	file/2020/08/06/8iMAX2fvg1Y_rWAt8nt.jpg	1
307	file/2020/08/06/8iMAX2fvg1Y_LLe0Zeq.jpg	1
308	file/2020/08/06/8iMAX2fvg1Y_bTnoyF6.jpg	1
309	file/2020/08/06/8iMAX2fvg1Y_75a3che.jpg	1
310	file/2020/08/06/8iMAX2fvg1Y_NUWfGEN.jpg	1
311	file/2020/08/06/8iMAX2fvg1Y_QxM2pJS.jpg	1
312	file/2020/08/06/8iMAX2fvg1Y_ZpQ2VU8.jpg	1
313	file/2020/08/06/8iMAX2fvg1Y_G6MVgti.jpg	1
314	file/2020/08/06/8iMAX2fvg1Y_NHMPOOv.jpg	1
315	file/2020/08/06/8iMAX2fvg1Y_EsqAGzO.jpg	1
316	file/2020/08/06/8iMAX2fvg1Y_TUNwavU.jpg	1
317	file/2020/08/06/8iMAX2fvg1Y_xZWt3RW.jpg	1
318	file/2020/08/06/8iMAX2fvg1Y_lgXYGd9.jpg	1
319	file/2020/08/06/8iMAX2fvg1Y_NLtG0oQ.jpg	1
320	file/2020/08/06/8iMAX2fvg1Y_hFH4jIA.jpg	1
321	file/2020/08/06/8iMAX2fvg1Y_j8jxX4K.jpg	1
322	file/2020/08/06/8iMAX2fvg1Y_aiPLvNz.jpg	1
323	file/2020/08/06/8iMAX2fvg1Y_8r8EBAo.jpg	1
324	file/2020/08/06/8iMAX2fvg1Y_amRTYwm.jpg	1
325	file/2020/08/06/8iMAX2fvg1Y_pPqlRoW.jpg	1
326	file/2020/08/06/8iMAX2fvg1Y_a6Q3xgB.jpg	1
327	file/2020/08/06/8iMAX2fvg1Y_pIc4fWZ.jpg	1
328	file/2020/08/06/8iMAX2fvg1Y_pc2qWE6.jpg	1
329	file/2020/08/06/8iMAX2fvg1Y_O2kZJW7.jpg	1
330	file/2020/08/06/8iMAX2fvg1Y_zf7Qito.jpg	1
331	file/2020/08/06/8iMAX2fvg1Y_kJRQXXs.jpg	1
332	file/2020/08/06/8iMAX2fvg1Y_sTTKfu6.jpg	1
333	file/2020/08/06/8iMAX2fvg1Y_1pSBFT2.jpg	1
334	file/2020/08/06/8iMAX2fvg1Y_mCpfQNX.jpg	1
335	file/2020/08/06/8iMAX2fvg1Y_sF5pwst.jpg	1
336	file/2020/08/06/8iMAX2fvg1Y_AIb6iAx.jpg	1
337	file/2020/08/06/8iMAX2fvg1Y_M8PeG3P.jpg	1
338	file/2020/08/06/8iMAX2fvg1Y_Apooq15.jpg	1
339	file/2020/08/06/8iMAX2fvg1Y_0qsHber.jpg	1
340	file/2020/08/06/8iMAX2fvg1Y_wHu3Roq.jpg	1
341	file/2020/08/06/8iMAX2fvg1Y_6FNG4zg.jpg	1
342	file/2020/08/06/8iMAX2fvg1Y_3FajjWA.jpg	1
343	file/2020/08/06/8iMAX2fvg1Y_s1XSb5l.jpg	1
344	file/2020/08/06/8iMAX2fvg1Y_IvtQiBq.jpg	1
345	file/2020/08/06/8iMAX2fvg1Y_Tc7uM6O.jpg	1
346	file/2020/08/06/8iMAX2fvg1Y_24hxeMc.jpg	1
347	file/2020/08/06/8iMAX2fvg1Y_vH1WNUH.jpg	1
348	file/2020/08/06/8iMAX2fvg1Y_mmBR2lJ.jpg	1
349	file/2020/08/06/8iMAX2fvg1Y_inYQqOH.jpg	1
350	file/2020/08/06/8iMAX2fvg1Y_JmUUFNV.jpg	1
351	file/2020/08/06/8iMAX2fvg1Y_4tkEHGp.jpg	1
352	file/2020/08/06/8iMAX2fvg1Y_d1zdYQY.jpg	1
353	file/2020/08/06/8iMAX2fvg1Y_PlrOJt7.jpg	1
354	file/2020/08/06/8iMAX2fvg1Y_80vfS7g.jpg	1
355	file/2020/08/06/8iMAX2fvg1Y_YHkytvK.jpg	1
356	file/2020/08/06/8iMAX2fvg1Y_CEpFw4c.jpg	1
357	file/2020/08/06/8iMAX2fvg1Y_kcdCiUt.jpg	1
358	file/2020/08/06/8iMAX2fvg1Y_W0VJC75.jpg	1
359	file/2020/08/06/8iMAX2fvg1Y_sI4GutH.jpg	1
360	file/2020/08/06/8iMAX2fvg1Y_7nk2xdU.jpg	1
361	file/2020/08/06/8iMAX2fvg1Y_4ypLFRn.jpg	1
362	file/2020/08/06/8iMAX2fvg1Y_cMAeoEU.jpg	1
363	file/2020/08/06/8iMAX2fvg1Y_iDLdjmY.jpg	1
364	file/2020/08/06/8iMAX2fvg1Y_ttp3JuX.jpg	1
365	file/2020/08/06/8iMAX2fvg1Y_4gIAa1e.jpg	1
366	file/2020/08/06/8iMAX2fvg1Y_LLiaMsv.jpg	1
367	file/2020/08/06/8iMAX2fvg1Y_5dq7kFn.jpg	1
368	file/2020/08/06/8iMAX2fvg1Y_Jl9rciP.jpg	1
369	file/2020/08/06/8iMAX2fvg1Y_AkDiDnr.jpg	1
370	file/2020/08/06/8iMAX2fvg1Y_ZtCV0IH.jpg	1
371	file/2020/08/06/8iMAX2fvg1Y_c1LmjJe.jpg	1
372	file/2020/08/06/8iMAX2fvg1Y_XH2wWcE.jpg	1
373	file/2020/08/06/8iMAX2fvg1Y_3efAkW2.jpg	1
374	file/2020/08/06/8iMAX2fvg1Y_svvF32o.jpg	1
375	file/2020/08/06/8iMAX2fvg1Y_CT7mo1Q.jpg	1
376	file/2020/08/06/8iMAX2fvg1Y_IHqNbwO.jpg	1
377	file/2020/08/06/8iMAX2fvg1Y_EwEjXG7.jpg	1
378	file/2020/08/06/8iMAX2fvg1Y_YDRkQaO.jpg	1
379	file/2020/08/06/8iMAX2fvg1Y_updO9nR.jpg	1
380	file/2020/08/06/8iMAX2fvg1Y_W9VTiCx.jpg	1
381	file/2020/08/06/8iMAX2fvg1Y_Y87J3J2.jpg	1
382	file/2020/08/06/8iMAX2fvg1Y_9RBbAON.jpg	1
383	file/2020/08/06/8iMAX2fvg1Y_xkr7xVQ.jpg	1
384	file/2020/08/06/8iMAX2fvg1Y_kQewQb3.jpg	1
385	file/2020/08/06/8iMAX2fvg1Y_v3eLiRN.jpg	1
386	file/2020/08/06/8iMAX2fvg1Y_ymhuGtk.jpg	1
387	file/2020/08/06/8iMAX2fvg1Y_dRD1bMH.jpg	1
388	file/2020/08/06/8iMAX2fvg1Y_510rCCQ.jpg	1
389	file/2020/08/06/8iMAX2fvg1Y_7aHurMu.jpg	1
390	file/2020/08/06/8iMAX2fvg1Y_4N6PFbV.jpg	1
391	file/2020/08/06/8iMAX2fvg1Y_rzQQ8pL.jpg	1
392	file/2020/08/06/8iMAX2fvg1Y_orlZUXI.jpg	1
393	file/2020/08/06/8iMAX2fvg1Y_uIkyqNo.jpg	1
394	file/2020/08/06/8iMAX2fvg1Y_2pJeOM8.jpg	1
395	file/2020/08/06/8iMAX2fvg1Y_Kjuq4PC.jpg	1
396	file/2020/08/06/8iMAX2fvg1Y_FVSzBgy.jpg	1
397	file/2020/08/06/8iMAX2fvg1Y_vPuOH1Y.jpg	1
398	file/2020/08/06/8iMAX2fvg1Y_HuNqnS2.jpg	1
399	file/2020/08/06/8iMAX2fvg1Y_CJiAq3j.jpg	1
400	file/2020/08/06/8iMAX2fvg1Y_pBPpALZ.jpg	1
401	file/2020/08/06/8iMAX2fvg1Y_NOomK5J.jpg	1
402	file/2020/08/06/8iMAX2fvg1Y_rEX08Cc.jpg	1
403	file/2020/08/06/8iMAX2fvg1Y_2vp1eyE.jpg	1
404	file/2020/08/06/8iMAX2fvg1Y_BPS9vm6.jpg	1
405	file/2020/08/06/8iMAX2fvg1Y_Lfh0LH2.jpg	1
406	file/2020/08/06/8iMAX2fvg1Y_BHi5bQr.jpg	1
407	file/2020/08/06/8iMAX2fvg1Y_tuYmCU2.jpg	1
408	file/2020/08/06/8iMAX2fvg1Y_c3fuTTX.jpg	1
409	file/2020/08/06/8iMAX2fvg1Y_aMlj9W0.jpg	1
410	file/2020/08/06/8iMAX2fvg1Y_oDgdmzk.jpg	1
411	file/2020/08/06/8iMAX2fvg1Y_YEuyhiC.jpg	1
412	file/2020/08/06/8iMAX2fvg1Y_oyBA1lZ.jpg	1
413	file/2020/08/06/8iMAX2fvg1Y_wKM0pgu.jpg	1
414	file/2020/08/06/8iMAX2fvg1Y_2HVPye0.jpg	1
415	file/2020/08/06/8iMAX2fvg1Y_WIFiOpy.jpg	1
416	file/2020/08/06/8iMAX2fvg1Y_SVHgI8S.jpg	1
417	file/2020/08/06/8iMAX2fvg1Y_KWdky5q.jpg	1
418	file/2020/08/06/8iMAX2fvg1Y_1t088rW.jpg	1
419	file/2020/08/06/8iMAX2fvg1Y_k57jTmw.jpg	1
420	file/2020/08/06/8iMAX2fvg1Y_mRnQCzz.jpg	1
421	file/2020/08/06/8iMAX2fvg1Y_2YhGsM5.jpg	1
422	file/2020/08/06/8iMAX2fvg1Y_CSLindf.jpg	1
423	file/2020/08/06/8iMAX2fvg1Y_djXDh2k.jpg	1
424	file/2020/08/06/8iMAX2fvg1Y_d2PAoFL.jpg	1
425	file/2020/08/06/8iMAX2fvg1Y_Z1hgXiM.jpg	1
426	file/2020/08/06/8iMAX2fvg1Y_F7lyXSh.jpg	1
427	file/2020/08/06/8iMAX2fvg1Y_zlvBqIY.jpg	1
428	file/2020/08/06/8iMAX2fvg1Y_K4MTQfV.jpg	1
429	file/2020/08/06/8iMAX2fvg1Y_D0s4di9.jpg	1
430	file/2020/08/06/8iMAX2fvg1Y_0JhG3Ut.jpg	1
431	file/2020/08/06/8iMAX2fvg1Y_2K5QnNq.jpg	1
432	file/2020/08/06/8iMAX2fvg1Y_YHkM31b.jpg	1
433	file/2020/08/06/8iMAX2fvg1Y_jKILvhZ.jpg	1
434	file/2020/08/06/8iMAX2fvg1Y_lXEuPy7.jpg	1
435	file/2020/08/06/8iMAX2fvg1Y_3jodP8E.jpg	1
436	file/2020/08/06/8iMAX2fvg1Y_K22PsQo.jpg	1
437	file/2020/08/06/8iMAX2fvg1Y_HPFZ9eh.jpg	1
438	file/2020/08/06/8iMAX2fvg1Y_18wx7Nv.jpg	1
439	file/2020/08/06/8iMAX2fvg1Y_5WCyC8g.jpg	1
440	file/2020/08/06/8iMAX2fvg1Y_Wf6teDl.jpg	1
441	file/2020/08/06/8iMAX2fvg1Y_RxGApq6.jpg	1
442	file/2020/08/06/8iMAX2fvg1Y_6EvSEit.jpg	1
443	file/2020/08/06/8iMAX2fvg1Y_UoPDFmQ.jpg	1
444	file/2020/08/06/8iMAX2fvg1Y_hpaZoKK.jpg	1
445	file/2020/08/06/8iMAX2fvg1Y_LaQgKpO.jpg	1
446	file/2020/08/06/8iMAX2fvg1Y_xulpNml.jpg	1
447	file/2020/08/06/8iMAX2fvg1Y_J67pGzS.jpg	1
448	file/2020/08/06/8iMAX2fvg1Y_8byIx6h.jpg	1
449	file/2020/08/06/8iMAX2fvg1Y_bdiJo59.jpg	1
450	file/2020/08/06/8iMAX2fvg1Y_2J6lymN.jpg	1
451	file/2020/08/06/8iMAX2fvg1Y_OBwO7il.jpg	1
452	file/2020/08/06/8iMAX2fvg1Y_WA4oLkh.jpg	1
453	file/2020/08/06/8iMAX2fvg1Y_tP8DOzH.jpg	1
454	file/2020/08/06/8iMAX2fvg1Y_z61ppWE.jpg	1
455	file/2020/08/06/8iMAX2fvg1Y_7p9Q42f.jpg	1
456	file/2020/08/06/8iMAX2fvg1Y_qNg63TC.jpg	1
457	file/2020/08/06/8iMAX2fvg1Y_2CZp4Mk.jpg	1
458	file/2020/08/06/8iMAX2fvg1Y_jJgHPGu.jpg	1
459	file/2020/08/06/8iMAX2fvg1Y_91HqdLw.jpg	1
460	file/2020/08/06/8iMAX2fvg1Y_FGOPUXc.jpg	1
461	file/2020/08/06/8iMAX2fvg1Y_RZQsczh.jpg	1
462	file/2020/08/06/8iMAX2fvg1Y_YMe5lwi.jpg	1
463	file/2020/08/06/8iMAX2fvg1Y_TiJ5CBq.jpg	1
464	file/2020/08/06/8iMAX2fvg1Y_wjJSKfj.jpg	1
465	file/2020/08/06/8iMAX2fvg1Y_Nts0sY3.jpg	1
466	file/2020/08/06/8iMAX2fvg1Y_RdNXME4.jpg	1
467	file/2020/08/06/8iMAX2fvg1Y_FN0kguF.jpg	1
468	file/2020/08/06/8iMAX2fvg1Y_Eg1dwPo.jpg	1
469	file/2020/08/06/8iMAX2fvg1Y_UDb0Uzp.jpg	1
470	file/2020/08/06/8iMAX2fvg1Y_yHvMjcs.jpg	1
471	file/2020/08/06/8iMAX2fvg1Y_jBnQZvU.jpg	1
472	file/2020/08/06/8iMAX2fvg1Y_BxXEqvn.jpg	1
473	file/2020/08/06/8iMAX2fvg1Y_cGhe7Ip.jpg	1
474	file/2020/08/06/8iMAX2fvg1Y_BM87KS9.jpg	1
475	file/2020/08/06/8iMAX2fvg1Y_XKlPSkI.jpg	1
476	file/2020/08/06/8iMAX2fvg1Y_Ekqx6ED.jpg	1
477	file/2020/08/06/8iMAX2fvg1Y_vRVRDmn.jpg	1
478	file/2020/08/06/8iMAX2fvg1Y_ngc1bmH.jpg	1
479	file/2020/08/06/8iMAX2fvg1Y_AY5JUG6.jpg	1
480	file/2020/08/06/8iMAX2fvg1Y_x2MttVm.jpg	1
481	file/2020/08/06/8iMAX2fvg1Y_JDNTsMG.jpg	1
482	file/2020/08/06/8iMAX2fvg1Y_i3Q0ulD.jpg	1
483	file/2020/08/06/8iMAX2fvg1Y_LOfSThQ.jpg	1
484	file/2020/08/06/8iMAX2fvg1Y_HylI2if.jpg	1
485	file/2020/08/06/8iMAX2fvg1Y_4IU6Sb6.jpg	1
486	file/2020/08/06/8iMAX2fvg1Y_AnUfqnz.jpg	1
487	file/2020/08/06/8iMAX2fvg1Y_vmPizHk.jpg	1
488	file/2020/08/06/8iMAX2fvg1Y_nuD3Xgv.jpg	1
489	file/2020/08/06/8iMAX2fvg1Y_ksmcq1v.jpg	1
490	file/2020/08/06/8iMAX2fvg1Y_vJHLObQ.jpg	1
491	file/2020/08/06/8iMAX2fvg1Y_hgsB4IU.jpg	1
492	file/2020/08/06/8iMAX2fvg1Y_SiXGmHK.jpg	1
493	file/2020/08/06/8iMAX2fvg1Y_F4kEVWw.jpg	1
494	file/2020/08/06/8iMAX2fvg1Y_AEAv26K.jpg	1
495	file/2020/08/06/8iMAX2fvg1Y_h7vPBmN.jpg	1
496	file/2020/08/06/8iMAX2fvg1Y_wXLAa0N.jpg	1
497	file/2020/08/06/8iMAX2fvg1Y_17s3Aiu.jpg	1
498	file/2020/08/06/8iMAX2fvg1Y_oaRVNZP.jpg	1
499	file/2020/08/06/8iMAX2fvg1Y_k3ymVzh.jpg	1
500	file/2020/08/06/8iMAX2fvg1Y_5ArweGj.jpg	1
501	file/2020/08/06/8iMAX2fvg1Y_YgvtTCw.jpg	1
502	file/2020/08/06/8iMAX2fvg1Y_BicQlxB.jpg	1
503	file/2020/08/06/8iMAX2fvg1Y_a2d0qUk.jpg	1
504	file/2020/08/06/8iMAX2fvg1Y_mKTgpV2.jpg	1
505	file/2020/08/06/8iMAX2fvg1Y_ybjcbTR.jpg	1
506	file/2020/08/06/8iMAX2fvg1Y_c066H3y.jpg	1
507	file/2020/08/06/8iMAX2fvg1Y_jh2wsnf.jpg	1
508	file/2020/08/06/8iMAX2fvg1Y_XdBgyPB.jpg	1
509	file/2020/08/06/8iMAX2fvg1Y_tX1FH7l.jpg	1
510	file/2020/08/06/8iMAX2fvg1Y_M0QO8II.jpg	1
511	file/2020/08/06/8iMAX2fvg1Y_qbAKRaP.jpg	1
512	file/2020/08/06/8iMAX2fvg1Y_xSTDjiO.jpg	1
513	file/2020/08/06/8iMAX2fvg1Y_eA4MGis.jpg	1
514	file/2020/08/06/8iMAX2fvg1Y_ZpvDZ9j.jpg	1
515	file/2020/08/06/8iMAX2fvg1Y_qKaseNg.jpg	1
516	file/2020/08/06/8iMAX2fvg1Y_YteX0R4.jpg	1
517	file/2020/08/06/8iMAX2fvg1Y_DdHz9u2.jpg	1
518	file/2020/08/06/8iMAX2fvg1Y_4ahdOXr.jpg	1
519	file/2020/08/06/8iMAX2fvg1Y_xpIDodJ.jpg	1
520	file/2020/08/06/8iMAX2fvg1Y_eGAKU1K.jpg	1
521	file/2020/08/06/8iMAX2fvg1Y_JvRmxUV.jpg	1
522	file/2020/08/06/8iMAX2fvg1Y_sFUpW5X.jpg	1
523	file/2020/08/06/8iMAX2fvg1Y_8W5acRT.jpg	1
524	file/2020/08/06/8iMAX2fvg1Y_P9lKdtA.jpg	1
525	file/2020/08/06/8iMAX2fvg1Y_fhU4IS0.jpg	1
526	file/2020/08/06/8iMAX2fvg1Y_En3gerL.jpg	1
527	file/2020/08/06/8iMAX2fvg1Y_kkP72Q3.jpg	1
528	file/2020/08/06/8iMAX2fvg1Y_zC8iMUI.jpg	1
529	file/2020/08/06/8iMAX2fvg1Y_btll7x2.jpg	1
530	file/2020/08/06/8iMAX2fvg1Y_sfbR0cn.jpg	1
531	file/2020/08/06/8iMAX2fvg1Y_GSuFlzu.jpg	1
532	file/2020/08/06/8iMAX2fvg1Y_0AF5bMS.jpg	1
533	file/2020/08/06/8iMAX2fvg1Y_MIieMbX.jpg	1
534	file/2020/08/06/8iMAX2fvg1Y_cOWmef5.jpg	1
535	file/2020/08/06/8iMAX2fvg1Y_NjKcxXB.jpg	1
536	file/2020/08/06/8iMAX2fvg1Y_RwZaFm9.jpg	1
537	file/2020/08/06/8iMAX2fvg1Y_ARiiMLW.jpg	1
538	file/2020/08/06/8iMAX2fvg1Y_fAkQaWk.jpg	1
539	file/2020/08/06/8iMAX2fvg1Y_WXcKCuK.jpg	1
540	file/2020/08/06/8iMAX2fvg1Y_lKYUZPd.jpg	1
541	file/2020/08/06/8iMAX2fvg1Y_TTfzReu.jpg	1
542	file/2020/08/06/8iMAX2fvg1Y_N3cE3GR.jpg	1
543	file/2020/08/06/8iMAX2fvg1Y_cJ9cOo6.jpg	1
544	file/2020/08/06/8iMAX2fvg1Y_ztm1okI.jpg	1
545	file/2020/08/06/8iMAX2fvg1Y_snwO6ad.jpg	1
546	file/2020/08/06/8iMAX2fvg1Y_O6wYgsl.jpg	1
547	file/2020/08/06/8iMAX2fvg1Y_raOvXVK.jpg	1
548	file/2020/08/06/8iMAX2fvg1Y_0OhBtXF.jpg	1
549	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_BJ4pZZ3.zip	1
550	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_38XdCcq.zip	1
551	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XtQVTzx.zip	1
552	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0D6PkX4.zip	1
553	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yunVhAX.zip	1
554	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NwEHUsU.zip	1
555	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Fnw2FAM.zip	1
556	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_DGWu9uX.zip	1
557	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_k4cCDPu.zip	1
558	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_r7IACnq.zip	1
559	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_WORKAPg.zip	1
560	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mUxe4Pq.zip	1
561	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_T600mYp.zip	1
562	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_pm30GyF.zip	1
563	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wJeYpOv.zip	1
564	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_K3G8hSk.zip	1
565	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OvL8X1Q.zip	1
566	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_zSUFwhL.zip	1
567	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HRul4aa.zip	1
568	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Pfu3AEV.zip	1
569	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_whVRfPs.zip	1
570	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_t2pgGNM.zip	1
571	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uEJ7Ir8.zip	1
572	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Rfe3FAG.zip	1
573	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mR804K6.zip	1
574	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_tNPsgp9.zip	1
575	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8YKQBAX.zip	1
576	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_MQiaLmP.zip	1
577	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_IEju7rM.zip	1
578	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RcwIY4c.zip	1
579	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ZA1Za8M.zip	1
580	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_c6iaUDy.zip	1
581	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9obcE8W.zip	1
582	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ut9koNX.zip	1
583	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_L7Ggkoa.zip	1
584	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vgjIi9N.zip	1
585	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_7MpqCUP.zip	1
586	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_a7GgoQK.zip	1
587	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aKpdNEZ.zip	1
588	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_KcxwEKE.zip	1
589	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_DTCbV1u.zip	1
590	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_DPwNo6i.zip	1
591	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_7Y8d7J3.zip	1
592	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Qh0juVr.zip	1
593	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_CkL9DXq.zip	1
594	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_4adhbjw.zip	1
595	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ZXUX2Ns.zip	1
596	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_b3PXtGL.zip	1
597	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_u2WgPnE.zip	1
598	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mifWd2l.zip	1
599	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aT57Zwm.zip	1
600	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RPeT9ty.zip	1
601	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HhZsjZW.zip	1
602	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xu36cAD.zip	1
603	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bHA87mc.zip	1
604	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hUufgIR.zip	1
605	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OmGg5GQ.zip	1
606	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Hzl2m6Z.zip	1
607	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_IqZ0BQf.zip	1
608	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_YOpWVaT.zip	1
609	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_g1Y5Kwv.zip	1
610	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hipqUD9.zip	1
611	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ZOaNoUP.zip	1
612	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OLlM4sl.zip	1
613	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fNMtlp9.zip	1
614	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_gJpTI0z.zip	1
615	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9t4kLUp.zip	1
616	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_009MCU4.zip	1
617	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bB8JH9k.zip	1
618	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_VH4RuPC.zip	1
619	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_zRvyFo0.zip	1
620	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_iPskM7F.zip	1
621	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_JPG2iNe.zip	1
622	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xXmKqVW.zip	1
623	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_FbnsNK7.zip	1
624	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XoLrIxG.zip	1
625	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_rxSwjYp.zip	1
626	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_deiNf3p.zip	1
627	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_pfV0Txi.zip	1
628	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3xnmALm.zip	1
629	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_gkPdaJH.zip	1
630	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jcjUJ9g.zip	1
631	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3ly0apV.zip	1
632	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3RzHyaw.zip	1
633	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0rMKWZg.zip	1
634	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0XqLhtt.zip	1
635	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_A64CsBl.zip	1
636	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_CtBjNfJ.zip	1
637	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Gj5hxur.zip	1
638	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Dxm4c1U.zip	1
639	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_u4XE7Jp.zip	1
640	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_oEbOmUf.zip	1
641	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_dpc8rfi.zip	1
642	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_qgOC4cI.zip	1
643	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_IEWdeDU.zip	1
644	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_DDyY5as.zip	1
645	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_FRzEfDH.zip	1
646	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Hn1JxkC.zip	1
647	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_cR91hak.zip	1
648	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_r7v9xa0.zip	1
649	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_kKNEqZQ.zip	1
650	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_pWA77bU.zip	1
651	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xq45XMb.zip	1
652	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_KxfvUbz.zip	1
653	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yUfkdBs.zip	1
654	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Wk40SiL.zip	1
655	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NkhyClW.zip	1
656	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_pTbxvTG.zip	1
657	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Tek1L3B.zip	1
658	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Ud4DdK3.zip	1
659	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_TDZsREV.zip	1
660	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SRtlKih.zip	1
661	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uoID6w5.zip	1
662	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_2zgpLAe.zip	1
663	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_L2v7gGo.zip	1
664	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Rafuz5o.zip	1
665	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_BYieQN2.zip	1
666	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bxtjVYS.zip	1
667	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_iC4HlUr.zip	1
668	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_v88SvYY.zip	1
669	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_5BJK6HV.zip	1
670	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_cW06mhG.zip	1
671	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aWc8tv6.zip	1
672	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Hna3Njr.zip	1
673	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Ge3zpOo.zip	1
674	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3GghVY1.zip	1
675	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ImvBuLL.zip	1
676	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UxWCwht.zip	1
677	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_YKkJdC9.zip	1
678	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_itPN6u1.zip	1
679	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QUjbezE.zip	1
680	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vZu2Wnf.zip	1
681	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vYgHuIi.zip	1
682	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0l4rgUB.zip	1
683	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_P6R8Oro.zip	1
684	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SW54CCN.zip	1
685	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_qWAB2Yd.zip	1
686	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_oWXIT0F.zip	1
687	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_CeaMsol.zip	1
688	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8c5JunF.zip	1
689	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_7tq6bL0.zip	1
690	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8A9B8RZ.zip	1
691	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_FyXexH5.zip	1
692	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_6eXA8sv.zip	1
693	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_a8phFzA.zip	1
694	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_lLF3fv5.zip	1
695	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_y4DAWYz.zip	1
696	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_M6SiyFL.zip	1
697	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wSTulNH.zip	1
698	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hqxyeax.zip	1
699	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_PSuqvbK.zip	1
700	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_R9Bpp6p.zip	1
701	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_h95vRSY.zip	1
702	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_P6HdJQ4.zip	1
703	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uwVlT4w.zip	1
704	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9NvFpFg.zip	1
705	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_qSKvQl8.zip	1
706	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3hHGWBe.zip	1
707	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_qvbqq1z.zip	1
708	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mgG9moc.zip	1
709	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_W7m70K2.zip	1
710	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OSHkgtW.zip	1
711	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Sf786Il.zip	1
712	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_gizAXp5.zip	1
713	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_KLqdai9.zip	1
714	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_U5acsBy.zip	1
715	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_oMxS4fE.zip	1
716	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wDaImGu.zip	1
717	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_h4u97F4.zip	1
718	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_878y4Z0.zip	1
719	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ZnN9oOy.zip	1
720	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_cA73Lq0.zip	1
721	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ycVmrz9.zip	1
722	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fTYmRtq.zip	1
723	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HaX20Rn.zip	1
724	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_o8EXqeR.zip	1
725	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OqIcnQU.zip	1
726	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_n4iyoRl.zip	1
727	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_21WSO7t.zip	1
728	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ncMZhM0.zip	1
729	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_z5lpXmh.zip	1
730	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_C6WqfOg.zip	1
731	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_YkRepCo.zip	1
732	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_I6eGOmu.zip	1
733	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jpGgMYk.zip	1
734	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hMvLygF.zip	1
735	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_eTLmUrJ.zip	1
736	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Nc406NI.zip	1
737	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vEfcri2.zip	1
738	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_3GQgbDa.zip	1
739	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_urhJg6u.zip	1
740	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0ypmuon.zip	1
741	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_b4fZTh9.zip	1
742	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aGhYqKP.zip	1
743	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_AJkfmWx.zip	1
744	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_IOG8GZ3.zip	1
745	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_gaowl9U.zip	1
746	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_D7ZQXCW.zip	1
747	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_89vVlO4.zip	1
748	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bxjQxlv.zip	1
749	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_YwTaIIu.zip	1
750	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xdcp2az.zip	1
751	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_gK6y9xV.zip	1
752	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_kb2v6ke.zip	1
753	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ny0XtgW.zip	1
754	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wV0huD2.zip	1
755	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XZREWMf.zip	1
756	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_AqcNOE9.zip	1
757	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_zjmHs68.zip	1
758	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_nOewOW3.zip	1
759	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_up0rG2l.zip	1
760	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HIfDkP4.zip	1
761	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Ok772xE.zip	1
762	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ql7I1bP.zip	1
763	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_KNaIkEn.zip	1
764	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_iWGZk6W.zip	1
765	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fntmLML.zip	1
766	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1).png	1
767	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_4pWmd4Z.png	1
768	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Zea4nnH.png	1
769	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_wBr83AX.png	1
770	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_15IKxam.png	1
771	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_U2q7jMa.png	1
772	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_3UA9Iy7.png	1
773	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_xYA3poM.png	1
774	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_70WuggR.png	1
775	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_2faSCWI.png	1
776	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_iFkE97L.png	1
777	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_VSf67Li.png	1
778	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_eo5hqkm.png	1
779	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_vUcaMHm.png	1
780	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_U0m4OIL.png	1
781	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_ooZy2OR.png	1
782	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_R7isVpt.png	1
783	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Bjybi0E.png	1
784	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_kz922GX.png	1
785	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_kHPIrxw.png	1
786	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_D47rzZe.png	1
787	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_y6IZlTs.png	1
788	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_ZJ0Oj8c.png	1
789	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_FSGL2Xm.png	1
790	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_WlKa2VX.png	1
791	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_gTiq2mP.png	1
792	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_WLKa7Bi.png	1
793	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_xKrEXLp.png	1
794	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_PFDx6dX.png	1
795	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_YzStdzJ.png	1
796	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Ii3mEV2.png	1
797	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_FyHGPRv.png	1
798	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_wUWI9n1.png	1
799	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_T0XnpLX.png	1
800	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_iiFMVJ0.png	1
801	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_lzxNN5Z.png	1
802	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_R3ZPhwI.png	1
803	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Ru80Dn2.png	1
804	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_ST83zgV.png	1
805	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_u9airtR.png	1
806	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_rGPKndC.png	1
807	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_CZ1Xb76.png	1
808	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_TgnDp6F.png	1
809	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_OEkhm7T.png	1
810	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_cs893sl.png	1
811	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_bUg2AEY.png	1
812	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_i5j74cM.png	1
813	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_CH9wFq2.png	1
814	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_eqxGXcQ.png	1
815	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_d5OmiXY.png	1
816	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_qfiI23I.png	1
817	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_DepsB2Z.png	1
818	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_4Ju2Mfp.png	1
819	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_aL6eaJC.png	1
820	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_a2blmqf.png	1
821	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_76xFMVp.png	1
822	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_0t3bxwN.png	1
823	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_RDfZrKL.png	1
824	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_H2npeuu.png	1
825	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_XbIEJBx.png	1
826	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_pQFDjtm.png	1
827	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_4Sgd6kT.png	1
828	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_TAmSFhP.png	1
829	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_pTbJcX6.png	1
830	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_DGfTXcb.png	1
831	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_f4beSxG.png	1
832	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_39kdvCi.png	1
833	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_T4AyBYA.png	1
834	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_1ZJqg3w.png	1
835	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_5wBLq2z.png	1
836	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_UUiQQph.png	1
837	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_MREHxqL.png	1
838	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_uLDqyyN.png	1
839	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_f1xKOAB.png	1
840	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_969tBYj.png	1
841	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_bt09R3P.png	1
842	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_h2Kzivv.png	1
843	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_oZuN0tn.png	1
844	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Grb8iyF.png	1
845	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_aV7avG7.png	1
846	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_mFdsXFC.png	1
847	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_dELgty8.png	1
848	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_7BRQpFp.png	1
849	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_718ElJb.png	1
850	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_g0lqDmQ.png	1
851	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_tPjW8zQ.png	1
852	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Ebx12LZ.png	1
853	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_dKDxSUC.png	1
854	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_EKO2tmh.png	1
855	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Q3vf8O0.png	1
856	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Qk0M6bX.png	1
857	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_X1nDVGb.png	1
858	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_rTeUZBs.png	1
859	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_989Eah6.png	1
860	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_4zwcbcZ.png	1
861	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_As8b7F4.png	1
862	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Ci6cTdJ.png	1
863	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_f0HgjDB.png	1
864	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_fdh9ZFX.png	1
865	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Kb06c1D.png	1
866	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_hHwL08Y.png	1
867	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_CckJiGv.png	1
868	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_eUZzn9X.png	1
869	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_BvE60x2.png	1
870	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_gTVjgJy.png	1
871	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_k0Z2BlN.png	1
872	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_heG62Jx.png	1
873	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_yYQExvb.png	1
874	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_4Ln9Ywa.png	1
875	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_USiIU8i.png	1
876	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_08nf8xq.png	1
877	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_o2OVYo9.png	1
878	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_FbsVzCT.png	1
879	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_v4Ho76A.png	1
880	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_NbcF6vK.png	1
881	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_CHh0e8S.png	1
882	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_r4YQrSw.png	1
883	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_GWHR4cq.png	1
884	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_1ny03S5.png	1
885	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_tuTscrH.png	1
886	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_dZ2ixvi.png	1
887	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_Aw0wsjX.png	1
888	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_D0rMh6v.png	1
889	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_ecLH8I9.png	1
890	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_i2olAtw.png	1
891	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_SC4TCPi.png	1
892	file/2020/08/06/Annotatsiya 2020-08-06 125703_yPgE9fn.png	1
893	file/2020/08/06/Annotatsiya 2020-08-06 125703_4cRFF5W.png	1
894	file/2020/08/06/Annotatsiya 2020-08-06 125703_8iD2D9E.png	1
895	file/2020/08/06/Annotatsiya 2020-08-06 125703_hiiYxR0.png	1
896	file/2020/08/06/Annotatsiya 2020-08-06 125703_9k1tnRA.png	1
897	file/2020/08/06/Annotatsiya 2020-08-06 125703_2gArObN.png	1
898	file/2020/08/06/Annotatsiya 2020-08-06 125703_tRFlgQP.png	1
899	file/2020/08/06/Annotatsiya 2020-08-06 125703_T3b4j9p.png	1
900	file/2020/08/06/Annotatsiya 2020-08-06 125703_599EF5h.png	1
901	file/2020/08/06/Annotatsiya 2020-08-06 125703_CPP6RWs.png	1
902	file/2020/08/06/Annotatsiya 2020-08-06 125703_7ifJuZQ.png	1
903	file/2020/08/06/Annotatsiya 2020-08-06 125703_mevjS2I.png	1
904	file/2020/08/06/Annotatsiya 2020-08-06 125703_vmyCBlQ.png	1
905	file/2020/08/06/Annotatsiya 2020-08-06 125703_RZ4FuRw.png	1
906	file/2020/08/06/Annotatsiya 2020-08-06 125703_zed9unh.png	1
907	file/2020/08/06/Annotatsiya 2020-08-06 125703_WvShNSs.png	1
908	file/2020/08/06/Annotatsiya 2020-08-06 125703_DstbBYI.png	1
909	file/2020/08/06/Annotatsiya 2020-08-06 125703_ArW6Yye.png	1
910	file/2020/08/06/Annotatsiya 2020-08-06 125703_K6uWWIm.png	1
911	file/2020/08/06/Annotatsiya 2020-08-06 125703_FWOv0VR.png	1
912	file/2020/08/06/Annotatsiya 2020-08-06 125703_YHnC0hd.png	1
913	file/2020/08/06/Annotatsiya 2020-08-06 125703_LowhbU5.png	1
914	file/2020/08/06/Annotatsiya 2020-08-06 125703_XFmW8jD.png	1
915	file/2020/08/06/Annotatsiya 2020-08-06 125703_lVnoS86.png	1
916	file/2020/08/06/Annotatsiya 2020-08-06 125703_VIRYcZw.png	1
917	file/2020/08/06/Annotatsiya 2020-08-06 125703_WCrxmCo.png	1
918	file/2020/08/06/Annotatsiya 2020-08-06 125703_X9NavHf.png	1
919	file/2020/08/06/Annotatsiya 2020-08-06 125703_KZpZ1YY.png	1
920	file/2020/08/06/Annotatsiya 2020-08-06 125703_uecXhCS.png	1
921	file/2020/08/06/Annotatsiya 2020-08-06 125703_t7tG03Q.png	1
922	file/2020/08/06/Annotatsiya 2020-08-06 125703_7SuN0wh.png	1
923	file/2020/08/06/Annotatsiya 2020-08-06 125703_lBMZRx8.png	1
924	file/2020/08/06/Annotatsiya 2020-08-06 125703_w6gDy7O.png	1
925	file/2020/08/06/Annotatsiya 2020-08-06 125703_yUQ5awi.png	1
926	file/2020/08/06/Annotatsiya 2020-08-06 125703_IGKAf3I.png	1
927	file/2020/08/06/Annotatsiya 2020-08-06 125703_6jn3oT2.png	1
928	file/2020/08/06/Annotatsiya 2020-08-06 125703_vcpDDVf.png	1
929	file/2020/08/06/Annotatsiya 2020-08-06 125703_68CSYGl.png	1
930	file/2020/08/06/Annotatsiya 2020-08-06 125703_9iHy2r9.png	1
931	file/2020/08/06/Annotatsiya 2020-08-06 125703_JSLBksg.png	1
932	file/2020/08/06/Annotatsiya 2020-08-06 125703_fwUQOAU.png	1
933	file/2020/08/06/Annotatsiya 2020-08-06 125703_lK7VObC.png	1
934	file/2020/08/06/Annotatsiya 2020-08-06 125703_sw5dXZf.png	1
935	file/2020/08/06/Annotatsiya 2020-08-06 125703_FwdGG20.png	1
936	file/2020/08/06/Annotatsiya 2020-08-06 125703_58H65sJ.png	1
937	file/2020/08/06/Annotatsiya 2020-08-06 125703_6O62cuq.png	1
938	file/2020/08/06/Annotatsiya 2020-08-06 125703_VZG62jN.png	1
939	file/2020/08/06/Annotatsiya 2020-08-06 125703_i3MIBPL.png	1
940	file/2020/08/06/Annotatsiya 2020-08-06 125703_1u1FhIu.png	1
941	file/2020/08/06/Annotatsiya 2020-08-06 125703_iDRSrls.png	1
942	file/2020/08/06/Annotatsiya 2020-08-06 125703_waQPhcj.png	1
943	file/2020/08/06/Annotatsiya 2020-08-06 125703_rPuTlan.png	1
944	file/2020/08/06/Annotatsiya 2020-08-06 125703_608uIxb.png	1
945	file/2020/08/06/Annotatsiya 2020-08-06 125703_hJU7kT1.png	1
946	file/2020/08/06/Annotatsiya 2020-08-06 125703_We3G0JG.png	1
947	file/2020/08/06/Annotatsiya 2020-08-06 125703_yxSiACB.png	1
948	file/2020/08/06/Annotatsiya 2020-08-06 125703_Adx9J8x.png	1
949	file/2020/08/06/Annotatsiya 2020-08-06 125703_V0GNdEw.png	1
950	file/2020/08/06/Annotatsiya 2020-08-06 125703_XauuhWF.png	1
951	file/2020/08/06/Annotatsiya 2020-08-06 125703_RdFq0in.png	1
952	file/2020/08/06/Annotatsiya 2020-08-06 125703_tEYJ8PR.png	1
953	file/2020/08/06/Annotatsiya 2020-08-06 125703_hsFfbG6.png	1
954	file/2020/08/06/Annotatsiya 2020-08-06 125703_Dd4SLfr.png	1
955	file/2020/08/06/Annotatsiya 2020-08-06 125703_xWPBLwU.png	1
956	file/2020/08/06/Annotatsiya 2020-08-06 125703_hHbHyol.png	1
957	file/2020/08/06/Annotatsiya 2020-08-06 125703_9Pdrced.png	1
958	file/2020/08/06/Annotatsiya 2020-08-06 125703_zP83H1K.png	1
959	file/2020/08/06/Annotatsiya 2020-08-06 125703_xavJPiU.png	1
960	file/2020/08/06/Annotatsiya 2020-08-06 125703_M8RIj3A.png	1
961	file/2020/08/06/Annotatsiya 2020-08-06 125703_5zpnv7F.png	1
962	file/2020/08/06/Annotatsiya 2020-08-06 125703_uNMOfpF.png	1
963	file/2020/08/06/Annotatsiya 2020-08-06 125703_XupfQ5j.png	1
964	file/2020/08/06/Annotatsiya 2020-08-06 125703_63vF9BE.png	1
965	file/2020/08/06/Annotatsiya 2020-08-06 125703_yUqNFBn.png	1
966	file/2020/08/06/Annotatsiya 2020-08-06 125703_Olh1kG1.png	1
967	file/2020/08/06/Annotatsiya 2020-08-06 125703_FZsMIW0.png	1
968	file/2020/08/06/Annotatsiya 2020-08-06 125703_CvK5iBC.png	1
969	file/2020/08/06/Annotatsiya 2020-08-06 125703_wz83ACj.png	1
970	file/2020/08/06/Annotatsiya 2020-08-06 125703_9xBpJLb.png	1
971	file/2020/08/06/Annotatsiya 2020-08-06 125703_1LnE0fM.png	1
972	file/2020/08/06/Annotatsiya 2020-08-06 125703_YhIIf8i.png	1
973	file/2020/08/06/Annotatsiya 2020-08-06 125703_YdIo2vF.png	1
974	file/2020/08/06/Annotatsiya 2020-08-06 125703_Al1sqTh.png	1
975	file/2020/08/06/Annotatsiya 2020-08-06 125703_E7LWE0E.png	1
976	file/2020/08/06/Annotatsiya 2020-08-06 125703_DQoaQft.png	1
977	file/2020/08/06/Annotatsiya 2020-08-06 125703_uKvPK3m.png	1
978	file/2020/08/06/Annotatsiya 2020-08-06 125703_oGZXJte.png	1
979	file/2020/08/06/Annotatsiya 2020-08-06 125703_hdt7S6R.png	1
980	file/2020/08/06/Annotatsiya 2020-08-06 125703_QwbfGyt.png	1
981	file/2020/08/06/Annotatsiya 2020-08-06 125703_kMWYhSq.png	1
982	file/2020/08/06/Annotatsiya 2020-08-06 125703_lbWZsv2.png	1
983	file/2020/08/06/Annotatsiya 2020-08-06 125703_JCF5D6e.png	1
984	file/2020/08/06/Annotatsiya 2020-08-06 125703_EmCiM2q.png	1
985	file/2020/08/06/Annotatsiya 2020-08-06 125703_9CMwjiA.png	1
986	file/2020/08/06/Annotatsiya 2020-08-06 125703_rHtSO3o.png	1
987	file/2020/08/06/Annotatsiya 2020-08-06 125703_tw9f72s.png	1
988	file/2020/08/06/Annotatsiya 2020-08-06 125703_MBsjcQH.png	1
989	file/2020/08/06/Annotatsiya 2020-08-06 125703_9Mi2rqH.png	1
990	file/2020/08/06/Annotatsiya 2020-08-06 125703_7xtTcTM.png	1
991	file/2020/08/06/Annotatsiya 2020-08-06 125703_eHsTUrP.png	1
992	file/2020/08/06/Annotatsiya 2020-08-06 125703_EldAZSJ.png	1
993	file/2020/08/06/Annotatsiya 2020-08-06 125703_iwmsip2.png	1
994	file/2020/08/06/Annotatsiya 2020-08-06 125703_kZLL2Qf.png	1
995	file/2020/08/06/Annotatsiya 2020-08-06 125703_FZPu0Mm.png	1
996	file/2020/08/06/Annotatsiya 2020-08-06 125703_8xGzd0G.png	1
997	file/2020/08/06/Annotatsiya 2020-08-06 125703_rabvP1K.png	1
998	file/2020/08/06/Annotatsiya 2020-08-06 125703_wrCNa6y.png	1
999	file/2020/08/06/Annotatsiya 2020-08-06 125703_TErjX9y.png	1
1000	file/2020/08/06/Annotatsiya 2020-08-06 125703_11zYPLa.png	1
1001	file/2020/08/06/Annotatsiya 2020-08-06 125703_Mrp2aM5.png	1
1002	file/2020/08/06/Annotatsiya 2020-08-06 125703_hDrGQe1.png	1
1003	file/2020/08/06/Annotatsiya 2020-08-06 125703_0yU9x5u.png	1
1004	file/2020/08/06/Annotatsiya 2020-08-06 125703_CztzoRl.png	1
1005	file/2020/08/06/Annotatsiya 2020-08-06 125703_j7BAaqb.png	1
1006	file/2020/08/06/Annotatsiya 2020-08-06 125703_60ZCtOU.png	1
1007	file/2020/08/06/Annotatsiya 2020-08-06 125703_kteaRWD.png	1
1008	file/2020/08/06/Annotatsiya 2020-08-06 125703_4xqUMF4.png	1
1009	file/2020/08/06/Annotatsiya 2020-08-06 125703_1duXaP2.png	1
1010	file/2020/08/06/Annotatsiya 2020-08-06 125703_RlVj8ah.png	1
1011	file/2020/08/06/Annotatsiya 2020-08-06 125703_g0HI2JS.png	1
1012	file/2020/08/06/Annotatsiya 2020-08-06 125703_8RonXde.png	1
1013	file/2020/08/06/Annotatsiya 2020-08-06 125703_DfgGRG3.png	1
1014	file/2020/08/06/Annotatsiya 2020-08-06 125703_rNUXNIS.png	1
1015	file/2020/08/06/Annotatsiya 2020-08-06 125703_uS4WxTN.png	1
1016	file/2020/08/06/Annotatsiya 2020-08-06 125703_iP4ojK1.png	1
1017	file/2020/08/06/Annotatsiya 2020-08-06 125703_eWMQlG6.png	1
1018	file/2020/08/06/Annotatsiya 2020-08-06 125703_Y8TSjQG.png	1
1019	file/2020/08/06/Annotatsiya 2020-08-06 125703_ckdJ01U.png	1
1020	file/2020/08/06/Annotatsiya 2020-08-06 125703_bEmeGob.png	1
1021	file/2020/08/06/Annotatsiya 2020-08-06 125703_7h3Qnl7.png	1
1022	file/2020/08/06/Annotatsiya 2020-08-06 125703_fzfAK2l.png	1
1023	file/2020/08/06/Annotatsiya 2020-08-06 125703_iwoVXOZ.png	1
1024	file/2020/08/06/Annotatsiya 2020-08-06 125703_oFlLbA2.png	1
1025	file/2020/08/06/Annotatsiya 2020-08-06 125703_57lkJVl.png	1
1026	file/2020/08/06/Annotatsiya 2020-08-06 125703_mxyjl5t.png	1
1027	file/2020/08/06/Annotatsiya 2020-08-06 125703_Kzcarvi.png	1
1028	file/2020/08/06/Annotatsiya 2020-08-06 125703_eYiJHeE.png	1
1029	file/2020/08/06/Annotatsiya 2020-08-06 125703_St3JjBo.png	1
1030	file/2020/08/06/Annotatsiya 2020-08-06 125703_G8fEVfq.png	1
1031	file/2020/08/06/Annotatsiya 2020-08-06 125703_UK9Odl1.png	1
1032	file/2020/08/06/Annotatsiya 2020-08-06 125703_dXTUKxD.png	1
1033	file/2020/08/06/Annotatsiya 2020-08-06 125703_efR8Aay.png	1
1034	file/2020/08/06/Annotatsiya 2020-08-06 125703_mCVcnje.png	1
1035	file/2020/08/06/Annotatsiya 2020-08-06 125703_tjfBJsH.png	1
1036	file/2020/08/06/Annotatsiya 2020-08-06 125703_pIt3iNn.png	1
1037	file/2020/08/06/Annotatsiya 2020-08-06 125703_C6lZDEx.png	1
1038	file/2020/08/06/Annotatsiya 2020-08-06 125703_gMx1L3F.png	1
1039	file/2020/08/06/Annotatsiya 2020-08-06 125703_CEA8AMW.png	1
1040	file/2020/08/06/Annotatsiya 2020-08-06 125703_rPa2GhE.png	1
1041	file/2020/08/06/Annotatsiya 2020-08-06 125703_EprUg47.png	1
1042	file/2020/08/06/Annotatsiya 2020-08-06 125703_VzdluIq.png	1
1043	file/2020/08/06/Annotatsiya 2020-08-06 125703_2GkMOvn.png	1
1044	file/2020/08/06/Annotatsiya 2020-08-06 125703_9YjS1el.png	1
1045	file/2020/08/06/Annotatsiya 2020-08-06 125703_1qIFvLh.png	1
1046	file/2020/08/06/Annotatsiya 2020-08-06 125703_lZrQ5UT.png	1
1047	file/2020/08/06/Annotatsiya 2020-08-06 125703_fXQMh74.png	1
1048	file/2020/08/06/Annotatsiya 2020-08-06 125703_trL8nbB.png	1
1049	file/2020/08/06/Annotatsiya 2020-08-06 125703_o3TaL8S.png	1
1050	file/2020/08/06/Annotatsiya 2020-08-06 125703_uh9yROE.png	1
1051	file/2020/08/06/Annotatsiya 2020-08-06 125703_kkcLbW0.png	1
1052	file/2020/08/06/Annotatsiya 2020-08-06 125703_UmqzwKO.png	1
1053	file/2020/08/06/Annotatsiya 2020-08-06 125703_yMFtzMm.png	1
1054	file/2020/08/06/Annotatsiya 2020-08-06 125703_nSr98um.png	1
1055	file/2020/08/06/Annotatsiya 2020-08-06 125703_Og475fU.png	1
1056	file/2020/08/06/Annotatsiya 2020-08-06 125703_Z8okLTD.png	1
1057	file/2020/08/06/Annotatsiya 2020-08-06 125703_QFYf6LA.png	1
1058	file/2020/08/06/Annotatsiya 2020-08-06 125703_ItMAoSe.png	1
1059	file/2020/08/06/Annotatsiya 2020-08-06 125703_VsaKn1g.png	1
1060	file/2020/08/06/Annotatsiya 2020-08-06 125703_Pm33gMv.png	1
1061	file/2020/08/06/Annotatsiya 2020-08-06 125703_Tb1HzZY.png	1
1062	file/2020/08/06/Annotatsiya 2020-08-06 125703_wKjhK8I.png	1
1063	file/2020/08/06/Annotatsiya 2020-08-06 125703_dUPfK8j.png	1
1064	file/2020/08/06/Annotatsiya 2020-08-06 125703_opCrxax.png	1
1065	file/2020/08/06/Annotatsiya 2020-08-06 125703_xCr3kbn.png	1
1066	file/2020/08/06/Annotatsiya 2020-08-06 125703_4MsER4H.png	1
1067	file/2020/08/06/Annotatsiya 2020-08-06 125703_v40ZOJX.png	1
1068	file/2020/08/06/Annotatsiya 2020-08-06 125703_FQvdaDU.png	1
1069	file/2020/08/06/Annotatsiya 2020-08-06 125703_16VVW6D.png	1
1070	file/2020/08/06/Annotatsiya 2020-08-06 125703_29ykKJM.png	1
1071	file/2020/08/06/Annotatsiya 2020-08-06 125703_OzxDY6f.png	1
1072	file/2020/08/06/Annotatsiya 2020-08-06 125703_h4ls92x.png	1
1073	file/2020/08/06/Annotatsiya 2020-08-06 125703_gTKv7tL.png	1
1074	file/2020/08/06/Annotatsiya 2020-08-06 125703_6T20Go6.png	1
1075	file/2020/08/06/Annotatsiya 2020-08-06 125703_NIQhGEN.png	1
1076	file/2020/08/06/Annotatsiya 2020-08-06 125703_CG2MO6n.png	1
1077	file/2020/08/06/Annotatsiya 2020-08-06 125703_vXJhN7A.png	1
1078	file/2020/08/06/Annotatsiya 2020-08-06 125703_7o3hVYz.png	1
1079	file/2020/08/06/Annotatsiya 2020-08-06 125703_QZMX5VU.png	1
1080	file/2020/08/06/Annotatsiya 2020-08-06 125703_Eo0CU7h.png	1
1081	file/2020/08/06/Annotatsiya 2020-08-06 125703_CGocsKT.png	1
1082	file/2020/08/06/Annotatsiya 2020-08-06 125703_ToLtiOj.png	1
1083	file/2020/08/06/Annotatsiya 2020-08-06 125703_zUv5bAY.png	1
1084	file/2020/08/06/Annotatsiya 2020-08-06 125703_bp84BTz.png	1
1085	file/2020/08/06/Annotatsiya 2020-08-06 125703_CMHXMtq.png	1
1086	file/2020/08/06/Annotatsiya 2020-08-06 125703_MI15QZR.png	1
1087	file/2020/08/06/Annotatsiya 2020-08-06 125703_tIDgjAk.png	1
1088	file/2020/08/06/Annotatsiya 2020-08-06 125703_GEDGWmR.png	1
1089	file/2020/08/06/Annotatsiya 2020-08-06 125703_zQfUmlF.png	1
1090	file/2020/08/06/Annotatsiya 2020-08-06 125703_Iw09ac8.png	1
1091	file/2020/08/06/Annotatsiya 2020-08-06 125703_Y1FBXoI.png	1
1092	file/2020/08/06/Annotatsiya 2020-08-06 125703_1TYJbly.png	1
1093	file/2020/08/06/Annotatsiya 2020-08-06 125703_vdLcNPL.png	1
1094	file/2020/08/06/Annotatsiya 2020-08-06 125703_HAeXAeT.png	1
1095	file/2020/08/06/Annotatsiya 2020-08-06 125703_1oJIkid.png	1
1096	file/2020/08/06/Annotatsiya 2020-08-06 125703_wiIeNij.png	1
1097	file/2020/08/06/Annotatsiya 2020-08-06 125703_YzurPnV.png	1
1098	file/2020/08/06/Annotatsiya 2020-08-06 125703_LeUXXmh.png	1
1099	file/2020/08/06/Annotatsiya 2020-08-06 125703_UzUeeZV.png	1
1100	file/2020/08/06/Annotatsiya 2020-08-06 125703_KxizYHb.png	1
1101	file/2020/08/06/Annotatsiya 2020-08-06 125703_nLGD7ub.png	1
1102	file/2020/08/06/Annotatsiya 2020-08-06 125703_78EvNn7.png	1
1103	file/2020/08/06/Annotatsiya 2020-08-06 125703_7QZSnDw.png	1
1104	file/2020/08/06/Annotatsiya 2020-08-06 125703_h9FdWLF.png	1
1105	file/2020/08/06/Annotatsiya 2020-08-06 125703_j1wkMf0.png	1
1106	file/2020/08/06/Annotatsiya 2020-08-06 125703_EdzQDGg.png	1
1107	file/2020/08/06/Annotatsiya 2020-08-06 125703_Ky0JYEx.png	1
1108	file/2020/08/06/Annotatsiya 2020-08-06 125703_lfO3Gx5.png	1
1109	file/2020/08/06/Annotatsiya 2020-08-06 125703_VNWC8e3.png	1
1110	file/2020/08/06/Annotatsiya 2020-08-06 125703_9fSYUiG.png	1
1111	file/2020/08/06/Annotatsiya 2020-08-06 125703_wQ7PSGq.png	1
1112	file/2020/08/06/Annotatsiya 2020-08-06 125703_Noe9lF5.png	1
1113	file/2020/08/06/Annotatsiya 2020-08-06 125703_h6aYpmJ.png	1
1114	file/2020/08/06/Annotatsiya 2020-08-06 125703_mCCBcq5.png	1
1115	file/2020/08/06/Annotatsiya 2020-08-06 125703_w9tAAPu.png	1
1116	file/2020/08/06/Annotatsiya 2020-08-06 125703_jswyNeL.png	1
1117	file/2020/08/06/Annotatsiya 2020-08-06 125703_AobDtEo.png	1
1118	file/2020/08/06/Annotatsiya 2020-08-06 125703_IDVI2zp.png	1
1119	file/2020/08/06/Annotatsiya 2020-08-06 125703_3OtSBWF.png	1
1120	file/2020/08/06/Annotatsiya 2020-08-06 125703_vRHtFtC.png	1
1121	file/2020/08/06/Annotatsiya 2020-08-06 125703_YhPTn0Z.png	1
1122	file/2020/08/06/Annotatsiya 2020-08-06 125703_NGfMCNS.png	1
1123	file/2020/08/06/Annotatsiya 2020-08-06 125703_ys7QBvZ.png	1
1124	file/2020/08/06/Annotatsiya 2020-08-06 125703_TW7gvCc.png	1
1125	file/2020/08/06/Annotatsiya 2020-08-06 125703_Kffdw6X.png	1
1126	file/2020/08/06/Annotatsiya 2020-08-06 125703_7qiw1iH.png	1
1127	file/2020/08/06/Annotatsiya 2020-08-06 125703_cYkDq4G.png	1
1128	file/2020/08/06/Annotatsiya 2020-08-06 125703_siO80eh.png	1
1129	file/2020/08/06/Annotatsiya 2020-08-06 125703_me8LcYu.png	1
1130	file/2020/08/06/Annotatsiya 2020-08-06 125703_SvUVOl3.png	1
1131	file/2020/08/06/Annotatsiya 2020-08-06 125703_BsXYIbl.png	1
1132	file/2020/08/06/Annotatsiya 2020-08-06 125703_p3LLy4h.png	1
1133	file/2020/08/06/Annotatsiya 2020-08-06 125703_qbRd1dP.png	1
1134	file/2020/08/06/Annotatsiya 2020-08-06 125703_MeGmVpz.png	1
1135	file/2020/08/06/Annotatsiya 2020-08-06 125703_fTKdJ39.png	1
1136	file/2020/08/06/Annotatsiya 2020-08-06 125703_JEm3efg.png	1
1137	file/2020/08/06/Annotatsiya 2020-08-06 125703_uSMbiIc.png	1
1138	file/2020/08/06/Annotatsiya 2020-08-06 125703_DWNHwdc.png	1
1139	file/2020/08/06/Annotatsiya 2020-08-06 125703_UNjoMRd.png	1
1140	file/2020/08/06/Annotatsiya 2020-08-06 125703_sPFwNda.png	1
1141	file/2020/08/06/Annotatsiya 2020-08-06 125703_NQvR4VT.png	1
1142	file/2020/08/06/Annotatsiya 2020-08-06 125703_GFx3yWq.png	1
1143	file/2020/08/06/Annotatsiya 2020-08-06 125703_tI7MgeO.png	1
1144	file/2020/08/06/Annotatsiya 2020-08-06 125703_daxvraC.png	1
1145	file/2020/08/06/Annotatsiya 2020-08-06 125703_CLKkrLp.png	1
1146	file/2020/08/06/Annotatsiya 2020-08-06 125703_OWrfetF.png	1
1147	file/2020/08/06/Annotatsiya 2020-08-06 125703_FtpH69v.png	1
1148	file/2020/08/06/Annotatsiya 2020-08-06 125703_HZLqpVm.png	1
1149	file/2020/08/06/Annotatsiya 2020-08-06 125703_rw8p2Uw.png	1
1150	file/2020/08/06/Annotatsiya 2020-08-06 125703_icuHgpx.png	1
1151	file/2020/08/06/Annotatsiya 2020-08-06 125703_yV95jAc.png	1
1152	file/2020/08/06/Annotatsiya 2020-08-06 125703_3EreE9T.png	1
1153	file/2020/08/06/Annotatsiya 2020-08-06 125703_0kw7ILi.png	1
1154	file/2020/08/06/Annotatsiya 2020-08-06 125703_XiiUdzo.png	1
1155	file/2020/08/06/Annotatsiya 2020-08-06 125703_eFgrtpA.png	1
1156	file/2020/08/06/Annotatsiya 2020-08-06 125703_7nDxFO1.png	1
1157	file/2020/08/06/Annotatsiya 2020-08-06 125703_lg7LZc5.png	1
1158	file/2020/08/06/Annotatsiya 2020-08-06 125703_6zQht9E.png	1
1159	file/2020/08/06/Annotatsiya 2020-08-06 125703_nItnyw6.png	1
1160	file/2020/08/06/Annotatsiya 2020-08-06 125703_hzX7Dv9.png	1
1161	file/2020/08/06/Annotatsiya 2020-08-06 125703_Tx7j0Ho.png	1
1162	file/2020/08/06/Annotatsiya 2020-08-06 125703_ESq16ji.png	1
1163	file/2020/08/06/Annotatsiya 2020-08-06 125703_mmerO1V.png	1
1164	file/2020/08/06/Annotatsiya 2020-08-06 125703_JbHNJsc.png	1
1165	file/2020/08/06/Annotatsiya 2020-08-06 125703_kAIuj2Q.png	1
1166	file/2020/08/06/Annotatsiya 2020-08-06 125703_VNi3pTb.png	1
1167	file/2020/08/06/Annotatsiya 2020-08-06 125703_sBHWVW1.png	1
1168	file/2020/08/06/Annotatsiya 2020-08-06 125703_aFj8Al4.png	1
1169	file/2020/08/06/Annotatsiya 2020-08-06 125703_DP0jJXd.png	1
1170	file/2020/08/06/Annotatsiya 2020-08-06 125703_gZveH5Y.png	1
1171	file/2020/08/06/Annotatsiya 2020-08-06 125703_G5tfhjs.png	1
1172	file/2020/08/06/Annotatsiya 2020-08-06 125703_ef2MvCY.png	1
1173	file/2020/08/06/Annotatsiya 2020-08-06 125703_H5990Yr.png	1
1174	file/2020/08/06/Annotatsiya 2020-08-06 125703_6VwrJEO.png	1
1175	file/2020/08/06/Annotatsiya 2020-08-06 125703_Aj0aI94.png	1
1176	file/2020/08/06/Annotatsiya 2020-08-06 125703_uBbNJfR.png	1
1177	file/2020/08/06/Annotatsiya 2020-08-06 125703_jcvAPmp.png	1
1178	file/2020/08/06/Annotatsiya 2020-08-06 125703_wZU7IMj.png	1
1179	file/2020/08/06/Annotatsiya 2020-08-06 125703_qFzlPIH.png	1
1180	file/2020/08/06/Annotatsiya 2020-08-06 125703_s4Vu0UJ.png	1
1181	file/2020/08/06/Annotatsiya 2020-08-06 125703_kDjz9uW.png	1
1182	file/2020/08/06/Annotatsiya 2020-08-06 125703_UfzgsqS.png	1
1183	file/2020/08/06/Annotatsiya 2020-08-06 125703_W9JxOur.png	1
1184	file/2020/08/06/Annotatsiya 2020-08-06 125703_Njh8pfv.png	1
1185	file/2020/08/06/Annotatsiya 2020-08-06 125703_DH7uEZy.png	1
1186	file/2020/08/06/Annotatsiya 2020-08-06 125703_Juskosu.png	1
1187	file/2020/08/06/Annotatsiya 2020-08-06 125703_EE8aorF.png	1
1188	file/2020/08/06/Annotatsiya 2020-08-06 125703_Iom9iVQ.png	1
1189	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_isarPCQ.zip	1
1190	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wONX5BR.zip	1
1191	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_R5kYFXf.zip	1
1192	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_L4DUJK6.zip	1
1193	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_U3c5YU9.zip	1
1194	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_A2n58mg.zip	1
1195	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ooUvZkr.zip	1
1196	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ouyB1Fw.zip	1
1197	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ehjBmkj.zip	1
1198	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_PWMDqYT.zip	1
1199	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Cp3BRRJ.zip	1
1200	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_cZfPkbX.zip	1
1201	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_FUc2w6q.zip	1
1202	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_JzLejbG.zip	1
1203	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_4CfBdVF.zip	1
1204	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_nsGHZZZ.zip	1
1205	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_iXFYnFm.zip	1
1206	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_laRhS5V.zip	1
1207	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_1jaldrP.zip	1
1208	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0K3joe0.zip	1
1209	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UxWedsj.zip	1
1210	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_kWxEzOa.zip	1
1211	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_js9ISPF.zip	1
1212	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NzWwaIr.zip	1
1213	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jtu0DL8.zip	1
1214	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_sr68NQ9.zip	1
1215	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_X1lqfzl.zip	1
1216	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jEKyEKK.zip	1
1217	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ARmqK1l.zip	1
1218	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_EZ4O8Xo.zip	1
1219	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_5kzKtLh.zip	1
1220	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Mok2muR.zip	1
1221	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vNd67v7.zip	1
1222	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xbSQLig.zip	1
1223	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Uob0Uox.zip	1
1224	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Wb55pa8.zip	1
1225	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wcS3Tix.zip	1
1226	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_VokTzpf.zip	1
1227	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_n8ijrjE.zip	1
1228	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aQr7N8m.zip	1
1229	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_WC1Qw4e.zip	1
1230	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_l8DSMTG.zip	1
1231	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8GszX5o.zip	1
1232	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_32Z3YBi.zip	1
1233	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UZnxhZz.zip	1
1234	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bhZS0J7.zip	1
1235	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OCWXZUs.zip	1
1236	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_X0CTAcs.zip	1
1237	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ka76rdj.zip	1
1238	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XZhrkaR.zip	1
1239	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aXG52Jj.zip	1
1240	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QaGGzZa.zip	1
1241	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SvBcEGn.zip	1
1242	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_A1GtGPQ.zip	1
1243	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_1Bvi8CX.zip	1
1244	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UvIfIoz.zip	1
1245	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_dZ6EAca.zip	1
1246	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ctpZg7R.zip	1
1247	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SVFhnKv.zip	1
1248	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fQCFHGd.zip	1
1249	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_aB9gZJe.zip	1
1250	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_u13bdZn.zip	1
1251	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_5rYI6GD.zip	1
1252	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RopXq0g.zip	1
1253	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ratD6tn.zip	1
1254	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_U6dGJd7.zip	1
1255	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_TORijUK.zip	1
1256	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_geb7RP2.zip	1
1257	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_LLq5fCU.zip	1
1258	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_N2qz7t6.zip	1
1259	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_lM940pj.zip	1
1260	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Sy8xvsy.zip	1
1261	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_M5yJzil.zip	1
1262	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ycAXXaM.zip	1
1263	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_M73324T.zip	1
1264	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_t1lMEYN.zip	1
1265	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RnZSm1t.zip	1
1266	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9M64SHg.zip	1
1267	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hkNLriY.zip	1
1268	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bcaIUGe.zip	1
1269	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_5htlXEn.zip	1
1270	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NurSiBq.zip	1
1271	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_MU791G4.zip	1
1272	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wXEpvZ0.zip	1
1273	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_wGr4Itn.zip	1
1274	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Uo4IAEL.zip	1
1275	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9F86wUI.zip	1
1276	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_I5EEz5A.zip	1
1277	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_okg6GNO.zip	1
1278	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_1A1s8Vn.zip	1
1279	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UOQvVV0.zip	1
1280	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bflulhl.zip	1
1281	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_k69wpQY.zip	1
1282	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_lTvv5KL.zip	1
1283	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Y4iorL7.zip	1
1284	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_csxmhPy.zip	1
1285	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_K4N0L7S.zip	1
1286	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yhJVYSy.zip	1
1287	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yw6BnVn.zip	1
1288	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ZGZr2P5.zip	1
1289	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_o6lCz1Y.zip	1
1290	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_MYPvR7e.zip	1
1291	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SA0oICK.zip	1
1292	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_k7Rcjfz.zip	1
1293	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_EsiGh27.zip	1
1294	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_BLOy2ud.zip	1
1295	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_tbhK5n0.zip	1
1296	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SulHTeT.zip	1
1297	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jOnPbng.zip	1
1298	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_u7Vl5xq.zip	1
1299	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_5jyxtBV.zip	1
1300	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_PpwGrYF.zip	1
1301	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ouQ1t1l.zip	1
1302	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QHvnnQU.zip	1
1303	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_kg4BbGQ.zip	1
1304	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_zNQq50u.zip	1
1305	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_nmt2rqI.zip	1
1306	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_BTyj4wf.zip	1
1307	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_FnoV5ck.zip	1
1308	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_nSs1b23.zip	1
1309	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_u0dAosD.zip	1
1310	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8upLrJz.zip	1
1311	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_b5oPs9S.zip	1
1312	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Xn37zCB.zip	1
1313	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_f8BGGCK.zip	1
1314	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_vQZFRyS.zip	1
1315	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_DCVz7Lw.zip	1
1316	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_KPdYaF5.zip	1
1317	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QppYOkS.zip	1
1318	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bcSVGIO.zip	1
1319	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_O7cKRvn.zip	1
1320	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_BJgtoO0.zip	1
1321	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_i2tfRAn.zip	1
1322	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ujNtpoq.zip	1
1323	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_hduMyR4.zip	1
1324	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_l7MCchK.zip	1
1325	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_rzlMVnw.zip	1
1326	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_6KLfv5a.zip	1
1327	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_eHGwYzS.zip	1
1328	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_6KpcvOC.zip	1
1329	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_PvlE1l9.zip	1
1330	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_xAWG0Ye.zip	1
1331	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QHIlaQK.zip	1
1332	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8RdPxq0.zip	1
1333	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0r0ndZ2.zip	1
1334	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0ucaxYp.zip	1
1335	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_G0Lm8gE.zip	1
1336	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Q5019U5.zip	1
1337	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UZElbon.zip	1
1338	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_4kVeKAU.zip	1
1339	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uOkL0wK.zip	1
1340	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_O1Lfnaj.zip	1
1341	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_VjfWHKP.zip	1
1342	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9rJl739.zip	1
1343	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XqMQ9ep.zip	1
1344	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_rFt7t0L.zip	1
1345	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bZcsIOS.zip	1
1346	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_w3RwGoX.zip	1
1347	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_XxcHwva.zip	1
1348	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_lpucexO.zip	1
1349	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_uHSMZg0.zip	1
1350	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mPVQyin.zip	1
1351	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Wj5aTNB.zip	1
1352	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_jarMlWh.zip	1
1353	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QgpPRms.zip	1
1354	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_1TwJs6b.zip	1
1355	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_m74HGcD.zip	1
1356	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_UVPgw5E.zip	1
1357	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_57uYGh0.zip	1
1358	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NXzzZwW.zip	1
1359	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_nidELqH.zip	1
1360	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_rcRh7xj.zip	1
1361	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fBF4yXa.zip	1
1362	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_TJB8RZb.zip	1
1363	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RtuZHbo.zip	1
1364	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_NUEhAhL.zip	1
1365	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_TOEkgvF.zip	1
1366	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_QU6jzXL.zip	1
1367	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0odDpe0.zip	1
1368	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_zwx0bTM.zip	1
1369	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_lu5oBHk.zip	1
1370	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ahjVD2I.zip	1
1371	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yaqULav.zip	1
1372	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Ic2APB4.zip	1
1373	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Jf02V0w.zip	1
1374	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OHD4KlR.zip	1
1375	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_AO0t9ZU.zip	1
1376	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SWtQFjc.zip	1
1377	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_SdgrEs2.zip	1
1378	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_VJFZCBd.zip	1
1379	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_7Zf5QG5.zip	1
1380	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_yvaWt70.zip	1
1381	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_2dsNPOJ.zip	1
1382	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_EXtF7Zh.zip	1
1383	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_9L37cxa.zip	1
1384	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_8mXe1RY.zip	1
1385	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_1dyThmJ.zip	1
1386	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_eKSXtqi.zip	1
1387	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fAQ9bFZ.zip	1
1388	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_b3naEij.zip	1
1389	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fjfpqne.zip	1
1390	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_r0Xt3mG.zip	1
1391	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mZ6ykqA.zip	1
1392	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_ClI2mNl.zip	1
1393	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OC5NKpS.zip	1
1394	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_Hph7o3m.zip	1
1395	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_pxxYoCe.zip	1
1396	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_OBP9WoM.zip	1
1397	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_m8gd0ZN.zip	1
1398	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_adT6k3f.zip	1
1399	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_fMc05sA.zip	1
1400	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_mx4paUO.zip	1
1401	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_0w00Wyc.zip	1
1402	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_6qpbRxY.zip	1
1403	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_80cibUh.zip	1
1404	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_bqXOAqU.zip	1
1405	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HPFoYGo.zip	1
1406	file/2020/08/06/Kupibilet_order_ru_6193085721 (1)_jUbojQt.pdf	1
1407	file/2020/08/06/Zapchasti_ijul' (1)_Q98uDbL.xlsx	1
1408	file/2020/08/06/sistema-peredachi-energii_zxnFvg1.jpg	1
1409	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_RtAt3oX.zip	1
1410	file/2020/08/06/Annotatsiya 2020-08-06 133102_jRm8hIw.png	1
1411	file/2020/08/06/andrej-chikatilo-1.jpg	1
1412	file/2020/08/06/Zapchasti_ijul' (1)_JyvUSh7.xlsx	1
1413	file/2020/08/06/Zapchasti_ijul' (1)_PPklH6R.xlsx	1
1414	file/2020/08/06/Zapchasti_ijul' (1)_nPYyouO.xlsx	1
1415	file/2020/08/06/Zapchasti_ijul' (1)_BwzY5MI.xlsx	1
1416	file/2020/08/06/sistema-peredachi-energii_IWayznq.jpg	1
1417	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_TVgL3zS.png	1
1418	file/2020/08/06/nongl.txt	1
1419	file/2020/08/06/nongl_4LBeucp.txt	1
1420	file/2020/08/06/Zapchasti_ijul' (1)_dwfrGUI.xlsx	1
1421	file/2020/08/06/Annotatsiya 2020-08-06 125703_5dNIQ5w.png	1
1422	file/2020/08/06/8iMAX2fvg1Y_ZLm8mCM.jpg	1
1423	file/2020/08/06/Video_WERjjyQ.mp4	1
1424	file/2020/08/06/Otchet_na_02_08_2020.docx	1
1425	file/2020/08/06/Annotatsiya 2020-08-06 173149.png	1
1426	file/2020/08/06/Soobschenija.html	1
1427	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_HOuVbW3.zip	1
1428	file/2020/08/06/Zapchasti_ijul' (1)_66xy4bu.xlsx	1
1429	file/2020/08/06/sistema-peredachi-energii_ehe81yv.jpg	1
1430	file/2020/08/06/Zapchasti_ijul' (1)_MM0rfxo.xlsx	1
1431	file/2020/08/06/Kupibilet_order_ru_6193085721 (1)_tFCbYSV.pdf	1
1432	file/2020/08/06/Video_mDNuqsr.mp4	1
1433	file/2020/08/06/Zapchasti_ijul' (1)_bGBXdu8.xlsx	1
1434	file/2020/08/06/andrej-chikatilo-1_WT18mI8.jpg	1
1435	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_2y1PQTl.zip	1
1436	file/2020/08/06/andrej-chikatilo-1_vgb8UGj.jpg	1
1437	file/2020/08/06/Dazhe koshka sledit za figuroj, a ty.mp4	1
1438	file/2020/08/06/Annotatsiya 2020-08-06 173149_NHhzxRF.png	1
1439	file/2020/08/06/andrej-chikatilo-1_cmtxFhP.jpg	1
1440	file/2020/08/06/Annotatsiya 2020-08-06 173149_lXANv2v.png	1
1441	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_2y1PQTl_mt7jN8d.zip	1
1442	file/2020/08/06/Dazhe koshka sledit za figuroj, a ty_chukvJv.mp4	1
1443	file/2020/08/06/Annotatsiya 2020-08-06 173149_gUEL8vg.png	1
1444	file/2020/08/06/andrej-chikatilo-1_CclQNo7.jpg	1
1445	file/2020/08/06/Annotatsiya 2020-08-06 133102 (1)_cBdIXRJ.png	1
1446	file/2020/08/06/Annotatsiya 2020-08-06 133102_fFfYVcR.png	1
1447	file/2020/08/06/nongl_Jh9Jv91.txt	1
1448	file/2020/08/06/Dazhe koshka sledit za figuroj, a ty_KHbjZI9.mp4	1
1449	file/2020/08/06/45930383_ml.jpg	1
1450	file/2020/08/06/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c.zip	1
1451	file/2020/08/06/Zapchasti_ijul' (1)_GGoTCVR.xlsx	1
1452	file/2020/08/06/Video_dvKsRgR.mp4	1
1453	file/2020/08/06/45930383_ml_7eAsTen.jpg	1
1454	file/2020/08/06/45930383_ml_2ZM3D3D.jpg	1
1455	file/2020/08/06/45930383_ml_hSe4dgq.jpg	1
1456	file/2020/08/06/Annotatsiya 2020-08-06 173149_UoZyAPc.png	1
1457	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl.zip	1
1458	file/2020/08/07/Arhiv s kirillicheskim nazvaniem.zip	1
1459	file/2020/08/07/andrej-chikatilo-1.jpg	1
1460	file/2020/08/07/Soobschenija.html	1
1461	file/2020/08/07/Annotatsiya 2020-08-06 133102 (1).png	1
1462	file/2020/08/07/Foto s kirillicheskim nazvaniem.jpg	1
1463	file/2020/08/07/Zapchasti_ijul' (1).xlsx	1
1464	file/2020/08/07/Annotatsiya 2020-08-06 133102 (1)_6U6vMUd.png	1
1465	file/2020/08/07/Annotatsiya 2020-08-06 133102.png	1
1466	file/2020/08/07/Annotatsiya 2020-08-06 125703.png	1
1467	file/2020/08/07/Zapchasti_ijul' (1)_WF4dIFZ.xlsx	1
1468	file/2020/08/07/Foto s kirillicheskim nazvaniem_Io6T9YS.jpg	1
1469	file/2020/08/07/Zapchasti_ijul' (1)_8FtINDg.xlsx	1
1470	file/2020/08/07/Annotatsiya 2020-08-06 133102_fFfYVcR.png	1
1471	file/2020/08/07/ehkzoticheskie-blyuda-vetnama-5.jpg	1
1472	file/2020/08/07/Zapchasti_ijul' (1)_C20FWV5.xlsx	1
1473	file/2020/08/07/Annotatsiya 2020-08-06 125703_huhljJc.png	1
1474	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo.zip	1
1475	file/2020/08/07/andrej-chikatilo-1_xg2FkjC.jpg	1
1476	file/2020/08/07/Annotatsiya 2020-08-06 125703_huhljJc_DK4Od4V.png	1
1477	file/2020/08/07/andrej-chikatilo-1_LS3OBq9.jpg	1
1478	file/2020/08/07/Annotatsiya 2020-08-06 173149.png	1
1479	file/2020/08/07/Zapchasti_ijul' (1)_LgHkuWq.xlsx	1
1480	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_U6bYtVF.zip	1
1481	file/2020/08/07/sistema-peredachi-energii.jpg	1
1482	file/2020/08/07/8iMAX2fvg1Y.jpg	1
1483	file/2020/08/07/Zapchasti_ijul' (1)_fj7Uwr7.xlsx	1
1484	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo_YqLkWgm.zip	1
1485	file/2020/08/07/Zapchasti_ijul' (1)_C20FWV5_FOvnAW3.xlsx	1
1486	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_mt7jN8d.zip	1
1487	file/2020/08/07/Annotatsiya 2020-08-06 125703_huhljJc_bEXkygt.png	1
1488	file/2020/08/07/ehkzoticheskie-blyuda-vetnama-5_3DMLThT.jpg	1
1489	file/2020/08/07/andrej-chikatilo-1 (1).jpg	1
1490	file/2020/08/07/Annotatsiya 2020-08-06 133102_fFfYVcR_YrnyleC.png	1
1491	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8.xlsx	1
1492	file/2020/08/07/Annotatsiya 2020-08-06 133102_eyQe5Oi.png	1
1493	file/2020/08/07/Annotatsiya 2020-08-06 133102 (1)_6U6vMUd_NsAbp1j.png	1
1494	file/2020/08/07/andrej-chikatilo-1 (1)_TTuJA2o.jpg	1
1495	file/2020/08/07/ehkzoticheskie-blyuda-vetnama-5_3a4DnVs.jpg	1
1496	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_5uFusf4.zip	1
1497	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_c8W5V67.xlsx	1
1498	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_mt7jN8d (1).zip	1
1499	file/2020/08/07/Annotatsiya 2020-08-06 125703_huhljJc_bEXkygt_kI5R1fM.png	1
1500	file/2020/08/07/Annotatsiya 2020-08-06 133102_fFfYVcR_BNgV6jN.png	1
1501	file/2020/08/07/Arhiv s kirillicheskim nazvaniem_2y1PQTl_mt7jN8d_KHw2idH.zip	1
1502	file/2020/08/07/Annotatsiya 2020-08-06 133102_6CH93oO.png	1
1503	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_6c9Ozha.xlsx	1
1504	file/2020/08/07/Annotatsiya 2020-08-06 133102_fFfYVcR_YrnyleC_2Be7tsQ.png	1
1505	file/2020/08/07/Zapchasti_ijul' (1)_C20FWV5_XxEKEu2.xlsx	1
1506	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_3VMp7jJ.xlsx	1
1507	file/2020/08/07/Annotatsiya 2020-08-06 125703_huhljJc_bEXkygt_N4lpRBw.png	1
1508	file/2020/08/07/Annotatsiya 2020-08-06 133102_vJ5qOx7.png	1
1509	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_1GWAHju.xlsx	1
1510	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_C6hRxr2.xlsx	1
1511	file/2020/08/07/Annotatsiya 2020-08-06 173149_SpHIbCu.png	1
1512	file/2020/08/07/Zapchasti_ijul' (1)_bGBXdu8_spmMXVi.xlsx	1
1513	file/2020/08/07/Annotatsiya 2020-08-06 133102_qpSnGU8.png	1
1514	file/2020/08/07/Annotatsiya 2020-08-06 173149_x6GRM7L.png	1
1515	file/2020/08/07/Annotatsiya 2020-08-06 133102_QzUcgnW.png	1
1516	file/2020/08/07/Annotatsiya 2020-08-06 133102_JvFcuLM.png	1
1517	file/2020/08/08/Dazhe koshka sledit za figuroj, a ty_KHbjZI9 (1).mp4	1
1518	file/2020/08/08/Zapchasti_ijul' (1)_bGBXdu8 (1).xlsx	1
1519	file/2020/08/08/45930383_ml (1).jpg	1
1520	file/2020/08/08/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c.zip	1
1521	file/2020/08/08/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo.zip	1
1522	file/2020/08/08/Zapchasti_ijul' (1)_C20FWV5.xlsx	1
1523	file/2020/08/10/nongl.txt	1
1524	file/2020/08/10/nongl_GFy4igb.txt	1
1525	file/2020/08/10/Otchet_na_02_08_2020.docx	1
1526	file/2020/08/10/company-icon.png	1
1527	file/2020/08/10/Zapchasti_ijul' (1)_bGBXdu8 (1) (3).xlsx	1
1528	file/2020/08/10/Zapchasti_ijul' (1)_bGBXdu8 (1) (3)_sMHjYZg.xlsx	1
1529	file/2020/08/10/Zapchasti_ijul' (1)_bGBXdu8 (1) (2).xlsx	1
1530	file/2020/08/10/company-icon (1).png	1
1531	file/2020/08/10/robert-kiyosaki.jpg-2.jpg	1
1532	file/2020/08/10/Zapchasti_ijul' (1)_bGBXdu8 (1) (3) (1).xlsx	1
1533	file/2020/08/10/company-icon_Cgsmz0u.png	1
1534	file/2020/08/10/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1).zip	1
1535	file/2020/08/10/Zapchasti_ijul' (1)_bGBXdu8 (1) (1).xlsx	1
1536	file/2020/08/11/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1).zip	1
1537	file/2020/08/11/Zapchasti_ijul' (1)_bGBXdu8 (1) (1) (1).xlsx	1
1538	file/2020/08/13/users.png	1
1539	file/2020/08/13/company-icon_Cgsmz0u.png	1
1540	file/2020/08/14/images (3).jpg	1
1541	file/2020/08/14/images (2).jpg	1
1542	file/2020/08/14/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1).zip	1
1543	file/2020/08/16/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1) (1).zip	1
1544	file/2020/08/16/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1) (1)_IEIqPfT.zip	1
1545	file/2020/08/16/images (3) (1).jpg	1
1546	file/2020/08/16/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1) (1)_ZmH4h6z.zip	1
1547	file/2020/08/16/image.webp	1
1548	file/2020/08/16/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1) (1)_BtIcfMp.zip	1
1549	file/2020/08/16/robert-kiyosaki.jpg-2 (1).jpg	1
1550	file/2020/08/16/company-icon_Cgsmz0u.png	1
1551	file/2020/08/16/images (3) (1)_YqblJoW.jpg	1
1552	file/2020/08/16/images (3) (1)_C3lvb3X.jpg	1
1553	file/2020/08/16/images (3) (1)_rWdwz8I.jpg	1
1554	file/2020/08/16/images (3) (1)_FSA74nj.jpg	1
1555	file/2020/08/16/rBVaVl1dOFSAaabfAAIDYxsb9WU773.jpg	1
1556	file/2020/08/16/Arhiv s kirillicheskim nazvaniem_2y1PQTl_tpCb69c (1) (1) (1)_8EClwhL.zip	1
1557	file/2020/08/16/images (3) (1)_Fz7K2CK.jpg	1
1558	file/2020/08/16/Zapchasti_ijul' (1)_bGBXdu8 (1) (1) (1).xlsx	1
1559	file/2020/08/16/unnamed (1).png	1
1560	file/2020/08/27/FhA3OW52B3w.jpg	1
1561	file/2020/08/27/q41Cn-BkJX0.jpg	1
1562	file/2020/08/27/Zapchasti_ijul' (1)_bGBXdu8 (1) (1) (1).xlsx	1
1563	file/2020/08/27/Zapchasti_ijul' (1)_bGBXdu8 (1) (2) (1).xlsx	1
1564	file/2020/08/27/images (4).jpg	1
1565	file/2020/08/28/j_iprUBHhMY.jpg	1
1566	file/2020/08/28/ezgif.com-video-to-gif (1).gif	1
1567	file/2020/08/28/j_iprUBHhMY_oBr6EB8.jpg	1
1568	file/2020/08/28/j_iprUBHhMY_oBr6EB8_77pSvaO.jpg	1
1569	file/2020/08/28/j_iprUBHhMY_oBr6EB8_Wh8A85K.jpg	1
1570	file/2020/08/28/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo.zip	1
1571	file/2020/08/28/j_iprUBHhMY_oBr6EB8_QOEXcms.jpg	1
1572	file/2020/08/28/j_iprUBHhMY_oBr6EB8_puhiU77.jpg	1
1573	file/2020/08/28/j_iprUBHhMY_oBr6EB8_eimSdM1.jpg	1
1574	file/2020/08/31/j_iprUBHhMY_oBr6EB8.jpg	1
1575	file/2020/08/31/5nF5Wh6Ms4A.jpg	1
1576	file/2020/08/31/Russo_One.zip	1
1577	file/2020/08/31/j_iprUBHhMY_oBr6EB8_Wh8A85K.jpg	1
1578	file/2020/08/31/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo (1).zip	1
1579	file/2020/08/31/Arhiv s kirillicheskim nazvaniem_2y1PQTl_D8g7vjo (1)_3h4HkDC.zip	1
1580	file/2020/08/31/FhA3OW52B3w.jpg	1
1581	file/2020/08/31/_fWMUzNMQfk.jpg	1
1582	file/2020/08/31/Zapchasti_ijul' (1)_bGBXdu8 (1) (2) (1) (1).xlsx	1
1583	file/2020/08/31/Racing_Sans_One.zip	1
1584	file/2020/08/31/ezgif.com-video-to-gif (1) (1).gif	1
1585	file/2020/08/31/json.txt	1
1586	file/2020/08/31/slide-4.jpg	1
1587	file/2020/08/31/favicon.ico	1
1588	file/2020/08/31/Kupibilet_order_ru_6170044731 (2).pdf	1
1589	file/2020/08/31/Bebas_Neue.zip	1
1590	file/2020/08/31/ezgif.com-video-to-gif (1) (1)_7ktcEZF.gif	1
1591	file/2020/08/31/Racing_Sans_One_kbM6EWo.zip	1
1592	file/2020/08/31/zdQ8-6P5byk.jpg	1
1593	file/2020/08/31/ezgif.com-video-to-gif (1) (1)_dcHnM2x.gif	1
1594	file/2020/08/31/Russo_One_aOV6Tkh.zip	1
1595	file/2020/08/31/Zapchasti_ijul' (1)_bGBXdu8 (1) (2) (1) (1)_eRcUBhC.xlsx	1
1596	file/2020/08/31/Bebas_Neue_wYbNGf4.zip	1
1597	file/2020/08/31/Racing_Sans_One_d53TgKd.zip	1
1598	file/2020/08/31/Bebas_Neue_mVYzoCj.zip	1
1599	file/2020/08/31/Racing_Sans_One_5KweKHk.zip	1
1600	file/2020/08/31/Roboto.zip	1
1601	file/2020/08/31/Zapchasti_ijul' (1)_bGBXdu8 (1) (2) (1) (1)_mijnXxh.xlsx	1
1602	file/2020/08/31/Russo_One_BoE4V26.zip	1
1603	file/2020/08/31/Racing_Sans_One_5DGT0ZS.zip	1
1604	file/2020/08/31/ezgif.com-video-to-gif (1) (1)_RdxmcL5.gif	1
1605	file/2020/08/31/Bebas_Neue_hsA8Z5Z.zip	1
1606	file/2020/08/31/ezgif.com-video-to-gif (1) (1)_AAH0pQt.gif	1
1607	file/2020/08/31/Roboto_SCP5o5i.zip	1
1608	file/2020/08/31/Bebas_Neue_HD4i6Kn.zip	1
1609	file/2020/08/31/Racing_Sans_One_QZSNFRp.zip	1
1610	file/2020/08/31/Racing_Sans_One_QZSNFRp_3TNHr6u.zip	1
1611	file/2020/09/01/images (3) (1).jpg	1
1612	file/2020/09/01/images (2) (1).jpg	1
1613	file/2020/09/01/images (4).jpg	1
1614	file/2020/09/01/unnamed.png	1
1615	file/2020/09/01/image.webp	1
1616	file/2020/09/01/images (3) (1) (1).jpg	1
1617	file/2020/09/01/zzz.xlsx	1
1618	file/2020/09/01/images (3) (1) (1)_QMeA5eM.jpg	1
1619	file/2020/09/01/images (3) (1) (1)_j3CyTYy.jpg	1
1620	file/2020/09/01/images (2) (1) (1).jpg	1
1621	file/2020/09/01/images (2) (1) (1)_1hb1kL8.jpg	1
1622	file/2020/09/01/images (3) (1) (1)_57b1sD8.jpg	1
1623	file/2020/09/01/images (2) (1) (1)_pHY9ta1.jpg	1
1624	file/2020/09/01/images (3) (1) (1)_Hy93ysG.jpg	1
1625	file/2020/09/01/images (2) (1) (1)_6DlDXV2.jpg	1
1626	file/2020/09/01/images (3) (1) (1)_IJYiof0.jpg	1
1627	file/2020/09/01/images (2) (1) (1)_y97rSpE.jpg	1
1628	file/2020/09/01/zzz_FKb7vxN.xlsx	1
\.


--
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.account_account_id_seq', 34, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 34, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.company_company_id_seq', 118, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 225, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 74, true);


--
-- Name: task_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.task_link_id_seq', 16, true);


--
-- Name: task_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.task_note_id_seq', 98, true);


--
-- Name: task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.task_task_id_seq', 149, true);


--
-- Name: task_task_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.task_task_links_id_seq', 120, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: advertiser
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 1628, true);


--
-- Name: account_account account_account_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.account_account
    ADD CONSTRAINT account_account_pkey PRIMARY KEY (id);


--
-- Name: account_account account_account_user_id_key; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.account_account
    ADD CONSTRAINT account_account_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: company_company company_company_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.company_company
    ADD CONSTRAINT company_company_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: task_link task_link_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_link
    ADD CONSTRAINT task_link_pkey PRIMARY KEY (id);


--
-- Name: task_note task_note_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_note
    ADD CONSTRAINT task_note_pkey PRIMARY KEY (id);


--
-- Name: task_task_links task_task_links_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task_links
    ADD CONSTRAINT task_task_links_pkey PRIMARY KEY (id);


--
-- Name: task_task_links task_task_links_task_id_link_id_0ff5a1cb_uniq; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task_links
    ADD CONSTRAINT task_task_links_task_id_link_id_0ff5a1cb_uniq UNIQUE (task_id, link_id);


--
-- Name: task_task task_task_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task
    ADD CONSTRAINT task_task_pkey PRIMARY KEY (id);


--
-- Name: upload_file upload_file_pkey; Type: CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.upload_file
    ADD CONSTRAINT upload_file_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: company_company_user_id_c99db68c; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX company_company_user_id_c99db68c ON public.company_company USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: task_note_task_id_9a9d6477; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX task_note_task_id_9a9d6477 ON public.task_note USING btree (task_id);


--
-- Name: task_note_user_id_21e8ae37; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX task_note_user_id_21e8ae37 ON public.task_note USING btree (user_id);


--
-- Name: task_task_company_id_117461f2; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX task_task_company_id_117461f2 ON public.task_task USING btree (company_id);


--
-- Name: task_task_links_link_id_92890482; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX task_task_links_link_id_92890482 ON public.task_task_links USING btree (link_id);


--
-- Name: task_task_links_task_id_644ac911; Type: INDEX; Schema: public; Owner: advertiser
--

CREATE INDEX task_task_links_task_id_644ac911 ON public.task_task_links USING btree (task_id);


--
-- Name: account_account account_account_user_id_8d4f4816_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.account_account
    ADD CONSTRAINT account_account_user_id_8d4f4816_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: company_company company_company_user_id_c99db68c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.company_company
    ADD CONSTRAINT company_company_user_id_c99db68c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_note task_note_task_id_9a9d6477_fk_task_task_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_note
    ADD CONSTRAINT task_note_task_id_9a9d6477_fk_task_task_id FOREIGN KEY (task_id) REFERENCES public.task_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_note task_note_user_id_21e8ae37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_note
    ADD CONSTRAINT task_note_user_id_21e8ae37_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_task task_task_company_id_117461f2_fk_company_company_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task
    ADD CONSTRAINT task_task_company_id_117461f2_fk_company_company_id FOREIGN KEY (company_id) REFERENCES public.company_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_task_links task_task_links_link_id_92890482_fk_task_link_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task_links
    ADD CONSTRAINT task_task_links_link_id_92890482_fk_task_link_id FOREIGN KEY (link_id) REFERENCES public.task_link(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: task_task_links task_task_links_task_id_644ac911_fk_task_task_id; Type: FK CONSTRAINT; Schema: public; Owner: advertiser
--

ALTER TABLE ONLY public.task_task_links
    ADD CONSTRAINT task_task_links_task_id_644ac911_fk_task_task_id FOREIGN KEY (task_id) REFERENCES public.task_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

