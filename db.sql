--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 13.1

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
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuration (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value character varying NOT NULL,
    commen character varying
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: TABLE configuration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.configuration IS '系统设置';


--
-- Name: configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuration_id_seq OWNER TO postgres;

--
-- Name: configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuration_id_seq OWNED BY public.configuration.id;


--
-- Name: navlinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navlinks (
    id integer NOT NULL,
    caption character varying(255) NOT NULL,
    "position" integer DEFAULT 99 NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.navlinks OWNER TO postgres;

--
-- Name: TABLE navlinks; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.navlinks IS '左侧导航表';


--
-- Name: navlinks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navlinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navlinks_id_seq OWNER TO postgres;

--
-- Name: navlinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navlinks_id_seq OWNED BY public.navlinks.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    visible integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    pubdate timestamp without time zone DEFAULT now() NOT NULL,
    shortdesc text,
    content text,
    tags text NOT NULL,
    titleimg character varying(255),
    visible integer DEFAULT 1,
    ctype character varying
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: COLUMN posts.ctype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.posts.ctype IS '文档类型，如html 或Markdown之类';


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    caption character varying(255) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: TABLE tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tags IS 'TAG标签';


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration ALTER COLUMN id SET DEFAULT nextval('public.configuration_id_seq'::regclass);


--
-- Name: navlinks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navlinks ALTER COLUMN id SET DEFAULT nextval('public.navlinks_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuration VALUES
	(1, 'title', '技术笔记', '网站标题'),
	(2, 'subtitle', '分享和记录', '副标题'),
	(4, 'logoimg', 'https://avatars.githubusercontent.com/u/41496183?v=4', '左侧头像图片'),
	(5, 'url', 'http://ggyun.top', '主站域名'),
	(6, 'beian', '鲁ICP备2022000045号', '备案号'),
	(7, 'gongan', '37021002001019', '公安备案号'),
	(8, 'gongan_title', '鲁公网安备', '公安备案前缀文字'),
	(3, 'intro', '本站主要是个人技术经验总结以及工作备忘。除特别注明出处的内容以及无法确定真实作者或来源的内容之外，本站内容均为站长原创。', '左侧自我介绍'),
	(10, 'lastfooter', 'ggyun.top版权所有', '页面最下方内容'),
	(9, 'linesperpage', '10', '列表页中每页条目数'),
	(11, 'accesstoken', '1234567890abcdefghijklmnopqrstuvwxyz', 'API连接Token');


--
-- Data for Name: navlinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.navlinks VALUES
	(4, '全部分类', 1, '/tags'),
	(5, '关于', 9, '/page?id=1');


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pages VALUES
	(1, 'About Me', '## Who am I
ddd
dddd
', 1);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.posts VALUES
	(1, '文章1', '2022-08-09 13:32:01', '简介1', '内容1', '1,2,', '', 1, 'Markdown'),
	(2, '文章2', '2022-08-09 13:32:02', '简介2', '内容2', '1,', '', 1, 'Markdown'),
	(3, '文章3', '2022-08-09 13:32:03', '简介3', '内容3', '2,', '', 1, 'Markdown'),
	(4, '文章4', '2022-08-09 13:32:04', '简介4', '## ddd
	ww
	www
	www
## ddd', '1,2,', '', 1, 'Markdown'),
	(5, '文章5', '2022-08-09 13:32:03', '简介5', '<h1>Welcome Content5</h1>', '1,', NULL, 1, 'Html');


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tags VALUES
	(1, '安卓开发'),
	(2, '服务器开发');


--
-- Name: configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuration_id_seq', 11, true);


--
-- Name: navlinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navlinks_id_seq', 5, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 2, true);


--
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: navlinks navlinks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navlinks
    ADD CONSTRAINT navlinks_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: configuration unique_configuration_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT unique_configuration_id UNIQUE (id);


--
-- Name: navlinks unique_navlinks_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navlinks
    ADD CONSTRAINT unique_navlinks_id UNIQUE (id);


--
-- Name: pages unique_pages_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT unique_pages_id UNIQUE (id);


--
-- Name: posts unique_posts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT unique_posts_id UNIQUE (id);


--
-- Name: tags unique_tags_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT unique_tags_id UNIQUE (id);


--
-- Name: index_caption1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_caption1 ON public.tags USING btree (caption);


--
-- Name: index_caption2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_caption2 ON public.navlinks USING btree (caption);


--
-- Name: index_ctype; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ctype ON public.posts USING btree (ctype);


--
-- Name: index_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_key ON public.configuration USING btree (key);


--
-- Name: index_position1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_position1 ON public.navlinks USING btree ("position");


--
-- Name: index_pubdate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pubdate ON public.posts USING btree (pubdate);


--
-- Name: index_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_title ON public.posts USING btree (title);


--
-- Name: index_title1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_title1 ON public.pages USING btree (title);


--
-- Name: index_visible; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_visible ON public.posts USING btree (visible);


--
-- Name: index_visible1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_visible1 ON public.pages USING btree (visible);


--
-- PostgreSQL database dump complete
--

