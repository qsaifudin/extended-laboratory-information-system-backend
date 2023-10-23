--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg90+1)
-- Dumped by pg_dump version 13.3

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
-- Name: kategori_rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori_rs (
    id integer NOT NULL,
    nama character varying(255),
    status boolean
);


ALTER TABLE public.kategori_rs OWNER TO postgres;

--
-- Name: kategori_rs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_rs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_rs_id_seq OWNER TO postgres;

--
-- Name: kategori_rs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_rs_id_seq OWNED BY public.kategori_rs.id;


--
-- Name: kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kecamatan (
    id integer NOT NULL,
    kota_id numeric,
    nama character varying(255),
    status boolean DEFAULT false
);


ALTER TABLE public.kecamatan OWNER TO postgres;

--
-- Name: kecamatan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kecamatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kecamatan_id_seq OWNER TO postgres;

--
-- Name: kecamatan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kecamatan_id_seq OWNED BY public.kecamatan.id;


--
-- Name: kota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kota (
    id integer NOT NULL,
    provinsi_id numeric,
    nama character varying(255),
    status boolean DEFAULT false
);


ALTER TABLE public.kota OWNER TO postgres;

--
-- Name: kota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kota_id_seq OWNER TO postgres;

--
-- Name: kota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kota_id_seq OWNED BY public.kota.id;


--
-- Name: lab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lab (
    id integer NOT NULL,
    kode character varying(100) NOT NULL,
    nama character varying(255) NOT NULL,
    rs_id integer NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.lab OWNER TO postgres;

--
-- Name: lab_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lab_id_seq OWNER TO postgres;

--
-- Name: lab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lab_id_seq OWNED BY public.lab.id;


--
-- Name: provinsi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinsi (
    id integer NOT NULL,
    nama character varying(255),
    status boolean DEFAULT false
);


ALTER TABLE public.provinsi OWNER TO postgres;

--
-- Name: provinsi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinsi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinsi_id_seq OWNER TO postgres;

--
-- Name: provinsi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinsi_id_seq OWNED BY public.provinsi.id;


--
-- Name: refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_token (
    id integer NOT NULL,
    token character varying(255),
    expiry_date timestamp with time zone,
    user_id integer
);


ALTER TABLE public.refresh_token OWNER TO postgres;

--
-- Name: refresh_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refresh_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refresh_token_id_seq OWNER TO postgres;

--
-- Name: refresh_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refresh_token_id_seq OWNED BY public.refresh_token.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    nama character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: rumah_sakit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rumah_sakit (
    id integer NOT NULL,
    kode character varying(100) NOT NULL,
    nama character varying(255) NOT NULL,
    provinsi_id integer NOT NULL,
    kota_id integer NOT NULL,
    kecamatan_id integer NOT NULL,
    alamat character varying(255) NOT NULL,
    kategori_id integer NOT NULL,
    vendor_id integer NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.rumah_sakit OWNER TO postgres;

--
-- Name: rumah_sakit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rumah_sakit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rumah_sakit_id_seq OWNER TO postgres;

--
-- Name: rumah_sakit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rumah_sakit_id_seq OWNED BY public.rumah_sakit.id;


--
-- Name: t_pasien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pasien (
    id integer NOT NULL,
    no_lab numeric NOT NULL,
    no_reg numeric NOT NULL,
    no_rm numeric NOT NULL,
    nik character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    provinsi character varying(255) NOT NULL,
    kota character varying(255) NOT NULL,
    kecamatan character varying(255) NOT NULL,
    alamat character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    usia_hari numeric NOT NULL,
    usia_bulan numeric NOT NULL,
    usia_tahun numeric NOT NULL,
    diagnosa_awal character varying(255) NOT NULL,
    icdt character varying(255) NOT NULL,
    penjamin character varying(255) NOT NULL,
    unit_asal character varying(255) NOT NULL,
    dokter_pengirim character varying(255) NOT NULL,
    waktu_registrasi timestamp with time zone NOT NULL,
    waktu_checkin timestamp with time zone NOT NULL,
    waktu_terbit timestamp with time zone NOT NULL,
    kode_rs character varying(100) NOT NULL,
    kode_lab character varying(100) NOT NULL,
    registrasi_id integer NOT NULL
);


ALTER TABLE public.t_pasien OWNER TO postgres;

--
-- Name: t_pasien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_pasien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_pasien_id_seq OWNER TO postgres;

--
-- Name: t_pasien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pasien_id_seq OWNED BY public.t_pasien.id;


--
-- Name: t_pemeriksaan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pemeriksaan (
    id integer NOT NULL,
    kode character varying(100) NOT NULL,
    nama character varying(255) NOT NULL,
    satuan character varying(50) NOT NULL,
    metode character varying(255) NOT NULL,
    no_urut integer NOT NULL,
    kategori_pemeriksaan character varying(100) NOT NULL,
    kategori_no_urut integer NOT NULL,
    subkategori_pemeriksaan character varying(100) NOT NULL,
    subkategori_no_urut integer NOT NULL,
    catatan character varying(255) NOT NULL,
    is_duplo boolean NOT NULL,
    total_duplo integer NOT NULL,
    kode_rs character varying(100) NOT NULL,
    kode_lab character varying(100) NOT NULL,
    registrasi_id integer NOT NULL
);


ALTER TABLE public.t_pemeriksaan OWNER TO postgres;

--
-- Name: t_pemeriksaan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_pemeriksaan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_pemeriksaan_id_seq OWNER TO postgres;

--
-- Name: t_pemeriksaan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pemeriksaan_id_seq OWNED BY public.t_pemeriksaan.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role_id integer NOT NULL,
    vendor_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    provinsi_id integer NOT NULL,
    kota_id integer NOT NULL,
    status boolean DEFAULT false NOT NULL
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_id_seq OWNER TO postgres;

--
-- Name: vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_id_seq OWNED BY public.vendor.id;


--
-- Name: kategori_rs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori_rs ALTER COLUMN id SET DEFAULT nextval('public.kategori_rs_id_seq'::regclass);


--
-- Name: kecamatan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatan ALTER COLUMN id SET DEFAULT nextval('public.kecamatan_id_seq'::regclass);


--
-- Name: kota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kota ALTER COLUMN id SET DEFAULT nextval('public.kota_id_seq'::regclass);


--
-- Name: lab id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab ALTER COLUMN id SET DEFAULT nextval('public.lab_id_seq'::regclass);


--
-- Name: provinsi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinsi ALTER COLUMN id SET DEFAULT nextval('public.provinsi_id_seq'::regclass);


--
-- Name: refresh_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token ALTER COLUMN id SET DEFAULT nextval('public.refresh_token_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: rumah_sakit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rumah_sakit ALTER COLUMN id SET DEFAULT nextval('public.rumah_sakit_id_seq'::regclass);


--
-- Name: t_pasien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pasien ALTER COLUMN id SET DEFAULT nextval('public.t_pasien_id_seq'::regclass);


--
-- Name: t_pemeriksaan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pemeriksaan ALTER COLUMN id SET DEFAULT nextval('public.t_pemeriksaan_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: vendor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor ALTER COLUMN id SET DEFAULT nextval('public.vendor_id_seq'::regclass);


--
-- Data for Name: kategori_rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori_rs (id, nama, status) FROM stdin;
4	Rumah Sakit Khusus	t
6	Rumah Sakit Umum	t
8	Rumah Sakit Swasta	t
7	Rumah Sakit Umum Daerah	t
3	Rumah Sakit Bersalin	t
2	Rumah Sakit Jiwa	t
1	Klinik	t
\.


--
-- Data for Name: kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kecamatan (id, kota_id, nama, status) FROM stdin;
1101010	1101	Teupah Selatan	t
1101020	1101	Simeulue Timur	t
1101021	1101	Teupah Barat	t
1101022	1101	Teupah Tengah	t
1101030	1101	Simeulue Tengah	t
1101031	1101	Teluk Dalam	t
1101032	1101	Simeulue Cut	t
1101040	1101	Salang	t
1101050	1101	Simeulue Barat	t
1101051	1101	Alafan	t
1102010	1102	Pulau Banyak	t
1102011	1102	Pulau Banyak Barat	t
1102020	1102	Singkil	t
1102021	1102	Singkil Utara	t
1102022	1102	Kuala Baru	t
1102030	1102	Simpang Kanan	t
1102031	1102	Gunung Meriah	t
1102032	1102	Danau Paris	t
1102033	1102	Suro	t
1102042	1102	Singkohor	t
1102043	1102	Kota Baharu	t
1103010	1103	Trumon	t
1103011	1103	Trumon Timur	t
1103012	1103	Trumon Tengah	t
1103020	1103	Bakongan	t
1103021	1103	Bakongan Timur	t
1103022	1103	Kota Bahagia	t
1103030	1103	Kluet Selatan	t
1103031	1103	Kluet Timur	t
1103040	1103	Kluet Utara	t
1103041	1103	Pasie Raja	t
1103042	1103	Kluet Tengah	t
1103050	1103	Tapak Tuan	t
1103060	1103	Sama Dua	t
1103070	1103	Sawang	t
1103080	1103	Meukek	t
1103090	1103	Labuhan Haji	t
1103091	1103	Labuhan Haji Timur	t
1103092	1103	Labuhan Haji Barat	t
1104010	1104	Lawe Alas	t
1104011	1104	Babul Rahmah	t
1104012	1104	Tanoh Alas	t
1104020	1104	Lawe Sigala-Gala	t
1104021	1104	Babul Makmur	t
1104022	1104	Semadam	t
1104023	1104	Leuser	t
1104030	1104	Bambel	t
1104031	1104	Bukit Tusam	t
1104032	1104	Lawe Sumur	t
1104040	1104	Babussalam	t
1104041	1104	Lawe Bulan	t
1104050	1104	Badar	t
1104051	1104	Darul Hasanah	t
1104052	1104	Ketambe	t
1104053	1104	Deleng Pokhkisen	t
1105080	1105	Serba Jadi	t
1105081	1105	Simpang Jernih	t
1105082	1105	Peunaron	t
1105090	1105	Birem Bayeun	t
1105100	1105	Rantau Selamat	t
1105101	1105	Sungai Raya	t
1105110	1105	Peureulak	t
1105111	1105	Peureulak Timur	t
1105112	1105	Peureulak Barat	t
1105120	1105	Ranto Peureulak	t
1105130	1105	Idi Rayeuk	t
1105131	1105	Peudawa	t
1105132	1105	Banda Alam	t
1105133	1105	Idi Tunong	t
1105134	1105	Darul Ihsan	t
1105135	1105	Idi Timur	t
1105140	1105	Darul Aman	t
1105150	1105	Nurussalam	t
1105151	1105	Darul Falah	t
1105160	1105	Julok	t
1105161	1105	Indra Makmur	t
1105170	1105	Pante Bidari	t
1105180	1105	Simpang Ulim	t
1105181	1105	Madat	t
1106010	1106	Linge	t
1106011	1106	Atu Lintang	t
1106012	1106	Jagong Jeget	t
1106020	1106	Bintang	t
1106031	1106	Lut Tawar	t
1106032	1106	Kebayakan	t
1106040	1106	Pegasing	t
1106041	1106	Bies	t
1106050	1106	Bebesen	t
1106051	1106	Kute Panang	t
1106060	1106	Silih Nara	t
1106061	1106	Ketol	t
1106062	1106	Celala	t
1106063	1106	Rusip Antara	t
1107050	1107	Johan Pahlawan	t
1107060	1107	Samatiga	t
1107061	1107	Bubon	t
1107062	1107	Arongan Lambalek	t
1107070	1107	Woyla	t
1107071	1107	Woyla Barat	t
1107072	1107	Woyla Timur	t
1107080	1107	Kaway Xvi	t
1107081	1107	Meureubo	t
1107082	1107	Pantai Ceuremen	t
1107083	1107	Panton Reu	t
1107090	1107	Sungai Mas	t
1108010	1108	Lhoong	t
1108020	1108	Lhoknga	t
1108021	1108	Leupung	t
1108030	1108	Indrapuri	t
1108031	1108	Kuta Cot Glie	t
1108040	1108	Seulimeum	t
1108041	1108	Kota Jantho	t
1108042	1108	Lembah Seulawah	t
1108050	1108	Mesjid Raya	t
1108060	1108	Darussalam	t
1108061	1108	Baitussalam	t
1108070	1108	Kuta Baro	t
1108080	1108	Montasik	t
1108081	1108	Blang Bintang	t
1108090	1108	Ingin Jaya	t
1108091	1108	Krueng Barona Jaya	t
1108100	1108	Suka Makmur	t
1108101	1108	Kuta Malaka	t
1108102	1108	Simpang Tiga	t
1108110	1108	Darul Imarah	t
1108111	1108	Darul Kamal	t
1108120	1108	Peukan Bada	t
1108130	1108	Pulo Aceh	t
1109010	1109	Geumpang	t
1109011	1109	Mane	t
1109070	1109	Glumpang Tiga	t
1109071	1109	Glumpang Baro	t
1109080	1109	Mutiara	t
1109081	1109	Mutiara Timur	t
1109090	1109	Tiro/Truseb	t
1109100	1109	Tangse	t
1109111	1109	Keumala	t
1109112	1109	Titeue	t
1109120	1109	Sakti	t
1109130	1109	Mila	t
1109140	1109	Padang Tiji	t
1109150	1109	Delima	t
1109151	1109	Grong Grong	t
1109160	1109	Indrajaya	t
1109170	1109	Peukan Baro	t
1109180	1109	Kembang Tanjong	t
1109190	1109	Simpang Tiga	t
1109200	1109	Kota Sigli	t
1109210	1109	Pidie	t
1109220	1109	Batee	t
1109230	1109	Muara Tiga	t
1110010	1110	Samalanga	t
1110011	1110	Simpang Mamplam	t
1110020	1110	Pandrah	t
1110030	1110	Jeunieb	t
1110031	1110	Peulimbang	t
1110040	1110	Peudada	t
1110050	1110	Juli	t
1110060	1110	Jeumpa	t
1110061	1110	Kota Juang	t
1110062	1110	Kuala	t
1110070	1110	Jangka	t
1110080	1110	Peusangan	t
1110081	1110	Peusangan Selatan	t
1110082	1110	Peusangan Siblah Krueng	t
1110090	1110	Makmur	t
1110100	1110	Ganda Pura	t
1110101	1110	Kuta Blang	t
1111010	1111	Sawang	t
1111020	1111	Nisam	t
1111021	1111	Nisam Antara	t
1111022	1111	Banda Baro	t
1111030	1111	Kuta Makmur	t
1111031	1111	Simpang Keramat	t
1111040	1111	Syamtalira Bayu	t
1111041	1111	Geureudong Pase	t
1111050	1111	Meurah Mulia	t
1111060	1111	Matangkuli	t
1111061	1111	Paya Bakong	t
1111062	1111	Pirak Timu	t
1111070	1111	Cot Girek	t
1111080	1111	Tanah Jambo Aye	t
1111081	1111	Langkahan	t
1111090	1111	Seunuddon	t
1111100	1111	Baktiya	t
1111101	1111	Baktiya Barat	t
1111110	1111	Lhoksukon	t
1111120	1111	Tanah Luas	t
1111121	1111	Nibong	t
1111130	1111	Samudera	t
1111140	1111	Syamtalira Aron	t
1111150	1111	Tanah Pasir	t
1111151	1111	Lapang	t
1111160	1111	Muara Batu	t
1111170	1111	Dewantara	t
1112010	1112	Manggeng	t
1112011	1112	Lembah Sabil	t
1112020	1112	Tangan-Tangan	t
1112021	1112	Setia	t
1112030	1112	Blang Pidie	t
1112031	1112	Jeumpa	t
1112040	1112	Susoh	t
1112050	1112	Kuala Batee	t
1112060	1112	Babah Rot	t
1113010	1113	Kuta Panjang	t
1113011	1113	Blang Jerango	t
1113020	1113	Blangkejeren	t
1113021	1113	Putri Betung	t
1113022	1113	Dabun Gelang	t
1113023	1113	Blang Pegayon	t
1113030	1113	Pining	t
1113040	1113	Rikit Gaib	t
1113041	1113	Pantan Cuaca	t
1113050	1113	Terangun	t
1113051	1113	Tripe Jaya	t
1114010	1114	Tamiang Hulu	t
1114011	1114	Bandar Pusaka	t
1114020	1114	Kejuruan Muda	t
1114021	1114	Tenggulun	t
1114030	1114	Rantau	t
1114040	1114	Kota Kuala Simpang	t
1114050	1114	Seruway	t
1114060	1114	Bendahara	t
1114061	1114	Banda Mulia	t
1114070	1114	Karang Baru	t
1114071	1114	Sekerak	t
1114080	1114	Manyak Payed	t
1115010	1115	Darul Makmur	t
1115011	1115	Tripa Makmur	t
1115020	1115	Kuala	t
1115021	1115	Kuala Pesisir	t
1115022	1115	Tadu Raya	t
1115030	1115	Beutong	t
1115031	1115	Beutong Ateuh Banggalang	t
1115040	1115	Seunagan	t
1115041	1115	Suka Makmue	t
1115050	1115	Seunagan Timur	t
1116010	1116	Teunom	t
1116011	1116	Pasie Raya	t
1116020	1116	Panga	t
1116030	1116	Krueng Sabee	t
1116040	1116	Setia Bakti	t
1116050	1116	Sampoiniet	t
1116051	1116	Darul Hikmah	t
1116060	1116	Jaya	t
1116061	1116	Indra Jaya	t
1117010	1117	Timang Gajah	t
1117011	1117	Gajah Putih	t
1117020	1117	Pintu Rime Gayo	t
1117030	1117	Bukit	t
1117040	1117	Wih Pesam	t
1117050	1117	Bandar	t
1117051	1117	Bener Kelipah	t
1117060	1117	Syiah Utama	t
1117061	1117	Mesidah	t
1117070	1117	Permata	t
1118010	1118	Meureudu	t
1118020	1118	Meurah Dua	t
1118030	1118	Bandar Dua	t
1118040	1118	Jangka Buya	t
1118050	1118	Ulim	t
1118060	1118	Trienggadeng	t
1118070	1118	Panteraja	t
1118080	1118	Bandar Baru	t
1171010	1171	Meuraxa	t
1171011	1171	Jaya Baru	t
1171012	1171	Banda Raya	t
1171020	1171	Baiturrahman	t
1171021	1171	Lueng Bata	t
1171030	1171	Kuta Alam	t
1171031	1171	Kuta Raja	t
1171040	1171	Syiah Kuala	t
1171041	1171	Ulee Kareng	t
1172010	1172	Sukajaya	t
1172020	1172	Sukakarya	t
1173010	1173	Langsa Timur	t
1173011	1173	Langsa Lama	t
1173020	1173	Langsa Barat	t
1173021	1173	Langsa Baro	t
1173030	1173	Langsa Kota	t
1174010	1174	Blang Mangat	t
1174020	1174	Muara Dua	t
1174021	1174	Muara Satu	t
1174030	1174	Banda Sakti	t
1175010	1175	Simpang Kiri	t
1175020	1175	Penanggalan	t
1175030	1175	Rundeng	t
1175040	1175	Sultan Daulat	t
1175050	1175	Longkib	t
1201060	1201	Idano Gawo	t
1201061	1201	Bawolato	t
1201062	1201	Ulugawo	t
1201070	1201	Gido	t
1201071	1201	Sogaeadu	t
1201081	1201	Ma U	t
1201082	1201	Somolo - Molo	t
1201130	1201	Hiliduho	t
1201131	1201	Hili Serangkai	t
1201132	1201	Botomuzoi	t
1202010	1202	Batahan	t
1202011	1202	Sinunukan	t
1202020	1202	Batang Natal	t
1202021	1202	Lingga Bayu	t
1202022	1202	Ranto Baek	t
1202030	1202	Kotanopan	t
1202031	1202	Ulu Pungkut	t
1202032	1202	Tambangan	t
1202033	1202	Lembah Sorik Marapi	t
1202034	1202	Puncak Sorik Marapi	t
1202040	1202	Muara Sipongi	t
1202041	1202	Pakantan	t
1202050	1202	Panyabungan	t
1202051	1202	Panyabungan Selatan	t
1202052	1202	Panyabungan Barat	t
1202053	1202	Panyabungan Utara	t
1202054	1202	Panyabungan Timur	t
1202055	1202	Huta Bargot	t
1202060	1202	Natal	t
1202070	1202	Muara Batang Gadis	t
1202080	1202	Siabu	t
1202081	1202	Bukit Malintang	t
1202082	1202	Naga Juang	t
1203010	1203	Batang Angkola	t
1203011	1203	Sayur Matinggi	t
1203012	1203	Tano Tombangan Angkola	t
1203070	1203	Angkola Timur	t
1203080	1203	Angkola Selatan	t
1203090	1203	Angkola  Barat	t
1203091	1203	Angkola Sangkunur	t
1203100	1203	Batang Toru	t
1203101	1203	Marancar	t
1203102	1203	Muara Batang Toru	t
1203110	1203	Sipirok	t
1203120	1203	Arse	t
1203160	1203	Saipar Dolok Hole	t
1203161	1203	Aek Bilah	t
1204010	1204	Pinang Sori	t
1204011	1204	Badiri	t
1204020	1204	Sibabangun	t
1204021	1204	Lumut	t
1204022	1204	Sukabangun	t
1204030	1204	Pandan	t
1204031	1204	Tukka	t
1204032	1204	Sarudik	t
1204040	1204	Tapian Nauli	t
1204041	1204	Sitahuis	t
1204050	1204	Kolang	t
1204060	1204	Sorkam	t
1204061	1204	Sorkam Barat	t
1204062	1204	Pasaribu Tobing	t
1204070	1204	Barus	t
1204071	1204	Sosor Gadong	t
1204072	1204	Andam Dewi	t
1204073	1204	Barus Utara	t
1204080	1204	Manduamas	t
1204081	1204	Sirandorung	t
1205030	1205	Parmonangan	t
1205040	1205	Adiankoting	t
1205050	1205	Sipoholon	t
1205060	1205	Tarutung	t
1205061	1205	Siatas Barita	t
1205070	1205	Pahae Julu	t
1205080	1205	Pahae Jae	t
1205081	1205	Purbatua	t
1205082	1205	Simangumban	t
1205090	1205	Pangaribuan	t
1205100	1205	Garoga	t
1205110	1205	Sipahutar	t
1205120	1205	Siborongborong	t
1205130	1205	Pagaran	t
1205180	1205	Muara	t
1206030	1206	Balige	t
1206031	1206	Tampahan	t
1206040	1206	Laguboti	t
1206050	1206	Habinsaran	t
1206051	1206	Borbor	t
1206052	1206	Nassau	t
1206060	1206	Silaen	t
1206061	1206	Sigumpar	t
1206070	1206	Porsea	t
1206071	1206	Pintu Pohan Meranti	t
1206072	1206	Siantar Narumonda	t
1206073	1206	Parmaksian	t
1206080	1206	Lumban Julu	t
1206081	1206	Uluan	t
1206082	1206	Ajibata	t
1206083	1206	Bonatua Lunasi	t
1207050	1207	Bilah Hulu	t
1207070	1207	Pangkatan	t
1207080	1207	Bilah Barat	t
1207130	1207	Bilah Hilir	t
1207140	1207	Panai Hulu	t
1207150	1207	Panai Tengah	t
1207160	1207	Panai Hilir	t
1207210	1207	Rantau Selatan	t
1207220	1207	Rantau Utara	t
1208010	1208	Bandar Pasir Mandoge	t
1208020	1208	Bandar Pulau	t
1208021	1208	Aek Songsongan	t
1208022	1208	Rahuning	t
1208030	1208	Pulau Rakyat	t
1208031	1208	Aek Kuasan	t
1208032	1208	Aek Ledong	t
1208040	1208	Sei Kepayang	t
1208041	1208	Sei Kepayang Barat	t
1208042	1208	Sei Kepayang Timur	t
1208050	1208	Tanjung Balai	t
1208060	1208	Simpang Empat	t
1208061	1208	Teluk Dalam	t
1208070	1208	Air Batu	t
1208071	1208	Sei Dadap	t
1208080	1208	Buntu Pane	t
1208081	1208	Tinggi Raja	t
1208082	1208	Setia Janji	t
1208090	1208	Meranti	t
1208091	1208	Pulo Bandring	t
1208092	1208	Rawang Panca Arga	t
1208100	1208	Air Joman	t
1208101	1208	Silau Laut	t
1208160	1208	Kisaran Barat	t
1208170	1208	Kisaran Timur	t
1209010	1209	Silimakuta	t
1209011	1209	Pematang Silimahuta	t
1209020	1209	Purba	t
1209021	1209	Haranggaol Horison	t
1209040	1209	Sidamanik	t
1209041	1209	Pematang Sidamanik	t
1209050	1209	Girsang Sipangan Bolon	t
1209060	1209	Tanah Jawa	t
1209061	1209	Hatonduhan	t
1209070	1209	Dolok Panribuan	t
1209080	1209	Jorlang Hataran	t
1209090	1209	Panei	t
1209091	1209	Panombean Panei	t
1209100	1209	Raya	t
1209101	1209	Dolog Masagal	t
1209110	1209	Dolok Silau	t
1209120	1209	Silau Kahean	t
1209130	1209	Raya Kahean	t
1209140	1209	Tapian Dolok	t
1209150	1209	Dolok Batu Nanggar	t
1209160	1209	Siantar	t
1209161	1209	Gunung Malela	t
1209162	1209	Gunung Maligas	t
1209170	1209	Hutabayu Raja	t
1209171	1209	Jawa Maraja Bah Jambi	t
1209180	1209	Pematang Bandar	t
1209181	1209	Bandar Huluan	t
1209190	1209	Bandar	t
1209191	1209	Bandar Masilam	t
1209200	1209	Bosar Maligas	t
1209210	1209	Ujung Padang	t
1210030	1210	Sidikalang	t
1210031	1210	Berampu	t
1210032	1210	Sitinjo	t
1210040	1210	Parbuluan	t
1210050	1210	Sumbul	t
1210051	1210	Silahisabungan	t
1210060	1210	Silima Pungga-Pungga	t
1210061	1210	Lae Parira	t
1210070	1210	Siempat Nempu	t
1210080	1210	Siempat Nempu Hulu	t
1210090	1210	Siempat Nempu Hilir	t
1210100	1210	Tiga Lingga	t
1210101	1210	Gunung Sitember	t
1210110	1210	Pegagan Hilir	t
1210120	1210	Tanah Pinem	t
1211010	1211	Mardingding	t
1211020	1211	Laubaleng	t
1211030	1211	Tiga Binanga	t
1211040	1211	Juhar	t
1211050	1211	Munte	t
1211060	1211	Kuta Buluh	t
1211070	1211	Payung	t
1211071	1211	Tiganderket	t
1211080	1211	Simpang Empat	t
1211081	1211	Naman Teran	t
1211082	1211	Merdeka	t
1211090	1211	Kabanjahe	t
1211100	1211	Berastagi	t
1211110	1211	Tigapanah	t
1211111	1211	Dolat Rayat	t
1211120	1211	Merek	t
1211130	1211	Barusjahe	t
1212010	1212	Gunung Meriah	t
1212020	1212	Sinembah Tanjung Muda Hulu	t
1212030	1212	Sibolangit	t
1212040	1212	Kutalimbaru	t
1212050	1212	Pancur Batu	t
1212060	1212	Namo Rambe	t
1212070	1212	Biru-Biru	t
1212080	1212	Sinembah Tanjung Muda Hilir	t
1212090	1212	Bangun Purba	t
1212190	1212	Galang	t
1212200	1212	Tanjung Morawa	t
1212210	1212	Patumbak	t
1212220	1212	Deli Tua	t
1212230	1212	Sunggal	t
1212240	1212	Hamparan Perak	t
1212250	1212	Labuhan Deli	t
1212260	1212	Percut Sei Tuan	t
1212270	1212	Batang Kuis	t
1212280	1212	Pantai Labu	t
1212290	1212	Beringin	t
1212300	1212	Lubuk Pakam	t
1212310	1212	Pagar Merbau	t
1213010	1213	Bohorok	t
1213011	1213	Sirapit	t
1213020	1213	Salapian	t
1213021	1213	Kutambaru	t
1213030	1213	Sei Bingai	t
1213040	1213	Kuala	t
1213050	1213	Selesai	t
1213060	1213	Binjai	t
1213070	1213	Stabat	t
1213080	1213	Wampu	t
1213090	1213	Batang Serangan	t
1213100	1213	Sawit Seberang	t
1213110	1213	Padang Tualang	t
1213120	1213	Hinai	t
1213130	1213	Secanggang	t
1213140	1213	Tanjung Pura	t
1213150	1213	Gebang	t
1213160	1213	Babalan	t
1213170	1213	Sei Lepan	t
1213180	1213	Brandan Barat	t
1213190	1213	Besitang	t
1213200	1213	Pangkalan Susu	t
1213201	1213	Pematang Jaya	t
1214010	1214	Hibala	t
1214011	1214	Tanah Masa	t
1214020	1214	Pulau-Pulau Batu	t
1214021	1214	Pulau-Pulau Batu Timur	t
1214022	1214	Simuk	t
1214023	1214	Pulau-Pulau Batu Barat	t
1214024	1214	Pulau-Pulau Batu Utara	t
1214030	1214	Teluk Dalam	t
1214031	1214	Fanayama	t
1214032	1214	Toma	t
1214033	1214	Maniamolo	t
1214034	1214	Mazino	t
1214035	1214	Luahagundre Maniamolo	t
1214036	1214	Onolalu	t
1214040	1214	Amandraya	t
1214041	1214	Aramo	t
1214042	1214	Ulususua	t
1214050	1214	Lahusa	t
1214051	1214	Siduaori	t
1214052	1214	Somambawa	t
1214060	1214	Gomo	t
1214061	1214	Susua	t
1214062	1214	Mazo	t
1214063	1214	Umbunasi	t
1214064	1214	Idanotae	t
1214065	1214	Uluidanotae	t
1214066	1214	Boronadu	t
1214070	1214	Lolomatua	t
1214071	1214	Ulunoyo	t
1214072	1214	Huruna	t
1214080	1214	Lolowa'U	t
1214081	1214	Hilimegai	t
1214082	1214	Oou	t
1214083	1214	Onohazumba	t
1214084	1214	Hilisalawaahe	t
1215010	1215	Pakkat	t
1215020	1215	Onan Ganjang	t
1215030	1215	Sijama Polang	t
1215040	1215	Dolok Sanggul	t
1215050	1215	Lintong Nihuta	t
1215060	1215	Paranginan	t
1215070	1215	Bakti Raja	t
1215080	1215	Pollung	t
1215090	1215	Parlilitan	t
1215100	1215	Tara Bintang	t
1216010	1216	Salak	t
1216011	1216	Sitellu Tali Urang Jehe	t
1216012	1216	Pagindar	t
1216013	1216	Sitellu Tali Urang Julu	t
1216014	1216	Pergetteng-Getteng Sengkut	t
1216020	1216	Kerajaan	t
1216021	1216	Tinada	t
1216022	1216	Siempat Rube	t
1217010	1217	Sianjur Mula Mula	t
1217020	1217	Harian	t
1217030	1217	Sitio-Tio	t
1217040	1217	Onan Runggu	t
1217050	1217	Nainggolan	t
1217060	1217	Palipi	t
1217070	1217	Ronggur Nihuta	t
1217080	1217	Pangururan	t
1217090	1217	Simanindo	t
1218010	1218	Kotarih	t
1218011	1218	Silinda	t
1218012	1218	Bintang Bayu	t
1218020	1218	Dolok Masihul	t
1218021	1218	Serbajadi	t
1218030	1218	Sipispis	t
1218040	1218	Dolok Merawan	t
1218050	1218	Tebingtinggi	t
1218051	1218	Tebing Syahbandar	t
1218060	1218	Bandar Khalipah	t
1218070	1218	Tanjung Beringin	t
1218080	1218	Sei Rampah	t
1218081	1218	Sei Bamban	t
1218090	1218	Teluk Mengkudu	t
1218100	1218	Perbaungan	t
1218101	1218	Pegajahan	t
1218110	1218	Pantai Cermin	t
1219010	1219	Sei Balai	t
1219020	1219	Tanjung Tiram	t
1219021	1219	Nibung Hangus	t
1219030	1219	Talawi	t
1219031	1219	Datuk Tanah Datar	t
1219040	1219	Limapuluh	t
1219041	1219	Lima Puluh Pesisir	t
1219042	1219	Datuk Lima Puluh	t
1219050	1219	Air Putih	t
1219060	1219	Sei Suka	t
1219061	1219	Laut Tador	t
1219070	1219	Medang Deras	t
1220010	1220	Batang Onang	t
1220020	1220	Padang Bolak Julu	t
1220030	1220	Portibi	t
1220040	1220	Padang Bolak	t
1220041	1220	Padang Bolak Tenggara	t
1220050	1220	Simangambat	t
1220051	1220	Ujung Batu	t
1220060	1220	Halongonan	t
1220061	1220	Halongonan Timur	t
1220070	1220	Dolok	t
1220080	1220	Dolok Sigompulon	t
1220090	1220	Hulu Sihapas	t
1221010	1221	Sosopan	t
1221020	1221	Ulu Barumun	t
1221030	1221	Barumun	t
1221031	1221	Barumun Selatan	t
1221040	1221	Lubuk Barumun	t
1221050	1221	Sosa	t
1221060	1221	Batang Lubu Sutam	t
1221070	1221	Huta Raja Tinggi	t
1221080	1221	Huristak	t
1221090	1221	Barumun Tengah	t
1221091	1221	Aek Nabara Barumun	t
1221092	1221	Sihapas Barumun	t
1222010	1222	Sungai Kanan	t
1222020	1222	Torgamba	t
1222030	1222	Kota Pinang	t
1222040	1222	Silangkitang	t
1222050	1222	Kampung Rakyat	t
1223010	1223	Na Ix-X	t
1223020	1223	Marbau	t
1223030	1223	Aek Kuo	t
1223040	1223	Aek Natas	t
1223050	1223	Kualuh Selatan	t
1223060	1223	Kualuh Hilir	t
1223070	1223	Kualuh Hulu	t
1223080	1223	Kualuh Leidong	t
1224010	1224	Tugala Oyo	t
1224020	1224	Alasa	t
1224030	1224	Alasa Talu Muzoi	t
1224040	1224	Namohalu Esiwa	t
1224050	1224	Sitolu Ori	t
1224060	1224	Tuhemberua	t
1224070	1224	Sawo	t
1224080	1224	Lotu	t
1224090	1224	Lahewa Timur	t
1224100	1224	Afulu	t
1224110	1224	Lahewa	t
1225010	1225	Sirombu	t
1225020	1225	Lahomi	t
1225030	1225	Ulu Moro O	t
1225040	1225	Lolofitu Moi	t
1225050	1225	Mandrehe Utara	t
1225060	1225	Mandrehe	t
1225070	1225	Mandrehe Barat	t
1225080	1225	Moro O	t
1271010	1271	Sibolga Utara	t
1271020	1271	Sibolga Kota	t
1271030	1271	Sibolga Selatan	t
1271031	1271	Sibolga Sambas	t
1272010	1272	Datuk Bandar	t
1272011	1272	Datuk Bandar Timur	t
1272020	1272	Tanjung Balai Selatan	t
1272030	1272	Tanjung Balai Utara	t
1272040	1272	Sei Tualang Raso	t
1272050	1272	Teluk Nibung	t
1273010	1273	Siantar Marihat	t
1273011	1273	Siantar Marimbun	t
1273020	1273	Siantar Selatan	t
1273030	1273	Siantar Barat	t
1273040	1273	Siantar Utara	t
1273050	1273	Siantar Timur	t
1273060	1273	Siantar Martoba	t
1273061	1273	Siantar Sitalasari	t
1274010	1274	Padang Hulu	t
1274011	1274	Tebing Tinggi Kota	t
1274020	1274	Rambutan	t
1274021	1274	Bajenis	t
1274030	1274	Padang Hilir	t
1275010	1275	Medan Tuntungan	t
1275020	1275	Medan Johor	t
1275030	1275	Medan Amplas	t
1275040	1275	Medan Denai	t
1275050	1275	Medan Area	t
1275060	1275	Medan Kota	t
1275070	1275	Medan Maimun	t
1275080	1275	Medan Polonia	t
1275090	1275	Medan Baru	t
1275100	1275	Medan Selayang	t
1275110	1275	Medan Sunggal	t
1275120	1275	Medan Helvetia	t
1275130	1275	Medan Petisah	t
1275140	1275	Medan Barat	t
1275150	1275	Medan Timur	t
1275160	1275	Medan Perjuangan	t
1275170	1275	Medan Tembung	t
1275180	1275	Medan Deli	t
1275190	1275	Medan Labuhan	t
1275200	1275	Medan Marelan	t
1275210	1275	Medan Belawan	t
1276010	1276	Binjai Selatan	t
1276020	1276	Binjai Kota	t
1276030	1276	Binjai Timur	t
1276040	1276	Binjai Utara	t
1276050	1276	Binjai Barat	t
1277010	1277	Padangsidimpuan Tenggara	t
1277020	1277	Padangsidimpuan Selatan	t
1277030	1277	Padangsidimpuan Batunadua	t
1277040	1277	Padangsidimpuan Utara	t
1277050	1277	Padangsidimpuan Hutaimbaru	t
1277051	1277	Padangsidimpuan Angkola Julu	t
1278010	1278	Gunungsitoli Idanoi	t
1278020	1278	Gunungsitoli Selatan	t
1278030	1278	Gunungsitoli Barat	t
1278040	1278	Gunung Sitoli	t
1278050	1278	Gunungsitoli Alo Oa	t
1278060	1278	Gunungsitoli Utara	t
1301011	1301	Pagai Selatan	t
1301012	1301	Sikakap	t
1301013	1301	Pagai Utara	t
1301021	1301	Sipora Selatan	t
1301022	1301	Sipora Utara	t
1301030	1301	Siberut Selatan	t
1301031	1301	Seberut Barat Daya	t
1301032	1301	Siberut Tengah	t
1301040	1301	Siberut Utara	t
1301041	1301	Siberut Barat	t
1302011	1302	Silaut	t
1302012	1302	Lunang	t
1302020	1302	Basa Ampek Balai Tapan	t
1302021	1302	Ranah Ampek Hulu Tapan	t
1302030	1302	Pancung Soal	t
1302031	1302	Airpura	t
1302040	1302	Linggo Sari Baganti	t
1302050	1302	Ranah Pesisir	t
1302060	1302	Lengayang	t
1302070	1302	Sutera	t
1302080	1302	Batang Kapas	t
1302090	1302	Iv Jurai	t
1302100	1302	Bayang	t
1302101	1302	Iv  Nagari Bayang Utara	t
1302110	1302	Koto Xi Tarusan	t
1303040	1303	Pantai Cermin	t
1303050	1303	Lembah Gumanti	t
1303051	1303	Hiliran Gumanti	t
1303060	1303	Payung Sekaki	t
1303061	1303	Tigo Lurah	t
1303070	1303	Lembang Jaya	t
1303071	1303	Danau Kembar	t
1303080	1303	Gunung Talang	t
1303090	1303	Bukit Sundi	t
1303100	1303	Ix Koto Sungai Lasi	t
1303110	1303	Kubung	t
1303120	1303	X Koto Diatas	t
1303130	1303	X Koto Singkarak	t
1303140	1303	Junjung Sirih	t
1304050	1304	Kamang Baru	t
1304060	1304	Tanjung Gadang	t
1304070	1304	Sijunjung	t
1304071	1304	Lubuk Tarok	t
1304080	1304	Iv Nagari	t
1304090	1304	Kupitan	t
1304100	1304	Koto Tujuh	t
1304110	1304	Sumpur Kudus	t
1305010	1305	Sepuluh Koto	t
1305020	1305	Batipuh	t
1305021	1305	Batipuh Selatan	t
1305030	1305	Pariangan	t
1305040	1305	Rambatan	t
1305050	1305	Lima Kaum	t
1305060	1305	Tanjung Emas	t
1305070	1305	Padang Ganting	t
1305080	1305	Lintau Buo	t
1305081	1305	Lintau Buo Utara	t
1305090	1305	Sungayang	t
1305100	1305	Sungai Tarab	t
1305110	1305	Salimpaung	t
1305111	1305	Tanjung Baru	t
1306010	1306	Batang Anai	t
1306020	1306	Lubuk Alung	t
1306021	1306	Sintuk Toboh Gadang	t
1306030	1306	Ulakan Tapakis	t
1306040	1306	Nan Sabaris	t
1306050	1306	2 X 11 Enam Lingkung	t
1306051	1306	Enam Lingkung	t
1306052	1306	2 X 11 Kayu Tanam	t
1306060	1306	Vii Koto Sungai Sariak	t
1306061	1306	Patamuan	t
1306062	1306	Padang Sago	t
1306070	1306	V Koto Kp Dalam	t
1306071	1306	V Koto Timur	t
1306080	1306	Sungai Limau	t
1306081	1306	Batang Gasan	t
1306090	1306	Sungai Geringging	t
1306100	1306	Iv Koto Aur Malintang	t
1307010	1307	Tanjung Mutiara	t
1307020	1307	Lubuk Basung	t
1307021	1307	Ampek Nagari	t
1307030	1307	Tanjung Raya	t
1307040	1307	Matur	t
1307050	1307	Iv Koto	t
1307051	1307	Malalak	t
1307061	1307	Banuhampu	t
1307062	1307	Sungai Pua	t
1307070	1307	Ampek Angkek	t
1307071	1307	Canduang	t
1307080	1307	Baso	t
1307090	1307	Tilatang Kamang	t
1307091	1307	Kamang Magek	t
1307100	1307	Palembayan	t
1307110	1307	Palupuh	t
1308010	1308	Payakumbuh	t
1308011	1308	Akabiluru	t
1308020	1308	Luak	t
1308021	1308	Lareh Sago Halaban	t
1308022	1308	Situjuah Limo Nagari	t
1308030	1308	Harau	t
1308040	1308	Guguak	t
1308041	1308	Mungka	t
1308050	1308	Suliki	t
1308051	1308	Bukik Barisan	t
1308060	1308	Gunuang Omeh	t
1308070	1308	Kapur Ix	t
1308080	1308	Pangkalan Koto Baru	t
1309070	1309	Bonjol	t
1309071	1309	Tigo Nagari	t
1309072	1309	Simpang Alahan Mati	t
1309080	1309	Lubuk Sikaping	t
1309100	1309	Dua Koto	t
1309110	1309	Panti	t
1309111	1309	Padang Gelugur	t
1309121	1309	Rao	t
1309122	1309	Mapat Tunggul	t
1309123	1309	Mapat Tunggul Selatan	t
1309124	1309	Rao Selatan	t
1309125	1309	Rao Utara	t
1310010	1310	Sangir	t
1310020	1310	Sangir Jujuan	t
1310021	1310	Sangir Balai Janggo	t
1310030	1310	Sangir Batang Hari	t
1310040	1310	Sungai Pagu	t
1310041	1310	Pauah Duo	t
1310050	1310	Koto Parik Gadang Diateh	t
1311010	1311	Sungai Rumbai	t
1311011	1311	Koto Besar	t
1311012	1311	Asam Jujuhan	t
1311020	1311	Koto Baru	t
1311021	1311	Koto Salak	t
1311022	1311	Tiumang	t
1311023	1311	Padang Laweh	t
1311030	1311	Sitiung	t
1311031	1311	Timpeh	t
1311040	1311	Pulau Punjung	t
1311041	1311	Ix Koto	t
1312010	1312	Sungai Beremas	t
1312020	1312	Ranah Batahan	t
1312030	1312	Koto Balingka	t
1312040	1312	Sungai Aur	t
1312050	1312	Lembah Malintang	t
1312060	1312	Gunung Tuleh	t
1312070	1312	Talamau	t
1312080	1312	Pasaman	t
1312090	1312	Luhak Nan Duo	t
1312100	1312	Sasak Ranah Pasisie	t
1312110	1312	Kinali	t
1371010	1371	Bungus Teluk Kabung	t
1371020	1371	Lubuk Kilangan	t
1371030	1371	Lubuk Begalung	t
1371040	1371	Padang Selatan	t
1371050	1371	Padang Timur	t
1371060	1371	Padang Barat	t
1371070	1371	Padang Utara	t
1371080	1371	Nanggalo	t
1371090	1371	Kuranji	t
1371100	1371	Pauh	t
1371110	1371	Koto Tangah	t
1372010	1372	Lubuk Sikarah	t
1372020	1372	Tanjung Harapan	t
1373010	1373	Silungkang	t
1373020	1373	Lembah Segar	t
1373030	1373	Barangin	t
1373040	1373	Talawi	t
1374010	1374	Padang Panjang Barat	t
1374020	1374	Padang Panjang Timur	t
1375010	1375	Guguk Panjang	t
1375020	1375	Mandiangin Koto Selayan	t
1375030	1375	Aur Birugo Tigo Baleh	t
1376010	1376	Payakumbuh Barat	t
1376011	1376	Payakumbuh Selatan	t
1376020	1376	Payakumbuh Timur	t
1376030	1376	Payakumbuh Utara	t
1376031	1376	Lamposi Tigo Nagori	t
1377010	1377	Pariaman Selatan	t
1377020	1377	Pariaman Tengah	t
1377021	1377	Pariaman Timur	t
1377030	1377	Pariaman Utara	t
1401010	1401	Kuantan Mudik	t
1401011	1401	Hulu Kuantan	t
1401012	1401	Gunung Toar	t
1401013	1401	Pucuk Rantau	t
1401020	1401	Singingi	t
1401021	1401	Singingi Hilir	t
1401030	1401	Kuantan Tengah	t
1401031	1401	Sentajo Raya	t
1401040	1401	Benai	t
1401050	1401	Kuantan Hilir	t
1401051	1401	Pangean	t
1401052	1401	Logas Tanah Darat	t
1401053	1401	Kuantan Hilir Seberang	t
1401060	1401	Cerenti	t
1401061	1401	Inuman	t
1402010	1402	Peranap	t
1402011	1402	Batang Peranap	t
1402020	1402	Seberida	t
1402021	1402	Batang Cenaku	t
1402022	1402	Batang Gansal	t
1402030	1402	Kelayang	t
1402031	1402	Rakit Kulim	t
1402040	1402	Pasir Penyu	t
1402041	1402	Lirik	t
1402042	1402	Sungai Lala	t
1402043	1402	Lubuk Batu Jaya	t
1402050	1402	Rengat Barat	t
1402060	1402	Rengat	t
1402061	1402	Kuala Cenaku	t
1403010	1403	Keritang	t
1403011	1403	Kemuning	t
1403020	1403	Reteh	t
1403021	1403	Sungai Batang	t
1403030	1403	Enok	t
1403040	1403	Tanah Merah	t
1403050	1403	Kuala Indragiri	t
1403051	1403	Concong	t
1403060	1403	Tembilahan	t
1403061	1403	Tembilahan Hulu	t
1403070	1403	Tempuling	t
1403071	1403	Kempas	t
1403080	1403	Batang Tuaka	t
1403090	1403	Gaung Anak Serka	t
1403100	1403	Gaung	t
1403110	1403	Mandah	t
1403120	1403	Kateman	t
1403121	1403	Pelangiran	t
1403122	1403	Teluk Belengkong	t
1403123	1403	Pulau Burung	t
1404010	1404	Langgam	t
1404011	1404	Pangkalan Kerinci	t
1404012	1404	Bandar Seikijang	t
1404020	1404	Pangkalan Kuras	t
1404021	1404	Ukui	t
1404022	1404	Pangkalan Lesung	t
1404030	1404	Bunut	t
1404031	1404	Pelalawan	t
1404032	1404	Bandar Petalangan	t
1404040	1404	Kuala Kampar	t
1404041	1404	Kerumutan	t
1404042	1404	Teluk Meranti	t
1405010	1405	Minas	t
1405011	1405	Sungai Mandau	t
1405012	1405	Kandis	t
1405020	1405	Siak	t
1405021	1405	Kerinci Kanan	t
1405022	1405	Tualang	t
1405023	1405	Dayun	t
1405024	1405	Lubuk Dalam	t
1405025	1405	Koto Gasib	t
1405026	1405	Mempura	t
1405030	1405	Sungai Apit	t
1405031	1405	Bunga Raya	t
1405032	1405	Sabak Auh	t
1405033	1405	Pusako	t
1406010	1406	Kampar Kiri	t
1406011	1406	Kampar Kiri Hulu	t
1406012	1406	Kampar Kiri Hilir	t
1406013	1406	Gunung Sahilan	t
1406014	1406	Kampar Kiri Tengah	t
1406020	1406	Xiii Koto Kampar	t
1406021	1406	Koto Kampar Hulu	t
1406030	1406	Kuok	t
1406031	1406	Salo	t
1406040	1406	Tapung	t
1406041	1406	Tapung Hulu	t
1406042	1406	Tapung Hilir	t
1406050	1406	Bangkinang Kota	t
1406051	1406	Bangkinang	t
1406060	1406	Kampar	t
1406061	1406	Kampa	t
1406062	1406	Rumbio Jaya	t
1406063	1406	Kampar Utara	t
1406070	1406	Tambang	t
1406080	1406	Siak Hulu	t
1406081	1406	Perhentian Raja	t
1407010	1407	Rokan Iv Koto	t
1407011	1407	Pendalian Iv Koto	t
1407020	1407	Tandun	t
1407021	1407	Kabun	t
1407022	1407	Ujung Batu	t
1407030	1407	Rambah Samo	t
1407040	1407	Rambah	t
1407041	1407	Rambah Hilir	t
1407042	1407	Bangun Purba	t
1407050	1407	Tambusai	t
1407051	1407	Tambusai Utara	t
1407060	1407	Kepenuhan	t
1407061	1407	Kepenuhan Hulu	t
1407070	1407	Kunto Darussalam	t
1407071	1407	Pagaran Tapah Darussalam	t
1407072	1407	Bonai Darussalam	t
1408010	1408	Mandau	t
1408011	1408	Pinggir	t
1408012	1408	Bathin Solapan	t
1408013	1408	Talang Muandau	t
1408020	1408	Bukit Batu	t
1408021	1408	Siak Kecil	t
1408022	1408	Bandar Laksamana	t
1408030	1408	Rupat	t
1408031	1408	Rupat Utara	t
1408040	1408	Bengkalis	t
1408050	1408	Bantan	t
1409010	1409	Tanah Putih	t
1409011	1409	Pujud	t
1409012	1409	Tanah Putih Tanjung Melawan	t
1409013	1409	Rantau Kopar	t
1409014	1409	Tanjung Medan	t
1409020	1409	Bagan Sinembah	t
1409021	1409	Simpang Kanan	t
1409022	1409	Bagan Sinembah Raya	t
1409023	1409	Balai Jaya	t
1409030	1409	Kubu	t
1409031	1409	Pasir Limau Kapas	t
1409032	1409	Kubu Babussalam	t
1409040	1409	Bangko	t
1409041	1409	Sinaboi	t
1409042	1409	Batu Hampar	t
1409043	1409	Pekaitan	t
1409050	1409	Rimba Melintang	t
1409051	1409	Bangko Pusako	t
1410010	1410	Tebing Tinggi Barat	t
1410020	1410	Tebing Tinggi	t
1410021	1410	Tebing Tinggi Timur	t
1410030	1410	Rangsang	t
1410031	1410	Rangsang Pesisir	t
1410040	1410	Rangsang Barat	t
1410050	1410	Merbau	t
1410051	1410	Pulau Merbau	t
1410052	1410	Tasik Putri Puyu	t
1471010	1471	Tampan	t
1471011	1471	Payung Sekaki	t
1471020	1471	Bukit Raya	t
1471021	1471	Marpoyan Damai	t
1471022	1471	Tenayan Raya	t
1471030	1471	Limapuluh	t
1471040	1471	Sail	t
1471050	1471	Pekanbaru Kota	t
1471060	1471	Sukajadi	t
1471070	1471	Senapelan	t
1471080	1471	Rumbai	t
1471081	1471	Rumbai Pesisir	t
1473010	1473	Bukit Kapur	t
1473011	1473	Medang Kampai	t
1473012	1473	Sungai Sembilan	t
1473020	1473	Dumai Barat	t
1473021	1473	Dumai Selatan	t
1473030	1473	Dumai Timur	t
1473031	1473	Dumai Kota	t
1501010	1501	Gunung Raya	t
1501011	1501	Bukit Kerman	t
1501020	1501	Batang Merangin	t
1501030	1501	Keliling Danau	t
1501040	1501	Danau Kerinci	t
1501050	1501	Sitinjau Laut	t
1501070	1501	Air Hangat	t
1501071	1501	Air Hangat Timur	t
1501072	1501	Depati Vii	t
1501073	1501	Air Hangat Barat	t
1501080	1501	Gunung Kerinci	t
1501081	1501	Siulak	t
1501082	1501	Siulak Mukai	t
1501090	1501	Kayu Aro	t
1501091	1501	Gunung Tujuh	t
1501092	1501	Kayu Aro Barat	t
1502010	1502	Jangkat	t
1502011	1502	Sungai Tenang	t
1502020	1502	Muara Siau	t
1502021	1502	Lembah Masurai	t
1502022	1502	Tiang Pumpung	t
1502030	1502	Pamenang	t
1502031	1502	Pamenang Barat	t
1502032	1502	Renah Pamenang	t
1502033	1502	Pamenang Selatan	t
1502040	1502	Bangko	t
1502041	1502	Bangko Barat	t
1502042	1502	Nalo Tantan	t
1502043	1502	Batang Masumai	t
1502050	1502	Sungai Manau	t
1502051	1502	Renah Pembarap	t
1502052	1502	Pangkalan Jambu	t
1502060	1502	Tabir	t
1502061	1502	Tabir Ulu	t
1502062	1502	Tabir Selatan	t
1502063	1502	Tabir Ilir	t
1502064	1502	Tabir Timur	t
1502065	1502	Tabir Lintas	t
1502066	1502	Margo Tabir	t
1502067	1502	Tabir Barat	t
1503010	1503	Batang Asai	t
1503020	1503	Limun	t
1503021	1503	Cermin Nan Gedang	t
1503030	1503	Pelawan	t
1503031	1503	Singkut	t
1503040	1503	Sarolangun	t
1503041	1503	Bathin Viii	t
1503050	1503	Pauh	t
1503051	1503	Air Hitam	t
1503060	1503	Mandiangin	t
1504010	1504	Mersam	t
1504011	1504	Maro Sebo Ulu	t
1504020	1504	Batin Xxiv	t
1504030	1504	Muara Tembesi	t
1504040	1504	Muara Bulian	t
1504041	1504	Bajubang	t
1504042	1504	Maro Sebo Ilir	t
1504050	1504	Pemayung	t
1505010	1505	Mestong	t
1505011	1505	Sungai Bahar	t
1505012	1505	Bahar Selatan	t
1505013	1505	Bahar Utara	t
1505020	1505	Kumpeh Ulu	t
1505021	1505	Sungai Gelam	t
1505030	1505	Kumpeh	t
1505040	1505	Maro Sebo	t
1505041	1505	Taman Rajo	t
1505050	1505	Jambi Luar Kota	t
1505060	1505	Sekernan	t
1506010	1506	Mendahara	t
1506011	1506	Mendahara Ulu	t
1506012	1506	Geragai	t
1506020	1506	Dendang	t
1506031	1506	Muara Sabak Barat	t
1506032	1506	Muara Sabak Timur	t
1506033	1506	Kuala Jambi	t
1506040	1506	Rantau Rasau	t
1506041	1506	Berbak	t
1506050	1506	Nipah Panjang	t
1506060	1506	Sadu	t
1507010	1507	Tungkal Ulu	t
1507011	1507	Merlung	t
1507012	1507	Batang Asam	t
1507013	1507	Tebing Tinggi	t
1507014	1507	Renah Mendaluh	t
1507015	1507	Muara Papalik	t
1507020	1507	Pengabuan	t
1507021	1507	Senyerang	t
1507030	1507	Tungkal Ilir	t
1507031	1507	Bram Itam	t
1507032	1507	Seberang Kota	t
1507040	1507	Betara	t
1507041	1507	Kuala Betara	t
1508010	1508	Tebo Ilir	t
1508011	1508	Muara Tabir	t
1508020	1508	Tebo Tengah	t
1508021	1508	Sumay	t
1508022	1508	Tengah Ilir	t
1508030	1508	Rimbo Bujang	t
1508031	1508	Rimbo Ulu	t
1508032	1508	Rimbo Ilir	t
1508040	1508	Tebo Ulu	t
1508041	1508	Vii Koto	t
1508042	1508	Serai Serumpun	t
1508043	1508	Vii Koto Ilir	t
1509010	1509	Pelepat	t
1509011	1509	Pelepat Ilir	t
1509021	1509	Bathin Ii Babeko	t
1509022	1509	Rimbo Tengah	t
1509023	1509	Bungo Dani	t
1509024	1509	Pasar Muara Bungo	t
1509025	1509	Bathin Iii	t
1509030	1509	Rantau Pandan	t
1509031	1509	Muko-Muko Bathin Vii	t
1509032	1509	Bathin Iii Ulu	t
1509040	1509	Tanah Sepenggal	t
1509041	1509	Tanah Sepenggal Lintas	t
1509050	1509	Tanah Tumbuh	t
1509051	1509	Limbur Lubuk Mengkuang	t
1509052	1509	Bathin Ii Pelayang	t
1509060	1509	Jujuhan	t
1509061	1509	Jujuhan Ilir	t
1571010	1571	Kota Baru	t
1571011	1571	Alam Barajo	t
1571020	1571	Jambi Selatan	t
1571021	1571	Paal Merah	t
1571030	1571	Jelutung	t
1571040	1571	Pasar Jambi	t
1571050	1571	Telanaipura	t
1571051	1571	Danau Sipin	t
1571060	1571	Danau Teluk	t
1571070	1571	Pelayangan	t
1571080	1571	Jambi Timur	t
1572010	1572	Tanah Kampung	t
1572020	1572	Kumun Debai	t
1572030	1572	Sungai Penuh	t
1572031	1572	Pondok Tinggi	t
1572032	1572	Sungai Bungkal	t
1572040	1572	Hamparan Rawang	t
1572050	1572	Pesisir Bukit	t
1572051	1572	Koto Baru	t
1601052	1601	Lengkiti	t
1601070	1601	Sosoh Buay Rayap	t
1601080	1601	Pengandonan	t
1601081	1601	Semidang Aji	t
1601082	1601	Ulu Ogan	t
1601083	1601	Muara Jaya	t
1601090	1601	Peninjauan	t
1601091	1601	Lubuk Batang	t
1601092	1601	Sinar Peninjauan	t
1601093	1601	Kedaton Peninjauan Raya	t
1601130	1601	Batu Raja Timur	t
1601131	1601	Lubuk Raja	t
1601140	1601	Batu Raja Barat	t
1602010	1602	Lempuing	t
1602011	1602	Lempuing Jaya	t
1602020	1602	Mesuji	t
1602021	1602	Sungai Menang	t
1602022	1602	Mesuji Makmur	t
1602023	1602	Mesuji Raya	t
1602030	1602	Tulung Selapan	t
1602031	1602	Cengal	t
1602040	1602	Pedamaran	t
1602041	1602	Pedamaran Timur	t
1602050	1602	Tanjung Lubuk	t
1602051	1602	Teluk Gelam	t
1602060	1602	Kota Kayu Agung	t
1602120	1602	Sirah Pulau Padang	t
1602121	1602	Jejawi	t
1602130	1602	Pampangan	t
1602131	1602	Pangkalan Lapam	t
1602140	1602	Air Sugihan	t
1603010	1603	Semendo Darat Laut	t
1603011	1603	Semendo Darat Ulu	t
1603012	1603	Semendo Darat Tengah	t
1603020	1603	Tanjung Agung	t
1603031	1603	Rambang	t
1603032	1603	Lubai	t
1603033	1603	Lubai Ulu	t
1603040	1603	Lawang Kidul	t
1603050	1603	Muara Enim	t
1603051	1603	Ujan Mas	t
1603060	1603	Gunung Megang	t
1603061	1603	Benakat	t
1603062	1603	Belimbing	t
1603070	1603	Rambang Dangku	t
1603090	1603	Gelumbang	t
1603091	1603	Lembak	t
1603092	1603	Sungai Rotan	t
1603093	1603	Muara Belida	t
1603094	1603	Kelekar	t
1603095	1603	Belida Darat	t
1604011	1604	Tanjung Sakti Pumi	t
1604012	1604	Tanjung Sakti Pumu	t
1604040	1604	Kota Agung	t
1604041	1604	Mulak Ulu	t
1604042	1604	Tanjung Tebat	t
1604043	1604	Mulak Sebingkai	t
1604050	1604	Pulau Pinang	t
1604051	1604	Pagar Gunung	t
1604052	1604	Gumay Ulu	t
1604060	1604	Jarai	t
1604061	1604	Pajar Bulan	t
1604062	1604	Muara Payang	t
1604063	1604	Sukamerindu	t
1604111	1604	Kikim Barat	t
1604112	1604	Kikim Timur	t
1604113	1604	Kikim Selatan	t
1604114	1604	Kikim Tengah	t
1604120	1604	Lahat	t
1604121	1604	Gumay Talang	t
1604122	1604	Pseksu	t
1604123	1604	Lahat Selatan	t
1604131	1604	Merapi Barat	t
1604132	1604	Merapi Timur	t
1604133	1604	Merapi Selatan	t
1605030	1605	Suku Tengah Lakitan Ulu	t
1605031	1605	Selangit	t
1605032	1605	Sumber Harta	t
1605040	1605	Tugumulyo	t
1605041	1605	Purwodadi	t
1605050	1605	Muara Beliti	t
1605051	1605	Tiang Pumpung Kepungut	t
1605060	1605	Jayaloka	t
1605061	1605	Suka Karya	t
1605070	1605	Muara Kelingi	t
1605071	1605	Bulang Tengah Suku Ulu	t
1605072	1605	Tuah Negeri	t
1605080	1605	Muara Lakitan	t
1605090	1605	Megang Sakti	t
1606010	1606	Sanga Desa	t
1606020	1606	Babat Toman	t
1606021	1606	Batanghari Leko	t
1606022	1606	Plakat Tinggi	t
1606023	1606	Lawang Wetan	t
1606030	1606	Sungai Keruh	t
1606040	1606	Sekayu	t
1606041	1606	Lais	t
1606090	1606	Sungai Lilin	t
1606091	1606	Keluang	t
1606092	1606	Babat Supat	t
1606100	1606	Bayung Lencir	t
1606101	1606	Lalan	t
1606102	1606	Tungkal Jaya	t
1607010	1607	Rantau Bayur	t
1607020	1607	Betung	t
1607021	1607	Suak Tapeh	t
1607030	1607	Pulau Rimau	t
1607031	1607	Tungkal Ilir	t
1607040	1607	Banyuasin Iii	t
1607041	1607	Sembawa	t
1607050	1607	Talang Kelapa	t
1607051	1607	Tanjung Lago	t
1607060	1607	Banyuasin I	t
1607061	1607	Air Kumbang	t
1607070	1607	Rambutan	t
1607080	1607	Muara Padang	t
1607081	1607	Muara Sugihan	t
1607090	1607	Makarti Jaya	t
1607091	1607	Air Saleh	t
1607100	1607	Banyuasin Ii	t
1607110	1607	Muara Telang	t
1607111	1607	Sumber Marga Telang	t
1608010	1608	Mekakau Ilir	t
1608020	1608	Banding Agung	t
1608021	1608	Warkuk Ranau Selatan	t
1608022	1608	Buay Pematang Ribu Ranau Tengah	t
1608030	1608	Buay Pemaca	t
1608040	1608	Simpang	t
1608041	1608	Buana Pemaca	t
1608050	1608	Muaradua	t
1608051	1608	Buay Rawan	t
1608060	1608	Buay Sandang Aji	t
1608061	1608	Tiga Dihaji	t
1608070	1608	Buay Runjung	t
1608071	1608	Runjung Agung	t
1608080	1608	Kisam Tinggi	t
1608090	1608	Muaradua Kisam	t
1608091	1608	Kisam Ilir	t
1608100	1608	Pulau Beringin	t
1608101	1608	Sindang Danau	t
1608102	1608	Sungai Are	t
1609010	1609	Martapura	t
1609011	1609	Bunga Mayang	t
1609012	1609	Jaya Pura	t
1609020	1609	Buay Pemuka Peliung	t
1609030	1609	Buay Madang	t
1609031	1609	Buay Madang Timur	t
1609032	1609	Buay Pemuka Bangsa Raja	t
1609040	1609	Madang Suku Ii	t
1609041	1609	Madang Suku Iii	t
1609050	1609	Madang Suku I	t
1609051	1609	Belitang Madang Raya	t
1609060	1609	Belitang	t
1609061	1609	Belitang Jaya	t
1609070	1609	Belitang Iii	t
1609080	1609	Belitang Ii	t
1609081	1609	Belitang Mulya	t
1609090	1609	Semendawai Suku Iii	t
1609091	1609	Semendawai Timur	t
1609100	1609	Cempaka	t
1609101	1609	Semendawai Barat	t
1610010	1610	Muara Kuang	t
1610011	1610	Rambang Kuang	t
1610012	1610	Lubuk Keliat	t
1610020	1610	Tanjung Batu	t
1610021	1610	Payaraman	t
1610030	1610	Rantau Alai	t
1610031	1610	Kandis	t
1610040	1610	Tanjung Raja	t
1610041	1610	Rantau Panjang	t
1610042	1610	Sungai Pinang	t
1610050	1610	Pemulutan	t
1610051	1610	Pemulutan Selatan	t
1610052	1610	Pemulutan Barat	t
1610060	1610	Indralaya	t
1610061	1610	Indralaya Utara	t
1610062	1610	Indralaya Selatan	t
1611010	1611	Muara Pinang	t
1611020	1611	Lintang Kanan	t
1611030	1611	Pendopo	t
1611031	1611	Pendopo Barat	t
1611040	1611	Pasemah Air Keruh	t
1611050	1611	Ulu Musi	t
1611051	1611	Sikap Dalam	t
1611060	1611	Talang Padang	t
1611070	1611	Tebing Tinggi	t
1611071	1611	Saling	t
1612010	1612	Talang Ubi	t
1612020	1612	Tanah Abang	t
1612030	1612	Abab	t
1612040	1612	Penukal	t
1612050	1612	Penukal Utara	t
1613010	1613	Ulu Rawas	t
1613020	1613	Karang Jaya	t
1613030	1613	Rawas Ulu	t
1613040	1613	Rupit	t
1613050	1613	Karang Dapo	t
1613060	1613	Rawas Ilir	t
1613070	1613	Nibung	t
1671010	1671	Ilir Barat Ii	t
1671011	1671	Gandus	t
1671020	1671	Seberang Ulu I	t
1671021	1671	Kertapati	t
1671022	1671	Jakabaring	t
1671030	1671	Seberang Ulu Ii	t
1671031	1671	Plaju	t
1671040	1671	Ilir Barat I	t
1671041	1671	Bukit Kecil	t
1671050	1671	Ilir Timur I	t
1671051	1671	Kemuning	t
1671060	1671	Ilir Timur Ii	t
1671061	1671	Kalidoni	t
1671062	1671	Ilir Timur Iii	t
1671070	1671	Sako	t
1671071	1671	Sematang Borang	t
1671080	1671	Sukarami	t
1671081	1671	Alang Alang Lebar	t
1672010	1672	Rambang Kapak Tengah	t
1672020	1672	Prabumulih Timur	t
1672021	1672	Prabumulih Selatan	t
1672030	1672	Prabumulih Barat	t
1672031	1672	Prabumulih Utara	t
1672040	1672	Cambai	t
1673010	1673	Dempo Selatan	t
1673011	1673	Dempo Tengah	t
1673020	1673	Dempo Utara	t
1673030	1673	Pagar Alam Selatan	t
1673040	1673	Pagar Alam Utara	t
1674011	1674	Lubuk Linggau Barat I	t
1674012	1674	Lubuk Linggau Barat Ii	t
1674021	1674	Lubuk Linggau Selatan I	t
1674022	1674	Lubuk Linggau Selatan Ii	t
1674031	1674	Lubuk Linggau Timur I	t
1674032	1674	Lubuk Linggau Timur Ii	t
1674041	1674	Lubuk Linggau Utara I	t
1674042	1674	Lubuk Linggau Utara Ii	t
1701040	1701	Manna	t
1701041	1701	Kota Manna	t
1701042	1701	Kedurang	t
1701043	1701	Bunga Mas	t
1701044	1701	Pasar Manna	t
1701045	1701	Kedurang Ilir	t
1701050	1701	Seginim	t
1701051	1701	Air Nipis	t
1701060	1701	Pino	t
1701061	1701	Pinoraya	t
1701062	1701	Ulu Manna	t
1702020	1702	Kota Padang	t
1702021	1702	Sindang Beliti Ilir	t
1702030	1702	Padang Ulak Tanding	t
1702031	1702	Sindang Kelingi	t
1702032	1702	Bindu Riang	t
1702033	1702	Sindang Beliti Ulu	t
1702034	1702	Sindang Dataran	t
1702040	1702	Curup	t
1702041	1702	Bermani Ulu	t
1702042	1702	Selupu Rejang	t
1702043	1702	Curup Selatan	t
1702044	1702	Curup Tengah	t
1702045	1702	Bermani Ulu Raya	t
1702046	1702	Curup Utara	t
1702047	1702	Curup Timur	t
1703010	1703	Enggano	t
1703050	1703	Kerkap	t
1703051	1703	Air Napal	t
1703052	1703	Air Besi	t
1703053	1703	Hulu Palik	t
1703054	1703	Tanjung Agung Palik	t
1703060	1703	Arga Makmur	t
1703061	1703	Arma Jaya	t
1703070	1703	Lais	t
1703071	1703	Batik Nau	t
1703072	1703	Giri Mulya	t
1703073	1703	Air Padang	t
1703080	1703	Padang Jaya	t
1703090	1703	Ketahun	t
1703091	1703	Napal Putih	t
1703092	1703	Ulok Kupai	t
1703093	1703	Pinang Raya	t
1703100	1703	Putri Hijau	t
1703101	1703	Marga Sakti Sebelat	t
1704010	1704	Nasal	t
1704020	1704	Maje	t
1704030	1704	Kaur Selatan	t
1704031	1704	Tetap	t
1704040	1704	Kaur Tengah	t
1704041	1704	Luas	t
1704042	1704	Muara Sahung	t
1704050	1704	Kinal	t
1704051	1704	Semidang Gumay	t
1704060	1704	Tanjung Kemuning	t
1704061	1704	Kelam Tengah	t
1704070	1704	Kaur Utara	t
1704071	1704	Padang Guci Hilir	t
1704072	1704	Lungkang Kule	t
1704073	1704	Padang Guci Hulu	t
1705010	1705	Semidang Alas Maras	t
1705020	1705	Semidang Alas	t
1705030	1705	Talo	t
1705031	1705	Ilir Talo	t
1705032	1705	Talo Kecil	t
1705033	1705	Ulu Talo	t
1705040	1705	Seluma	t
1705041	1705	Seluma Selatan	t
1705042	1705	Seluma Barat	t
1705043	1705	Seluma Timur	t
1705044	1705	Seluma Utara	t
1705050	1705	Sukaraja	t
1705051	1705	Air Periukan	t
1705052	1705	Lubuk Sandi	t
1706010	1706	Ipuh	t
1706011	1706	Air Rami	t
1706012	1706	Malin Deman	t
1706020	1706	Pondok Suguh	t
1706021	1706	Sungai Rumbai	t
1706022	1706	Teramang Jaya	t
1706030	1706	Teras Terunjam	t
1706031	1706	Penarik	t
1706032	1706	Selagan Raya	t
1706040	1706	Kota Mukomuko	t
1706041	1706	Air Dikit	t
1706042	1706	Xiv Koto	t
1706050	1706	Lubuk Pinang	t
1706051	1706	Air Manjunto	t
1706052	1706	V Koto	t
1707010	1707	Rimbo Pengadang	t
1707011	1707	Topos	t
1707020	1707	Lebong Selatan	t
1707021	1707	Bingin Kuning	t
1707030	1707	Lebong Tengah	t
1707031	1707	Lebong Sakti	t
1707040	1707	Lebong Atas	t
1707042	1707	Pelabai	t
1707050	1707	Lebong Utara	t
1707051	1707	Amen	t
1707052	1707	Uram Jaya	t
1707053	1707	Pinang Belapis	t
1708010	1708	Muara Kemumu	t
1708020	1708	Bermani Ilir	t
1708030	1708	Seberang Musi	t
1708040	1708	Tebat Karai	t
1708050	1708	Kepahiang	t
1708060	1708	Kaba Wetan	t
1708070	1708	Ujan Mas	t
1708080	1708	Merigi	t
1709010	1709	Talang Empat	t
1709020	1709	Karang Tinggi	t
1709030	1709	Taba Penanjung	t
1709031	1709	Merigi Kelindang	t
1709040	1709	Pagar Jati	t
1709041	1709	Merigi Sakti	t
1709050	1709	Pondok Kelapa	t
1709051	1709	Pondok Kubang	t
1709060	1709	Pematang Tiga	t
1709061	1709	Bang Haji	t
1771010	1771	Selebar	t
1771011	1771	Kampung Melayu	t
1771020	1771	Gading Cempaka	t
1771021	1771	Ratu Agung	t
1771022	1771	Ratu Samban	t
1771023	1771	Singaran Pati	t
1771030	1771	Teluk Segara	t
1771031	1771	Sungai Serut	t
1771040	1771	Muara Bangka Hulu	t
1801040	1801	Balik Bukit	t
1801041	1801	Sukau	t
1801042	1801	Lumbok Seminung	t
1801050	1801	Belalau	t
1801051	1801	Sekincau	t
1801052	1801	Suoh	t
1801053	1801	Batu Brak	t
1801054	1801	Pagar Dewa	t
1801055	1801	Batu Ketulis	t
1801056	1801	Bandar Negeri Suoh	t
1801060	1801	Sumber Jaya	t
1801061	1801	Way Tenong	t
1801062	1801	Gedung Surian	t
1801063	1801	Kebun Tebu	t
1801064	1801	Air Hitam	t
1802010	1802	Wonosobo	t
1802011	1802	Semaka	t
1802012	1802	Bandar Negeri Semuong	t
1802020	1802	Kota Agung	t
1802021	1802	Pematang Sawa	t
1802022	1802	Kota Agung Timur	t
1802023	1802	Kota Agung Barat	t
1802030	1802	Pulau Panggung	t
1802031	1802	Ulubelu	t
1802032	1802	Air Naningan	t
1802040	1802	Talang Padang	t
1802041	1802	Sumberejo	t
1802042	1802	Gisting	t
1802043	1802	Gunung Alip	t
1802050	1802	Pugung	t
1802101	1802	Bulok	t
1802110	1802	Cukuh Balak	t
1802111	1802	Kelumbayan	t
1802112	1802	Limau	t
1802113	1802	Kelumbayan Barat	t
1803060	1803	Natar	t
1803070	1803	Jati Agung	t
1803080	1803	Tanjung Bintang	t
1803081	1803	Tanjung Sari	t
1803090	1803	Katibung	t
1803091	1803	Merbau Mataram	t
1803092	1803	Way Sulan	t
1803100	1803	Sidomulyo	t
1803101	1803	Candipuro	t
1803102	1803	Way Panji	t
1803110	1803	Kalianda	t
1803111	1803	Rajabasa	t
1803120	1803	Palas	t
1803121	1803	Sragi	t
1803130	1803	Penengahan	t
1803131	1803	Ketapang	t
1803132	1803	Bakauheni	t
1804010	1804	Metro Kibang	t
1804020	1804	Batanghari	t
1804030	1804	Sekampung	t
1804040	1804	Margatiga	t
1804050	1804	Sekampung Udik	t
1804060	1804	Jabung	t
1804061	1804	Pasir Sakti	t
1804062	1804	Waway Karya	t
1804063	1804	Marga Sekampung	t
1804070	1804	Labuhan Maringgai	t
1804071	1804	Mataram Baru	t
1804072	1804	Bandar Sribawono	t
1804073	1804	Melinting	t
1804074	1804	Gunung Pelindung	t
1804080	1804	Way Jepara	t
1804081	1804	Braja Slebah	t
1804082	1804	Labuhan Ratu	t
1804090	1804	Sukadana	t
1804091	1804	Bumi Agung	t
1804092	1804	Batanghari Nuban	t
1804100	1804	Pekalongan	t
1804110	1804	Raman Utara	t
1804120	1804	Purbolinggo	t
1804121	1804	Way Bungur	t
1805010	1805	Padang Ratu	t
1805011	1805	Selagai Lingga	t
1805012	1805	Pubian	t
1805013	1805	Anak Tuha	t
1805014	1805	Anak Ratu Aji	t
1805020	1805	Kalirejo	t
1805021	1805	Sendang Agung	t
1805030	1805	Bangunrejo	t
1805040	1805	Gunung Sugih	t
1805041	1805	Bekri	t
1805042	1805	Bumi Ratu Nuban	t
1805050	1805	Trimurjo	t
1805060	1805	Punggur	t
1805061	1805	Kota Gajah	t
1805070	1805	Seputih Raman	t
1805080	1805	Terbanggi Besar	t
1805081	1805	Seputih Agung	t
1805082	1805	Way Pengubuan	t
1805090	1805	Terusan Nunyai	t
1805100	1805	Seputih Mataram	t
1805101	1805	Bandar Mataram	t
1805110	1805	Seputih Banyak	t
1805111	1805	Way Seputih	t
1805120	1805	Rumbia	t
1805121	1805	Bumi Nabung	t
1805122	1805	Putra Rumbia	t
1805130	1805	Seputih Surabaya	t
1805131	1805	Bandar Surabaya	t
1806010	1806	Bukit Kemuning	t
1806011	1806	Abung Tinggi	t
1806020	1806	Tanjung Raja	t
1806030	1806	Abung Barat	t
1806031	1806	Abung Tengah	t
1806032	1806	Abung  Kunang	t
1806033	1806	Abung Pekurun	t
1806040	1806	Kotabumi	t
1806041	1806	Kotabumi Utara	t
1806042	1806	Kotabumi Selatan	t
1806050	1806	Abung Selatan	t
1806051	1806	Abung Semuli	t
1806052	1806	Blambangan Pagar	t
1806060	1806	Abung Timur	t
1806061	1806	Abung Surakarta	t
1806070	1806	Sungkai Selatan	t
1806071	1806	Muara Sungkai	t
1806072	1806	Bunga Mayang	t
1806073	1806	Sungkai  Barat	t
1806074	1806	Sungkai Jaya	t
1806080	1806	Sungkai Utara	t
1806081	1806	Hulusungkai	t
1806082	1806	Sungkai Tengah	t
1807010	1807	Banjit	t
1807020	1807	Baradatu	t
1807021	1807	Gunung Labuhan	t
1807030	1807	Kasui	t
1807031	1807	Rebang Tangkas	t
1807040	1807	Blambangan Umpu	t
1807041	1807	Way Tuba	t
1807042	1807	Negeri Agung	t
1807050	1807	Bahuga	t
1807051	1807	Buay  Bahuga	t
1807052	1807	Bumi Agung	t
1807060	1807	Pakuan Ratu	t
1807061	1807	Negara Batin	t
1807062	1807	Negeri Besar	t
1808030	1808	Banjar Agung	t
1808031	1808	Banjar Margo	t
1808032	1808	Banjar Baru	t
1808040	1808	Gedung Aji	t
1808041	1808	Penawar Aji	t
1808042	1808	Meraksa Aji	t
1808050	1808	Menggala	t
1808051	1808	Penawar Tama	t
1808052	1808	Rawajitu Selatan	t
1808053	1808	Gedung Meneng	t
1808054	1808	Rawajitu Timur	t
1808055	1808	Rawa Pitu	t
1808056	1808	Gedung Aji Baru	t
1808057	1808	Dente Teladas	t
1808058	1808	Menggala Timur	t
1809010	1809	Punduh Pidada	t
1809011	1809	Marga Punduh	t
1809020	1809	Padang Cermin	t
1809021	1809	Teluk Pandan	t
1809022	1809	Way Ratai	t
1809030	1809	Kedondong	t
1809031	1809	Way Khilau	t
1809040	1809	Way Lima	t
1809050	1809	Gedung Tataan	t
1809060	1809	Negeri Katon	t
1809070	1809	Tegineneng	t
1810010	1810	Pardasuka	t
1810020	1810	Ambarawa	t
1810030	1810	Pagelaran	t
1810031	1810	Pagelaran Utara	t
1810040	1810	Pringsewu	t
1810050	1810	Gading Rejo	t
1810060	1810	Sukoharjo	t
1810070	1810	Banyumas	t
1810080	1810	Adi Luwih	t
1811010	1811	Way Serdang	t
1811020	1811	Simpang Pematang	t
1811030	1811	Panca Jaya	t
1811040	1811	Tanjung Raya	t
1811050	1811	Mesuji	t
1811060	1811	Mesuji Timur	t
1811070	1811	Rawajitu Utara	t
1812010	1812	Tulang Bawang Udik	t
1812020	1812	Tumi Jajar	t
1812030	1812	Tulang Bawang Tengah	t
1812040	1812	Pagar Dewa	t
1812050	1812	Lambu Kibang	t
1812060	1812	Gunung Terang	t
1812061	1812	Batu Putih	t
1812070	1812	Gunung Agung	t
1812080	1812	Way Kenanga	t
1813010	1813	Lemong	t
1813020	1813	Pesisir Utara	t
1813030	1813	Pulau Pisang	t
1813040	1813	Karya Penggawa	t
1813050	1813	Way Krui	t
1813060	1813	Pesisir Tengah	t
1813070	1813	Krui Selatan	t
1813080	1813	Pesisir Selatan	t
1813090	1813	Ngambur	t
1813100	1813	Bengkunat	t
1813110	1813	Bengkunat Belimbing	t
1871010	1871	Teluk Betung Barat	t
1871011	1871	Telukbetung Timur	t
1871020	1871	Teluk Betung Selatan	t
1871021	1871	Bumi Waras	t
1871030	1871	Panjang	t
1871040	1871	Tanjung Karang Timur	t
1871041	1871	Kedamaian	t
1871050	1871	Teluk Betung Utara	t
1871060	1871	Tanjung Karang Pusat	t
1871061	1871	Enggal	t
1871070	1871	Tanjung Karang Barat	t
1871071	1871	Kemiling	t
1871072	1871	Langkapura	t
1871080	1871	Kedaton	t
1871081	1871	Rajabasa	t
1871082	1871	Tanjung Senang	t
1871083	1871	Labuhan Ratu	t
1871090	1871	Sukarame	t
1871091	1871	Sukabumi	t
1871092	1871	Way Halim	t
1872011	1872	Metro Selatan	t
1872012	1872	Metro Barat	t
1872021	1872	Metro Timur	t
1872022	1872	Metro Pusat	t
1872023	1872	Metro Utara	t
1901070	1901	Mendo Barat	t
1901080	1901	Merawang	t
1901081	1901	Puding Besar	t
1901090	1901	Sungai Liat	t
1901091	1901	Pemali	t
1901092	1901	Bakam	t
1901130	1901	Belinyu	t
1901131	1901	Riau Silip	t
1902010	1902	Membalong	t
1902060	1902	Tanjung Pandan	t
1902061	1902	Badau	t
1902062	1902	Sijuk	t
1902063	1902	Selat Nasik	t
1903010	1903	Kelapa	t
1903020	1903	Tempilang	t
1903030	1903	Mentok	t
1903040	1903	Simpang Teritip	t
1903050	1903	Jebus	t
1903051	1903	Parittiga	t
1904010	1904	Koba	t
1904011	1904	Lubuk Besar	t
1904020	1904	Pangkalan Baru	t
1904021	1904	Namang	t
1904030	1904	Sungai Selan	t
1904040	1904	Simpang Katis	t
1905010	1905	Payung	t
1905011	1905	Pulau Besar	t
1905020	1905	Simpang Rimba	t
1905030	1905	Toboali	t
1905031	1905	Tukak Sadai	t
1905040	1905	Air Gegas	t
1905050	1905	Lepar Pongok	t
1905051	1905	Kepulauan Pongok	t
1906010	1906	Dendang	t
1906011	1906	Simpang Pesak	t
1906020	1906	Gantung	t
1906021	1906	Simpang Renggiang	t
1906030	1906	Manggar	t
1906031	1906	Damar	t
1906040	1906	Kelapa Kampit	t
1971010	1971	Rangkui	t
1971020	1971	Bukit Intan	t
1971021	1971	Girimaya	t
1971030	1971	Pangkal Balam	t
1971031	1971	Gabek	t
1971040	1971	Taman Sari	t
1971041	1971	Gerunggang	t
2101010	2101	Moro	t
2101011	2101	Durai	t
2101020	2101	Kundur	t
2101021	2101	Kundur Utara	t
2101022	2101	Kundur Barat	t
2101023	2101	Ungar	t
2101024	2101	Belat	t
2101030	2101	Karimun	t
2101031	2101	Buru	t
2101032	2101	Meral	t
2101033	2101	Tebing	t
2101034	2101	Meral Barat	t
2102040	2102	Teluk Bintan	t
2102050	2102	Bintan Utara	t
2102051	2102	Teluk Sebong	t
2102052	2102	Seri Kuala Lobam	t
2102060	2102	Bintan Timur	t
2102061	2102	Gunung Kijang	t
2102062	2102	Mantang	t
2102063	2102	Bintan Pesisir	t
2102064	2102	Toapaya	t
2102070	2102	Tambelan	t
2103030	2103	Midai	t
2103031	2103	Suak Midai	t
2103040	2103	Bunguran Barat	t
2103041	2103	Bunguran Utara	t
2103042	2103	Pulau Laut	t
2103043	2103	Pulau Tiga	t
2103044	2103	Bunguran Batubi	t
2103045	2103	Pulau Tiga Barat	t
2103050	2103	Bunguran Timur	t
2103051	2103	Bunguran Timur Laut	t
2103052	2103	Bunguran Tengah	t
2103053	2103	Bunguran Selatan	t
2103060	2103	Serasan	t
2103061	2103	Subi	t
2103062	2103	Serasan Timur	t
2104010	2104	Singkep Barat	t
2104011	2104	Kepulauan Posek	t
2104020	2104	Singkep	t
2104021	2104	Singkep Selatan	t
2104022	2104	Singkep Pesisir	t
2104030	2104	Lingga	t
2104031	2104	Selayar	t
2104032	2104	Lingga Timur	t
2104040	2104	Lingga Utara	t
2104050	2104	Senayang	t
2105010	2105	Jemaja	t
2105020	2105	Jemaja Timur	t
2105030	2105	Siantan Selatan	t
2105040	2105	Siantan	t
2105050	2105	Siantan Timur	t
2105060	2105	Siantan Tengah	t
2105070	2105	Palmatak	t
2171010	2171	Belakang Padang	t
2171020	2171	Bulang	t
2171030	2171	Galang	t
2171040	2171	Sei Beduk	t
2171041	2171	Sagulung	t
2171050	2171	Nongsa	t
2171051	2171	Batam Kota	t
2171060	2171	Sekupang	t
2171061	2171	Batu Aji	t
2171070	2171	Lubuk Baja	t
2171080	2171	Batu Ampar	t
2171081	2171	Bengkong	t
2172010	2172	Bukit Bestari	t
2172020	2172	Tanjungpinang Timur	t
2172030	2172	Tanjungpinang Kota	t
2172040	2172	Tanjungpinang Barat	t
3101010	3101	Kepulauan Seribu Selatan	t
3101020	3101	Kepulauan Seribu Utara	t
3171010	3171	Jagakarsa	t
3171020	3171	Pasar Minggu	t
3171030	3171	Cilandak	t
3171040	3171	Pesanggrahan	t
3171050	3171	Kebayoran Lama	t
3171060	3171	Kebayoran Baru	t
3171070	3171	Mampang Prapatan	t
3171080	3171	Pancoran	t
3171090	3171	Tebet	t
3171100	3171	Setia Budi	t
3172010	3172	Pasar Rebo	t
3172020	3172	Ciracas	t
3172030	3172	Cipayung	t
3172040	3172	Makasar	t
3172050	3172	Kramat Jati	t
3172060	3172	Jatinegara	t
3172070	3172	Duren Sawit	t
3172080	3172	Cakung	t
3172090	3172	Pulo Gadung	t
3172100	3172	Matraman	t
3173010	3173	Tanah Abang	t
3173020	3173	Menteng	t
3173030	3173	Senen	t
3173040	3173	Johar Baru	t
3173050	3173	Cempaka Putih	t
3173060	3173	Kemayoran	t
3173070	3173	Sawah Besar	t
3173080	3173	Gambir	t
3174010	3174	Kembangan	t
3174020	3174	Kebon Jeruk	t
3174030	3174	Palmerah	t
3174040	3174	Grogol Petamburan	t
3174050	3174	Tambora	t
3174060	3174	Taman Sari	t
3174070	3174	Cengkareng	t
3174080	3174	Kali Deres	t
3175010	3175	Penjaringan	t
3175020	3175	Pademangan	t
3175030	3175	Tanjung Priok	t
3175040	3175	Koja	t
3175050	3175	Kelapa Gading	t
3175060	3175	Cilincing	t
3201010	3201	Nanggung	t
3201020	3201	Leuwiliang	t
3201021	3201	Leuwisadeng	t
3201030	3201	Pamijahan	t
3201040	3201	Cibungbulang	t
3201050	3201	Ciampea	t
3201051	3201	Tenjolaya	t
3201060	3201	Dramaga	t
3201070	3201	Ciomas	t
3201071	3201	Tamansari	t
3201080	3201	Cijeruk	t
3201081	3201	Cigombong	t
3201090	3201	Caringin	t
3201100	3201	Ciawi	t
3201110	3201	Cisarua	t
3201120	3201	Megamendung	t
3201130	3201	Sukaraja	t
3201140	3201	Babakan Madang	t
3201150	3201	Sukamakmur	t
3201160	3201	Cariu	t
3201161	3201	Tanjungsari	t
3201170	3201	Jonggol	t
3201180	3201	Cileungsi	t
3201181	3201	Kelapa Nunggal	t
3201190	3201	Gunung Putri	t
3201200	3201	Citeureup	t
3201210	3201	Cibinong	t
3201220	3201	Bojong Gede	t
3201221	3201	Tajur Halang	t
3201230	3201	Kemang	t
3201231	3201	Ranca Bungur	t
3201240	3201	Parung	t
3201241	3201	Ciseeng	t
3201250	3201	Gunung Sindur	t
3201260	3201	Rumpin	t
3201270	3201	Cigudeg	t
3201271	3201	Sukajaya	t
3201280	3201	Jasinga	t
3201290	3201	Tenjo	t
3201300	3201	Parung Panjang	t
3202010	3202	Ciemas	t
3202020	3202	Ciracap	t
3202021	3202	Waluran	t
3202030	3202	Surade	t
3202031	3202	Cibitung	t
3202040	3202	Jampang Kulon	t
3202041	3202	Cimanggu	t
3202050	3202	Kali Bunder	t
3202060	3202	Tegal Buleud	t
3202070	3202	Cidolog	t
3202080	3202	Sagaranten	t
3202081	3202	Cidadap	t
3202082	3202	Curugkembar	t
3202090	3202	Pabuaran	t
3202100	3202	Lengkong	t
3202110	3202	Palabuhanratu	t
3202111	3202	Simpenan	t
3202120	3202	Warung Kiara	t
3202121	3202	Bantargadung	t
3202130	3202	Jampang Tengah	t
3202131	3202	Purabaya	t
3202140	3202	Cikembar	t
3202150	3202	Nyalindung	t
3202160	3202	Geger Bitung	t
3202170	3202	Sukaraja	t
3202171	3202	Kebonpedes	t
3202172	3202	Cireunghas	t
3202173	3202	Sukalarang	t
3202180	3202	Sukabumi	t
3202190	3202	Kadudampit	t
3202200	3202	Cisaat	t
3202201	3202	Gunungguruh	t
3202210	3202	Cibadak	t
3202211	3202	Cicantayan	t
3202212	3202	Caringin	t
3202220	3202	Nagrak	t
3202221	3202	Ciambar	t
3202230	3202	Cicurug	t
3202240	3202	Cidahu	t
3202250	3202	Parakan Salak	t
3202260	3202	Parung Kuda	t
3202261	3202	Bojong Genteng	t
3202270	3202	Kalapa Nunggal	t
3202280	3202	Cikidang	t
3202290	3202	Cisolok	t
3202291	3202	Cikakak	t
3202300	3202	Kabandungan	t
3203010	3203	Agrabinta	t
3203011	3203	Leles	t
3203020	3203	Sindangbarang	t
3203030	3203	Cidaun	t
3203040	3203	Naringgul	t
3203050	3203	Cibinong	t
3203051	3203	Cikadu	t
3203060	3203	Tanggeung	t
3203061	3203	Pasirkuda	t
3203070	3203	Kadupandak	t
3203071	3203	Cijati	t
3203080	3203	Takokak	t
3203090	3203	Sukanagara	t
3203100	3203	Pagelaran	t
3203110	3203	Campaka	t
3203111	3203	Campaka Mulya	t
3203120	3203	Cibeber	t
3203130	3203	Warungkondang	t
3203131	3203	Gekbrong	t
3203140	3203	Cilaku	t
3203150	3203	Sukaluyu	t
3203160	3203	Bojongpicung	t
3203161	3203	Haurwangi	t
3203170	3203	Ciranjang	t
3203180	3203	Mande	t
3203190	3203	Karangtengah	t
3203200	3203	Cianjur	t
3203210	3203	Cugenang	t
3203220	3203	Pacet	t
3203221	3203	Cipanas	t
3203230	3203	Sukaresmi	t
3203240	3203	Cikalongkulon	t
3204010	3204	Ciwidey	t
3204011	3204	Rancabali	t
3204020	3204	Pasirjambu	t
3204030	3204	Cimaung	t
3204040	3204	Pangalengan	t
3204050	3204	Kertasari	t
3204060	3204	Pacet	t
3204070	3204	Ibun	t
3204080	3204	Paseh	t
3204090	3204	Cikancung	t
3204100	3204	Cicalengka	t
3204101	3204	Nagreg	t
3204110	3204	Rancaekek	t
3204120	3204	Majalaya	t
3204121	3204	Solokan Jeruk	t
3204130	3204	Ciparay	t
3204140	3204	Baleendah	t
3204150	3204	Arjasari	t
3204160	3204	Banjaran	t
3204161	3204	Cangkuang	t
3204170	3204	Pameungpeuk	t
3204180	3204	Katapang	t
3204190	3204	Soreang	t
3204191	3204	Kutawaringin	t
3204250	3204	Margaasih	t
3204260	3204	Margahayu	t
3204270	3204	Dayeuhkolot	t
3204280	3204	Bojongsoang	t
3204290	3204	Cileunyi	t
3204300	3204	Cilengkrang	t
3204310	3204	Cimenyan	t
3205010	3205	Cisewu	t
3205011	3205	Caringin	t
3205020	3205	Talegong	t
3205030	3205	Bungbulang	t
3205031	3205	Mekarmukti	t
3205040	3205	Pamulihan	t
3205050	3205	Pakenjeng	t
3205060	3205	Cikelet	t
3205070	3205	Pameungpeuk	t
3205080	3205	Cibalong	t
3205090	3205	Cisompet	t
3205100	3205	Peundeuy	t
3205110	3205	Singajaya	t
3205111	3205	Cihurip	t
3205120	3205	Cikajang	t
3205130	3205	Banjarwangi	t
3205140	3205	Cilawu	t
3205150	3205	Bayongbong	t
3205151	3205	Cigedug	t
3205160	3205	Cisurupan	t
3205161	3205	Sukaresmi	t
3205170	3205	Samarang	t
3205171	3205	Pasirwangi	t
3205181	3205	Tarogong Kidul	t
3205182	3205	Tarogong Kaler	t
3205190	3205	Garut Kota	t
3205200	3205	Karangpawitan	t
3205210	3205	Wanaraja	t
3205211	3205	Sucinaraja	t
3205212	3205	Pangatikan	t
3205220	3205	Sukawening	t
3205221	3205	Karangtengah	t
3205230	3205	Banyuresmi	t
3205240	3205	Leles	t
3205250	3205	Leuwigoong	t
3205260	3205	Cibatu	t
3205261	3205	Kersamanah	t
3205270	3205	Cibiuk	t
3205280	3205	Kadungora	t
3205290	3205	Blubur Limbangan	t
3205300	3205	Selaawi	t
3205310	3205	Malangbong	t
3206010	3206	Cipatujah	t
3206020	3206	Karangnunggal	t
3206030	3206	Cikalong	t
3206040	3206	Pancatengah	t
3206050	3206	Cikatomas	t
3206060	3206	Cibalong	t
3206061	3206	Parungponteng	t
3206070	3206	Bantarkalong	t
3206071	3206	Bojongasih	t
3206072	3206	Culamega	t
3206080	3206	Bojonggambir	t
3206090	3206	Sodonghilir	t
3206100	3206	Taraju	t
3206110	3206	Salawu	t
3206111	3206	Puspahiang	t
3206120	3206	Tanjungjaya	t
3206130	3206	Sukaraja	t
3206140	3206	Salopa	t
3206141	3206	Jatiwaras	t
3206150	3206	Cineam	t
3206151	3206	Karangjaya	t
3206160	3206	Manonjaya	t
3206161	3206	Gunungtanjung	t
3206190	3206	Singaparna	t
3206191	3206	Sukarame	t
3206192	3206	Mangunreja	t
3206200	3206	Cigalontang	t
3206210	3206	Leuwisari	t
3206211	3206	Sariwangi	t
3206212	3206	Padakembang	t
3206221	3206	Sukaratu	t
3206230	3206	Cisayong	t
3206231	3206	Sukahening	t
3206240	3206	Rajapolah	t
3206250	3206	Jamanis	t
3206260	3206	Ciawi	t
3206261	3206	Kadipaten	t
3206270	3206	Pagerageung	t
3206271	3206	Sukaresik	t
3207100	3207	Banjarsari	t
3207101	3207	Banjaranyar	t
3207110	3207	Lakbok	t
3207111	3207	Purwadadi	t
3207120	3207	Pamarican	t
3207130	3207	Cidolog	t
3207140	3207	Cimaragas	t
3207150	3207	Cijeungjing	t
3207160	3207	Cisaga	t
3207170	3207	Tambaksari	t
3207180	3207	Rancah	t
3207190	3207	Rajadesa	t
3207200	3207	Sukadana	t
3207210	3207	Ciamis	t
3207211	3207	Baregbeg	t
3207220	3207	Cikoneng	t
3207221	3207	Sindangkasih	t
3207230	3207	Cihaurbeuti	t
3207240	3207	Sadananya	t
3207250	3207	Cipaku	t
3207260	3207	Jatinagara	t
3207270	3207	Panawangan	t
3207280	3207	Kawali	t
3207281	3207	Lumbung	t
3207290	3207	Panjalu	t
3207291	3207	Sukamantri	t
3207300	3207	Panumbangan	t
3208010	3208	Darma	t
3208020	3208	Kadugede	t
3208021	3208	Nusaherang	t
3208030	3208	Ciniru	t
3208031	3208	Hantara	t
3208040	3208	Selajambe	t
3208050	3208	Subang	t
3208051	3208	Cilebak	t
3208060	3208	Ciwaru	t
3208061	3208	Karangkancana	t
3208070	3208	Cibingbin	t
3208071	3208	Cibeureum	t
3208080	3208	Luragung	t
3208081	3208	Cimahi	t
3208090	3208	Cidahu	t
3208091	3208	Kalimanggis	t
3208100	3208	Ciawigebang	t
3208101	3208	Cipicung	t
3208110	3208	Lebakwangi	t
3208111	3208	Maleber	t
3208120	3208	Garawangi	t
3208121	3208	Sindangagung	t
3208130	3208	Kuningan	t
3208140	3208	Cigugur	t
3208150	3208	Kramatmulya	t
3208160	3208	Jalaksana	t
3208161	3208	Japara	t
3208170	3208	Cilimus	t
3208171	3208	Cigandamekar	t
3208180	3208	Mandirancan	t
3208181	3208	Pancalang	t
3208190	3208	Pasawahan	t
3209010	3209	Waled	t
3209011	3209	Pasaleman	t
3209020	3209	Ciledug	t
3209021	3209	Pabuaran	t
3209030	3209	Losari	t
3209031	3209	Pabedilan	t
3209040	3209	Babakan	t
3209041	3209	Gebang	t
3209050	3209	Karangsembung	t
3209051	3209	Karangwareng	t
3209060	3209	Lemahabang	t
3209061	3209	Susukanlebak	t
3209070	3209	Sedong	t
3209080	3209	Astanajapura	t
3209081	3209	Pangenan	t
3209090	3209	Mundu	t
3209100	3209	Beber	t
3209101	3209	Greged	t
3209111	3209	Talun	t
3209120	3209	Sumber	t
3209121	3209	Dukupuntang	t
3209130	3209	Palimanan	t
3209140	3209	Plumbon	t
3209141	3209	Depok	t
3209150	3209	Weru	t
3209151	3209	Plered	t
3209161	3209	Tengah Tani	t
3209162	3209	Kedawung	t
3209171	3209	Gunungjati	t
3209180	3209	Kapetakan	t
3209181	3209	Suranenggala	t
3209190	3209	Klangenan	t
3209191	3209	Jamblang	t
3209200	3209	Arjawinangun	t
3209201	3209	Panguragan	t
3209210	3209	Ciwaringin	t
3209211	3209	Gempol	t
3209220	3209	Susukan	t
3209230	3209	Gegesik	t
3209231	3209	Kaliwedi	t
3210010	3210	Lemahsugih	t
3210020	3210	Bantarujeg	t
3210021	3210	Malausma	t
3210030	3210	Cikijing	t
3210031	3210	Cingambul	t
3210040	3210	Talaga	t
3210041	3210	Banjaran	t
3210050	3210	Argapura	t
3210060	3210	Maja	t
3210070	3210	Majalengka	t
3210080	3210	Cigasong	t
3210090	3210	Sukahaji	t
3210091	3210	Sindang	t
3210100	3210	Rajagaluh	t
3210110	3210	Sindangwangi	t
3210120	3210	Leuwimunding	t
3210130	3210	Palasah	t
3210140	3210	Jatiwangi	t
3210150	3210	Dawuan	t
3210151	3210	Kasokandel	t
3210160	3210	Panyingkiran	t
3210170	3210	Kadipaten	t
3210180	3210	Kertajati	t
3210190	3210	Jatitujuh	t
3210200	3210	Ligung	t
3210210	3210	Sumberjaya	t
3211010	3211	Jatinangor	t
3211020	3211	Cimanggung	t
3211030	3211	Tanjungsari	t
3211031	3211	Sukasari	t
3211032	3211	Pamulihan	t
3211040	3211	Rancakalong	t
3211050	3211	Sumedang Selatan	t
3211060	3211	Sumedang Utara	t
3211061	3211	Ganeas	t
3211070	3211	Situraja	t
3211071	3211	Cisitu	t
3211080	3211	Darmaraja	t
3211090	3211	Cibugel	t
3211100	3211	Wado	t
3211101	3211	Jatinunggal	t
3211111	3211	Jatigede	t
3211120	3211	Tomo	t
3211130	3211	Ujung Jaya	t
3211140	3211	Conggeang	t
3211150	3211	Paseh	t
3211160	3211	Cimalaka	t
3211161	3211	Cisarua	t
3211170	3211	Tanjungkerta	t
3211171	3211	Tanjungmedar	t
3211180	3211	Buahdua	t
3211181	3211	Surian	t
3212010	3212	Haurgeulis	t
3212011	3212	Gantar	t
3212020	3212	Kroya	t
3212030	3212	Gabuswetan	t
3212040	3212	Cikedung	t
3212041	3212	Terisi	t
3212050	3212	Lelea	t
3212060	3212	Bangodua	t
3212061	3212	Tukdana	t
3212070	3212	Widasari	t
3212080	3212	Kertasemaya	t
3212081	3212	Sukagumiwang	t
3212090	3212	Krangkeng	t
3212100	3212	Karangampel	t
3212101	3212	Kedokan Bunder	t
3212110	3212	Juntinyuat	t
3212120	3212	Sliyeg	t
3212130	3212	Jatibarang	t
3212140	3212	Balongan	t
3212150	3212	Indramayu	t
3212160	3212	Sindang	t
3212161	3212	Cantigi	t
3212162	3212	Pasekan	t
3212170	3212	Lohbener	t
3212171	3212	Arahan	t
3212180	3212	Losarang	t
3212190	3212	Kandanghaur	t
3212200	3212	Bongas	t
3212210	3212	Anjatan	t
3212220	3212	Sukra	t
3212221	3212	Patrol	t
3213010	3213	Sagalaherang	t
3213011	3213	Serangpanjang	t
3213020	3213	Jalancagak	t
3213021	3213	Ciater	t
3213030	3213	Cisalak	t
3213031	3213	Kasomalang	t
3213040	3213	Tanjungsiang	t
3213050	3213	Cijambe	t
3213060	3213	Cibogo	t
3213070	3213	Subang	t
3213080	3213	Kalijati	t
3213081	3213	Dawuan	t
3213090	3213	Cipeundeuy	t
3213100	3213	Pabuaran	t
3213110	3213	Patokbeusi	t
3213120	3213	Purwadadi	t
3213130	3213	Cikaum	t
3213140	3213	Pagaden	t
3213141	3213	Pagaden Barat	t
3213150	3213	Cipunagara	t
3213160	3213	Compreng	t
3213170	3213	Binong	t
3213171	3213	Tambakdahan	t
3213180	3213	Ciasem	t
3213190	3213	Pamanukan	t
3213191	3213	Sukasari	t
3213200	3213	Pusakanagara	t
3213201	3213	Pusakajaya	t
3213210	3213	Legonkulon	t
3213220	3213	Blanakan	t
3214010	3214	Jatiluhur	t
3214011	3214	Sukasari	t
3214020	3214	Maniis	t
3214030	3214	Tegal Waru	t
3214040	3214	Plered	t
3214050	3214	Sukatani	t
3214060	3214	Darangdan	t
3214070	3214	Bojong	t
3214080	3214	Wanayasa	t
3214081	3214	Kiarapedes	t
3214090	3214	Pasawahan	t
3214091	3214	Pondok Salam	t
3214100	3214	Purwakarta	t
3214101	3214	Babakancikao	t
3214110	3214	Campaka	t
3214111	3214	Cibatu	t
3214112	3214	Bungursari	t
3215010	3215	Pangkalan	t
3215011	3215	Tegalwaru	t
3215020	3215	Ciampel	t
3215031	3215	Telukjambe Timur	t
3215032	3215	Telukjambe Barat	t
3215040	3215	Klari	t
3215050	3215	Cikampek	t
3215051	3215	Purwasari	t
3215060	3215	Tirtamulya	t
3215070	3215	Jatisari	t
3215071	3215	Banyusari	t
3215072	3215	Kotabaru	t
3215081	3215	Cilamaya Wetan	t
3215082	3215	Cilamaya Kulon	t
3215090	3215	Lemahabang	t
3215100	3215	Talagasari	t
3215111	3215	Majalaya	t
3215112	3215	Karawang Timur	t
3215113	3215	Karawang Barat	t
3215120	3215	Rawamerta	t
3215130	3215	Tempuran	t
3215140	3215	Kutawaluya	t
3215150	3215	Rengasdengklok	t
3215151	3215	Jayakerta	t
3215160	3215	Pedes	t
3215161	3215	Cilebar	t
3215170	3215	Cibuaya	t
3215180	3215	Tirtajaya	t
3215190	3215	Batujaya	t
3215200	3215	Pakisjaya	t
3216010	3216	Setu	t
3216021	3216	Serang Baru	t
3216022	3216	Cikarang Pusat	t
3216023	3216	Cikarang Selatan	t
3216030	3216	Cibarusah	t
3216031	3216	Bojongmangu	t
3216041	3216	Cikarang Timur	t
3216050	3216	Kedungwaringin	t
3216061	3216	Cikarang Utara	t
3216062	3216	Karangbahagia	t
3216070	3216	Cibitung	t
3216071	3216	Cikarang Barat	t
3216081	3216	Tambun Selatan	t
3216082	3216	Tambun Utara	t
3216090	3216	Babelan	t
3216100	3216	Tarumajaya	t
3216110	3216	Tambelang	t
3216111	3216	Sukawangi	t
3216120	3216	Sukatani	t
3216121	3216	Sukakarya	t
3216130	3216	Pebayuran	t
3216140	3216	Cabangbungin	t
3216150	3216	Muara Gembong	t
3217010	3217	Rongga	t
3217020	3217	Gununghalu	t
3217030	3217	Sindangkerta	t
3217040	3217	Cililin	t
3217050	3217	Cihampelas	t
3217060	3217	Cipongkor	t
3217070	3217	Batujajar	t
3217071	3217	Saguling	t
3217080	3217	Cipatat	t
3217090	3217	Padalarang	t
3217100	3217	Ngamprah	t
3217110	3217	Parongpong	t
3217120	3217	Lembang	t
3217130	3217	Cisarua	t
3217140	3217	Cikalong Wetan	t
3217150	3217	Cipeundeuy	t
3218010	3218	Cimerak	t
3218020	3218	Cijulang	t
3218030	3218	Cigugur	t
3218040	3218	Langkaplancar	t
3218050	3218	Parigi	t
3218060	3218	Sidamulih	t
3218070	3218	Pangandaran	t
3218080	3218	Kalipucang	t
3218090	3218	Padaherang	t
3218100	3218	Mangunjaya	t
3271010	3271	Bogor Selatan	t
3271020	3271	Bogor Timur	t
3271030	3271	Bogor Utara	t
3271040	3271	Bogor Tengah	t
3271050	3271	Bogor Barat	t
3271060	3271	Tanah Sereal	t
3272010	3272	Baros	t
3272011	3272	Lembursitu	t
3272012	3272	Cibeureum	t
3272020	3272	Citamiang	t
3272030	3272	Warudoyong	t
3272040	3272	Gunung Puyuh	t
3272050	3272	Cikole	t
3273010	3273	Bandung Kulon	t
3273020	3273	Babakan Ciparay	t
3273030	3273	Bojongloa Kaler	t
3273040	3273	Bojongloa Kidul	t
3273050	3273	Astanaanyar	t
3273060	3273	Regol	t
3273070	3273	Lengkong	t
3273080	3273	Bandung Kidul	t
3273090	3273	Buahbatu	t
3273100	3273	Rancasari	t
3273101	3273	Gedebage	t
3273110	3273	Cibiru	t
3273111	3273	Panyileukan	t
3273120	3273	Ujung Berung	t
3273121	3273	Cinambo	t
3273130	3273	Arcamanik	t
3273141	3273	Antapani	t
3273142	3273	Mandalajati	t
3273150	3273	Kiaracondong	t
3273160	3273	Batununggal	t
3273170	3273	Sumur Bandung	t
3273180	3273	Andir	t
3273190	3273	Cicendo	t
3273200	3273	Bandung Wetan	t
3273210	3273	Cibeunying Kidul	t
3273220	3273	Cibeunying Kaler	t
3273230	3273	Coblong	t
3273240	3273	Sukajadi	t
3273250	3273	Sukasari	t
3273260	3273	Cidadap	t
3274010	3274	Harjamukti	t
3274020	3274	Lemahwungkuk	t
3274030	3274	Pekalipan	t
3274040	3274	Kesambi	t
3274050	3274	Kejaksan	t
3275010	3275	Pondokgede	t
3275011	3275	Jatisampurna	t
3275012	3275	Pondokmelati	t
3275020	3275	Jatiasih	t
3275030	3275	Bantargebang	t
3275031	3275	Mustikajaya	t
3275040	3275	Bekasi Timur	t
3275041	3275	Rawalumbu	t
3275050	3275	Bekasi Selatan	t
3275060	3275	Bekasi Barat	t
3275061	3275	Medan Satria	t
3275070	3275	Bekasi Utara	t
3276010	3276	Sawangan	t
3276011	3276	Bojongsari	t
3276020	3276	Pancoran Mas	t
3276021	3276	Cipayung	t
3276030	3276	Sukma Jaya	t
3276031	3276	Cilodong	t
3276040	3276	Cimanggis	t
3276041	3276	Tapos	t
3276050	3276	Beji	t
3276060	3276	Limo	t
3276061	3276	Cinere	t
3277010	3277	Cimahi Selatan	t
3277020	3277	Cimahi Tengah	t
3277030	3277	Cimahi Utara	t
3278010	3278	Kawalu	t
3278020	3278	Tamansari	t
3278030	3278	Cibeureum	t
3278031	3278	Purbaratu	t
3278040	3278	Tawang	t
3278050	3278	Cihideung	t
3278060	3278	Mangkubumi	t
3278070	3278	Indihiang	t
3278071	3278	Bungursari	t
3278080	3278	Cipedes	t
3279010	3279	Banjar	t
3279020	3279	Purwaharja	t
3279030	3279	Pataruman	t
3279040	3279	Langensari	t
3301010	3301	Dayeuhluhur	t
3301020	3301	Wanareja	t
3301030	3301	Majenang	t
3301040	3301	Cimanggu	t
3301050	3301	Karangpucung	t
3301060	3301	Cipari	t
3301070	3301	Sidareja	t
3301080	3301	Kedungreja	t
3301090	3301	Patimuan	t
3301100	3301	Gandrungmangu	t
3301110	3301	Bantarsari	t
3301120	3301	Kawunganten	t
3301121	3301	Kampung Laut	t
3301130	3301	Jeruklegi	t
3301140	3301	Kesugihan	t
3301150	3301	Adipala	t
3301160	3301	Maos	t
3301170	3301	Sampang	t
3301180	3301	Kroya	t
3301190	3301	Binangun	t
3301200	3301	Nusawungu	t
3301710	3301	Cilacap Selatan	t
3301720	3301	Cilacap Tengah	t
3301730	3301	Cilacap Utara	t
3302010	3302	Lumbir	t
3302020	3302	Wangon	t
3302030	3302	Jatilawang	t
3302040	3302	Rawalo	t
3302050	3302	Kebasen	t
3302060	3302	Kemranjen	t
3302070	3302	Sumpiuh	t
3302080	3302	Tambak	t
3302090	3302	Somagede	t
3302100	3302	Kalibagor	t
3302110	3302	Banyumas	t
3302120	3302	Patikraja	t
3302130	3302	Purwojati	t
3302140	3302	Ajibarang	t
3302150	3302	Gumelar	t
3302160	3302	Pekuncen	t
3302170	3302	Cilongok	t
3302180	3302	Karanglewas	t
3302190	3302	Kedung Banteng	t
3302200	3302	Baturraden	t
3302210	3302	Sumbang	t
3302220	3302	Kembaran	t
3302230	3302	Sokaraja	t
3302710	3302	Purwokerto Selatan	t
3302720	3302	Purwokerto Barat	t
3302730	3302	Purwokerto Timur	t
3302740	3302	Purwokerto Utara	t
3303010	3303	Kemangkon	t
3303020	3303	Bukateja	t
3303030	3303	Kejobong	t
3303040	3303	Pengadegan	t
3303050	3303	Kaligondang	t
3303060	3303	Purbalingga	t
3303070	3303	Kalimanah	t
3303080	3303	Padamara	t
3303090	3303	Kutasari	t
3303100	3303	Bojongsari	t
3303110	3303	Mrebet	t
3303120	3303	Bobotsari	t
3303130	3303	Karangreja	t
3303131	3303	Karangjambu	t
3303140	3303	Karanganyar	t
3303141	3303	Kertanegara	t
3303150	3303	Karangmoncol	t
3303160	3303	Rembang	t
3304010	3304	Susukan	t
3304020	3304	Purwareja Klampok	t
3304030	3304	Mandiraja	t
3304040	3304	Purwanegara	t
3304050	3304	Bawang	t
3304060	3304	Banjarnegara	t
3304061	3304	Pagedongan	t
3304070	3304	Sigaluh	t
3304080	3304	Madukara	t
3304090	3304	Banjarmangu	t
3304100	3304	Wanadadi	t
3304110	3304	Rakit	t
3304120	3304	Punggelan	t
3304130	3304	Karangkobar	t
3304140	3304	Pagentan	t
3304150	3304	Pejawaran	t
3304160	3304	Batur	t
3304170	3304	Wanayasa	t
3304180	3304	Kalibening	t
3304181	3304	Pandanarum	t
3305010	3305	Ayah	t
3305020	3305	Buayan	t
3305030	3305	Puring	t
3305040	3305	Petanahan	t
3305050	3305	Klirong	t
3305060	3305	Buluspesantren	t
3305070	3305	Ambal	t
3305080	3305	Mirit	t
3305081	3305	Bonorowo	t
3305090	3305	Prembun	t
3305091	3305	Padureso	t
3305100	3305	Kutowinangun	t
3305110	3305	Alian	t
3305111	3305	Poncowarno	t
3305120	3305	Kebumen	t
3305130	3305	Pejagoan	t
3305140	3305	Sruweng	t
3305150	3305	Adimulyo	t
3305160	3305	Kuwarasan	t
3305170	3305	Rowokele	t
3305180	3305	Sempor	t
3305190	3305	Gombong	t
3305200	3305	Karanganyar	t
3305210	3305	Karanggayam	t
3305220	3305	Sadang	t
3305221	3305	Karangsambung	t
3306010	3306	Grabag	t
3306020	3306	Ngombol	t
3306030	3306	Purwodadi	t
3306040	3306	Bagelen	t
3306050	3306	Kaligesing	t
3306060	3306	Purworejo	t
3306070	3306	Banyu Urip	t
3306080	3306	Bayan	t
3306090	3306	Kutoarjo	t
3306100	3306	Butuh	t
3306110	3306	Pituruh	t
3306120	3306	Kemiri	t
3306130	3306	Bruno	t
3306140	3306	Gebang	t
3306150	3306	Loano	t
3306160	3306	Bener	t
3307010	3307	Wadaslintang	t
3307020	3307	Kepil	t
3307030	3307	Sapuran	t
3307031	3307	Kalibawang	t
3307040	3307	Kaliwiro	t
3307050	3307	Leksono	t
3307051	3307	Sukoharjo	t
3307060	3307	Selomerto	t
3307070	3307	Kalikajar	t
3307080	3307	Kertek	t
3307090	3307	Wonosobo	t
3307100	3307	Watumalang	t
3307110	3307	Mojotengah	t
3307120	3307	Garung	t
3307130	3307	Kejajar	t
3308010	3308	Salaman	t
3308020	3308	Borobudur	t
3308030	3308	Ngluwar	t
3308040	3308	Salam	t
3308050	3308	Srumbung	t
3308060	3308	Dukun	t
3308070	3308	Muntilan	t
3308080	3308	Mungkid	t
3308090	3308	Sawangan	t
3308100	3308	Candimulyo	t
3308110	3308	Mertoyudan	t
3308120	3308	Tempuran	t
3308130	3308	Kajoran	t
3308140	3308	Kaliangkrik	t
3308150	3308	Bandongan	t
3308160	3308	Windusari	t
3308170	3308	Secang	t
3308180	3308	Tegalrejo	t
3308190	3308	Pakis	t
3308200	3308	Grabag	t
3308210	3308	Ngablak	t
3309010	3309	Selo	t
3309020	3309	Ampel	t
3309030	3309	Cepogo	t
3309040	3309	Musuk	t
3309050	3309	Boyolali	t
3309060	3309	Mojosongo	t
3309070	3309	Teras	t
3309080	3309	Sawit	t
3309090	3309	Banyudono	t
3309100	3309	Sambi	t
3309110	3309	Ngemplak	t
3309120	3309	Nogosari	t
3309130	3309	Simo	t
3309140	3309	Karanggede	t
3309150	3309	Klego	t
3309160	3309	Andong	t
3309170	3309	Kemusu	t
3309180	3309	Wonosegoro	t
3309190	3309	Juwangi	t
3310010	3310	Prambanan	t
3310020	3310	Gantiwarno	t
3310030	3310	Wedi	t
3310040	3310	Bayat	t
3310050	3310	Cawas	t
3310060	3310	Trucuk	t
3310070	3310	Kalikotes	t
3310080	3310	Kebonarum	t
3310090	3310	Jogonalan	t
3310100	3310	Manisrenggo	t
3310110	3310	Karangnongko	t
3310120	3310	Ngawen	t
3310130	3310	Ceper	t
3310140	3310	Pedan	t
3310150	3310	Karangdowo	t
3310160	3310	Juwiring	t
3310170	3310	Wonosari	t
3310180	3310	Delanggu	t
3310190	3310	Polanharjo	t
3310200	3310	Karanganom	t
3310210	3310	Tulung	t
3310220	3310	Jatinom	t
3310230	3310	Kemalang	t
3310710	3310	Klaten Selatan	t
3310720	3310	Klaten Tengah	t
3310730	3310	Klaten Utara	t
3311010	3311	Weru	t
3311020	3311	Bulu	t
3311030	3311	Tawangsari	t
3311040	3311	Sukoharjo	t
3311050	3311	Nguter	t
3311060	3311	Bendosari	t
3311070	3311	Polokarto	t
3311080	3311	Mojolaban	t
3311090	3311	Grogol	t
3311100	3311	Baki	t
3311110	3311	Gatak	t
3311120	3311	Kartasura	t
3312010	3312	Pracimantoro	t
3312020	3312	Paranggupito	t
3312030	3312	Giritontro	t
3312040	3312	Giriwoyo	t
3312050	3312	Batuwarno	t
3312060	3312	Karangtengah	t
3312070	3312	Tirtomoyo	t
3312080	3312	Nguntoronadi	t
3312090	3312	Baturetno	t
3312100	3312	Eromoko	t
3312110	3312	Wuryantoro	t
3312120	3312	Manyaran	t
3312130	3312	Selogiri	t
3312140	3312	Wonogiri	t
3312150	3312	Ngadirojo	t
3312160	3312	Sidoharjo	t
3312170	3312	Jatiroto	t
3312180	3312	Kismantoro	t
3312190	3312	Purwantoro	t
3312200	3312	Bulukerto	t
3312201	3312	Puhpelem	t
3312210	3312	Slogohimo	t
3312220	3312	Jatisrono	t
3312230	3312	Jatipurno	t
3312240	3312	Girimarto	t
3313010	3313	Jatipuro	t
3313020	3313	Jatiyoso	t
3313030	3313	Jumapolo	t
3313040	3313	Jumantono	t
3313050	3313	Matesih	t
3313060	3313	Tawangmangu	t
3313070	3313	Ngargoyoso	t
3313080	3313	Karangpandan	t
3313090	3313	Karanganyar	t
3313100	3313	Tasikmadu	t
3313110	3313	Jaten	t
3313120	3313	Colomadu	t
3313130	3313	Gondangrejo	t
3313140	3313	Kebakkramat	t
3313150	3313	Mojogedang	t
3313160	3313	Kerjo	t
3313170	3313	Jenawi	t
3314010	3314	Kalijambe	t
3314020	3314	Plupuh	t
3314030	3314	Masaran	t
3314040	3314	Kedawung	t
3314050	3314	Sambirejo	t
3314060	3314	Gondang	t
3314070	3314	Sambung Macan	t
3314080	3314	Ngrampal	t
3314090	3314	Karangmalang	t
3314100	3314	Sragen	t
3314110	3314	Sidoharjo	t
3314120	3314	Tanon	t
3314130	3314	Gemolong	t
3314140	3314	Miri	t
3314150	3314	Sumberlawang	t
3314160	3314	Mondokan	t
3314170	3314	Sukodono	t
3314180	3314	Gesi	t
3314190	3314	Tangen	t
3314200	3314	Jenar	t
3315010	3315	Kedungjati	t
3315020	3315	Karangrayung	t
3315030	3315	Penawangan	t
3315040	3315	Toroh	t
3315050	3315	Geyer	t
3315060	3315	Pulokulon	t
3315070	3315	Kradenan	t
3315080	3315	Gabus	t
3315090	3315	Ngaringan	t
3315100	3315	Wirosari	t
3315110	3315	Tawangharjo	t
3315120	3315	Grobogan	t
3315130	3315	Purwodadi	t
3315140	3315	Brati	t
3315150	3315	Klambu	t
3315160	3315	Godong	t
3315170	3315	Gubug	t
3315180	3315	Tegowanu	t
3315190	3315	Tanggungharjo	t
3316010	3316	Jati	t
3316020	3316	Randublatung	t
3316030	3316	Kradenan	t
3316040	3316	Kedungtuban	t
3316050	3316	Cepu	t
3316060	3316	Sambong	t
3316070	3316	Jiken	t
3316080	3316	Bogorejo	t
3316090	3316	Jepon	t
3316100	3316	Kota Blora	t
3316110	3316	Banjarejo	t
3316120	3316	Tunjungan	t
3316130	3316	Japah	t
3316140	3316	Ngawen	t
3316150	3316	Kunduran	t
3316160	3316	Todanan	t
3317010	3317	Sumber	t
3317020	3317	Bulu	t
3317030	3317	Gunem	t
3317040	3317	Sale	t
3317050	3317	Sarang	t
3317060	3317	Sedan	t
3317070	3317	Pamotan	t
3317080	3317	Sulang	t
3317090	3317	Kaliori	t
3317100	3317	Rembang	t
3317110	3317	Pancur	t
3317120	3317	Kragan	t
3317130	3317	Sluke	t
3317140	3317	Lasem	t
3318010	3318	Sukolilo	t
3318020	3318	Kayen	t
3318030	3318	Tambakromo	t
3318040	3318	Winong	t
3318050	3318	Pucakwangi	t
3318060	3318	Jaken	t
3318070	3318	Batangan	t
3318080	3318	Juwana	t
3318090	3318	Jakenan	t
3318100	3318	Pati	t
3318110	3318	Gabus	t
3318120	3318	Margorejo	t
3318130	3318	Gembong	t
3318140	3318	Tlogowungu	t
3318150	3318	Wedarijaksa	t
3318160	3318	Trangkil	t
3318170	3318	Margoyoso	t
3318180	3318	Gunung Wungkal	t
3318190	3318	Cluwak	t
3318200	3318	Tayu	t
3318210	3318	Dukuhseti	t
3319010	3319	Kaliwungu	t
3319020	3319	Kota Kudus	t
3319030	3319	Jati	t
3319040	3319	Undaan	t
3319050	3319	Mejobo	t
3319060	3319	Jekulo	t
3319070	3319	Bae	t
3319080	3319	Gebog	t
3319090	3319	Dawe	t
3320010	3320	Kedung	t
3320020	3320	Pecangaan	t
3320021	3320	Kalinyamatan	t
3320030	3320	Welahan	t
3320040	3320	Mayong	t
3320050	3320	Nalumsari	t
3320060	3320	Batealit	t
3320070	3320	Tahunan	t
3320080	3320	Jepara	t
3320090	3320	Mlonggo	t
3320091	3320	Pakis Aji	t
3320100	3320	Bangsri	t
3320101	3320	Kembang	t
3320110	3320	Keling	t
3320111	3320	Donorojo	t
3320120	3320	Karimunjawa	t
3321010	3321	Mranggen	t
3321020	3321	Karangawen	t
3321030	3321	Guntur	t
3321040	3321	Sayung	t
3321050	3321	Karang Tengah	t
3321060	3321	Bonang	t
3321070	3321	Demak	t
3321080	3321	Wonosalam	t
3321090	3321	Dempet	t
3321091	3321	Kebonagung	t
3321100	3321	Gajah	t
3321110	3321	Karanganyar	t
3321120	3321	Mijen	t
3321130	3321	Wedung	t
3322010	3322	Getasan	t
3322020	3322	Tengaran	t
3322030	3322	Susukan	t
3322031	3322	Kaliwungu	t
3322040	3322	Suruh	t
3322050	3322	Pabelan	t
3322060	3322	Tuntang	t
3322070	3322	Banyubiru	t
3322080	3322	Jambu	t
3322090	3322	Sumowono	t
3322100	3322	Ambarawa	t
3322101	3322	Bandungan	t
3322110	3322	Bawen	t
3322120	3322	Bringin	t
3322121	3322	Bancak	t
3322130	3322	Pringapus	t
3322140	3322	Bergas	t
3322151	3322	Ungaran Barat	t
3322152	3322	Ungaran Timur	t
3323010	3323	Parakan	t
3323011	3323	Kledung	t
3323012	3323	Bansari	t
3323020	3323	Bulu	t
3323030	3323	Temanggung	t
3323031	3323	Tlogomulyo	t
3323040	3323	Tembarak	t
3323041	3323	Selopampang	t
3323050	3323	Kranggan	t
3323060	3323	Pringsurat	t
3323070	3323	Kaloran	t
3323080	3323	Kandangan	t
3323090	3323	Kedu	t
3323100	3323	Ngadirejo	t
3323110	3323	Jumo	t
3323111	3323	Gemawang	t
3323120	3323	Candiroto	t
3323121	3323	Bejen	t
3323130	3323	Tretep	t
3323131	3323	Wonoboyo	t
3324010	3324	Plantungan	t
3324020	3324	Sukorejo	t
3324030	3324	Pagerruyung	t
3324040	3324	Patean	t
3324050	3324	Singorojo	t
3324060	3324	Limbangan	t
3324070	3324	Boja	t
3324080	3324	Kaliwungu	t
3324081	3324	Kaliwungu Selatan	t
3324090	3324	Brangsong	t
3324100	3324	Pegandon	t
3324101	3324	Ngampel	t
3324110	3324	Gemuh	t
3324111	3324	Ringinarum	t
3324120	3324	Weleri	t
3324130	3324	Rowosari	t
3324140	3324	Kangkung	t
3324150	3324	Cepiring	t
3324160	3324	Patebon	t
3324170	3324	Kota Kendal	t
3325010	3325	Wonotunggal	t
3325020	3325	Bandar	t
3325030	3325	Blado	t
3325040	3325	Reban	t
3325050	3325	Bawang	t
3325060	3325	Tersono	t
3325070	3325	Gringsing	t
3325080	3325	Limpung	t
3325081	3325	Banyuputih	t
3325090	3325	Subah	t
3325091	3325	Pecalungan	t
3325100	3325	Tulis	t
3325101	3325	Kandeman	t
3325110	3325	Batang	t
3325120	3325	Warung Asem	t
3326010	3326	Kandangserang	t
3326020	3326	Paninggaran	t
3326030	3326	Lebakbarang	t
3326040	3326	Petungkriono	t
3326050	3326	Talun	t
3326060	3326	Doro	t
3326070	3326	Karanganyar	t
3326080	3326	Kajen	t
3326090	3326	Kesesi	t
3326100	3326	Sragi	t
3326101	3326	Siwalan	t
3326110	3326	Bojong	t
3326120	3326	Wonopringgo	t
3326130	3326	Kedungwuni	t
3326131	3326	Karangdadap	t
3326140	3326	Buaran	t
3326150	3326	Tirto	t
3326160	3326	Wiradesa	t
3326161	3326	Wonokerto	t
3327010	3327	Moga	t
3327011	3327	Warungpring	t
3327020	3327	Pulosari	t
3327030	3327	Belik	t
3327040	3327	Watukumpul	t
3327050	3327	Bodeh	t
3327060	3327	Bantarbolang	t
3327070	3327	Randudongkal	t
3327080	3327	Pemalang	t
3327090	3327	Taman	t
3327100	3327	Petarukan	t
3327110	3327	Ampelgading	t
3327120	3327	Comal	t
3327130	3327	Ulujami	t
3328010	3328	Margasari	t
3328020	3328	Bumijawa	t
3328030	3328	Bojong	t
3328040	3328	Balapulang	t
3328050	3328	Pagerbarang	t
3328060	3328	Lebaksiu	t
3328070	3328	Jatinegara	t
3328080	3328	Kedung Banteng	t
3328090	3328	Pangkah	t
3328100	3328	Slawi	t
3328110	3328	Dukuhwaru	t
3328120	3328	Adiwerna	t
3328130	3328	Dukuhturi	t
3328140	3328	Talang	t
3328150	3328	Tarub	t
3328160	3328	Kramat	t
3328170	3328	Suradadi	t
3328180	3328	Warureja	t
3329010	3329	Salem	t
3329020	3329	Bantarkawung	t
3329030	3329	Bumiayu	t
3329040	3329	Paguyangan	t
3329050	3329	Sirampog	t
3329060	3329	Tonjong	t
3329070	3329	Larangan	t
3329080	3329	Ketanggungan	t
3329090	3329	Banjarharjo	t
3329100	3329	Losari	t
3329110	3329	Tanjung	t
3329120	3329	Kersana	t
3329130	3329	Bulakamba	t
3329140	3329	Wanasari	t
3329150	3329	Songgom	t
3329160	3329	Jatibarang	t
3329170	3329	Brebes	t
3371010	3371	Magelang Selatan	t
3371011	3371	Magelang Tengah	t
3371020	3371	Magelang Utara	t
3372010	3372	Laweyan	t
3372020	3372	Serengan	t
3372030	3372	Pasar Kliwon	t
3372040	3372	Jebres	t
3372050	3372	Banjarsari	t
3373010	3373	Argomulyo	t
3373020	3373	Tingkir	t
3373030	3373	Sidomukti	t
3373040	3373	Sidorejo	t
3374010	3374	Mijen	t
3374020	3374	Gunung Pati	t
3374030	3374	Banyumanik	t
3374040	3374	Gajah Mungkur	t
3374050	3374	Semarang Selatan	t
3374060	3374	Candisari	t
3374070	3374	Tembalang	t
3374080	3374	Pedurungan	t
3374090	3374	Genuk	t
3374100	3374	Gayamsari	t
3374110	3374	Semarang Timur	t
3374120	3374	Semarang Utara	t
3374130	3374	Semarang Tengah	t
3374140	3374	Semarang Barat	t
3374150	3374	Tugu	t
3374160	3374	Ngaliyan	t
3375010	3375	Pekalongan Barat	t
3375020	3375	Pekalongan Timur	t
3375030	3375	Pekalongan Selatan	t
3375040	3375	Pekalongan Utara	t
3376010	3376	Tegal Selatan	t
3376020	3376	Tegal Timur	t
3376030	3376	Tegal Barat	t
3376040	3376	Margadana	t
3401010	3401	Temon	t
3401020	3401	Wates	t
3401030	3401	Panjatan	t
3401040	3401	Galur	t
3401050	3401	Lendah	t
3401060	3401	Sentolo	t
3401070	3401	Pengasih	t
3401080	3401	Kokap	t
3401090	3401	Girimulyo	t
3401100	3401	Nanggulan	t
3401110	3401	Kalibawang	t
3401120	3401	Samigaluh	t
3402010	3402	Srandakan	t
3402020	3402	Sanden	t
3402030	3402	Kretek	t
3402040	3402	Pundong	t
3402050	3402	Bambang Lipuro	t
3402060	3402	Pandak	t
3402070	3402	Bantul	t
3402080	3402	Jetis	t
3402090	3402	Imogiri	t
3402100	3402	Dlingo	t
3402110	3402	Pleret	t
3402120	3402	Piyungan	t
3402130	3402	Banguntapan	t
3402140	3402	Sewon	t
3402150	3402	Kasihan	t
3402160	3402	Pajangan	t
3402170	3402	Sedayu	t
3403010	3403	Panggang	t
3403011	3403	Purwosari	t
3403020	3403	Paliyan	t
3403030	3403	Sapto Sari	t
3403040	3403	Tepus	t
3403041	3403	Tanjungsari	t
3403050	3403	Rongkop	t
3403051	3403	Girisubo	t
3403060	3403	Semanu	t
3403070	3403	Ponjong	t
3403080	3403	Karangmojo	t
3403090	3403	Wonosari	t
3403100	3403	Playen	t
3403110	3403	Patuk	t
3403120	3403	Gedang Sari	t
3403130	3403	Nglipar	t
3403140	3403	Ngawen	t
3403150	3403	Semin	t
3404010	3404	Moyudan	t
3404020	3404	Minggir	t
3404030	3404	Seyegan	t
3404040	3404	Godean	t
3404050	3404	Gamping	t
3404060	3404	Mlati	t
3404070	3404	Depok	t
3404080	3404	Berbah	t
3404090	3404	Prambanan	t
3404100	3404	Kalasan	t
3404110	3404	Ngemplak	t
3404120	3404	Ngaglik	t
3404130	3404	Sleman	t
3404140	3404	Tempel	t
3404150	3404	Turi	t
3404160	3404	Pakem	t
3404170	3404	Cangkringan	t
3471010	3471	Mantrijeron	t
3471020	3471	Kraton	t
3471030	3471	Mergangsan	t
3471040	3471	Umbulharjo	t
3471050	3471	Kotagede	t
3471060	3471	Gondokusuman	t
3471070	3471	Danurejan	t
3471080	3471	Pakualaman	t
3471090	3471	Gondomanan	t
3471100	3471	Ngampilan	t
3471110	3471	Wirobrajan	t
3471120	3471	Gedong Tengen	t
3471130	3471	Jetis	t
3471140	3471	Tegalrejo	t
3501010	3501	Donorojo	t
3501020	3501	Punung	t
3501030	3501	Pringkuku	t
3501040	3501	Pacitan	t
3501050	3501	Kebonagung	t
3501060	3501	Arjosari	t
3501070	3501	Nawangan	t
3501080	3501	Bandar	t
3501090	3501	Tegalombo	t
3501100	3501	Tulakan	t
3501110	3501	Ngadirojo	t
3501120	3501	Sudimoro	t
3502010	3502	Ngrayun	t
3502020	3502	Slahung	t
3502030	3502	Bungkal	t
3502040	3502	Sambit	t
3502050	3502	Sawoo	t
3502060	3502	Sooko	t
3502061	3502	Pudak	t
3502070	3502	Pulung	t
3502080	3502	Mlarak	t
3502090	3502	Siman	t
3502100	3502	Jetis	t
3502110	3502	Balong	t
3502120	3502	Kauman	t
3502130	3502	Jambon	t
3502140	3502	Badegan	t
3502150	3502	Sampung	t
3502160	3502	Sukorejo	t
3502170	3502	Ponorogo	t
3502180	3502	Babadan	t
3502190	3502	Jenangan	t
3502200	3502	Ngebel	t
3503010	3503	Panggul	t
3503020	3503	Munjungan	t
3503030	3503	Watulimo	t
3503040	3503	Kampak	t
3503050	3503	Dongko	t
3503060	3503	Pule	t
3503070	3503	Karangan	t
3503071	3503	Suruh	t
3503080	3503	Gandusari	t
3503090	3503	Durenan	t
3503100	3503	Pogalan	t
3503110	3503	Trenggalek	t
3503120	3503	Tugu	t
3503130	3503	Bendungan	t
3504010	3504	Besuki	t
3504020	3504	Bandung	t
3504030	3504	Pakel	t
3504040	3504	Campur Darat	t
3504050	3504	Tanggung Gunung	t
3504060	3504	Kalidawir	t
3504070	3504	Pucang Laban	t
3504080	3504	Rejotangan	t
3504090	3504	Ngunut	t
3504100	3504	Sumbergempol	t
3504110	3504	Boyolangu	t
3504120	3504	Tulungagung	t
3504130	3504	Kedungwaru	t
3504140	3504	Ngantru	t
3504150	3504	Karangrejo	t
3504160	3504	Kauman	t
3504170	3504	Gondang	t
3504180	3504	Pager Wojo	t
3504190	3504	Sendang	t
3505010	3505	Bakung	t
3505020	3505	Wonotirto	t
3505030	3505	Panggungrejo	t
3505040	3505	Wates	t
3505050	3505	Binangun	t
3505060	3505	Sutojayan	t
3505070	3505	Kademangan	t
3505080	3505	Kanigoro	t
3505090	3505	Talun	t
3505100	3505	Selopuro	t
3505110	3505	Kesamben	t
3505120	3505	Selorejo	t
3505130	3505	Doko	t
3505140	3505	Wlingi	t
3505150	3505	Gandusari	t
3505160	3505	Garum	t
3505170	3505	Nglegok	t
3505180	3505	Sanankulon	t
3505190	3505	Ponggok	t
3505200	3505	Srengat	t
3505210	3505	Wonodadi	t
3505220	3505	Udanawu	t
3506010	3506	Mojo	t
3506020	3506	Semen	t
3506030	3506	Ngadiluwih	t
3506040	3506	Kras	t
3506050	3506	Ringinrejo	t
3506060	3506	Kandat	t
3506070	3506	Wates	t
3506080	3506	Ngancar	t
3506090	3506	Plosoklaten	t
3506100	3506	Gurah	t
3506110	3506	Puncu	t
3506120	3506	Kepung	t
3506130	3506	Kandangan	t
3506140	3506	Pare	t
3506141	3506	Badas	t
3506150	3506	Kunjang	t
3506160	3506	Plemahan	t
3506170	3506	Purwoasri	t
3506180	3506	Papar	t
3506190	3506	Pagu	t
3506191	3506	Kayen Kidul	t
3506200	3506	Gampengrejo	t
3506201	3506	Ngasem	t
3506210	3506	Banyakan	t
3506220	3506	Grogol	t
3506230	3506	Tarokan	t
3507010	3507	Donomulyo	t
3507020	3507	Kalipare	t
3507030	3507	Pagak	t
3507040	3507	Bantur	t
3507050	3507	Gedangan	t
3507060	3507	Sumbermanjing	t
3507070	3507	Dampit	t
3507080	3507	Tirto Yudo	t
3507090	3507	Ampelgading	t
3507100	3507	Poncokusumo	t
3507110	3507	Wajak	t
3507120	3507	Turen	t
3507130	3507	Bululawang	t
3507140	3507	Gondanglegi	t
3507150	3507	Pagelaran	t
3507160	3507	Kepanjen	t
3507170	3507	Sumber Pucung	t
3507180	3507	Kromengan	t
3507190	3507	Ngajum	t
3507200	3507	Wonosari	t
3507210	3507	Wagir	t
3507220	3507	Pakisaji	t
3507230	3507	Tajinan	t
3507240	3507	Tumpang	t
3507250	3507	Pakis	t
3507260	3507	Jabung	t
3507270	3507	Lawang	t
3507280	3507	Singosari	t
3507290	3507	Karangploso	t
3507300	3507	Dau	t
3507310	3507	Pujon	t
3507320	3507	Ngantang	t
3507330	3507	Kasembon	t
3508010	3508	Tempursari	t
3508020	3508	Pronojiwo	t
3508030	3508	Candipuro	t
3508040	3508	Pasirian	t
3508050	3508	Tempeh	t
3508060	3508	Lumajang	t
3508061	3508	Sumbersuko	t
3508070	3508	Tekung	t
3508080	3508	Kunir	t
3508090	3508	Yosowilangun	t
3508100	3508	Rowokangkung	t
3508110	3508	Jatiroto	t
3508120	3508	Randuagung	t
3508130	3508	Sukodono	t
3508140	3508	Padang	t
3508150	3508	Pasrujambe	t
3508160	3508	Senduro	t
3508170	3508	Gucialit	t
3508180	3508	Kedungjajang	t
3508190	3508	Klakah	t
3508200	3508	Ranuyoso	t
3509010	3509	Kencong	t
3509020	3509	Gumuk Mas	t
3509030	3509	Puger	t
3509040	3509	Wuluhan	t
3509050	3509	Ambulu	t
3509060	3509	Tempurejo	t
3509070	3509	Silo	t
3509080	3509	Mayang	t
3509090	3509	Mumbulsari	t
3509100	3509	Jenggawah	t
3509110	3509	Ajung	t
3509120	3509	Rambipuji	t
3509130	3509	Balung	t
3509140	3509	Umbulsari	t
3509150	3509	Semboro	t
3509160	3509	Jombang	t
3509170	3509	Sumber Baru	t
3509180	3509	Tanggul	t
3509190	3509	Bangsalsari	t
3509200	3509	Panti	t
3509210	3509	Sukorambi	t
3509220	3509	Arjasa	t
3509230	3509	Pakusari	t
3509240	3509	Kalisat	t
3509250	3509	Ledokombo	t
3509260	3509	Sumberjambe	t
3509270	3509	Sukowono	t
3509280	3509	Jelbuk	t
3509710	3509	Kaliwates	t
3509720	3509	Sumbersari	t
3509730	3509	Patrang	t
3510010	3510	Pesanggaran	t
3510011	3510	Siliragung	t
3510020	3510	Bangorejo	t
3510030	3510	Purwoharjo	t
3510040	3510	Tegaldlimo	t
3510050	3510	Muncar	t
3510060	3510	Cluring	t
3510070	3510	Gambiran	t
3510071	3510	Tegalsari	t
3510080	3510	Glenmore	t
3510090	3510	Kalibaru	t
3510100	3510	Genteng	t
3510110	3510	Srono	t
3510120	3510	Rogojampi	t
3510121	3510	Blimbingsari	t
3510130	3510	Kabat	t
3510140	3510	Singojuruh	t
3510150	3510	Sempu	t
3510160	3510	Songgon	t
3510170	3510	Glagah	t
3510171	3510	Licin	t
3510180	3510	Banyuwangi	t
3510190	3510	Giri	t
3510200	3510	Kalipuro	t
3510210	3510	Wongsorejo	t
3511010	3511	Maesan	t
3511020	3511	Grujugan	t
3511030	3511	Tamanan	t
3511031	3511	Jambesari Darus Sholah	t
3511040	3511	Pujer	t
3511050	3511	Tlogosari	t
3511060	3511	Sukosari	t
3511061	3511	Sumber Wringin	t
3511070	3511	Tapen	t
3511080	3511	Wonosari	t
3511090	3511	Tenggarang	t
3511100	3511	Bondowoso	t
3511110	3511	Curah Dami	t
3511111	3511	Binakal	t
3511120	3511	Pakem	t
3511130	3511	Wringin	t
3511140	3511	Tegalampel	t
3511141	3511	Taman Krocok	t
3511150	3511	Klabang	t
3511151	3511	Ijen	t
3511152	3511	Botolinggo	t
3511160	3511	Prajekan	t
3511170	3511	Cermee	t
3512010	3512	Sumbermalang	t
3512020	3512	Jatibanteng	t
3512030	3512	Banyuglugur	t
3512040	3512	Besuki	t
3512050	3512	Suboh	t
3512060	3512	Mlandingan	t
3512070	3512	Bungatan	t
3512080	3512	Kendit	t
3512090	3512	Panarukan	t
3512100	3512	Situbondo	t
3512110	3512	Mangaran	t
3512120	3512	Panji	t
3512130	3512	Kapongan	t
3512140	3512	Arjasa	t
3512150	3512	Jangkar	t
3512160	3512	Asembagus	t
3512170	3512	Banyuputih	t
3513010	3513	Sukapura	t
3513020	3513	Sumber	t
3513030	3513	Kuripan	t
3513040	3513	Bantaran	t
3513050	3513	Leces	t
3513060	3513	Tegalsiwalan	t
3513070	3513	Banyuanyar	t
3513080	3513	Tiris	t
3513090	3513	Krucil	t
3513100	3513	Gading	t
3513110	3513	Pakuniran	t
3513120	3513	Kotaanyar	t
3513130	3513	Paiton	t
3513140	3513	Besuk	t
3513150	3513	Kraksaan	t
3513160	3513	Krejengan	t
3513170	3513	Pajarakan	t
3513180	3513	Maron	t
3513190	3513	Gending	t
3513200	3513	Dringu	t
3513210	3513	Wonomerto	t
3513220	3513	Lumbang	t
3513230	3513	Tongas	t
3513240	3513	Sumberasih	t
3514010	3514	Purwodadi	t
3514020	3514	Tutur	t
3514030	3514	Puspo	t
3514040	3514	Tosari	t
3514050	3514	Lumbang	t
3514060	3514	Pasrepan	t
3514070	3514	Kejayan	t
3514080	3514	Wonorejo	t
3514090	3514	Purwosari	t
3514100	3514	Prigen	t
3514110	3514	Sukorejo	t
3514120	3514	Pandaan	t
3514130	3514	Gempol	t
3514140	3514	Beji	t
3514150	3514	Bangil	t
3514160	3514	Rembang	t
3514170	3514	Kraton	t
3514180	3514	Pohjentrek	t
3514190	3514	Gondang Wetan	t
3514200	3514	Rejoso	t
3514210	3514	Winongan	t
3514220	3514	Grati	t
3514230	3514	Lekok	t
3514240	3514	Nguling	t
3515010	3515	Tarik	t
3515020	3515	Prambon	t
3515030	3515	Krembung	t
3515040	3515	Porong	t
3515050	3515	Jabon	t
3515060	3515	Tanggulangin	t
3515070	3515	Candi	t
3515080	3515	Tulangan	t
3515090	3515	Wonoayu	t
3515100	3515	Sukodono	t
3515110	3515	Sidoarjo	t
3515120	3515	Buduran	t
3515130	3515	Sedati	t
3515140	3515	Waru	t
3515150	3515	Gedangan	t
3515160	3515	Taman	t
3515170	3515	Krian	t
3515180	3515	Balong Bendo	t
3516010	3516	Jatirejo	t
3516020	3516	Gondang	t
3516030	3516	Pacet	t
3516040	3516	Trawas	t
3516050	3516	Ngoro	t
3516060	3516	Pungging	t
3516070	3516	Kutorejo	t
3516080	3516	Mojosari	t
3516090	3516	Bangsal	t
3516091	3516	Mojoanyar	t
3516100	3516	Dlanggu	t
3516110	3516	Puri	t
3516120	3516	Trowulan	t
3516130	3516	Sooko	t
3516140	3516	Gedek	t
3516150	3516	Kemlagi	t
3516160	3516	Jetis	t
3516170	3516	Dawar Blandong	t
3517010	3517	Bandar Kedung Mulyo	t
3517020	3517	Perak	t
3517030	3517	Gudo	t
3517040	3517	Diwek	t
3517050	3517	Ngoro	t
3517060	3517	Mojowarno	t
3517070	3517	Bareng	t
3517080	3517	Wonosalam	t
3517090	3517	Mojoagung	t
3517100	3517	Sumobito	t
3517110	3517	Jogo Roto	t
3517120	3517	Peterongan	t
3517130	3517	Jombang	t
3517140	3517	Megaluh	t
3517150	3517	Tembelang	t
3517160	3517	Kesamben	t
3517170	3517	Kudu	t
3517171	3517	Ngusikan	t
3517180	3517	Ploso	t
3517190	3517	Kabuh	t
3517200	3517	Plandaan	t
3518010	3518	Sawahan	t
3518020	3518	Ngetos	t
3518030	3518	Berbek	t
3518040	3518	Loceret	t
3518050	3518	Pace	t
3518060	3518	Tanjunganom	t
3518070	3518	Prambon	t
3518080	3518	Ngronggot	t
3518090	3518	Kertosono	t
3518100	3518	Patianrowo	t
3518110	3518	Baron	t
3518120	3518	Gondang	t
3518130	3518	Sukomoro	t
3518140	3518	Nganjuk	t
3518150	3518	Bagor	t
3518160	3518	Wilangan	t
3518170	3518	Rejoso	t
3518180	3518	Ngluyu	t
3518190	3518	Lengkong	t
3518200	3518	Jatikalen	t
3519010	3519	Kebonsari	t
3519020	3519	Geger	t
3519030	3519	Dolopo	t
3519040	3519	Dagangan	t
3519050	3519	Wungu	t
3519060	3519	Kare	t
3519070	3519	Gemarang	t
3519080	3519	Saradan	t
3519090	3519	Pilangkenceng	t
3519100	3519	Mejayan	t
3519110	3519	Wonoasri	t
3519120	3519	Balerejo	t
3519130	3519	Madiun	t
3519140	3519	Sawahan	t
3519150	3519	Jiwan	t
3520010	3520	Poncol	t
3520020	3520	Parang	t
3520030	3520	Lembeyan	t
3520040	3520	Takeran	t
3520041	3520	Nguntoronadi	t
3520050	3520	Kawedanan	t
3520060	3520	Magetan	t
3520061	3520	Ngariboyo	t
3520070	3520	Plaosan	t
3520071	3520	Sidorejo	t
3520080	3520	Panekan	t
3520090	3520	Sukomoro	t
3520100	3520	Bendo	t
3520110	3520	Maospati	t
3520120	3520	Karangrejo	t
3520121	3520	Karas	t
3520130	3520	Barat	t
3520131	3520	Kartoharjo	t
3521010	3521	Sine	t
3521020	3521	Ngrambe	t
3521030	3521	Jogorogo	t
3521040	3521	Kendal	t
3521050	3521	Geneng	t
3521051	3521	Gerih	t
3521060	3521	Kwadungan	t
3521070	3521	Pangkur	t
3521080	3521	Karangjati	t
3521090	3521	Bringin	t
3521100	3521	Padas	t
3521101	3521	Kasreman	t
3521110	3521	Ngawi	t
3521120	3521	Paron	t
3521130	3521	Kedunggalar	t
3521140	3521	Pitu	t
3521150	3521	Widodaren	t
3521160	3521	Mantingan	t
3521170	3521	Karanganyar	t
3522010	3522	Margomulyo	t
3522020	3522	Ngraho	t
3522030	3522	Tambakrejo	t
3522040	3522	Ngambon	t
3522041	3522	Sekar	t
3522050	3522	Bubulan	t
3522051	3522	Gondang	t
3522060	3522	Temayang	t
3522070	3522	Sugihwaras	t
3522080	3522	Kedungadem	t
3522090	3522	Kepoh Baru	t
3522100	3522	Baureno	t
3522110	3522	Kanor	t
3522120	3522	Sumberejo	t
3522130	3522	Balen	t
3522140	3522	Sukosewu	t
3522150	3522	Kapas	t
3522160	3522	Bojonegoro	t
3522170	3522	Trucuk	t
3522180	3522	Dander	t
3522190	3522	Ngasem	t
3522191	3522	Gayam	t
3522200	3522	Kalitidu	t
3522210	3522	Malo	t
3522220	3522	Purwosari	t
3522230	3522	Padangan	t
3522240	3522	Kasiman	t
3522241	3522	Kedewan	t
3523010	3523	Kenduruan	t
3523020	3523	Bangilan	t
3523030	3523	Senori	t
3523040	3523	Singgahan	t
3523050	3523	Montong	t
3523060	3523	Parengan	t
3523070	3523	Soko	t
3523080	3523	Rengel	t
3523081	3523	Grabagan	t
3523090	3523	Plumpang	t
3523100	3523	Widang	t
3523110	3523	Palang	t
3523120	3523	Semanding	t
3523130	3523	Tuban	t
3523140	3523	Jenu	t
3523150	3523	Merakurak	t
3523160	3523	Kerek	t
3523170	3523	Tambakboyo	t
3523180	3523	Jatirogo	t
3523190	3523	Bancar	t
3524010	3524	Sukorame	t
3524020	3524	Bluluk	t
3524030	3524	Ngimbang	t
3524040	3524	Sambeng	t
3524050	3524	Mantup	t
3524060	3524	Kembangbahu	t
3524070	3524	Sugio	t
3524080	3524	Kedungpring	t
3524090	3524	Modo	t
3524100	3524	Babat	t
3524110	3524	Pucuk	t
3524120	3524	Sukodadi	t
3524130	3524	Lamongan	t
3524140	3524	Tikung	t
3524141	3524	Sarirejo	t
3524150	3524	Deket	t
3524160	3524	Glagah	t
3524170	3524	Karangbinangun	t
3524180	3524	Turi	t
3524190	3524	Kalitengah	t
3524200	3524	Karang Geneng	t
3524210	3524	Sekaran	t
3524220	3524	Maduran	t
3524230	3524	Laren	t
3524240	3524	Solokuro	t
3524250	3524	Paciran	t
3524260	3524	Brondong	t
3525010	3525	Wringinanom	t
3525020	3525	Driyorejo	t
3525030	3525	Kedamean	t
3525040	3525	Menganti	t
3525050	3525	Cerme	t
3525060	3525	Benjeng	t
3525070	3525	Balongpanggang	t
3525080	3525	Duduksampeyan	t
3525090	3525	Kebomas	t
3525100	3525	Gresik	t
3525110	3525	Manyar	t
3525120	3525	Bungah	t
3525130	3525	Sidayu	t
3525140	3525	Dukun	t
3525150	3525	Panceng	t
3525160	3525	Ujungpangkah	t
3525170	3525	Sangkapura	t
3525180	3525	Tambak	t
3526010	3526	Kamal	t
3526020	3526	Labang	t
3526030	3526	Kwanyar	t
3526040	3526	Modung	t
3526050	3526	Blega	t
3526060	3526	Konang	t
3526070	3526	Galis	t
3526080	3526	Tanah Merah	t
3526090	3526	Tragah	t
3526100	3526	Socah	t
3526110	3526	Bangkalan	t
3526120	3526	Burneh	t
3526130	3526	Arosbaya	t
3526140	3526	Geger	t
3526150	3526	Kokop	t
3526160	3526	Tanjungbumi	t
3526170	3526	Sepulu	t
3526180	3526	Klampis	t
3527010	3527	Sreseh	t
3527020	3527	Torjun	t
3527021	3527	Pangarengan	t
3527030	3527	Sampang	t
3527040	3527	Camplong	t
3527050	3527	Omben	t
3527060	3527	Kedungdung	t
3527070	3527	Jrengik	t
3527080	3527	Tambelangan	t
3527090	3527	Banyuates	t
3527100	3527	Robatal	t
3527101	3527	Karang Penang	t
3527110	3527	Ketapang	t
3527120	3527	Sokobanah	t
3528010	3528	Tlanakan	t
3528020	3528	Pademawu	t
3528030	3528	Galis	t
3528040	3528	Larangan	t
3528050	3528	Pamekasan	t
3528060	3528	Proppo	t
3528070	3528	Palengaan	t
3528080	3528	Pegantenan	t
3528090	3528	Kadur	t
3528100	3528	Pakong	t
3528110	3528	Waru	t
3528120	3528	Batu Marmar	t
3528130	3528	Pasean	t
3529010	3529	Pragaan	t
3529020	3529	Bluto	t
3529030	3529	Saronggi	t
3529040	3529	Giligenteng	t
3529050	3529	Talango	t
3529060	3529	Kalianget	t
3529070	3529	Kota Sumenep	t
3529071	3529	Batuan	t
3529080	3529	Lenteng	t
3529090	3529	Ganding	t
3529100	3529	Guluk Guluk	t
3529110	3529	Pasongsongan	t
3529120	3529	Ambunten	t
3529130	3529	Rubaru	t
3529140	3529	Dasuk	t
3529150	3529	Manding	t
3529160	3529	Batuputih	t
3529170	3529	Gapura	t
3529180	3529	Batang Batang	t
3529190	3529	Dungkek	t
3529200	3529	Nonggunong	t
3529210	3529	Gayam	t
3529220	3529	Raas	t
3529230	3529	Sapeken	t
3529240	3529	Arjasa	t
3529241	3529	Kangayan	t
3529250	3529	Masalembu	t
3571010	3571	Mojoroto	t
3571020	3571	Kota Kediri	t
3571030	3571	Pesantren	t
3572010	3572	Sukorejo	t
3572020	3572	Kepanjenkidul	t
3572030	3572	Sananwetan	t
3573010	3573	Kedungkandang	t
3573020	3573	Sukun	t
3573030	3573	Klojen	t
3573040	3573	Blimbing	t
3573050	3573	Lowokwaru	t
3574010	3574	Kademangan	t
3574011	3574	Kedopok	t
3574020	3574	Wonoasih	t
3574030	3574	Mayangan	t
3574031	3574	Kanigaran	t
3575010	3575	Gadingrejo	t
3575020	3575	Purworejo	t
3575030	3575	Bugulkidul	t
3575031	3575	Panggungrejo	t
3576010	3576	Prajurit Kulon	t
3576020	3576	Magersari	t
3576021	3576	Kranggan	t
3577010	3577	Mangu Harjo	t
3577020	3577	Taman	t
3577030	3577	Kartoharjo	t
3578010	3578	Karang Pilang	t
3578020	3578	Jambangan	t
3578030	3578	Gayungan	t
3578040	3578	Wonocolo	t
3578050	3578	Tenggilis Mejoyo	t
3578060	3578	Gunung Anyar	t
3578070	3578	Rungkut	t
3578080	3578	Sukolilo	t
3578090	3578	Mulyorejo	t
3578100	3578	Gubeng	t
3578110	3578	Wonokromo	t
3578120	3578	Dukuh Pakis	t
3578130	3578	Wiyung	t
3578140	3578	Lakarsantri	t
3578141	3578	Sambikerep	t
3578150	3578	Tandes	t
3578160	3578	Suko Manunggal	t
3578170	3578	Sawahan	t
3578180	3578	Tegalsari	t
3578190	3578	Genteng	t
3578200	3578	Tambaksari	t
3578210	3578	Kenjeran	t
3578211	3578	Bulak	t
3578220	3578	Simokerto	t
3578230	3578	Semampir	t
3578240	3578	Pabean Cantian	t
3578250	3578	Bubutan	t
3578260	3578	Krembangan	t
3578270	3578	Asemrowo	t
3578280	3578	Benowo	t
3578281	3578	Pakal	t
3579010	3579	Batu	t
3579020	3579	Junrejo	t
3579030	3579	Bumiaji	t
3601010	3601	Sumur	t
3601020	3601	Cimanggu	t
3601030	3601	Cibaliung	t
3601031	3601	Cibitung	t
3601040	3601	Cikeusik	t
3601050	3601	Cigeulis	t
3601060	3601	Panimbang	t
3601061	3601	Sobang	t
3601070	3601	Munjul	t
3601071	3601	Angsana	t
3601072	3601	Sindangresmi	t
3601080	3601	Picung	t
3601090	3601	Bojong	t
3601100	3601	Saketi	t
3601101	3601	Cisata	t
3601110	3601	Pagelaran	t
3601111	3601	Patia	t
3601112	3601	Sukaresmi	t
3601120	3601	Labuan	t
3601121	3601	Carita	t
3601130	3601	Jiput	t
3601131	3601	Cikedal	t
3601140	3601	Menes	t
3601141	3601	Pulosari	t
3601150	3601	Mandalawangi	t
3601160	3601	Cimanuk	t
3601161	3601	Cipeucang	t
3601170	3601	Banjar	t
3601171	3601	Kaduhejo	t
3601172	3601	Mekarjaya	t
3601180	3601	Pandeglang	t
3601181	3601	Majasari	t
3601190	3601	Cadasari	t
3601191	3601	Karangtanjung	t
3601192	3601	Koroncong	t
3602010	3602	Malingping	t
3602011	3602	Wanasalam	t
3602020	3602	Panggarangan	t
3602021	3602	Cihara	t
3602030	3602	Bayah	t
3602031	3602	Cilograng	t
3602040	3602	Cibeber	t
3602050	3602	Cijaku	t
3602051	3602	Cigemblong	t
3602060	3602	Banjarsari	t
3602070	3602	Cileles	t
3602080	3602	Gunung Kencana	t
3602090	3602	Bojongmanik	t
3602091	3602	Cirinten	t
3602100	3602	Leuwidamar	t
3602110	3602	Muncang	t
3602111	3602	Sobang	t
3602120	3602	Cipanas	t
3602121	3602	Lebakgedong	t
3602130	3602	Sajira	t
3602140	3602	Cimarga	t
3602150	3602	Cikulur	t
3602160	3602	Warunggunung	t
3602170	3602	Cibadak	t
3602180	3602	Rangkasbitung	t
3602181	3602	Kalanganyar	t
3602190	3602	Maja	t
3602191	3602	Curugbitung	t
3603010	3603	Cisoka	t
3603011	3603	Solear	t
3603020	3603	Tigaraksa	t
3603021	3603	Jambe	t
3603030	3603	Cikupa	t
3603040	3603	Panongan	t
3603050	3603	Curug	t
3603051	3603	Kelapa Dua	t
3603060	3603	Legok	t
3603070	3603	Pagedangan	t
3603081	3603	Cisauk	t
3603120	3603	Pasarkemis	t
3603121	3603	Sindang Jaya	t
3603130	3603	Balaraja	t
3603131	3603	Jayanti	t
3603132	3603	Sukamulya	t
3603140	3603	Kresek	t
3603141	3603	Gunung Kaler	t
3603150	3603	Kronjo	t
3603151	3603	Mekar Baru	t
3603160	3603	Mauk	t
3603161	3603	Kemiri	t
3603162	3603	Sukadiri	t
3603170	3603	Rajeg	t
3603180	3603	Sepatan	t
3603181	3603	Sepatan Timur	t
3603190	3603	Pakuhaji	t
3603200	3603	Teluknaga	t
3603210	3603	Kosambi	t
3604010	3604	Cinangka	t
3604020	3604	Padarincang	t
3604030	3604	Ciomas	t
3604040	3604	Pabuaran	t
3604041	3604	Gunung Sari	t
3604050	3604	Baros	t
3604060	3604	Petir	t
3604061	3604	Tunjung Teja	t
3604080	3604	Cikeusal	t
3604090	3604	Pamarayan	t
3604091	3604	Bandung	t
3604100	3604	Jawilan	t
3604110	3604	Kopo	t
3604120	3604	Cikande	t
3604121	3604	Kibin	t
3604130	3604	Kragilan	t
3604180	3604	Waringinkurung	t
3604190	3604	Mancak	t
3604200	3604	Anyar	t
3604210	3604	Bojonegara	t
3604211	3604	Pulo Ampel	t
3604220	3604	Kramatwatu	t
3604240	3604	Ciruas	t
3604250	3604	Pontang	t
3604251	3604	Lebak Wangi	t
3604260	3604	Carenang	t
3604261	3604	Binuang	t
3604270	3604	Tirtayasa	t
3604271	3604	Tanara	t
3671010	3671	Ciledug	t
3671011	3671	Larangan	t
3671012	3671	Karang Tengah	t
3671020	3671	Cipondoh	t
3671021	3671	Pinang	t
3671030	3671	Tangerang	t
3671031	3671	Karawaci	t
3671040	3671	Jati Uwung	t
3671041	3671	Cibodas	t
3671042	3671	Periuk	t
3671050	3671	Batuceper	t
3671051	3671	Neglasari	t
3671060	3671	Benda	t
3672010	3672	Ciwandan	t
3672011	3672	Citangkil	t
3672020	3672	Pulomerak	t
3672021	3672	Purwakarta	t
3672022	3672	Grogol	t
3672030	3672	Cilegon	t
3672031	3672	Jombang	t
3672040	3672	Cibeber	t
3673010	3673	Curug	t
3673020	3673	Walantaka	t
3673030	3673	Cipocok Jaya	t
3673040	3673	Serang	t
3673050	3673	Taktakan	t
3673060	3673	Kasemen	t
3674010	3674	Setu	t
3674020	3674	Serpong	t
3674030	3674	Pamulang	t
3674040	3674	Ciputat	t
3674050	3674	Ciputat Timur	t
3674060	3674	Pondok Aren	t
3674070	3674	Serpong Utara	t
5101010	5101	Melaya	t
5101020	5101	Negara	t
5101021	5101	Jembrana	t
5101030	5101	Mendoyo	t
5101040	5101	Pekutatan	t
5102010	5102	Selemadeg	t
5102011	5102	Selemadeg Timur	t
5102012	5102	Selemadeg Barat	t
5102020	5102	Kerambitan	t
5102030	5102	Tabanan	t
5102040	5102	Kediri	t
5102050	5102	Marga	t
5102060	5102	Baturiti	t
5102070	5102	Penebel	t
5102080	5102	Pupuan	t
5103010	5103	Kuta Selatan	t
5103020	5103	Kuta	t
5103030	5103	Kuta Utara	t
5103040	5103	Mengwi	t
5103050	5103	Abiansemal	t
5103060	5103	Petang	t
5104010	5104	Sukawati	t
5104020	5104	Blahbatuh	t
5104030	5104	Gianyar	t
5104040	5104	Tampaksiring	t
5104050	5104	Ubud	t
5104060	5104	Tegallalang	t
5104070	5104	Payangan	t
5105010	5105	Nusapenida	t
5105020	5105	Banjarangkan	t
5105030	5105	Klungkung	t
5105040	5105	Dawan	t
5106010	5106	Susut	t
5106020	5106	Bangli	t
5106030	5106	Tembuku	t
5106040	5106	Kintamani	t
5107010	5107	Rendang	t
5107020	5107	Sidemen	t
5107030	5107	Manggis	t
5107040	5107	Karangasem	t
5107050	5107	Abang	t
5107060	5107	Bebandem	t
5107070	5107	Selat	t
5107080	5107	Kubu	t
5108010	5108	Gerokgak	t
5108020	5108	Seririt	t
5108030	5108	Busungbiu	t
5108040	5108	Banjar	t
5108050	5108	Sukasada	t
5108060	5108	Buleleng	t
5108070	5108	Sawan	t
5108080	5108	Kubutambahan	t
5108090	5108	Tejakula	t
5171010	5171	Denpasar Selatan	t
5171020	5171	Denpasar Timur	t
5171030	5171	Denpasar Barat	t
5171031	5171	Denpasar Utara	t
5201010	5201	Sekotong	t
5201011	5201	Lembar	t
5201020	5201	Gerung	t
5201030	5201	Labu Api	t
5201040	5201	Kediri	t
5201041	5201	Kuripan	t
5201050	5201	Narmada	t
5201051	5201	Lingsar	t
5201060	5201	Gunung Sari	t
5201061	5201	Batu Layar	t
5202010	5202	Praya Barat	t
5202011	5202	Praya Barat Daya	t
5202020	5202	Pujut	t
5202030	5202	Praya Timur	t
5202040	5202	Janapria	t
5202050	5202	Kopang	t
5202060	5202	Praya	t
5202061	5202	Praya Tengah	t
5202070	5202	Jonggat	t
5202080	5202	Pringgarata	t
5202090	5202	Batukliang	t
5202091	5202	Batukliang Utara	t
5203010	5203	Keruak	t
5203011	5203	Jerowaru	t
5203020	5203	Sakra	t
5203021	5203	Sakra Barat	t
5203022	5203	Sakra Timur	t
5203030	5203	Terara	t
5203031	5203	Montong Gading	t
5203040	5203	Sikur	t
5203050	5203	Masbagik	t
5203051	5203	Pringgasela	t
5203060	5203	Sukamulia	t
5203061	5203	Suralaga	t
5203070	5203	Selong	t
5203071	5203	Labuhan Haji	t
5203080	5203	Pringgabaya	t
5203081	5203	Suela	t
5203090	5203	Aikmel	t
5203091	5203	Wanasaba	t
5203092	5203	Sembalun	t
5203100	5203	Sambelia	t
5204020	5204	Lunyuk	t
5204021	5204	Orong Telu	t
5204050	5204	Alas	t
5204051	5204	Alas Barat	t
5204052	5204	Buer	t
5204061	5204	Utan	t
5204062	5204	Rhee	t
5204070	5204	Batulanteh	t
5204080	5204	Sumbawa	t
5204081	5204	Labuhan Badas	t
5204082	5204	Unter Iwes	t
5204090	5204	Moyohilir	t
5204091	5204	Moyo Utara	t
5204100	5204	Moyohulu	t
5204110	5204	Ropang	t
5204111	5204	Lenangguar	t
5204112	5204	Lantung	t
5204121	5204	Lape	t
5204122	5204	Lopok	t
5204130	5204	Plampang	t
5204131	5204	Labangka	t
5204132	5204	Maronge	t
5204140	5204	Empang	t
5204141	5204	Tarano	t
5205010	5205	Hu'U	t
5205011	5205	Pajo	t
5205020	5205	Dompu	t
5205030	5205	Woja	t
5205040	5205	Kilo	t
5205050	5205	Kempo	t
5205051	5205	Manggalewa	t
5205060	5205	Pekat	t
5206010	5206	Monta	t
5206011	5206	Parado	t
5206020	5206	Bolo	t
5206021	5206	Mada Pangga	t
5206030	5206	Woha	t
5206040	5206	Belo	t
5206041	5206	Palibelo	t
5206050	5206	Wawo	t
5206051	5206	Langgudu	t
5206052	5206	Lambitu	t
5206060	5206	Sape	t
5206061	5206	Lambu	t
5206070	5206	Wera	t
5206071	5206	Ambalawi	t
5206080	5206	Donggo	t
5206081	5206	Soromandi	t
5206090	5206	Sanggar	t
5206091	5206	Tambora	t
5207010	5207	Sekongkang	t
5207020	5207	Jereweh	t
5207021	5207	Maluk	t
5207030	5207	Taliwang	t
5207031	5207	Brang Ene	t
5207040	5207	Brang Rea	t
5207050	5207	Seteluk	t
5207051	5207	Poto Tano	t
5208010	5208	Pemenang	t
5208020	5208	Tanjung	t
5208030	5208	Gangga	t
5208040	5208	Kayangan	t
5208050	5208	Bayan	t
5271010	5271	Ampenan	t
5271011	5271	Sekarbela	t
5271020	5271	Mataram	t
5271021	5271	Selaparang	t
5271030	5271	Cakranegara	t
5271031	5271	Sandubaya	t
5272010	5272	Rasanae Barat	t
5272011	5272	Mpunda	t
5272020	5272	Rasanae Timur	t
5272021	5272	Raba	t
5272030	5272	Asakota	t
5301021	5301	Lamboya	t
5301022	5301	Wanokaka	t
5301023	5301	Laboya Barat	t
5301050	5301	Loli	t
5301060	5301	Kota Waikabubak	t
5301072	5301	Tana Righu	t
5302010	5302	Lewa	t
5302011	5302	Nggaha Oriangu	t
5302012	5302	Lewa Tidahu	t
5302013	5302	Katala Hamu Lingu	t
5302020	5302	Tabundung	t
5302021	5302	Pinupahar	t
5302030	5302	Paberiwai	t
5302031	5302	Karera	t
5302032	5302	Matawai La Pawu	t
5302033	5302	Kahaungu Eti	t
5302034	5302	Mahu	t
5302035	5302	Ngadu Ngala	t
5302040	5302	Pahunga Lodu	t
5302041	5302	Wula Waijelu	t
5302051	5302	Rindi	t
5302052	5302	Umalulu	t
5302060	5302	Pandawai	t
5302061	5302	Kambata Mapambuhang	t
5302070	5302	Kota Waingapu	t
5302071	5302	Kambera	t
5302080	5302	Haharu	t
5302081	5302	Kanatang	t
5303100	5303	Semau	t
5303101	5303	Semau Selatan	t
5303110	5303	Kupang Barat	t
5303111	5303	Nekamese	t
5303120	5303	Kupang Tengah	t
5303121	5303	Taebenu	t
5303130	5303	Amarasi	t
5303131	5303	Amarasi Barat	t
5303132	5303	Amarasi Selatan	t
5303133	5303	Amarasi Timur	t
5303140	5303	Kupang Timur	t
5303141	5303	Amabi Oefeto Timur	t
5303142	5303	Amabi Oefeto	t
5303150	5303	Sulamu	t
5303160	5303	Fatuleu	t
5303161	5303	Fatuleu Tengah	t
5303162	5303	Fatuleu Barat	t
5303170	5303	Takari	t
5303180	5303	Amfoang Selatan	t
5303181	5303	Amfoang Barat Daya	t
5303182	5303	Amfoang Tengah	t
5303190	5303	Amfoang Utara	t
5303191	5303	Amfoang Barat Laut	t
5303192	5303	Amfoang Timur	t
5304010	5304	Mollo Utara	t
5304011	5304	Fatumnasi	t
5304012	5304	Tobu	t
5304013	5304	Nunbena	t
5304020	5304	Mollo Selatan	t
5304021	5304	Polen	t
5304022	5304	Mollo Barat	t
5304023	5304	Mollo Tengah	t
5304030	5304	Kota Soe	t
5304040	5304	Amanuban Barat	t
5304041	5304	Batu Putih	t
5304042	5304	Kuatnana	t
5304050	5304	Amanuban Selatan	t
5304051	5304	Noebeba	t
5304060	5304	Kuan Fatu	t
5304061	5304	Kualin	t
5304070	5304	Amanuban Tengah	t
5304071	5304	Kolbano	t
5304072	5304	Oenino	t
5304080	5304	Amanuban Timur	t
5304081	5304	Fautmolo	t
5304082	5304	Fatukopa	t
5304090	5304	Kie	t
5304091	5304	Kot'Olin	t
5304100	5304	Amanatun Selatan	t
5304101	5304	Boking	t
5304102	5304	Nunkolo	t
5304103	5304	Noebana	t
5304104	5304	Santian	t
5304110	5304	Amanatun Utara	t
5304111	5304	Toianas	t
5304112	5304	Kokbaun	t
5305010	5305	Miomaffo Barat	t
5305011	5305	Miomaffo Tengah	t
5305012	5305	Musi	t
5305013	5305	Mutis	t
5305020	5305	Miomaffo Timur	t
5305021	5305	Noemuti	t
5305022	5305	Bikomi Selatan	t
5305023	5305	Bikomi Tengah	t
5305024	5305	Bikomi Nilulat	t
5305025	5305	Bikomi Utara	t
5305026	5305	Naibenu	t
5305027	5305	Noemuti Timur	t
5305030	5305	Kota Kefamenanu	t
5305040	5305	Insana	t
5305041	5305	Insana Utara	t
5305042	5305	Insana Barat	t
5305043	5305	Insana Tengah	t
5305044	5305	Insana Fafinesu	t
5305050	5305	Biboki Selatan	t
5305051	5305	Biboki Tanpah	t
5305052	5305	Biboki Moenleu	t
5305060	5305	Biboki Utara	t
5305061	5305	Biboki Anleu	t
5305062	5305	Biboki Feotleu	t
5306032	5306	Rai Manuk	t
5306050	5306	Tasifeto Barat	t
5306051	5306	Kakuluk Mesak	t
5306052	5306	Nanaet Dubesi	t
5306060	5306	Atambua	t
5306061	5306	Atambua Barat	t
5306062	5306	Atambua Selatan	t
5306070	5306	Tasifeto Timur	t
5306071	5306	Raihat	t
5306072	5306	Lasiolat	t
5306080	5306	Lamaknen	t
5306081	5306	Lamaknen Selatan	t
5307010	5307	Pantar	t
5307011	5307	Pantar Barat	t
5307012	5307	Pantar Timur	t
5307013	5307	Pantar Barat Laut	t
5307014	5307	Pantar Tengah	t
5307020	5307	Alor Barat Daya	t
5307021	5307	Mataru	t
5307030	5307	Alor Selatan	t
5307040	5307	Alor Timur	t
5307041	5307	Alor Timur Laut	t
5307042	5307	Pureman	t
5307050	5307	Teluk Mutiara	t
5307051	5307	Kabola	t
5307060	5307	Alor Barat Laut	t
5307061	5307	Alor Tengah Utara	t
5307062	5307	Pulau Pura	t
5307063	5307	Lembur	t
5308010	5308	Nagawutung	t
5308011	5308	Wulandoni	t
5308020	5308	Atadei	t
5308030	5308	Ile Ape	t
5308031	5308	Ile Ape Timur	t
5308040	5308	Lebatukan	t
5308050	5308	Nubatukan	t
5308060	5308	Omesuri	t
5308070	5308	Buyasari	t
5309010	5309	Wulanggitang	t
5309011	5309	Titehena	t
5309012	5309	Ilebura	t
5309020	5309	Tanjung Bunga	t
5309021	5309	Lewo Lema	t
5309030	5309	Larantuka	t
5309031	5309	Ile Mandiri	t
5309032	5309	Demon Pagong	t
5309040	5309	Solor Barat	t
5309041	5309	Solor Selatan	t
5309050	5309	Solor Timur	t
5309060	5309	Adonara Barat	t
5309061	5309	Wotan Ulu Mado	t
5309062	5309	Adonara Tengah	t
5309070	5309	Adonara Timur	t
5309071	5309	Ile Boleng	t
5309072	5309	Witihama	t
5309073	5309	Kelubagolit	t
5309074	5309	Adonara	t
5310010	5310	Paga	t
5310011	5310	Mego	t
5310012	5310	Tana Wawo	t
5310020	5310	Lela	t
5310030	5310	Bola	t
5310031	5310	Doreng	t
5310032	5310	Mapitara	t
5310040	5310	Talibura	t
5310041	5310	Waigete	t
5310042	5310	Waiblama	t
5310050	5310	Kewapante	t
5310051	5310	Hewokloang	t
5310052	5310	Kangae	t
5310061	5310	Palue	t
5310062	5310	Koting	t
5310063	5310	Nelle	t
5310070	5310	Nita	t
5310071	5310	Magepanda	t
5310080	5310	Alok	t
5310081	5310	Alok Barat	t
5310082	5310	Alok Timur	t
5311010	5311	Nangapanda	t
5311011	5311	Pulau Ende	t
5311012	5311	Maukaro	t
5311020	5311	Ende	t
5311030	5311	Ende Selatan	t
5311031	5311	Ende Timur	t
5311032	5311	Ende Tengah	t
5311033	5311	Ende Utara	t
5311040	5311	Ndona	t
5311041	5311	Ndona Timur	t
5311050	5311	Wolowaru	t
5311051	5311	Wolojita	t
5311052	5311	Lio Timur	t
5311053	5311	Kelimutu	t
5311054	5311	Ndori	t
5311060	5311	Maurole	t
5311061	5311	Kotabaru	t
5311062	5311	Detukeli	t
5311063	5311	Lepembusu Kelisoke	t
5311070	5311	Detusoko	t
5311071	5311	Wewaria	t
5312010	5312	Aimere	t
5312011	5312	Jerebuu	t
5312012	5312	Inerie	t
5312020	5312	Bajawa	t
5312030	5312	Golewa	t
5312031	5312	Golewa Selatan	t
5312032	5312	Golewa Barat	t
5312070	5312	Bajawa Utara	t
5312071	5312	Soa	t
5312080	5312	Riung	t
5312081	5312	Riung Barat	t
5312082	5312	Wolomeze	t
5313040	5313	Satar Mese	t
5313041	5313	Satar Mese Barat	t
5313042	5313	Satar Mese Utara	t
5313110	5313	Langke Rembong	t
5313120	5313	Ruteng	t
5313121	5313	Wae Rii	t
5313122	5313	Lelak	t
5313123	5313	Rahong Utara	t
5313130	5313	Cibal	t
5313131	5313	Cibal Barat	t
5313140	5313	Reok	t
5313141	5313	Reok Barat	t
5314010	5314	Rote Barat Daya	t
5314020	5314	Rote Barat Laut	t
5314030	5314	Lobalain	t
5314040	5314	Rote Tengah	t
5314041	5314	Rote Selatan	t
5314050	5314	Pantai Baru	t
5314060	5314	Rote Timur	t
5314061	5314	Landu Leko	t
5314070	5314	Rote Barat	t
5314071	5314	Ndao Nuse	t
5315010	5315	Komodo	t
5315011	5315	Boleng	t
5315020	5315	Sano Nggoang	t
5315021	5315	Mbeliling	t
5315030	5315	Lembor	t
5315031	5315	Welak	t
5315032	5315	Lembor Selatan	t
5315040	5315	Kuwus	t
5315041	5315	Ndoso	t
5315050	5315	Macang Pacar	t
5316010	5316	Katikutana	t
5316011	5316	Katikutana Selatan	t
5316020	5316	Umbu Ratu Nggay Barat	t
5316030	5316	Umbu Ratu Nggay	t
5316040	5316	Mamboro	t
5317010	5317	Kodi Bangedo	t
5317011	5317	Kodi Balaghar	t
5317020	5317	Kodi	t
5317030	5317	Kodi Utara	t
5317040	5317	Wewewa Selatan	t
5317050	5317	Wewewa Barat	t
5317060	5317	Wewewa Timur	t
5317061	5317	Wewewa Tengah	t
5317070	5317	Wewewa Utara	t
5317080	5317	Loura	t
5317081	5317	Kota Tambolaka	t
5318010	5318	Mauponggo	t
5318020	5318	Keo Tengah	t
5318030	5318	Nangaroro	t
5318040	5318	Boawae	t
5318050	5318	Aesesa Selatan	t
5318060	5318	Aesesa	t
5318070	5318	Wolowae	t
5319010	5319	Borong	t
5319011	5319	Rana Mese	t
5319020	5319	Kota Komba	t
5319030	5319	Elar	t
5319031	5319	Elar Selatan	t
5319040	5319	Sambi Rampas	t
5319050	5319	Poco Ranaka	t
5319051	5319	Poco Ranaka Timur	t
5319060	5319	Lamba Leda	t
5320010	5320	Raijua	t
5320020	5320	Hawu Mehara	t
5320030	5320	Sabu Liae	t
5320040	5320	Sabu Barat	t
5320050	5320	Sabu Tengah	t
5320060	5320	Sabu Timur	t
5321010	5321	Wewiku	t
5321020	5321	Malaka Barat	t
5321030	5321	Weliman	t
5321040	5321	Rinhat	t
5321050	5321	Io Kufeu	t
5321060	5321	Sasita Mean	t
5321070	5321	Malaka Tengah	t
5321080	5321	Botin Leobele	t
5321090	5321	Laen Manen	t
5321100	5321	Malaka Timur	t
5321110	5321	Kobalima	t
5321120	5321	Kobalima Timur	t
5371010	5371	Alak	t
5371020	5371	Maulafa	t
5371030	5371	Oebobo	t
5371031	5371	Kota Raja	t
5371040	5371	Kelapa Lima	t
5371041	5371	Kota Lama	t
6101010	6101	Selakau	t
6101011	6101	Selakau Timur	t
6101020	6101	Pemangkat	t
6101021	6101	Semparuk	t
6101022	6101	Salatiga	t
6101030	6101	Tebas	t
6101031	6101	Tekarang	t
6101040	6101	Sambas	t
6101041	6101	Subah	t
6101042	6101	Sebawi	t
6101043	6101	Sajad	t
6101050	6101	Jawai	t
6101051	6101	Jawai Selatan	t
6101060	6101	Teluk Keramat	t
6101061	6101	Galing	t
6101062	6101	Tangaran	t
6101070	6101	Sejangkung	t
6101080	6101	Sajingan Besar	t
6101090	6101	Paloh	t
6102010	6102	Sungai Raya	t
6102011	6102	Capkala	t
6102012	6102	Sungai Raya Kepulauan	t
6102030	6102	Samalantan	t
6102031	6102	Monterado	t
6102032	6102	Lembah Bawang	t
6102040	6102	Bengkayang	t
6102041	6102	Teriak	t
6102042	6102	Sungai Betung	t
6102050	6102	Ledo	t
6102051	6102	Suti Semarang	t
6102052	6102	Lumar	t
6102060	6102	Sanggau Ledo	t
6102061	6102	Tujuhbelas	t
6102070	6102	Seluas	t
6102080	6102	Jagoi Babang	t
6102081	6102	Siding	t
6103020	6103	Sebangki	t
6103030	6103	Ngabang	t
6103031	6103	Jelimpo	t
6103040	6103	Sengah Temila	t
6103050	6103	Mandor	t
6103060	6103	Menjalin	t
6103070	6103	Mempawah Hulu	t
6103071	6103	Sompak	t
6103080	6103	Menyuke	t
6103081	6103	Banyuke Hulu	t
6103090	6103	Meranti	t
6103100	6103	Kuala Behe	t
6103110	6103	Air Besar	t
6104080	6104	Siantan	t
6104081	6104	Segedong	t
6104090	6104	Sungai Pinyuh	t
6104091	6104	Anjongan	t
6104100	6104	Mempawah Hilir	t
6104101	6104	Mempawah Timur	t
6104110	6104	Sungai Kunyit	t
6104120	6104	Toho	t
6104121	6104	Sadaniang	t
6105010	6105	Toba	t
6105020	6105	Meliau	t
6105060	6105	Kapuas	t
6105070	6105	Mukok	t
6105120	6105	Jangkang	t
6105130	6105	Bonti	t
6105140	6105	Parindu	t
6105150	6105	Tayan Hilir	t
6105160	6105	Balai	t
6105170	6105	Tayan Hulu	t
6105180	6105	Kembayan	t
6105190	6105	Beduwai	t
6105200	6105	Noyan	t
6105210	6105	Sekayam	t
6105220	6105	Entikong	t
6106010	6106	Kendawangan	t
6106020	6106	Manis Mata	t
6106030	6106	Marau	t
6106031	6106	Singkup	t
6106032	6106	Air Upas	t
6106040	6106	Jelai Hulu	t
6106050	6106	Tumbang Titi	t
6106051	6106	Pemahan	t
6106052	6106	Sungai Melayu Rayak	t
6106060	6106	Matan Hilir Selatan	t
6106061	6106	Benua Kayong	t
6106070	6106	Matan Hilir Utara	t
6106071	6106	Delta Pawan	t
6106072	6106	Muara Pawan	t
6106090	6106	Nanga Tayap	t
6106100	6106	Sandai	t
6106101	6106	Hulu Sungai	t
6106110	6106	Sungai Laur	t
6106120	6106	Simpang Hulu	t
6106121	6106	Simpang Dua	t
6107060	6107	Serawai	t
6107070	6107	Ambalau	t
6107080	6107	Kayan Hulu	t
6107110	6107	Sepauk	t
6107120	6107	Tempunak	t
6107130	6107	Sungai Tebelian	t
6107140	6107	Sintang	t
6107150	6107	Dedai	t
6107160	6107	Kayan Hilir	t
6107170	6107	Kelam Permai	t
6107180	6107	Binjai Hulu	t
6107190	6107	Ketungau Hilir	t
6107200	6107	Ketungau Tengah	t
6107210	6107	Ketungau Hulu	t
6108010	6108	Silat Hilir	t
6108020	6108	Silat Hulu	t
6108030	6108	Hulu Gurung	t
6108040	6108	Bunut Hulu	t
6108050	6108	Mentebah	t
6108060	6108	Bika	t
6108070	6108	Kalis	t
6108080	6108	Putussibau Selatan	t
6108090	6108	Embaloh Hilir	t
6108100	6108	Bunut Hilir	t
6108110	6108	Boyan Tanjung	t
6108120	6108	Pengkadan	t
6108130	6108	Jongkong	t
6108140	6108	Selimbau	t
6108150	6108	Suhaid	t
6108160	6108	Seberuang	t
6108170	6108	Semitau	t
6108180	6108	Empanang	t
6108190	6108	Puring Kencana	t
6108200	6108	Badau	t
6108210	6108	Batang Lupar	t
6108220	6108	Embaloh Hulu	t
6108230	6108	Putussibau Utara	t
6109010	6109	Nanga Mahap	t
6109020	6109	Nanga Taman	t
6109030	6109	Sekadau Hulu	t
6109040	6109	Sekadau Hilir	t
6109050	6109	Belitang Hilir	t
6109060	6109	Belitang	t
6109070	6109	Belitang Hulu	t
6110010	6110	Sokan	t
6110020	6110	Tanah Pinoh	t
6110021	6110	Tanah Pinoh Barat	t
6110030	6110	Sayan	t
6110040	6110	Belimbing	t
6110041	6110	Belimbing Hulu	t
6110050	6110	Nanga Pinoh	t
6110051	6110	Pinoh Selatan	t
6110052	6110	Pinoh Utara	t
6110060	6110	Ella Hilir	t
6110070	6110	Menukung	t
6111010	6111	Pulau Maya	t
6111011	6111	Kepulauan Karimata	t
6111020	6111	Sukadana	t
6111030	6111	Simpang Hilir	t
6111040	6111	Teluk Batang	t
6111050	6111	Seponti	t
6112010	6112	Batu Ampar	t
6112020	6112	Terentang	t
6112030	6112	Kubu	t
6112040	6112	Telok Pa'Kedai	t
6112050	6112	Sungai Kakap	t
6112060	6112	Rasau Jaya	t
6112070	6112	Sungai Raya	t
6112080	6112	Sungai Ambawang	t
6112090	6112	Kuala Mandor-B	t
6171010	6171	Pontianak Selatan	t
6171011	6171	Pontianak Tenggara	t
6171020	6171	Pontianak Timur	t
6171030	6171	Pontianak Barat	t
6171031	6171	Pontianak Kota	t
6171040	6171	Pontianak Utara	t
6172010	6172	Singkawang Selatan	t
6172020	6172	Singkawang Timur	t
6172030	6172	Singkawang Utara	t
6172040	6172	Singkawang Barat	t
6172050	6172	Singkawang Tengah	t
6201040	6201	Kotawaringin Lama	t
6201050	6201	Arut Selatan	t
6201060	6201	Kumai	t
6201061	6201	Pangkalan Banteng	t
6201062	6201	Pangkalan Lada	t
6201070	6201	Arut Utara	t
6202020	6202	Mentaya Hilir Selatan	t
6202021	6202	Teluk Sampit	t
6202050	6202	Pulau Hanaut	t
6202060	6202	Mentawa Baru/Ketapang	t
6202061	6202	Seranau	t
6202070	6202	Mentaya Hilir Utara	t
6202110	6202	Kota Besi	t
6202111	6202	Telawang	t
6202120	6202	Baamang	t
6202190	6202	Cempaga	t
6202191	6202	Cempaga Hulu	t
6202200	6202	Parenggean	t
6202201	6202	Tualan Hulu	t
6202210	6202	Mentaya Hulu	t
6202211	6202	Bukit Santuai	t
6202230	6202	Antang Kalang	t
6202231	6202	Telaga Antang	t
6203020	6203	Kapuas Kuala	t
6203021	6203	Tamban Catur	t
6203030	6203	Kapuas Timur	t
6203040	6203	Selat	t
6203041	6203	Bataguh	t
6203070	6203	Basarang	t
6203080	6203	Kapuas Hilir	t
6203090	6203	Pulau Petak	t
6203100	6203	Kapuas Murung	t
6203101	6203	Dadahup	t
6203110	6203	Kapuas Barat	t
6203150	6203	Mantangai	t
6203160	6203	Timpah	t
6203170	6203	Kapuas Tengah	t
6203171	6203	Pasak Talawang	t
6203180	6203	Kapuas Hulu	t
6203181	6203	Mandau Talawang	t
6204010	6204	Jenamas	t
6204020	6204	Dusun Hilir	t
6204030	6204	Karau Kuala	t
6204040	6204	Dusun Selatan	t
6204050	6204	Dusun Utara	t
6204060	6204	Gunung Bintang Awai	t
6205010	6205	Montallat	t
6205020	6205	Gunung Timang	t
6205030	6205	Gunung Purei	t
6205040	6205	Teweh Timur	t
6205050	6205	Teweh Tengah	t
6205051	6205	Teweh  Baru	t
6205052	6205	Teweh Selatan	t
6205060	6205	Lahei	t
6205061	6205	Lahei Barat	t
6206010	6206	Jelai	t
6206011	6206	Pantai Lunci	t
6206020	6206	Sukamara	t
6206030	6206	Balai Riam	t
6206031	6206	Permata Kecubung	t
6207010	6207	Bulik	t
6207011	6207	Sematu Jaya	t
6207012	6207	Menthobi Raya	t
6207013	6207	Bulik Timur	t
6207020	6207	Lamandau	t
6207021	6207	Belantikan Raya	t
6207030	6207	Delang	t
6207031	6207	Batangkawa	t
6208010	6208	Seruyan Hilir	t
6208011	6208	Seruyan Hilir Timur	t
6208020	6208	Danau Sembuluh	t
6208021	6208	Seruyan Raya	t
6208030	6208	Hanau	t
6208031	6208	Danau Seluluk	t
6208040	6208	Seruyan Tengah	t
6208041	6208	Batu Ampar	t
6208050	6208	Seruyan Hulu	t
6208051	6208	Suling Tambun	t
6209010	6209	Katingan Kuala	t
6209020	6209	Mendawai	t
6209030	6209	Kamipang	t
6209040	6209	Tasik Payawan	t
6209050	6209	Katingan Hilir	t
6209060	6209	Tewang Sangalang Garing	t
6209070	6209	Pulau Malan	t
6209080	6209	Katingan Tengah	t
6209090	6209	Sanaman Mantikei	t
6209091	6209	Petak Malai	t
6209100	6209	Marikit	t
6209110	6209	Katingan Hulu	t
6209111	6209	Bukit Raya	t
6210010	6210	Kahayan Kuala	t
6210011	6210	Sebangau Kuala	t
6210020	6210	Pandih Batu	t
6210030	6210	Maliku	t
6210040	6210	Kahayan Hilir	t
6210041	6210	Jabiren Raya	t
6210050	6210	Kahayan Tengah	t
6210060	6210	Banama Tingang	t
6211010	6211	Manuhing	t
6211011	6211	Manuhing Raya	t
6211020	6211	Rungan	t
6211021	6211	Rungan Hulu	t
6211022	6211	Rungan Barat	t
6211030	6211	Sepang	t
6211031	6211	Mihing Raya	t
6211040	6211	Kurun	t
6211050	6211	Tewah	t
6211060	6211	Kahayan Hulu Utara	t
6211061	6211	Damang Batu	t
6211062	6211	Miri Manasa	t
6212010	6212	Benua Lima	t
6212020	6212	Dusun Timur	t
6212021	6212	Paju Epat	t
6212030	6212	Awang	t
6212040	6212	Patangkep Tutui	t
6212050	6212	Dusun Tengah	t
6212051	6212	Raren Batuah	t
6212052	6212	Paku	t
6212053	6212	Karusen Janang	t
6212060	6212	Pematang Karau	t
6213010	6213	Permata Intan	t
6213011	6213	Sungai Babuat	t
6213020	6213	Murung	t
6213030	6213	Laung Tuhup	t
6213031	6213	Barito Tuhup Raya	t
6213040	6213	Tanah Siang	t
6213041	6213	Tanah Siang Selatan	t
6213050	6213	Sumber Barito	t
6213051	6213	Seribu Riam	t
6213052	6213	Uut Murung	t
6271010	6271	Pahandut	t
6271011	6271	Sabangau	t
6271012	6271	Jekan Raya	t
6271020	6271	Bukit Batu	t
6271021	6271	Rakumpit	t
6301010	6301	Panyipatan	t
6301020	6301	Takisung	t
6301030	6301	Kurau	t
6301031	6301	Bumi Makmur	t
6301040	6301	Bati - Bati	t
6301050	6301	Tambang Ulang	t
6301060	6301	Pelaihari	t
6301061	6301	Bajuin	t
6301070	6301	Batu Ampar	t
6301080	6301	Jorong	t
6301090	6301	Kintap	t
6302010	6302	Pulau Sembilan	t
6302020	6302	Pulau Laut Barat	t
6302021	6302	Pulau Laut Tanjung Selayar	t
6302030	6302	Pulau Laut Selatan	t
6302031	6302	Pulau Laut Kepulauan	t
6302040	6302	Pulau Laut Timur	t
6302050	6302	Pulau Sebuku	t
6302060	6302	Pulau Laut Utara	t
6302061	6302	Pulau Laut Tengah	t
6302120	6302	Kelumpang Selatan	t
6302121	6302	Kelumpang Hilir	t
6302130	6302	Kelumpang Hulu	t
6302140	6302	Hampang	t
6302150	6302	Sungai Durian	t
6302160	6302	Kelumpang Tengah	t
6302161	6302	Kelumpang Barat	t
6302170	6302	Kelumpang Utara	t
6302180	6302	Pamukan Selatan	t
6302190	6302	Sampanahan	t
6302200	6302	Pamukan Utara	t
6302201	6302	Pamukan Barat	t
6303010	6303	Aluh - Aluh	t
6303011	6303	Beruntung Baru	t
6303020	6303	Gambut	t
6303030	6303	Kertak Hanyar	t
6303031	6303	Tatah Makmur	t
6303040	6303	Sungai Tabuk	t
6303050	6303	Martapura	t
6303051	6303	Martapura Timur	t
6303052	6303	Martapura Barat	t
6303060	6303	Astambul	t
6303070	6303	Karang Intan	t
6303080	6303	Aranio	t
6303090	6303	Sungai Pinang	t
6303091	6303	Paramasan	t
6303100	6303	Pengaron	t
6303101	6303	Sambung Makmur	t
6303110	6303	Mataraman	t
6303120	6303	Simpang Empat	t
6303121	6303	Telaga Bauntung	t
6304010	6304	Tabunganen	t
6304020	6304	Tamban	t
6304030	6304	Mekar Sari	t
6304040	6304	Anjir Pasar	t
6304050	6304	Anjir Muara	t
6304060	6304	Alalak	t
6304070	6304	Mandastana	t
6304071	6304	Jejangkit	t
6304080	6304	Belawang	t
6304090	6304	Wanaraya	t
6304100	6304	Barambai	t
6304110	6304	Rantau Badauh	t
6304120	6304	Cerbon	t
6304130	6304	Bakumpai	t
6304140	6304	Marabahan	t
6304150	6304	Tabukan	t
6304160	6304	Kuripan	t
6305010	6305	Binuang	t
6305011	6305	Hatungun	t
6305020	6305	Tapin Selatan	t
6305021	6305	Salam Babaris	t
6305030	6305	Tapin Tengah	t
6305040	6305	Bungur	t
6305050	6305	Piani	t
6305060	6305	Lokpaikat	t
6305070	6305	Tapin Utara	t
6305080	6305	Bakarangan	t
6305090	6305	Candi Laras Selatan	t
6305100	6305	Candi Laras Utara	t
6306010	6306	Padang Batung	t
6306020	6306	Loksado	t
6306030	6306	Telaga Langsat	t
6306040	6306	Angkinang	t
6306050	6306	Kandangan	t
6306060	6306	Sungai Raya	t
6306070	6306	Simpur	t
6306080	6306	Kalumpang	t
6306090	6306	Daha Selatan	t
6306091	6306	Daha Barat	t
6306100	6306	Daha Utara	t
6307010	6307	Haruyan	t
6307020	6307	Batu Benawa	t
6307030	6307	Hantakan	t
6307040	6307	Batang Alai Selatan	t
6307041	6307	Batang Alai Timur	t
6307050	6307	Barabai	t
6307060	6307	Labuan Amas Selatan	t
6307070	6307	Labuan Amas Utara	t
6307080	6307	Pandawan	t
6307090	6307	Batang Alai Utara	t
6307091	6307	Limpasu	t
6308010	6308	Danau Panggang	t
6308011	6308	Paminggir	t
6308020	6308	Babirik	t
6308030	6308	Sungai Pandan	t
6308031	6308	Sungai Tabukan	t
6308040	6308	Amuntai Selatan	t
6308050	6308	Amuntai Tengah	t
6308060	6308	Banjang	t
6308070	6308	Amuntai Utara	t
6308071	6308	Haur Gading	t
6309010	6309	Banua Lawas	t
6309020	6309	Pugaan	t
6309030	6309	Kelua	t
6309040	6309	Muara Harus	t
6309050	6309	Tanta	t
6309060	6309	Tanjung	t
6309070	6309	Murung Pudak	t
6309080	6309	Haruai	t
6309081	6309	Bintang Ara	t
6309090	6309	Upau	t
6309100	6309	Muara Uya	t
6309110	6309	Jaro	t
6310010	6310	Kusan Hilir	t
6310020	6310	Sungai Loban	t
6310030	6310	Satui	t
6310031	6310	Angsana	t
6310040	6310	Kusan Hulu	t
6310041	6310	Kuranji	t
6310050	6310	Batu Licin	t
6310051	6310	Karang Bintang	t
6310052	6310	Simpang Empat	t
6310053	6310	Mantewe	t
6311010	6311	Lampihong	t
6311020	6311	Batu Mandi	t
6311030	6311	Awayan	t
6311031	6311	Tebing Tinggi	t
6311040	6311	Paringin	t
6311041	6311	Paringin Selatan	t
6311050	6311	Juai	t
6311060	6311	Halong	t
6371010	6371	Banjarmasin Selatan	t
6371020	6371	Banjarmasin Timur	t
6371030	6371	Banjarmasin Barat	t
6371031	6371	Banjarmasin Tengah	t
6371040	6371	Banjarmasin Utara	t
6372010	6372	Landasan Ulin	t
6372011	6372	Liang Anggang	t
6372020	6372	Cempaka	t
6372031	6372	Banjar Baru Utara	t
6372032	6372	Banjar Baru Selatan	t
6401010	6401	Batu Sopang	t
6401011	6401	Muara Samu	t
6401021	6401	Batu Engau	t
6401022	6401	Tanjung Harapan	t
6401030	6401	Pasir Belengkong	t
6401040	6401	Tanah Grogot	t
6401050	6401	Kuaro	t
6401060	6401	Long Ikis	t
6401070	6401	Muara Komam	t
6401080	6401	Long Kali	t
6402010	6402	Bongan	t
6402020	6402	Jempang	t
6402030	6402	Penyinggahan	t
6402040	6402	Muara Pahu	t
6402041	6402	Siluq Ngurai	t
6402050	6402	Muara Lawa	t
6402051	6402	Bentian Besar	t
6402060	6402	Damai	t
6402061	6402	Nyuatan	t
6402070	6402	Barong Tongkok	t
6402071	6402	Linggang Bigung	t
6402080	6402	Melak	t
6402081	6402	Sekolaq Darat	t
6402082	6402	Manor Bulatn	t
6402090	6402	Long Iram	t
6402091	6402	Tering	t
6403010	6403	Semboja	t
6403020	6403	Muara Jawa	t
6403030	6403	Sanga-Sanga	t
6403040	6403	Loa Janan	t
6403050	6403	Loa Kulu	t
6403060	6403	Muara Muntai	t
6403070	6403	Muara Wis	t
6403080	6403	Kotabangun	t
6403090	6403	Tenggarong	t
6403100	6403	Sebulu	t
6403110	6403	Tenggarong Seberang	t
6403120	6403	Anggana	t
6403130	6403	Muara Badak	t
6403140	6403	Marang Kayu	t
6403150	6403	Muara Kaman	t
6403160	6403	Kenohan	t
6403170	6403	Kembang Janggut	t
6403180	6403	Tabang	t
6404010	6404	Muara Ancalong	t
6404011	6404	Busang	t
6404012	6404	Long Mesangat	t
6404020	6404	Muara Wahau	t
6404021	6404	Telen	t
6404022	6404	Kongbeng	t
6404030	6404	Muara Bengkal	t
6404031	6404	Batu Ampar	t
6404040	6404	Sangatta Utara	t
6404041	6404	Bengalon	t
6404042	6404	Teluk Pandan	t
6404043	6404	Sangatta Selatan	t
6404044	6404	Rantau Pulung	t
6404050	6404	Sangkulirang	t
6404051	6404	Kaliorang	t
6404052	6404	Sandaran	t
6404053	6404	Kaubun	t
6404054	6404	Karangan	t
6405010	6405	Kelay	t
6405020	6405	Talisayan	t
6405021	6405	Tabalar	t
6405030	6405	Biduk Biduk	t
6405040	6405	Pulau Derawan	t
6405041	6405	Maratua	t
6405050	6405	Sambaliung	t
6405060	6405	Tanjung Redeb	t
6405070	6405	Gunung Tabur	t
6405080	6405	Segah	t
6405090	6405	Teluk Bayur	t
6405100	6405	Batu Putih	t
6405110	6405	Biatan	t
6409010	6409	Babulu	t
6409020	6409	Waru	t
6409030	6409	Penajam	t
6409040	6409	Sepaku	t
6411010	6411	Laham	t
6411020	6411	Long Hubung	t
6411030	6411	Long Bagun	t
6411040	6411	Long Pahangai	t
6411050	6411	Long Apari	t
6471010	6471	Balikpapan Selatan	t
6471011	6471	Balikpapan Kota	t
6471020	6471	Balikpapan Timur	t
6471030	6471	Balikpapan Utara	t
6471040	6471	Balikpapan Tengah	t
6471050	6471	Balikpapan Barat	t
6472010	6472	Palaran	t
6472020	6472	Samarinda Ilir	t
6472021	6472	Samarinda Kota	t
6472022	6472	Sambutan	t
6472030	6472	Samarinda Seberang	t
6472031	6472	Loa Janan Ilir	t
6472040	6472	Sungai Kunjang	t
6472050	6472	Samarinda Ulu	t
6472060	6472	Samarinda Utara	t
6472061	6472	Sungai Pinang	t
6474010	6474	Bontang Selatan	t
6474020	6474	Bontang Utara	t
6474030	6474	Bontang Barat	t
6501010	6501	Sungai Boh	t
6501020	6501	Kayan Selatan	t
6501030	6501	Kayan Hulu	t
6501040	6501	Kayan Hilir	t
6501050	6501	Pujungan	t
6501060	6501	Bahau Hulu	t
6501070	6501	Sungai Tubu	t
6501080	6501	Malinau Selatan Hulu	t
6501090	6501	Malinau Selatan	t
6501100	6501	Malinau Selatan Hilir	t
6501110	6501	Mentarang	t
6501120	6501	Mentarang Hulu	t
6501130	6501	Malinau Utara	t
6501140	6501	Malinau Barat	t
6501150	6501	Malinau Kota	t
6502010	6502	Peso	t
6502020	6502	Peso Hilir	t
6502030	6502	Tanjung Palas Barat	t
6502040	6502	Tanjung Palas	t
6502050	6502	Tanjung Selor	t
6502060	6502	Tanjung Palas Timur	t
6502070	6502	Tanjung Palas Tengah	t
6502080	6502	Tanjung Palas Utara	t
6502090	6502	Sekatak	t
6502100	6502	Bunyu	t
6503010	6503	Muruk Rian	t
6503020	6503	Sesayap	t
6503030	6503	Betayau	t
6503040	6503	Sesayap Hilir	t
6503050	6503	Tana Lia	t
6504010	6504	Krayan Selatan	t
6504011	6504	Krayan Tengah	t
6504020	6504	Krayan	t
6504021	6504	Krayan Timur	t
6504022	6504	Krayan Barat	t
6504030	6504	Lumbis Ogong	t
6504040	6504	Lumbis	t
6504050	6504	Sembakung Atulai	t
6504060	6504	Sembakung	t
6504070	6504	Sebuku	t
6504080	6504	Tulin Onsoi	t
6504090	6504	Sei Menggaris	t
6504100	6504	Nunukan	t
6504110	6504	Nunukan Selatan	t
6504120	6504	Sebatik Barat	t
6504130	6504	Sebatik	t
6504140	6504	Sebatik Timur	t
6504150	6504	Sebatik Tengah	t
6504160	6504	Sebatik Utara	t
6571010	6571	Tarakan Timur	t
6571020	6571	Tarakan Tengah	t
6571030	6571	Tarakan Barat	t
6571040	6571	Tarakan Utara	t
7101021	7101	Dumoga Barat	t
7101022	7101	Dumoga Utara	t
7101023	7101	Dumoga Timur	t
7101024	7101	Dumoga Tengah	t
7101025	7101	Dumoga Tenggara	t
7101026	7101	Dumoga	t
7101060	7101	Lolayan	t
7101081	7101	Passi Barat	t
7101082	7101	Passi Timur	t
7101083	7101	Bilalang	t
7101090	7101	Poigar	t
7101100	7101	Bolaang	t
7101101	7101	Bolaang Timur	t
7101110	7101	Lolak	t
7101120	7101	Sangtombolang	t
7102091	7102	Langowan Timur	t
7102092	7102	Langowan Barat	t
7102093	7102	Langowan Selatan	t
7102094	7102	Langowan Utara	t
7102110	7102	Tompaso	t
7102111	7102	Tompaso Barat	t
7102120	7102	Kawangkoan	t
7102121	7102	Kawangkoan Barat	t
7102122	7102	Kawangkoan Utara	t
7102130	7102	Sonder	t
7102160	7102	Tombariri	t
7102161	7102	Tombariri Timur	t
7102170	7102	Pineleng	t
7102171	7102	Tombulu	t
7102172	7102	Mandolang	t
7102190	7102	Tondano Barat	t
7102191	7102	Tondano Selatan	t
7102200	7102	Remboken	t
7102210	7102	Kakas	t
7102211	7102	Kakas Barat	t
7102220	7102	Lembean Timur	t
7102230	7102	Eris	t
7102240	7102	Kombi	t
7102250	7102	Tondano Timur	t
7102251	7102	Tondano Utara	t
7103040	7103	Manganitu Selatan	t
7103041	7103	Tatoareng	t
7103050	7103	Tamako	t
7103060	7103	Tabukan Selatan	t
7103061	7103	Tabukan Selatan Tengah	t
7103062	7103	Tabukan Selatan Tenggara	t
7103070	7103	Tabukan Tengah	t
7103080	7103	Manganitu	t
7103090	7103	Tahuna	t
7103091	7103	Tahuna Timur	t
7103092	7103	Tahuna Barat	t
7103100	7103	Tabukan Utara	t
7103101	7103	Nusa Tabukan	t
7103102	7103	Kepulauan Marore	t
7103110	7103	Kendahe	t
7104010	7104	Kabaruan	t
7104011	7104	Damau	t
7104020	7104	Lirung	t
7104021	7104	Salibabu	t
7104022	7104	Kalongan	t
7104023	7104	Moronge	t
7104030	7104	Melonguane	t
7104031	7104	Melonguane Timur	t
7104040	7104	Beo	t
7104041	7104	Beo Utara	t
7104042	7104	Beo Selatan	t
7104050	7104	Rainis	t
7104051	7104	Tampa Na'Mma	t
7104052	7104	Pulutan	t
7104060	7104	Essang	t
7104061	7104	Essang Selatan	t
7104070	7104	Gemeh	t
7104080	7104	Nanusa	t
7104081	7104	Miangas	t
7105010	7105	Modoinding	t
7105020	7105	Tompaso Baru	t
7105021	7105	Maesaan	t
7105070	7105	Ranoyapo	t
7105080	7105	Motoling	t
7105081	7105	Kumelembuai	t
7105082	7105	Motoling Barat	t
7105083	7105	Motoling Timur	t
7105090	7105	Sinonsayang	t
7105100	7105	Tenga	t
7105111	7105	Amurang	t
7105112	7105	Amurang Barat	t
7105113	7105	Amurang Timur	t
7105120	7105	Tareran	t
7105121	7105	Sulta	t
7105130	7105	Tumpaan	t
7105131	7105	Tatapaan	t
7106010	7106	Kema	t
7106020	7106	Kauditan	t
7106030	7106	Airmadidi	t
7106040	7106	Kalawat	t
7106050	7106	Dimembe	t
7106051	7106	Talawaan	t
7106060	7106	Wori	t
7106070	7106	Likupang Barat	t
7106080	7106	Likupang Timur	t
7106081	7106	Likupang Selatan	t
7107010	7107	Sangkub	t
7107020	7107	Bintauna	t
7107030	7107	Bolang Itang Timur	t
7107040	7107	Bolang Itang Barat	t
7107050	7107	Kaidipang	t
7107060	7107	Pinogaluman	t
7108010	7108	Biaro	t
7108020	7108	Tagulandang Selatan	t
7108030	7108	Tagulandang	t
7108040	7108	Tagulandang Utara	t
7108050	7108	Siau Barat Selatan	t
7108060	7108	Siau Timur Selatan	t
7108070	7108	Siau Barat	t
7108080	7108	Siau Tengah	t
7108090	7108	Siau Timur	t
7108100	7108	Siau Barat Utara	t
7109010	7109	Ratatotok	t
7109020	7109	Pusomaen	t
7109030	7109	Belang	t
7109040	7109	Ratahan	t
7109041	7109	Pasan	t
7109042	7109	Ratahan Timur	t
7109050	7109	Tombatu	t
7109051	7109	Tombatu Timur	t
7109052	7109	Tombatu Utara	t
7109060	7109	Touluaan	t
7109061	7109	Touluaan Selatan	t
7109062	7109	Silian Raya	t
7110010	7110	Posigadan	t
7110011	7110	Tomini	t
7110020	7110	Bolang Uki	t
7110021	7110	Helumo	t
7110030	7110	Pinolosian	t
7110040	7110	Pinolosian Tengah	t
7110050	7110	Pinolosian Timur	t
7111010	7111	Nuangan	t
7111011	7111	Motongkad	t
7111020	7111	Tutuyan	t
7111030	7111	Kotabunan	t
7111040	7111	Modayag	t
7111041	7111	Mooat	t
7111050	7111	Modayag Barat	t
7171010	7171	Malalayang	t
7171020	7171	Sario	t
7171021	7171	Wanea	t
7171030	7171	Wenang	t
7171031	7171	Tikala	t
7171032	7171	Paal Dua	t
7171040	7171	Mapanget	t
7171051	7171	Singkil	t
7171052	7171	Tuminting	t
7171053	7171	Bunaken	t
7171054	7171	Bunaken Kepulauan	t
7172010	7172	Madidir	t
7172011	7172	Matuari	t
7172012	7172	Girian	t
7172021	7172	Lembeh Selatan	t
7172022	7172	Lembeh Utara	t
7172030	7172	Aertembaga	t
7172031	7172	Maesa	t
7172040	7172	Ranowulu	t
7173010	7173	Tomohon Selatan	t
7173020	7173	Tomohon Tengah	t
7173021	7173	Tomohon Timur	t
7173022	7173	Tomohon Barat	t
7173030	7173	Tomohon Utara	t
7174010	7174	Kotamobagu Selatan	t
7174020	7174	Kotamobagu Timur	t
7174030	7174	Kotamobagu Barat	t
7174040	7174	Kotamobagu Utara	t
7201030	7201	Totikum	t
7201031	7201	Totikum Selatan	t
7201040	7201	Tinangkung	t
7201041	7201	Tinangkung Selatan	t
7201042	7201	Tinangkung Utara	t
7201050	7201	Liang	t
7201051	7201	Peling Tengah	t
7201060	7201	Bulagi	t
7201061	7201	Bulagi Selatan	t
7201062	7201	Bulagi Utara	t
7201070	7201	Buko	t
7201071	7201	Buko Selatan	t
7202010	7202	Toili	t
7202011	7202	Toili Barat	t
7202012	7202	Moilong	t
7202020	7202	Batui	t
7202021	7202	Batui Selatan	t
7202030	7202	Bunta	t
7202031	7202	Nuhon	t
7202032	7202	Simpang Raya	t
7202040	7202	Kintom	t
7202050	7202	Luwuk	t
7202051	7202	Luwuk Timur	t
7202052	7202	Luwuk Utara	t
7202053	7202	Luwuk Selatan	t
7202054	7202	Nambo	t
7202060	7202	Pagimana	t
7202061	7202	Bualemo	t
7202062	7202	Lobu	t
7202070	7202	Lamala	t
7202071	7202	Masama	t
7202072	7202	Mantoh	t
7202080	7202	Balantak	t
7202081	7202	Balantak Selatan	t
7202082	7202	Balantak Utara	t
7203010	7203	Menui Kepulauan	t
7203020	7203	Bungku Selatan	t
7203021	7203	Bahodopi	t
7203022	7203	Bungku Pesisir	t
7203030	7203	Bungku Tengah	t
7203031	7203	Bungku Timur	t
7203040	7203	Bungku Barat	t
7203041	7203	Bumi Raya	t
7203042	7203	Wita Ponda	t
7204010	7204	Pamona Selatan	t
7204011	7204	Pamona Barat	t
7204012	7204	Pamona Tenggara	t
7204020	7204	Lore Selatan	t
7204021	7204	Lore Barat	t
7204030	7204	Pamona Pusalemba	t
7204031	7204	Pamona Timur	t
7204032	7204	Pamona Utara	t
7204040	7204	Lore Utara	t
7204041	7204	Lore Tengah	t
7204042	7204	Lore Timur	t
7204043	7204	Lore Peore	t
7204050	7204	Poso Pesisir	t
7204051	7204	Poso Pesisir Selatan	t
7204052	7204	Poso Pesisir Utara	t
7204060	7204	Lage	t
7204070	7204	Poso Kota	t
7204071	7204	Poso Kota Utara	t
7204072	7204	Poso Kota Selatan	t
7205041	7205	Rio Pakava	t
7205051	7205	Pinembani	t
7205080	7205	Banawa	t
7205081	7205	Banawa Selatan	t
7205082	7205	Banawa Tengah	t
7205090	7205	Labuan	t
7205091	7205	Tanantovea	t
7205100	7205	Sindue	t
7205101	7205	Sindue Tombusabora	t
7205102	7205	Sindue Tobata	t
7205120	7205	Sirenja	t
7205130	7205	Balaesang	t
7205131	7205	Balaesang Tanjung	t
7205140	7205	Dampelas	t
7205160	7205	Sojol	t
7205161	7205	Sojol Utara	t
7206010	7206	Dampal Selatan	t
7206020	7206	Dampal Utara	t
7206030	7206	Dondo	t
7206031	7206	Ogodeide	t
7206032	7206	Basidondo	t
7206040	7206	Baolan	t
7206041	7206	Lampasio	t
7206050	7206	Galang	t
7206060	7206	Tolitoli Utara	t
7206061	7206	Dako Pamean	t
7207010	7207	Lakea	t
7207011	7207	Biau	t
7207012	7207	Karamat	t
7207020	7207	Momunu	t
7207021	7207	Tiloan	t
7207030	7207	Bokat	t
7207031	7207	Bukal	t
7207040	7207	Bunobogu	t
7207041	7207	Gadung	t
7207050	7207	Paleleh	t
7207051	7207	Paleleh Barat	t
7208010	7208	Sausu	t
7208011	7208	Torue	t
7208012	7208	Balinggi	t
7208020	7208	Parigi	t
7208021	7208	Parigi Selatan	t
7208022	7208	Parigi Barat	t
7208023	7208	Parigi Utara	t
7208024	7208	Parigi Tengah	t
7208030	7208	Ampibabo	t
7208031	7208	Kasimbar	t
7208032	7208	Toribulu	t
7208033	7208	Siniu	t
7208040	7208	Tinombo	t
7208041	7208	Tinombo Selatan	t
7208042	7208	Sidoan	t
7208050	7208	Tomini	t
7208051	7208	Mepanga	t
7208052	7208	Palasa	t
7208060	7208	Moutong	t
7208061	7208	Bolano Lambunu	t
7208062	7208	Taopa	t
7208063	7208	Bolano	t
7208064	7208	Ongka Malino	t
7209010	7209	Tojo Barat	t
7209020	7209	Tojo	t
7209030	7209	Ulubongka	t
7209040	7209	Ampana Tete	t
7209050	7209	Ampana Kota	t
7209051	7209	Ratolindo	t
7209060	7209	Una - Una	t
7209061	7209	Batudaka	t
7209070	7209	Togean	t
7209080	7209	Walea Kepulauan	t
7209081	7209	Walea Besar	t
7209082	7209	Talatako	t
7210010	7210	Pipikoro	t
7210020	7210	Kulawi Selatan	t
7210030	7210	Kulawi	t
7210040	7210	Lindu	t
7210050	7210	Nokilalaki	t
7210060	7210	Palolo	t
7210070	7210	Gumbasa	t
7210080	7210	Dolo Selatan	t
7210090	7210	Dolo Barat	t
7210100	7210	Tanambulava	t
7210110	7210	Dolo	t
7210120	7210	Sigi Biromaru	t
7210130	7210	Marawola	t
7210140	7210	Marawola Barat	t
7210150	7210	Kinovaro	t
7211010	7211	Bangkurung	t
7211020	7211	Labobo	t
7211030	7211	Banggai Utara	t
7211040	7211	Banggai	t
7211050	7211	Banggai Tengah	t
7211060	7211	Banggai Selatan	t
7211070	7211	Bokan Kepulauan	t
7212010	7212	Mori Atas	t
7212020	7212	Lembo	t
7212030	7212	Lembo Raya	t
7212040	7212	Petasia Timur	t
7212050	7212	Petasia	t
7212060	7212	Petasia Barat	t
7212070	7212	Mori Utara	t
7212080	7212	Soyo Jaya	t
7212090	7212	Bungku Utara	t
7212100	7212	Mamosalato	t
7271010	7271	Palu Barat	t
7271011	7271	Tatanga	t
7271012	7271	Ulujadi	t
7271020	7271	Palu Selatan	t
7271030	7271	Palu Timur	t
7271031	7271	Mantikulore	t
7271040	7271	Palu Utara	t
7271041	7271	Tawaeli	t
7301010	7301	Pasimarannu	t
7301011	7301	Pasilambena	t
7301020	7301	Pasimassunggu	t
7301021	7301	Takabonerate	t
7301022	7301	Pasimassunggu Timur	t
7301030	7301	Bontosikuyu	t
7301040	7301	Bontoharu	t
7301041	7301	Benteng	t
7301042	7301	Bontomanai	t
7301050	7301	Bontomatene	t
7301051	7301	Buki	t
7302010	7302	Gantarang	t
7302020	7302	Ujung Bulu	t
7302021	7302	Ujung Loe	t
7302030	7302	Bonto Bahari	t
7302040	7302	Bontotiro	t
7302050	7302	Hero Lange-Lange	t
7302060	7302	Kajang	t
7302070	7302	Bulukumpa	t
7302080	7302	Rilau Ale	t
7302090	7302	Kindang	t
7303010	7303	Bissappu	t
7303011	7303	Uluere	t
7303012	7303	Sinoa	t
7303020	7303	Bantaeng	t
7303021	7303	Eremerasa	t
7303030	7303	Tompobulu	t
7303031	7303	Pa'Jukukang	t
7303032	7303	Gantarangkeke	t
7304010	7304	Bangkala	t
7304011	7304	Bangkala Barat	t
7304020	7304	Tamalatea	t
7304021	7304	Bontoramba	t
7304030	7304	Binamu	t
7304031	7304	Turatea	t
7304040	7304	Batang	t
7304041	7304	Arungkeke	t
7304042	7304	Tarowang	t
7304050	7304	Kelara	t
7304051	7304	Rumbia	t
7305010	7305	Mangara Bombang	t
7305020	7305	Mappakasunggu	t
7305021	7305	Sanrobone	t
7305030	7305	Polombangkeng Selatan	t
7305031	7305	Pattallassang	t
7305040	7305	Polombangkeng Utara	t
7305050	7305	Galesong Selatan	t
7305051	7305	Galesong	t
7305060	7305	Galesong Utara	t
7306010	7306	Bontonompo	t
7306011	7306	Bontonompo Selatan	t
7306020	7306	Bajeng	t
7306021	7306	Bajeng Barat	t
7306030	7306	Pallangga	t
7306031	7306	Barombong	t
7306040	7306	Somba Opu	t
7306050	7306	Bontomarannu	t
7306051	7306	Pattallassang	t
7306060	7306	Parangloe	t
7306061	7306	Manuju	t
7306070	7306	Tinggimoncong	t
7306071	7306	Tombolo Pao	t
7306072	7306	Parigi	t
7306080	7306	Bungaya	t
7306081	7306	Bontolempangan	t
7306090	7306	Tompobulu	t
7306091	7306	Biringbulu	t
7307010	7307	Sinjai Barat	t
7307020	7307	Sinjai Borong	t
7307030	7307	Sinjai Selatan	t
7307040	7307	Tellu Limpoe	t
7307050	7307	Sinjai Timur	t
7307060	7307	Sinjai Tengah	t
7307070	7307	Sinjai Utara	t
7307080	7307	Bulupoddo	t
7307090	7307	Pulau Sembilan	t
7308010	7308	Mandai	t
7308011	7308	Moncongloe	t
7308020	7308	Maros Baru	t
7308021	7308	Marusu	t
7308022	7308	Turikale	t
7308023	7308	Lau	t
7308030	7308	Bontoa	t
7308040	7308	Bantimurung	t
7308041	7308	Simbang	t
7308050	7308	Tanralili	t
7308051	7308	Tompu Bulu	t
7308060	7308	Camba	t
7308061	7308	Cenrana	t
7308070	7308	Mallawa	t
7309010	7309	Liukang Tangaya	t
7309020	7309	Liukang Kalmas	t
7309030	7309	Liukang Tupabbiring	t
7309031	7309	Liukang Tupabbiring Utara	t
7309040	7309	Pangkajene	t
7309041	7309	Minasatene	t
7309050	7309	Balocci	t
7309051	7309	Tondong Tallasa	t
7309060	7309	Bungoro	t
7309070	7309	Labakkang	t
7309080	7309	Ma'Rang	t
7309091	7309	Segeri	t
7309092	7309	Mandalle	t
7310010	7310	Tanete Riaja	t
7310011	7310	Pujananting	t
7310020	7310	Tanete Rilau	t
7310030	7310	Barru	t
7310040	7310	Soppeng Riaja	t
7310041	7310	Balusu	t
7310050	7310	Mallusetasi	t
7311010	7311	Bontocani	t
7311020	7311	Kahu	t
7311030	7311	Kajuara	t
7311040	7311	Salomekko	t
7311050	7311	Tonra	t
7311060	7311	Patimpeng	t
7311070	7311	Libureng	t
7311080	7311	Mare	t
7311090	7311	Sibulue	t
7311100	7311	Cina	t
7311110	7311	Barebbo	t
7311120	7311	Ponre	t
7311130	7311	Lappariaja	t
7311140	7311	Lamuru	t
7311141	7311	Tellu Limpoe	t
7311150	7311	Bengo	t
7311160	7311	Ulaweng	t
7311170	7311	Palakka	t
7311180	7311	Awangpone	t
7311190	7311	Tellu Siattinge	t
7311200	7311	Amali	t
7311210	7311	Ajangale	t
7311220	7311	Dua Boccoe	t
7311230	7311	Cenrana	t
7311710	7311	Tanete Riattang Barat	t
7311720	7311	Tanete Riattang	t
7311730	7311	Tanete Riattang Timur	t
7312010	7312	Mario Riwawo	t
7312020	7312	Lalabata	t
7312030	7312	Lili Riaja	t
7312031	7312	Ganra	t
7312032	7312	Citta	t
7312040	7312	Lili Rilau	t
7312050	7312	Donri Donri	t
7312060	7312	Mario Riawa	t
7313010	7313	Sabbang Paru	t
7313020	7313	Tempe	t
7313030	7313	Pammana	t
7313040	7313	Bola	t
7313050	7313	Takkalalla	t
7313060	7313	Sajoanging	t
7313061	7313	Penrang	t
7313070	7313	Majauleng	t
7313080	7313	Tana Sitolo	t
7313090	7313	Belawa	t
7313100	7313	Maniang Pajo	t
7313101	7313	Gilireng	t
7313110	7313	Keera	t
7313120	7313	Pitumpanua	t
7314010	7314	Panca Lautang	t
7314020	7314	Tellulimpo E	t
7314030	7314	Watang Pulu	t
7314040	7314	Baranti	t
7314050	7314	Panca Rijang	t
7314051	7314	Kulo	t
7314060	7314	Maritengngae	t
7314061	7314	Watang Sidenreng	t
7314070	7314	Pitu Riawa	t
7314080	7314	Duapitue	t
7314081	7314	Pitu Riase	t
7315010	7315	Suppa	t
7315020	7315	Mattirosompe	t
7315021	7315	Lanrisang	t
7315030	7315	Mattiro Bulu	t
7315040	7315	Watang Sawitto	t
7315041	7315	Paleteang	t
7315042	7315	Tiroang	t
7315050	7315	Patampanua	t
7315060	7315	Cempa	t
7315070	7315	Duampanua	t
7315071	7315	Batulappa	t
7315080	7315	Lembang	t
7316010	7316	Maiwa	t
7316011	7316	Bungin	t
7316020	7316	Enrekang	t
7316021	7316	Cendana	t
7316030	7316	Baraka	t
7316031	7316	Buntu Batu	t
7316040	7316	Anggeraja	t
7316041	7316	Malua	t
7316050	7316	Alla	t
7316051	7316	Curio	t
7316052	7316	Masalle	t
7316053	7316	Baroko	t
7317010	7317	Larompong	t
7317011	7317	Larompong Selatan	t
7317020	7317	Suli	t
7317021	7317	Suli Barat	t
7317030	7317	Belopa	t
7317031	7317	Kamanre	t
7317032	7317	Belopa Utara	t
7317040	7317	Bajo	t
7317041	7317	Bajo Barat	t
7317050	7317	Bassesangtempe	t
7317051	7317	Latimojong	t
7317052	7317	Bassesangtempe Utara	t
7317060	7317	Bupon	t
7317061	7317	Ponrang	t
7317062	7317	Ponrang Selatan	t
7317070	7317	Bua	t
7317080	7317	Walenrang	t
7317081	7317	Walenrang Timur	t
7317090	7317	Lamasi	t
7317091	7317	Walenrang Utara	t
7317092	7317	Walenrang Barat	t
7317093	7317	Lamasi Timur	t
7318010	7318	Bonggakaradeng	t
7318011	7318	Simbuang	t
7318012	7318	Rano	t
7318013	7318	Mappak	t
7318020	7318	Mengkendek	t
7318021	7318	Gandang Batu Silanan	t
7318030	7318	Sangalla	t
7318031	7318	Sangala Selatan	t
7318032	7318	Sangalla Utara	t
7318040	7318	Makale	t
7318041	7318	Makale Selatan	t
7318042	7318	Makale Utara	t
7318050	7318	Saluputti	t
7318051	7318	Bittuang	t
7318052	7318	Rembon	t
7318053	7318	Masanda	t
7318054	7318	Malimbong Balepe	t
7318061	7318	Rantetayo	t
7318067	7318	Kurra	t
7322010	7322	Sabbang	t
7322020	7322	Baebunta	t
7322030	7322	Malangke	t
7322031	7322	Malangke Barat	t
7322040	7322	Sukamaju	t
7322050	7322	Bone-Bone	t
7322051	7322	Tana Lili	t
7322120	7322	Masamba	t
7322121	7322	Mappedeceng	t
7322122	7322	Rampi	t
7322130	7322	Limbong	t
7322131	7322	Seko	t
7325010	7325	Burau	t
7325020	7325	Wotu	t
7325030	7325	Tomoni	t
7325031	7325	Tomoni Timur	t
7325040	7325	Angkona	t
7325050	7325	Malili	t
7325060	7325	Towuti	t
7325070	7325	Nuha	t
7325071	7325	Wasuponda	t
7325080	7325	Mangkutana	t
7325081	7325	Kalaena	t
7326010	7326	Sopai	t
7326020	7326	Kesu	t
7326030	7326	Sanggalangi	t
7326040	7326	Buntao	t
7326050	7326	Rantebua	t
7326060	7326	Nanggala	t
7326070	7326	Tondon	t
7326080	7326	Tallunglipu	t
7326090	7326	Rantepao	t
7326100	7326	Tikala	t
7326110	7326	Sesean	t
7326120	7326	Balusu	t
7326130	7326	Sa'Dan	t
7326140	7326	Bengkelekila	t
7326150	7326	Sesean Suloara	t
7326160	7326	Kapala Pitu	t
7326170	7326	Dende Piongan Napo	t
7326180	7326	Awan Rante Karua	t
7326190	7326	Rindingalo	t
7326200	7326	Buntu Pepasan	t
7326210	7326	Baruppu	t
7371010	7371	Mariso	t
7371020	7371	Mamajang	t
7371030	7371	Tamalate	t
7371031	7371	Rappocini	t
7371040	7371	Makassar	t
7371050	7371	Ujung Pandang	t
7371060	7371	Wajo	t
7371070	7371	Bontoala	t
7371080	7371	Ujung Tanah	t
7371081	7371	Kepulauan Sangkarrang	t
7371090	7371	Tallo	t
7371100	7371	Panakkukang	t
7371101	7371	Manggala	t
7371110	7371	Biring Kanaya	t
7371111	7371	Tamalanrea	t
7372010	7372	Bacukiki	t
7372011	7372	Bacukiki Barat	t
7372020	7372	Ujung	t
7372030	7372	Soreang	t
7373010	7373	Wara Selatan	t
7373011	7373	Sendana	t
7373020	7373	Wara	t
7373021	7373	Wara Timur	t
7373022	7373	Mungkajang	t
7373030	7373	Wara Utara	t
7373031	7373	Bara	t
7373040	7373	Telluwanua	t
7373041	7373	Wara Barat	t
7401050	7401	Lasalimu	t
7401051	7401	Lasalimu Selatan	t
7401052	7401	Siontapina	t
7401060	7401	Pasar Wajo	t
7401061	7401	Wolowa	t
7401062	7401	Wabula	t
7401110	7401	Kapontori	t
7402010	7402	Tongkuno	t
7402011	7402	Tongkuno Selatan	t
7402020	7402	Parigi	t
7402021	7402	Bone	t
7402022	7402	Marobo	t
7402030	7402	Kabawo	t
7402031	7402	Kabangka	t
7402032	7402	Kontukowuna	t
7402061	7402	Kontunaga	t
7402062	7402	Watopute	t
7402070	7402	Katobu	t
7402071	7402	Lohia	t
7402072	7402	Duruka	t
7402073	7402	Batalaiworu	t
7402080	7402	Napabalano	t
7402081	7402	Lasalepa	t
7402083	7402	Towea	t
7402090	7402	Wakorumba Selatan	t
7402091	7402	Pasir Putih	t
7402092	7402	Pasi Kolaga	t
7402111	7402	Maligano	t
7402112	7402	Batukara	t
7403090	7403	Soropia	t
7403091	7403	Lalonggasumeeto	t
7403100	7403	Sampara	t
7403101	7403	Bondoala	t
7403102	7403	Besulutu	t
7403103	7403	Kapoiala	t
7403104	7403	Anggalomoare	t
7403105	7403	Morosi	t
7403130	7403	Lambuya	t
7403131	7403	Uepai	t
7403132	7403	Puriala	t
7403133	7403	Onembute	t
7403140	7403	Pondidaha	t
7403141	7403	Wonggeduku	t
7403142	7403	Amonggedo	t
7403143	7403	Wonggeduku Barat	t
7403150	7403	Wawotobi	t
7403151	7403	Meluhu	t
7403152	7403	Konawe	t
7403153	7403	Anggotoa	t
7403170	7403	Unaaha	t
7403171	7403	Anggaberi	t
7403180	7403	Abuki	t
7403181	7403	Latoma	t
7403182	7403	Tongauna	t
7403183	7403	Asinua	t
7403184	7403	Padangguni	t
7403185	7403	Tongauna Utara	t
7403193	7403	Routa	t
7404010	7404	Watubangga	t
7404011	7404	Tanggetada	t
7404012	7404	Toari	t
7404013	7404	Polinggona	t
7404020	7404	Pomalaa	t
7404030	7404	Wundulako	t
7404031	7404	Baula	t
7404060	7404	Kolaka	t
7404061	7404	Latambaga	t
7404070	7404	Wolo	t
7404071	7404	Samaturu	t
7404072	7404	Iwoimendaa	t
7405010	7405	Tinanggea	t
7405011	7405	Lalembuu	t
7405020	7405	Andoolo	t
7405021	7405	Buke	t
7405022	7405	Andoolo Barat	t
7405030	7405	Palangga	t
7405031	7405	Palangga Selatan	t
7405032	7405	Baito	t
7405040	7405	Lainea	t
7405041	7405	Laeya	t
7405050	7405	Kolono	t
7405051	7405	Kolono Timur	t
7405060	7405	Laonti	t
7405070	7405	Moramo	t
7405071	7405	Moramo Utara	t
7405080	7405	Konda	t
7405081	7405	Wolasi	t
7405090	7405	Ranomeeto	t
7405091	7405	Ranomeeto Barat	t
7405100	7405	Landono	t
7405101	7405	Mowila	t
7405102	7405	Sabulakoa	t
7405110	7405	Angata	t
7405111	7405	Benua	t
7405112	7405	Basala	t
7406010	7406	Kabaena	t
7406011	7406	Kabaena Utara	t
7406012	7406	Kabaena Selatan	t
7406013	7406	Kabaena Barat	t
7406020	7406	Kabaena Timur	t
7406021	7406	Kabaena Tengah	t
7406030	7406	Rumbia	t
7406031	7406	Mata Oleo	t
7406032	7406	Kep. Masaloka Raya	t
7406033	7406	Rumbia Tengah	t
7406040	7406	Rarowatu	t
7406041	7406	Rarowatu Utara	t
7406042	7406	Mata Usu	t
7406043	7406	Lantari Jaya	t
7406050	7406	Poleang Timur	t
7406051	7406	Poleang Utara	t
7406052	7406	Poleang Selatan	t
7406053	7406	Poleang Tenggara	t
7406060	7406	Poleang	t
7406061	7406	Poleang Barat	t
7406062	7406	Tontonunu	t
7406063	7406	Poleang Tengah	t
7407010	7407	Binongko	t
7407011	7407	Togo Binongko	t
7407020	7407	Tomia	t
7407021	7407	Tomia Timur	t
7407030	7407	Kaledupa	t
7407031	7407	Kaledupa Selatan	t
7407040	7407	Wangi-Wangi	t
7407050	7407	Wangi-Wangi Selatan	t
7408010	7408	Ranteangin	t
7408011	7408	Lambai	t
7408012	7408	Wawo	t
7408020	7408	Lasusua	t
7408021	7408	Katoi	t
7408030	7408	Kodeoha	t
7408031	7408	Tiwu	t
7408040	7408	Ngapa	t
7408041	7408	Watunohu	t
7408050	7408	Pakue	t
7408051	7408	Pakue Utara	t
7408052	7408	Pakue Tengah	t
7408060	7408	Batu Putih	t
7408061	7408	Porehu	t
7408062	7408	Tolala	t
7409100	7409	Bonegunu	t
7409101	7409	Kambowa	t
7409110	7409	Wakorumba	t
7409120	7409	Kulisusu	t
7409121	7409	Kulisusu Barat	t
7409122	7409	Kulisusu Utara	t
7410010	7410	Sawa	t
7410011	7410	Motui	t
7410020	7410	Lembo	t
7410030	7410	Lasolo	t
7410031	7410	Wawolesea	t
7410032	7410	Lasolo Kepulauan	t
7410040	7410	Molawe	t
7410050	7410	Asera	t
7410051	7410	Andowia	t
7410052	7410	Oheo	t
7410060	7410	Langgikima	t
7410070	7410	Wiwirano	t
7410071	7410	Landawe	t
7411010	7411	Aere	t
7411020	7411	Lambandia	t
7411030	7411	Poli-Polia	t
7411040	7411	Dangia	t
7411050	7411	Ladongi	t
7411060	7411	Loea	t
7411070	7411	Tirawuta	t
7411080	7411	Lalolae	t
7411090	7411	Mowewe	t
7411100	7411	Tinondo	t
7411110	7411	Uluiwoi	t
7411120	7411	Ueesi	t
7412010	7412	Wawonii Tenggara	t
7412020	7412	Wawonii Timur	t
7412030	7412	Wawonii Timur Laut	t
7412040	7412	Wawonii Utara	t
7412050	7412	Wawonii Selatan	t
7412060	7412	Wawonii Tengah	t
7412070	7412	Wawonii Barat	t
7413010	7413	Tiworo Kepulauan	t
7413020	7413	Maginti	t
7413030	7413	Tiworo Tengah	t
7413040	7413	Tiworo Selatan	t
7413050	7413	Tiworo Utara	t
7413060	7413	Lawa	t
7413070	7413	Sawerigadi	t
7413080	7413	Barangka	t
7413090	7413	Wa Daga	t
7413100	7413	Kusambi	t
7413110	7413	Napano Kusambi	t
7414010	7414	Talaga Raya	t
7414020	7414	Mawasangka	t
7414030	7414	Mawasangka Tengah	t
7414040	7414	Mawasangka Timur	t
7414050	7414	Lakudo	t
7414060	7414	Gu	t
7414070	7414	Sangia Wambulu	t
7415010	7415	Batu Atas	t
7415020	7415	Lapandewa	t
7415030	7415	Sampolawa	t
7415040	7415	Batauga	t
7415050	7415	Siompu Barat	t
7415060	7415	Siompu	t
7415070	7415	Kadatua	t
7471010	7471	Mandonga	t
7471011	7471	Baruga	t
7471012	7471	Puuwatu	t
7471013	7471	Kadia	t
7471014	7471	Wua-Wua	t
7471020	7471	Poasia	t
7471021	7471	Abeli	t
7471022	7471	Kambu	t
7471023	7471	Nambo	t
7471030	7471	Kendari	t
7471031	7471	Kendari Barat	t
7472010	7472	Betoambari	t
7472011	7472	Murhum	t
7472012	7472	Batupoaro	t
7472020	7472	Wolio	t
7472021	7472	Kokalukuna	t
7472030	7472	Sorawolio	t
7472040	7472	Bungi	t
7472041	7472	Lea-Lea	t
7501031	7501	Mananggu	t
7501040	7501	Tilamuta	t
7501041	7501	Dulupi	t
7501042	7501	Botumoito	t
7501050	7501	Paguyaman	t
7501051	7501	Wonosari	t
7501052	7501	Paguyaman Pantai	t
7502010	7502	Batudaa Pantai	t
7502011	7502	Biluhu	t
7502020	7502	Batudaa	t
7502021	7502	Bongomeme	t
7502022	7502	Tabongo	t
7502023	7502	Dungaliyo	t
7502030	7502	Tibawa	t
7502031	7502	Pulubala	t
7502040	7502	Boliyohuto	t
7502041	7502	Mootilango	t
7502042	7502	Tolangohula	t
7502043	7502	Asparaga	t
7502044	7502	Bilato	t
7502070	7502	Limboto	t
7502071	7502	Limboto Barat	t
7502080	7502	Telaga	t
7502081	7502	Telaga Biru	t
7502082	7502	Tilango	t
7502083	7502	Telaga Jaya	t
7503010	7503	Popayato	t
7503011	7503	Popayato Barat	t
7503012	7503	Popayato Timur	t
7503020	7503	Lemito	t
7503021	7503	Wanggarasi	t
7503030	7503	Marisa	t
7503031	7503	Patilanggio	t
7503032	7503	Buntulia	t
7503033	7503	Duhiadaa	t
7503040	7503	Randangan	t
7503041	7503	Taluditi	t
7503050	7503	Paguat	t
7503051	7503	Dengilo	t
7504010	7504	Tapa	t
7504011	7504	Bulango Utara	t
7504012	7504	Bulango Selatan	t
7504013	7504	Bulango Timur	t
7504014	7504	Bulango Ulu	t
7504020	7504	Kabila	t
7504021	7504	Botu Pingge	t
7504022	7504	Tilongkabila	t
7504030	7504	Suwawa	t
7504031	7504	Suwawa Selatan	t
7504032	7504	Suwawa Timur	t
7504033	7504	Suwawa Tengah	t
7504034	7504	Pinogu	t
7504040	7504	Bonepantai	t
7504041	7504	Kabila Bone	t
7504042	7504	Bone Raya	t
7504043	7504	Bone	t
7504044	7504	Bulawa	t
7505010	7505	Atinggola	t
7505011	7505	Gentuma Raya	t
7505020	7505	Kwandang	t
7505021	7505	Tomilito	t
7505022	7505	Ponelo Kepulauan	t
7505030	7505	Anggrek	t
7505031	7505	Monano	t
7505040	7505	Sumalata	t
7505041	7505	Sumalata Timur	t
7505050	7505	Tolinggula	t
7505051	7505	Biau	t
7571010	7571	Kota Barat	t
7571011	7571	Dungingi	t
7571020	7571	Kota Selatan	t
7571021	7571	Kota Timur	t
7571022	7571	Hulonthalangi	t
7571023	7571	Dumbo Raya	t
7571030	7571	Kota Utara	t
7571031	7571	Kota Tengah	t
7571032	7571	Sipatana	t
7601010	7601	Banggae	t
7601011	7601	Banggae Timur	t
7601020	7601	Pamboang	t
7601030	7601	Sendana	t
7601031	7601	Tammerodo	t
7601033	7601	Tubo Sendana	t
7601040	7601	Malunda	t
7601041	7601	Ulumanda	t
7602010	7602	Tinambung	t
7602011	7602	Balanipa	t
7602012	7602	Limboro	t
7602020	7602	Tubbi Taramanu	t
7602021	7602	Alu	t
7602030	7602	Campalagian	t
7602031	7602	Luyo	t
7602040	7602	Wonomulyo	t
7602041	7602	Mapilli	t
7602042	7602	Tapango	t
7602043	7602	Matakali	t
7602044	7602	B U L O	t
7602050	7602	Polewali	t
7602051	7602	Binuang	t
7602052	7602	Anreapi	t
7602061	7602	Matangnga	t
7603010	7603	Sumarorong	t
7603020	7603	Messawa	t
7603030	7603	Pana	t
7603031	7603	Nosu	t
7603040	7603	Tabang	t
7603050	7603	Mamasa	t
7603060	7603	Tanduk Kalua	t
7603061	7603	Balla	t
7603070	7603	Sesenapadang	t
7603071	7603	Tawalian	t
7603080	7603	Mambi	t
7603081	7603	Bambang	t
7603082	7603	Rantebulahan Timur	t
7603083	7603	Mehalaan	t
7603090	7603	Aralle	t
7603091	7603	Buntu Malangka	t
7603100	7603	Tabulahan	t
7604010	7604	Tapalang	t
7604011	7604	Tapalang Barat	t
7604020	7604	Mamuju	t
7604022	7604	Simboro	t
7604023	7604	Balabalakang	t
7604030	7604	Kalukku	t
7604031	7604	Papalang	t
7604032	7604	Sampaga	t
7604033	7604	Tommo	t
7604040	7604	Kalumpang	t
7604041	7604	Bonehau	t
7605010	7605	Sarudu	t
7605011	7605	Dapurang	t
7605012	7605	Duripoku	t
7605020	7605	Baras	t
7605021	7605	Bulu Taba	t
7605022	7605	Lariang	t
7605030	7605	Pasangkayu	t
7605031	7605	Tikke Raya	t
7605032	7605	Pedongga	t
7605040	7605	Bambalamotu	t
7605041	7605	Bambaira	t
7605042	7605	Sarjo	t
7606010	7606	Pangale	t
7606020	7606	Budong-Budong	t
7606030	7606	Tobadak	t
7606040	7606	Topoyo	t
7606050	7606	Karossa	t
8101040	8101	Tanimbar Selatan	t
8101041	8101	Wer Tamrian	t
8101042	8101	Wer Maktian	t
8101043	8101	Selaru	t
8101050	8101	Tanimbar Utara	t
8101051	8101	Yaru	t
8101052	8101	Wuar Labobar	t
8101053	8101	Nirunmas	t
8101054	8101	Kormomolin	t
8101055	8101	Molu Maru	t
8102010	8102	Kei Kecil	t
8102012	8102	Kei Kecil Barat	t
8102013	8102	Kei Kecil Timur	t
8102014	8102	Hoat Sorbay	t
8102015	8102	Manyeuw	t
8102016	8102	Kei Kecil Timur Selatan	t
8102020	8102	Kei Besar	t
8102021	8102	Kei Besar Utara Timur	t
8102022	8102	Kei Besar Selatan	t
8102023	8102	Kei Besar Utara Barat	t
8102024	8102	Kei Besar Selatan Barat	t
8103010	8103	Banda	t
8103040	8103	Tehoru	t
8103041	8103	Telutih	t
8103050	8103	Amahai	t
8103051	8103	Kota Masohi	t
8103052	8103	Teluk Elpaputih	t
8103060	8103	Teon Nila Serua	t
8103080	8103	Saparua	t
8103081	8103	Nusalaut	t
8103082	8103	Saparua Timur	t
8103090	8103	P. Haruku	t
8103100	8103	Salahutu	t
8103110	8103	Leihitu	t
8103111	8103	Leihitu Barat	t
8103140	8103	Seram Utara	t
8103141	8103	Seram Utara Barat	t
8103142	8103	Seram Utara Timur Kobi	t
8103143	8103	Seram Utara Timur Seti	t
8104020	8104	Namlea	t
8104021	8104	Waeapo	t
8104022	8104	Waplau	t
8104023	8104	Bata Bual	t
8104024	8104	Teluk Kaiely	t
8104025	8104	Waelata	t
8104026	8104	Lolong Guba	t
8104027	8104	Lilialy	t
8104030	8104	Air Buaya	t
8104031	8104	Fena Leisela	t
8105010	8105	Aru Selatan	t
8105011	8105	Aru Selatan Timur	t
8105012	8105	Aru Selatan Utara	t
8105020	8105	Aru Tengah	t
8105021	8105	Aru Tengah Timur	t
8105022	8105	Aru Tengah Selatan	t
8105030	8105	Pulau-Pulau Aru	t
8105031	8105	Aru Utara	t
8105032	8105	Aru Utara Timur Batuley	t
8105033	8105	Sir-Sir	t
8106010	8106	Huamual Belakang	t
8106011	8106	Kepulauan Manipa	t
8106020	8106	Seram Barat	t
8106021	8106	Huamual	t
8106030	8106	Kairatu	t
8106031	8106	Kairatu Barat	t
8106032	8106	Inamosol	t
8106033	8106	Amalatu	t
8106034	8106	Elpaputih	t
8106040	8106	Taniwel	t
8106041	8106	Taniwel Timur	t
8107010	8107	Pulau Gorom	t
8107011	8107	Wakate	t
8107012	8107	Teor	t
8107013	8107	Gorom Timur	t
8107014	8107	Pulau Panjang	t
8107020	8107	Seram Timur	t
8107021	8107	Tutuk Tolu	t
8107022	8107	Kilmury	t
8107023	8107	Lian Vitu	t
8107024	8107	Kian Darat	t
8107030	8107	Werinama	t
8107031	8107	Siwalalat	t
8107040	8107	Bula	t
8107041	8107	Bula Barat	t
8107042	8107	Teluk Waru	t
8108010	8108	Wetar	t
8108011	8108	Wetar Barat	t
8108012	8108	Wetar Utara	t
8108013	8108	Wetar Timur	t
8108020	8108	Pp. Terselatan	t
8108021	8108	Kisar Utara	t
8108022	8108	Kepulauan Romang	t
8108030	8108	Letti	t
8108041	8108	Moa	t
8108042	8108	Lakor	t
8108050	8108	Damer	t
8108060	8108	Mdona Hiera	t
8108070	8108	Pp. Babar	t
8108071	8108	Pulau Wetang	t
8108080	8108	Babar Timur	t
8108081	8108	Pulau Masela	t
8108082	8108	Dawelor Dawera	t
8109010	8109	Kepala Madan	t
8109020	8109	Leksula	t
8109021	8109	Fena Fafan	t
8109030	8109	Namrole	t
8109040	8109	Waisama	t
8109050	8109	Ambalau	t
8171010	8171	Nusaniwe	t
8171020	8171	Sirimau	t
8171021	8171	Leitimur Selatan	t
8171030	8171	Teluk Ambon Baguala	t
8171031	8171	Teluk Ambon	t
8172010	8172	Pp. Kur	t
8172011	8172	Kur Selatan	t
8172020	8172	Tayando Tam	t
8172030	8172	Pulau Dullah Utara	t
8172040	8172	Pulau Dullah Selatan	t
8201090	8201	Jailolo	t
8201091	8201	Jailolo Selatan	t
8201100	8201	Sahu	t
8201101	8201	Sahu Timur	t
8201130	8201	Ibu	t
8201131	8201	Ibu Selatan	t
8201132	8201	Tabaru	t
8201140	8201	Loloda	t
8202030	8202	Weda	t
8202031	8202	Weda Selatan	t
8202032	8202	Weda Utara	t
8202033	8202	Weda Tengah	t
8202034	8202	Weda Timur	t
8202041	8202	Pulau Gebe	t
8202042	8202	Patani	t
8202043	8202	Patani Utara	t
8202044	8202	Patani Barat	t
8202045	8202	Patani Timur	t
8203010	8203	Sula Besi Barat	t
8203011	8203	Sulabesi Selatan	t
8203020	8203	Sanana	t
8203021	8203	Sula Besi Tengah	t
8203022	8203	Sulabesi Timur	t
8203023	8203	Sanana Utara	t
8203030	8203	Mangoli Timur	t
8203031	8203	Mangoli Tengah	t
8203032	8203	Mangoli Utara Timur	t
8203040	8203	Mangoli Barat	t
8203041	8203	Mangoli Utara	t
8203042	8203	Mangoli Selatan	t
8204010	8204	Obi Selatan	t
8204020	8204	Obi	t
8204021	8204	Obi Barat	t
8204022	8204	Obi Timur	t
8204023	8204	Obi Utara	t
8204030	8204	Bacan	t
8204031	8204	Mandioli Selatan	t
8204032	8204	Mandioli Utara	t
8204033	8204	Bacan Selatan	t
8204034	8204	Batang Lomang	t
8204040	8204	Bacan Timur	t
8204041	8204	Bacan Timur Selatan	t
8204042	8204	Bacan Timur Tengah	t
8204050	8204	Bacan Barat	t
8204051	8204	Kasiruta Barat	t
8204052	8204	Kasiruta Timur	t
8204053	8204	Bacan Barat Utara	t
8204060	8204	Kayoa	t
8204061	8204	Kayoa Barat	t
8204062	8204	Kayoa Selatan	t
8204063	8204	Kayoa Utara	t
8204070	8204	Pulau Makian	t
8204071	8204	Makian Barat	t
8204080	8204	Gane Barat	t
8204081	8204	Gane Barat Selatan	t
8204082	8204	Gane Barat Utara	t
8204083	8204	Kepulauan Joronga	t
8204090	8204	Gane Timur	t
8204091	8204	Gane Timur Tengah	t
8204092	8204	Gane Timur Selatan	t
8205010	8205	Malifut	t
8205011	8205	Kao Teluk	t
8205020	8205	Kao	t
8205021	8205	Kao Barat	t
8205022	8205	Kao Utara	t
8205030	8205	Tobelo Selatan	t
8205031	8205	Tobelo Barat	t
8205032	8205	Tobelo Timur	t
8205040	8205	Tobelo	t
8205041	8205	Tobelo Tengah	t
8205042	8205	Tobelo Utara	t
8205050	8205	Galela	t
8205051	8205	Galela Selatan	t
8205052	8205	Galela Barat	t
8205053	8205	Galela Utara	t
8205060	8205	Loloda Utara	t
8205061	8205	Loloda Kepulauan	t
8206010	8206	Maba Selatan	t
8206011	8206	Kota Maba	t
8206020	8206	Wasile Selatan	t
8206030	8206	Wasile	t
8206031	8206	Wasile Timur	t
8206032	8206	Wasile Tengah	t
8206033	8206	Wasile Utara	t
8206040	8206	Maba	t
8206041	8206	Maba Tengah	t
8206042	8206	Maba Utara	t
8207010	8207	Morotai Selatan	t
8207020	8207	Morotai Timur	t
8207030	8207	Morotai Selatan Barat	t
8207040	8207	Morotai Jaya	t
8207050	8207	Morotai Utara	t
8208010	8208	Taliabu Barat	t
8208020	8208	Taliabu Selatan	t
8208030	8208	Tabona	t
8208040	8208	Taliabu Timur Selatan	t
8208050	8208	Taliabu Timur	t
8208060	8208	Taliabu Utara	t
8208070	8208	Lede	t
8208080	8208	Taliabu Barat Laut	t
8271010	8271	Pulau Ternate	t
8271011	8271	Moti	t
8271012	8271	Pulau Batang Dua	t
8271013	8271	Pulau Hiri	t
8271014	8271	Ternate Barat	t
8271020	8271	Ternate Selatan	t
8271021	8271	Ternate Tengah	t
8271030	8271	Ternate Utara	t
8272010	8272	Tidore Selatan	t
8272020	8272	Tidore Utara	t
8272030	8272	Tidore	t
8272031	8272	Tidore Timur	t
8272040	8272	Oba	t
8272041	8272	Oba Selatan	t
8272050	8272	Oba Utara	t
8272051	8272	Oba Tengah	t
9101050	9101	Fakfak Timur	t
9101051	9101	Karas	t
9101052	9101	Fakfak Timur Tengah	t
9101060	9101	Fakfak	t
9101061	9101	Fakfak Tengah	t
9101062	9101	Pariwari	t
9101070	9101	Fakfak Barat	t
9101071	9101	Wartutin	t
9101080	9101	Kokas	t
9101081	9101	Teluk Patipi	t
9101082	9101	Kramongmongga	t
9101083	9101	Bomberay	t
9101084	9101	Arguni	t
9101085	9101	Mbahamdandara	t
9101086	9101	Furwagi	t
9101087	9101	Kayauni	t
9101088	9101	Tomage	t
9102010	9102	Buruway	t
9102020	9102	Teluk Arguni	t
9102021	9102	Teluk Arguni Bawah	t
9102030	9102	Kaimana	t
9102031	9102	Kambrau	t
9102040	9102	Teluk Etna	t
9102041	9102	Yamor	t
9103010	9103	Naikere	t
9103020	9103	Wondiboy	t
9103021	9103	Rasiey	t
9103022	9103	Kuri Wamesa	t
9103030	9103	Wasior	t
9103040	9103	Duairi	t
9103041	9103	Roon	t
9103050	9103	Windesi	t
9103051	9103	Nikiwar	t
9103060	9103	Wamesa	t
9103061	9103	Roswar	t
9103070	9103	Rumberpon	t
9103071	9103	Soug Jaya	t
9104010	9104	Fafurwar	t
9104020	9104	Babo	t
9104021	9104	Sumuri	t
9104022	9104	Aroba	t
9104023	9104	Kaitaro	t
9104030	9104	Kuri	t
9104040	9104	Wamesa	t
9104050	9104	Bintuni	t
9104051	9104	Manimeri	t
9104052	9104	Tuhiba	t
9104053	9104	Dataran Beimes	t
9104060	9104	Tembuni	t
9104070	9104	Aranday	t
9104071	9104	Kamundan	t
9104072	9104	Tomu	t
9104073	9104	Weriagar	t
9104080	9104	Moskona Selatan	t
9104081	9104	Meyado	t
9104082	9104	Moskona Barat	t
9104090	9104	Merdey	t
9104091	9104	Biscoop	t
9104092	9104	Masyeta	t
9104100	9104	Moskona Utara	t
9104101	9104	Moskona Timur	t
9105110	9105	Warmare	t
9105120	9105	Prafi	t
9105141	9105	Manokwari Barat	t
9105142	9105	Manokwari Timur	t
9105143	9105	Manokwari Utara	t
9105144	9105	Manokwari Selatan	t
9105146	9105	Tanah Rubu	t
9105170	9105	Masni	t
9105171	9105	Sidey	t
9106010	9106	Inanwatan	t
9106011	9106	Metemani	t
9106020	9106	Kokoda	t
9106021	9106	Kais	t
9106022	9106	Kokoda Utara	t
9106023	9106	Kais Darat	t
9106060	9106	Moswaren	t
9106070	9106	Teminabuan	t
9106071	9106	Seremuk	t
9106072	9106	Wayer	t
9106073	9106	Konda	t
9106074	9106	Saifi	t
9106080	9106	Sawiat	t
9106081	9106	Fokour	t
9106082	9106	Salkma	t
9107061	9107	Klaso	t
9107062	9107	Saengkeduk	t
9107100	9107	Makbon	t
9107101	9107	Klayili	t
9107110	9107	Beraur	t
9107111	9107	Klamono	t
9107112	9107	Klabot	t
9107113	9107	Klawak	t
9107114	9107	Bagun	t
9107115	9107	Klasafet	t
9107116	9107	Malabotom	t
9107118	9107	Botain	t
9107119	9107	Konhir	t
9107120	9107	Salawati	t
9107121	9107	Mayamuk	t
9107122	9107	Salawati Timur	t
9107123	9107	Hobard	t
9107124	9107	Buk	t
9107130	9107	Seget	t
9107131	9107	Segun	t
9107132	9107	Salawati Selatan	t
9107133	9107	Salawati Tengah	t
9107170	9107	Aimas	t
9107171	9107	Mariat	t
9107172	9107	Sorong	t
9107180	9107	Sayosa	t
9107181	9107	Maudus	t
9107182	9107	Wemak	t
9107183	9107	Sayosa Timur	t
9107184	9107	Sunook	t
9108011	9108	Misool Selatan	t
9108012	9108	Misool Barat	t
9108020	9108	Misool	t
9108021	9108	Kofiau	t
9108022	9108	Misool Timur	t
9108023	9108	Kepulauan Sembilan	t
9108031	9108	Salawati Utara	t
9108033	9108	Salawati Tengah	t
9108034	9108	Salawati Barat	t
9108035	9108	Batanta Selatan	t
9108036	9108	Batanta Utara	t
9108040	9108	Waigeo Selatan	t
9108041	9108	Teluk Mayalibit	t
9108042	9108	Meos Mansar	t
9108043	9108	Kota Waisai	t
9108044	9108	Tiplol Mayalibit	t
9108050	9108	Waigeo Barat	t
9108051	9108	Waigeo Barat Kepulauan	t
9108060	9108	Waigeo Utara	t
9108061	9108	Warwarbomi	t
9108062	9108	Supnin	t
9108070	9108	Kepulauan Ayau	t
9108071	9108	Ayau	t
9108080	9108	Waigeo Timur	t
9109010	9109	Fef	t
9109011	9109	Syujak	t
9109012	9109	Ases	t
9109013	9109	Tinggouw	t
9109020	9109	Miyah	t
9109021	9109	Miyah Selatan	t
9109022	9109	Ireres	t
9109023	9109	Wilhem Roumbouts	t
9109030	9109	Abun	t
9109040	9109	Kwoor	t
9109041	9109	Tobouw	t
9109042	9109	Kwesefo	t
9109050	9109	Sausapor	t
9109051	9109	Bikar	t
9109060	9109	Yembun	t
9109061	9109	Bamusbama	t
9109070	9109	Kebar	t
9109071	9109	Kebar Timur	t
9109072	9109	Kebar Selatan	t
9109073	9109	Manekar	t
9109080	9109	Senopi	t
9109081	9109	Mawabuan	t
9109090	9109	Amberbaken	t
9109091	9109	Mpur	t
9109092	9109	Amberbaken Barat	t
9109100	9109	Mubarni / Arfu	t
9109110	9109	Moraid	t
9109111	9109	Selemkai	t
9110010	9110	Aitinyo Barat/Athabu	t
9110011	9110	Ayamaru Selatan Jaya	t
9110020	9110	Aitinyo	t
9110021	9110	Aitinyo Tengah	t
9110030	9110	Aifat Selatan	t
9110031	9110	Aifat Timur Selatan	t
9110040	9110	Aifat	t
9110050	9110	Aitinyo Utara	t
9110051	9110	Aitinyo Raya	t
9110060	9110	Ayamaru Timur	t
9110061	9110	Ayamaru Timur Selatan	t
9110070	9110	Ayamaru	t
9110071	9110	Ayamaru Selatan	t
9110072	9110	Ayamaru Jaya	t
9110073	9110	Ayamaru Tengah	t
9110074	9110	Ayamaru Barat	t
9110080	9110	Ayamaru Utara	t
9110081	9110	Ayamaru Utara Timur	t
9110090	9110	Mare	t
9110091	9110	Mare Selatan	t
9110100	9110	Aifat Utara	t
9110110	9110	Aifat Timur	t
9110111	9110	Aifat Timur Tengah	t
9110112	9110	Aifat Timur Jauh	t
9111010	9111	Tahota	t
9111020	9111	Dataran Isim	t
9111030	9111	Nenei	t
9111040	9111	Momi Waren	t
9111050	9111	Ransiki	t
9111060	9111	Oransbari	t
9112010	9112	Didohu	t
9112020	9112	Sururey	t
9112030	9112	Anggi Gida	t
9112040	9112	Membey	t
9112050	9112	Anggi	t
9112060	9112	Taige	t
9112070	9112	Hingk	t
9112080	9112	Menyambouw	t
9112090	9112	Catubouw	t
9112100	9112	Testega	t
9171010	9171	Sorong Barat	t
9171011	9171	Sorong Kepulauan	t
9171012	9171	Maladum Mes	t
9171020	9171	Sorong Timur	t
9171021	9171	Sorong Utara	t
9171022	9171	Sorong	t
9171023	9171	Sorong Manoi	t
9171024	9171	Klaurung	t
9171025	9171	Malaimsimsa	t
9171026	9171	Sorong Kota	t
9401010	9401	Kimaam	t
9401011	9401	Waan	t
9401012	9401	Tabonji	t
9401013	9401	Ilwayab	t
9401020	9401	Okaba	t
9401021	9401	Tubang	t
9401022	9401	Ngguti	t
9401023	9401	Kaptel	t
9401030	9401	Kurik	t
9401031	9401	Malind	t
9401032	9401	Animha	t
9401040	9401	Merauke	t
9401041	9401	Semangga	t
9401042	9401	Tanah Miring	t
9401043	9401	Jagebob	t
9401044	9401	Sota	t
9401045	9401	Naukenjerai	t
9401050	9401	Muting	t
9401051	9401	Eligobel	t
9401052	9401	Ulilin	t
9402110	9402	Wamena	t
9402111	9402	Asolokobal	t
9402112	9402	Walelagama	t
9402113	9402	Trikora	t
9402114	9402	Napua	t
9402115	9402	Walaik	t
9402116	9402	Wouma	t
9402117	9402	Walesi	t
9402118	9402	Asotipo	t
9402119	9402	Maima	t
9402120	9402	Hubikosi	t
9402121	9402	Pelebaga	t
9402122	9402	Ibele	t
9402123	9402	Tailarek	t
9402124	9402	Hubikiak	t
9402180	9402	Asologaima	t
9402181	9402	Musatfak	t
9402182	9402	Silo Karno Doga	t
9402183	9402	Pyramid	t
9402184	9402	Muliama	t
9402185	9402	Wame	t
9402190	9402	Kurulu	t
9402191	9402	Usilimo	t
9402192	9402	Wita Waya	t
9402193	9402	Libarek	t
9402194	9402	Wadangku	t
9402195	9402	Pisugi	t
9402220	9402	Bolakme	t
9402221	9402	Wollo	t
9402222	9402	Yalengga	t
9402223	9402	Tagime	t
9402224	9402	Molagalome	t
9402225	9402	Tagineri	t
9402226	9402	Bugi	t
9402227	9402	Bpiri	t
9402228	9402	Koragi	t
9402611	9402	Itlay Hasige	t
9402612	9402	Siepkosi	t
9402614	9402	Popugoba	t
9403080	9403	Kaureh	t
9403081	9403	Airu	t
9403082	9403	Yapsi	t
9403140	9403	Kemtuk	t
9403150	9403	Kemtuk Gresi	t
9403151	9403	Gresi Selatan	t
9403160	9403	Nimboran	t
9403161	9403	Nimboran Timur / Namblong	t
9403170	9403	Nimbokrang	t
9403180	9403	Unurum Guay	t
9403200	9403	Demta	t
9403201	9403	Yokari	t
9403210	9403	Depapre	t
9403211	9403	Ravenirara	t
9403220	9403	Sentani Barat	t
9403221	9403	Waibu	t
9403230	9403	Sentani	t
9403231	9403	Ebungfau	t
9403240	9403	Sentani Timur	t
9404050	9404	Uwapa	t
9404051	9404	Menou	t
9404052	9404	Dipa	t
9404060	9404	Yaur	t
9404061	9404	Teluk Umar	t
9404070	9404	Wanggar	t
9404071	9404	Nabire Barat	t
9404080	9404	Nabire	t
9404081	9404	Teluk Kimi	t
9404090	9404	Napan	t
9404091	9404	Makimi	t
9404092	9404	Wapoga	t
9404093	9404	Kepulauan Moora	t
9404100	9404	Siriwo	t
9404110	9404	Yaro	t
9408040	9408	Yapen Timur	t
9408041	9408	Pantura Yapen	t
9408042	9408	Teluk Ampimoi	t
9408043	9408	Raimbawi	t
9408044	9408	Pulau Kurudu	t
9408050	9408	Angkaisera	t
9408051	9408	Kep. Ambai	t
9408052	9408	Yawakukat	t
9408060	9408	Yapen Selatan	t
9408061	9408	Kosiwo	t
9408062	9408	Anataurei	t
9408070	9408	Yapen Barat	t
9408071	9408	Wonawa	t
9408072	9408	Pulau Yerui	t
9408080	9408	Poom	t
9408081	9408	Windesi	t
9409010	9409	Numfor Barat	t
9409011	9409	Orkeri	t
9409020	9409	Numfor Timur	t
9409021	9409	Bruyadori	t
9409022	9409	Poiru	t
9409030	9409	Padaido	t
9409031	9409	Aimando Padaido	t
9409040	9409	Biak Timur	t
9409041	9409	Oridek	t
9409050	9409	Biak Kota	t
9409060	9409	Samofa	t
9409070	9409	Yendidori	t
9409080	9409	Biak Utara	t
9409081	9409	Andey	t
9409090	9409	Warsa	t
9409091	9409	Yawosi	t
9409092	9409	Bondifuar	t
9409100	9409	Biak Barat	t
9409101	9409	Swandiwe	t
9410030	9410	Paniai Timur	t
9410031	9410	Yatamo	t
9410032	9410	Kebo	t
9410033	9410	Pugo Dagi	t
9410034	9410	Wege Muka	t
9410035	9410	Wegee Bino	t
9410036	9410	Yagai	t
9410040	9410	Bibida	t
9410041	9410	Dumadama	t
9410070	9410	Aradide	t
9410071	9410	Ekadide	t
9410072	9410	Aweida	t
9410073	9410	Fajar Timur	t
9410074	9410	Topiyai	t
9410080	9410	Paniai Barat	t
9410081	9410	Siriwo	t
9410082	9410	Muye	t
9410083	9410	Nakama	t
9410084	9410	Teluk Deya	t
9410090	9410	Bogobaida	t
9411040	9411	Fawi	t
9411041	9411	Dagai	t
9411042	9411	Kiyage	t
9411050	9411	Mulia	t
9411053	9411	Yambi	t
9411054	9411	Ilamburawi	t
9411055	9411	Muara	t
9411056	9411	Pagaleme	t
9411057	9411	Gurage	t
9411058	9411	Irimuli	t
9411060	9411	Ilu	t
9411061	9411	Torere	t
9411063	9411	Yamoneri	t
9411064	9411	Waegi	t
9411065	9411	Nume	t
9411066	9411	Nioga	t
9411067	9411	Gubume	t
9411068	9411	Taganombak	t
9411070	9411	Tingginambut	t
9411071	9411	Kalome	t
9411072	9411	Wanwi	t
9411080	9411	Mewoluk	t
9411081	9411	Lumo	t
9411082	9411	Molanikime	t
9411090	9411	Yamo	t
9411091	9411	Dokome	t
9412010	9412	Mimika Barat	t
9412011	9412	Mimika Barat Jauh	t
9412012	9412	Mimika Barat Tengah	t
9412013	9412	Amar	t
9412020	9412	Mimika Timur	t
9412021	9412	Mimika Tengah	t
9412022	9412	Mimika Timur Jauh	t
9412030	9412	Mimika Baru	t
9412031	9412	Kuala Kencana	t
9412032	9412	Tembagapura	t
9412033	9412	Wania	t
9412034	9412	Iwaka	t
9412035	9412	Kwamki Narama	t
9412040	9412	Agimuga	t
9412041	9412	Jila	t
9412042	9412	Jita	t
9412043	9412	Alama	t
9412044	9412	Hoya	t
9413010	9413	Jair	t
9413011	9413	Subur	t
9413013	9413	Kia	t
9413020	9413	Mindiptana	t
9413021	9413	Iniyandit	t
9413022	9413	Kombut	t
9413023	9413	Sesnuk	t
9413030	9413	Mandobo	t
9413031	9413	Fofi	t
9413032	9413	Arimop	t
9413040	9413	Kouh	t
9413041	9413	Bomakia	t
9413042	9413	Firiwage	t
9413043	9413	Manggelum	t
9413044	9413	Yaniruma	t
9413045	9413	Kawagit	t
9413046	9413	Kombay	t
9413050	9413	Waropko	t
9413051	9413	Ambatkwi	t
9413052	9413	Ninati	t
9414010	9414	Nambioman Bapai	t
9414011	9414	Minyamur	t
9414020	9414	Edera	t
9414021	9414	Venaha	t
9414022	9414	Syahcame	t
9414023	9414	Bamgi	t
9414024	9414	Yakomi	t
9414030	9414	Obaa	t
9414031	9414	Passue	t
9414040	9414	Haju	t
9414050	9414	Assue	t
9414060	9414	Citakmitak	t
9414061	9414	Kaibar	t
9414062	9414	Passue Bawah	t
9414063	9414	Ti-Zain	t
9415010	9415	Pantai Kasuari	t
9415011	9415	Kopay	t
9415012	9415	Der Koumur	t
9415013	9415	Safan	t
9415014	9415	Awyu	t
9415020	9415	Fayit	t
9415021	9415	Aswi	t
9415030	9415	Atsy	t
9415031	9415	Sirets	t
9415032	9415	Ayip	t
9415033	9415	Bectbamu	t
9415040	9415	Suator	t
9415041	9415	Kolf Braza	t
9415042	9415	Joutu	t
9415043	9415	Koroway Buluanop	t
9415050	9415	Akat	t
9415051	9415	Jetsy	t
9415060	9415	Agats	t
9415070	9415	Sawa Erma	t
9415071	9415	Suru-Suru	t
9415072	9415	Unir Sirau	t
9415073	9415	Joerat	t
9415074	9415	Pulau Tiga	t
9416010	9416	Kurima	t
9416011	9416	Musaik	t
9416013	9416	Dekai	t
9416014	9416	Obio	t
9416015	9416	Pasema	t
9416016	9416	Amuma	t
9416017	9416	Suru-Suru	t
9416018	9416	Wusama	t
9416019	9416	Silimo	t
9416020	9416	Ninia	t
9416021	9416	Holuwon	t
9416022	9416	Lolat	t
9416023	9416	Langda	t
9416024	9416	Bomela	t
9416025	9416	Suntamon	t
9416026	9416	Sobaham	t
9416027	9416	Korupun	t
9416028	9416	Sela	t
9416029	9416	Kwelamdua	t
9416030	9416	Anggruk	t
9416031	9416	Panggema	t
9416032	9416	Walma	t
9416033	9416	Kosarek	t
9416034	9416	Ubahak	t
9416035	9416	Nalca	t
9416036	9416	Puldama	t
9416037	9416	Nipsan	t
9416041	9416	Samenage	t
9416042	9416	Tangma	t
9416043	9416	Soba	t
9416044	9416	Mugi	t
9416045	9416	Yogosem	t
9416046	9416	Kayo	t
9416047	9416	Sumo	t
9416048	9416	Hogio	t
9416049	9416	Ukha	t
9416051	9416	Werima	t
9416052	9416	Soloikma	t
9416053	9416	Seradala	t
9416054	9416	Kabianggama	t
9416055	9416	Kwikma	t
9416056	9416	Hilipuk	t
9416057	9416	Yahuliambut	t
9416058	9416	Hereapini	t
9416059	9416	Ubalihi	t
9416061	9416	Talambo	t
9416062	9416	Pronggoli	t
9416063	9416	Endomen	t
9416065	9416	Kona	t
9416066	9416	Duram	t
9416067	9416	Dirwemna	t
9417010	9417	Iwur	t
9417011	9417	Kawor	t
9417012	9417	Tarup	t
9417013	9417	Awinbon	t
9417020	9417	Oksibil	t
9417021	9417	Pepera	t
9417022	9417	Alemsom	t
9417023	9417	Serambakon	t
9417024	9417	Kolomdol	t
9417025	9417	Oksop	t
9417026	9417	Ok Bape	t
9417027	9417	Ok Aon	t
9417030	9417	Borme	t
9417031	9417	Bime	t
9417032	9417	Epumek	t
9417033	9417	Weime	t
9417034	9417	Pamek	t
9417035	9417	Nongme	t
9417036	9417	Batani	t
9417040	9417	Okbi	t
9417041	9417	Aboy	t
9417042	9417	Okbab	t
9417043	9417	Teiraplu	t
9417044	9417	Yefta	t
9417050	9417	Kiwirok	t
9417051	9417	Kiwirok Timur	t
9417052	9417	Oksebang	t
9417053	9417	Okhika	t
9417054	9417	Oklip	t
9417055	9417	Oksamol	t
9417056	9417	Okbemta	t
9417060	9417	Batom	t
9417061	9417	Murkim	t
9417062	9417	Mofinop	t
9418010	9418	Kanggime	t
9418011	9418	Woniki	t
9418012	9418	Nabunage	t
9418013	9418	Gilubandu	t
9418014	9418	Wakuo	t
9418015	9418	Aweku	t
9418016	9418	Bogonuk	t
9418020	9418	Karubaga	t
9418021	9418	Goyage	t
9418022	9418	Wunin	t
9418023	9418	Kondaga	t
9418024	9418	Nelawi	t
9418025	9418	Kuari	t
9418026	9418	Lianogoma	t
9418027	9418	Biuk	t
9418030	9418	Bokondini	t
9418031	9418	Bokoneri	t
9418032	9418	Bewani	t
9418040	9418	Kembu	t
9418041	9418	Wina	t
9418042	9418	Umagi	t
9418043	9418	Panaga	t
9418044	9418	Poganeri	t
9418045	9418	Kamboneri	t
9418046	9418	Air Garam	t
9418047	9418	Dow	t
9418048	9418	Wari / Taiyeve	t
9418049	9418	Egiam	t
9418051	9418	Nunggawi	t
9418060	9418	Kubu	t
9418061	9418	Anawi	t
9418062	9418	Wugi	t
9418070	9418	Geya	t
9418071	9418	Wenam	t
9418080	9418	Numba	t
9418081	9418	Kai	t
9418090	9418	Dundu	t
9418100	9418	Gundagi	t
9418110	9418	Timori	t
9418121	9418	Yuneri	t
9418125	9418	Tagime	t
9418126	9418	Danime	t
9418127	9418	Yuko	t
9418541	9418	Telenggeme	t
9418542	9418	Gika	t
9418543	9418	Tagineri	t
9419021	9419	Pantai Timur Bagian Barat	t
9419022	9419	Pantai Timur	t
9419024	9419	Sungai Biri	t
9419025	9419	Veen	t
9419031	9419	Bonggo	t
9419032	9419	Bonggo Timur	t
9419033	9419	Bonggo Barat	t
9419040	9419	Tor Atas	t
9419041	9419	Ismari	t
9419050	9419	Sarmi	t
9419051	9419	Sarmi Timur	t
9419052	9419	Sarmi Selatan	t
9419053	9419	Sobey	t
9419054	9419	Muara Tor	t
9419055	9419	Verkam	t
9419060	9419	Pantai Barat	t
9419061	9419	Apawer Hulu	t
9419062	9419	Apawer Hilir	t
9419063	9419	Apawer Tengah	t
9420010	9420	Web	t
9420011	9420	Towe	t
9420012	9420	Yaffi	t
9420020	9420	Senggi	t
9420021	9420	Kaisenar	t
9420030	9420	Waris	t
9420040	9420	Arso	t
9420041	9420	Arso Timur	t
9420042	9420	Arso Barat	t
9420043	9420	Mannem	t
9420050	9420	Skanto	t
9426010	9426	Waropen Bawah	t
9426011	9426	Inggerus	t
9426012	9426	Urei Faisei	t
9426013	9426	Oudate	t
9426014	9426	Wapoga	t
9426020	9426	Masirei	t
9426021	9426	Risei Sayati	t
9426022	9426	Demba	t
9426023	9426	Soyoi Mambai	t
9426024	9426	Wonti	t
9426030	9426	Walani	t
9426040	9426	Kirihi	t
9427010	9427	Supiori Selatan	t
9427011	9427	Kepulauan Aruri	t
9427020	9427	Supiori Utara	t
9427021	9427	Supiori Barat	t
9427030	9427	Supiori Timur	t
9428030	9428	Waropen Atas	t
9428031	9428	Benuki	t
9428032	9428	Sawai	t
9428040	9428	Mamberamo Ilir	t
9428050	9428	Mamberamo Tengah	t
9428051	9428	Iwaso	t
9428060	9428	Mamberamo Tengah Timur	t
9428070	9428	Rofaer	t
9428080	9428	Mamberamo Ulu	t
9429010	9429	Wosak	t
9429011	9429	Moba	t
9429012	9429	Pija	t
9429013	9429	Kora	t
9429020	9429	Kenyam	t
9429021	9429	Mbuwa Tengah	t
9429022	9429	Krepkuri	t
9429023	9429	Embetpem	t
9429030	9429	Geselma	t
9429031	9429	Kilmid	t
9429032	9429	Yenggelo	t
9429033	9429	Alama	t
9429034	9429	Meborok	t
9429040	9429	Mapenduma	t
9429041	9429	Kroptak	t
9429042	9429	Paro	t
9429043	9429	Kegayem	t
9429050	9429	Mugi	t
9429051	9429	Yal	t
9429052	9429	Mam	t
9429060	9429	Yigi	t
9429061	9429	Dal	t
9429062	9429	Nirkuri	t
9429063	9429	Inikgal	t
9429070	9429	Mbuwa	t
9429071	9429	Iniye	t
9429072	9429	Wutpaga	t
9429073	9429	Nenggeangin	t
9429074	9429	Mbulmu Yalma	t
9429080	9429	Gearek	t
9429081	9429	Pasir Putih	t
9429082	9429	Wusi	t
9430010	9430	Makki	t
9430011	9430	Gupura	t
9430012	9430	Kolawa	t
9430013	9430	Gelok Beam	t
9430014	9430	Awina	t
9430020	9430	Pirime	t
9430021	9430	Buguk Gona	t
9430022	9430	Milimbo	t
9430023	9430	Gollo	t
9430024	9430	Wiringgabut	t
9430030	9430	Tiom	t
9430031	9430	Nogi	t
9430032	9430	Mokoni	t
9430033	9430	Niname	t
9430034	9430	Yiginua	t
9430035	9430	Tiom Ollo	t
9430036	9430	Yugunwi	t
9430037	9430	Lannyna	t
9430040	9430	Balingga	t
9430041	9430	Balingga Barat	t
9430042	9430	Bruwa	t
9430043	9430	Ayumnati	t
9430050	9430	Kuyawage	t
9430051	9430	Wano Barat	t
9430060	9430	Malagaineri	t
9430061	9430	Melagai	t
9430070	9430	Tiomneri	t
9430071	9430	Wereka	t
9430080	9430	Dimba	t
9430081	9430	Kelulome	t
9430082	9430	Nikogwe	t
9430090	9430	Gamelia	t
9430091	9430	Karu	t
9430092	9430	Yiluk	t
9430093	9430	Guna	t
9430100	9430	Poga	t
9430101	9430	Muara	t
9431010	9431	Kobakma	t
9431020	9431	Ilugwa	t
9431030	9431	Kelila	t
9431040	9431	Eragayam	t
9431050	9431	Megambilis	t
9432010	9432	Welarek	t
9432020	9432	Apalapsili	t
9432030	9432	Abenaho	t
9432040	9432	Elelim	t
9432050	9432	Benawa	t
9433010	9433	Agadugume	t
9433011	9433	Lambewi	t
9433012	9433	Oneri	t
9433020	9433	Gome	t
9433021	9433	Amungkalpia	t
9433022	9433	Gome Utara	t
9433023	9433	Erelmakawia	t
9433030	9433	Ilaga	t
9433031	9433	Ilaga Utara	t
9433032	9433	Mabugi	t
9433033	9433	Omukia	t
9433040	9433	Sinak	t
9433041	9433	Sinak Barat	t
9433042	9433	Mage∩┐╜Bume	t
9433043	9433	Yugumuak	t
9433050	9433	Pogoma	t
9433051	9433	Kembru	t
9433052	9433	Bina	t
9433060	9433	Wangbe	t
9433061	9433	Ogamanim	t
9433070	9433	Beoga	t
9433071	9433	Beoga Barat	t
9433072	9433	Beoga Timur	t
9433080	9433	Doufo	t
9433081	9433	Dervos	t
9434010	9434	Sukikai Selatan	t
9434020	9434	Piyaiye	t
9434030	9434	Mapia Barat	t
9434040	9434	Mapia Tengah	t
9434050	9434	Mapia	t
9434060	9434	Dogiyai	t
9434070	9434	Kamu Selatan	t
9434080	9434	Kamu	t
9434090	9434	Kamu Timur	t
9434100	9434	Kamu Utara	t
9435010	9435	Homeyo	t
9435020	9435	Sugapa	t
9435030	9435	Hitadipa	t
9435040	9435	Agisiga	t
9435050	9435	Biandoga	t
9435060	9435	Wandai	t
9436010	9436	Kapiraya	t
9436020	9436	Tigi Barat	t
9436030	9436	Tigi	t
9436040	9436	Tigi Timur	t
9436050	9436	Bowobado	t
9471010	9471	Muara Tami	t
9471020	9471	Abepura	t
9471021	9471	Heram	t
9471030	9471	Jayapura Selatan	t
9471040	9471	Jayapura Utara	t
\.


--
-- Data for Name: kota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kota (id, provinsi_id, nama, status) FROM stdin;
1101	11	Kabupaten Simeulue	t
1102	11	Kabupaten Aceh Singkil	t
1103	11	Kabupaten Aceh Selatan	t
1104	11	Kabupaten Aceh Tenggara	t
1105	11	Kabupaten Aceh Timur	t
1106	11	Kabupaten Aceh Tengah	t
1107	11	Kabupaten Aceh Barat	t
1108	11	Kabupaten Aceh Besar	t
1109	11	Kabupaten Pidie	t
1110	11	Kabupaten Bireuen	t
1111	11	Kabupaten Aceh Utara	t
1112	11	Kabupaten Aceh Barat Daya	t
1113	11	Kabupaten Gayo Lues	t
1114	11	Kabupaten Aceh Tamiang	t
1115	11	Kabupaten Nagan Raya	t
1116	11	Kabupaten Aceh Jaya	t
1117	11	Kabupaten Bener Meriah	t
1118	11	Kabupaten Pidie Jaya	t
1171	11	Kota Banda Aceh	t
1172	11	Kota Sabang	t
1173	11	Kota Langsa	t
1174	11	Kota Lhokseumawe	t
1175	11	Kota Subulussalam	t
1201	12	Kabupaten Nias	t
1202	12	Kabupaten Mandailing Natal	t
1203	12	Kabupaten Tapanuli Selatan	t
1204	12	Kabupaten Tapanuli Tengah	t
1205	12	Kabupaten Tapanuli Utara	t
1206	12	Kabupaten Toba Samosir	t
1207	12	Kabupaten Labuhan Batu	t
1208	12	Kabupaten Asahan	t
1209	12	Kabupaten Simalungun	t
1210	12	Kabupaten Dairi	t
1211	12	Kabupaten Karo	t
1212	12	Kabupaten Deli Serdang	t
1213	12	Kabupaten Langkat	t
1214	12	Kabupaten Nias Selatan	t
1215	12	Kabupaten Humbang Hasundutan	t
1216	12	Kabupaten Pakpak Bharat	t
1217	12	Kabupaten Samosir	t
1218	12	Kabupaten Serdang Bedagai	t
1219	12	Kabupaten Batu Bara	t
1220	12	Kabupaten Padang Lawas Utara	t
1221	12	Kabupaten Padang Lawas	t
1222	12	Kabupaten Labuhan Batu Selatan	t
1223	12	Kabupaten Labuhan Batu Utara	t
1224	12	Kabupaten Nias Utara	t
1225	12	Kabupaten Nias Barat	t
1271	12	Kota Sibolga	t
1272	12	Kota Tanjung Balai	t
1273	12	Kota Pematang Siantar	t
1274	12	Kota Tebing Tinggi	t
1275	12	Kota Medan	t
1276	12	Kota Binjai	t
1277	12	Kota Padangsidimpuan	t
1278	12	Kota Gunungsitoli	t
1301	13	Kabupaten Kepulauan Mentawai	t
1302	13	Kabupaten Pesisir Selatan	t
1303	13	Kabupaten Solok	t
1304	13	Kabupaten Sijunjung	t
1305	13	Kabupaten Tanah Datar	t
1306	13	Kabupaten Padang Pariaman	t
1307	13	Kabupaten Agam	t
1308	13	Kabupaten Lima Puluh Kota	t
1309	13	Kabupaten Pasaman	t
1310	13	Kabupaten Solok Selatan	t
1311	13	Kabupaten Dharmasraya	t
1312	13	Kabupaten Pasaman Barat	t
1371	13	Kota Padang	t
1372	13	Kota Solok	t
1373	13	Kota Sawah Lunto	t
1374	13	Kota Padang Panjang	t
1375	13	Kota Bukittinggi	t
1376	13	Kota Payakumbuh	t
1377	13	Kota Pariaman	t
1401	14	Kabupaten Kuantan Singingi	t
1402	14	Kabupaten Indragiri Hulu	t
1403	14	Kabupaten Indragiri Hilir	t
1404	14	Kabupaten Pelalawan	t
1405	14	Kabupaten S I A K	t
1406	14	Kabupaten Kampar	t
1407	14	Kabupaten Rokan Hulu	t
1408	14	Kabupaten Bengkalis	t
1409	14	Kabupaten Rokan Hilir	t
1410	14	Kabupaten Kepulauan Meranti	t
1471	14	Kota Pekanbaru	t
1473	14	Kota D U M A I	t
1501	15	Kabupaten Kerinci	t
1502	15	Kabupaten Merangin	t
1503	15	Kabupaten Sarolangun	t
1504	15	Kabupaten Batang Hari	t
1505	15	Kabupaten Muaro Jambi	t
1506	15	Kabupaten Tanjung Jabung Timur	t
1507	15	Kabupaten Tanjung Jabung Barat	t
1508	15	Kabupaten Tebo	t
1509	15	Kabupaten Bungo	t
1571	15	Kota Jambi	t
1572	15	Kota Sungai Penuh	t
1601	16	Kabupaten Ogan Komering Ulu	t
1602	16	Kabupaten Ogan Komering Ilir	t
1603	16	Kabupaten Muara Enim	t
1604	16	Kabupaten Lahat	t
1605	16	Kabupaten Musi Rawas	t
1606	16	Kabupaten Musi Banyuasin	t
1607	16	Kabupaten Banyu Asin	t
1608	16	Kabupaten Ogan Komering Ulu Selatan	t
1609	16	Kabupaten Ogan Komering Ulu Timur	t
1610	16	Kabupaten Ogan Ilir	t
1611	16	Kabupaten Empat Lawang	t
1612	16	Kabupaten Penukal Abab Lematang Ilir	t
1613	16	Kabupaten Musi Rawas Utara	t
1671	16	Kota Palembang	t
1672	16	Kota Prabumulih	t
1673	16	Kota Pagar Alam	t
1674	16	Kota Lubuklinggau	t
1701	17	Kabupaten Bengkulu Selatan	t
1702	17	Kabupaten Rejang Lebong	t
1703	17	Kabupaten Bengkulu Utara	t
1704	17	Kabupaten Kaur	t
1705	17	Kabupaten Seluma	t
1706	17	Kabupaten Mukomuko	t
1707	17	Kabupaten Lebong	t
1708	17	Kabupaten Kepahiang	t
1709	17	Kabupaten Bengkulu Tengah	t
1771	17	Kota Bengkulu	t
1801	18	Kabupaten Lampung Barat	t
1802	18	Kabupaten Tanggamus	t
1803	18	Kabupaten Lampung Selatan	t
1804	18	Kabupaten Lampung Timur	t
1805	18	Kabupaten Lampung Tengah	t
1806	18	Kabupaten Lampung Utara	t
1807	18	Kabupaten Way Kanan	t
1808	18	Kabupaten Tulangbawang	t
1809	18	Kabupaten Pesawaran	t
1810	18	Kabupaten Pringsewu	t
1811	18	Kabupaten Mesuji	t
1812	18	Kabupaten Tulang Bawang Barat	t
1813	18	Kabupaten Pesisir Barat	t
1871	18	Kota Bandar Lampung	t
1872	18	Kota Metro	t
1901	19	Kabupaten Bangka	t
1902	19	Kabupaten Belitung	t
1903	19	Kabupaten Bangka Barat	t
1904	19	Kabupaten Bangka Tengah	t
1905	19	Kabupaten Bangka Selatan	t
1906	19	Kabupaten Belitung Timur	t
1971	19	Kota Pangkal Pinang	t
2101	21	Kabupaten Karimun	t
2102	21	Kabupaten Bintan	t
2103	21	Kabupaten Natuna	t
2104	21	Kabupaten Lingga	t
2105	21	Kabupaten Kepulauan Anambas	t
2171	21	Kota B A T A M	t
2172	21	Kota Tanjung Pinang	t
3101	31	Kabupaten Kepulauan Seribu	t
3171	31	Kota Jakarta Selatan	t
3172	31	Kota Jakarta Timur	t
3173	31	Kota Jakarta Pusat	t
3174	31	Kota Jakarta Barat	t
3175	31	Kota Jakarta Utara	t
3201	32	Kabupaten Bogor	t
3202	32	Kabupaten Sukabumi	t
3203	32	Kabupaten Cianjur	t
3204	32	Kabupaten Bandung	t
3205	32	Kabupaten Garut	t
3206	32	Kabupaten Tasikmalaya	t
3207	32	Kabupaten Ciamis	t
3208	32	Kabupaten Kuningan	t
3209	32	Kabupaten Cirebon	t
3210	32	Kabupaten Majalengka	t
3211	32	Kabupaten Sumedang	t
3212	32	Kabupaten Indramayu	t
3213	32	Kabupaten Subang	t
3214	32	Kabupaten Purwakarta	t
3215	32	Kabupaten Karawang	t
3216	32	Kabupaten Bekasi	t
3217	32	Kabupaten Bandung Barat	t
3218	32	Kabupaten Pangandaran	t
3271	32	Kota Bogor	t
3272	32	Kota Sukabumi	t
3273	32	Kota Bandung	t
3274	32	Kota Cirebon	t
3275	32	Kota Bekasi	t
3276	32	Kota Depok	t
3277	32	Kota Cimahi	t
3278	32	Kota Tasikmalaya	t
3279	32	Kota Banjar	t
3301	33	Kabupaten Cilacap	t
3302	33	Kabupaten Banyumas	t
3303	33	Kabupaten Purbalingga	t
3304	33	Kabupaten Banjarnegara	t
3305	33	Kabupaten Kebumen	t
3306	33	Kabupaten Purworejo	t
3307	33	Kabupaten Wonosobo	t
3308	33	Kabupaten Magelang	t
3309	33	Kabupaten Boyolali	t
3310	33	Kabupaten Klaten	t
3311	33	Kabupaten Sukoharjo	t
3312	33	Kabupaten Wonogiri	t
3313	33	Kabupaten Karanganyar	t
3314	33	Kabupaten Sragen	t
3315	33	Kabupaten Grobogan	t
3316	33	Kabupaten Blora	t
3317	33	Kabupaten Rembang	t
3318	33	Kabupaten Pati	t
3319	33	Kabupaten Kudus	t
3320	33	Kabupaten Jepara	t
3321	33	Kabupaten Demak	t
3322	33	Kabupaten Semarang	t
3323	33	Kabupaten Temanggung	t
3324	33	Kabupaten Kendal	t
3325	33	Kabupaten Batang	t
3326	33	Kabupaten Pekalongan	t
3327	33	Kabupaten Pemalang	t
3328	33	Kabupaten Tegal	t
3329	33	Kabupaten Brebes	t
3371	33	Kota Magelang	t
3372	33	Kota Surakarta	t
3373	33	Kota Salatiga	t
3374	33	Kota Semarang	t
3375	33	Kota Pekalongan	t
3376	33	Kota Tegal	t
3401	34	Kabupaten Kulon Progo	t
3402	34	Kabupaten Bantul	t
3403	34	Kabupaten Gunung Kidul	t
3404	34	Kabupaten Sleman	t
3471	34	Kota Yogyakarta	t
3501	35	Kabupaten Pacitan	t
3502	35	Kabupaten Ponorogo	t
3503	35	Kabupaten Trenggalek	t
3504	35	Kabupaten Tulungagung	t
3505	35	Kabupaten Blitar	t
3506	35	Kabupaten Kediri	t
3507	35	Kabupaten Malang	t
3508	35	Kabupaten Lumajang	t
3509	35	Kabupaten Jember	t
3510	35	Kabupaten Banyuwangi	t
3511	35	Kabupaten Bondowoso	t
3512	35	Kabupaten Situbondo	t
3513	35	Kabupaten Probolinggo	t
3514	35	Kabupaten Pasuruan	t
3515	35	Kabupaten Sidoarjo	t
3516	35	Kabupaten Mojokerto	t
3517	35	Kabupaten Jombang	t
3518	35	Kabupaten Nganjuk	t
3519	35	Kabupaten Madiun	t
3520	35	Kabupaten Magetan	t
3521	35	Kabupaten Ngawi	t
3522	35	Kabupaten Bojonegoro	t
3523	35	Kabupaten Tuban	t
3524	35	Kabupaten Lamongan	t
3525	35	Kabupaten Gresik	t
3526	35	Kabupaten Bangkalan	t
3527	35	Kabupaten Sampang	t
3528	35	Kabupaten Pamekasan	t
3529	35	Kabupaten Sumenep	t
3571	35	Kota Kediri	t
3572	35	Kota Blitar	t
3573	35	Kota Malang	t
3574	35	Kota Probolinggo	t
3575	35	Kota Pasuruan	t
3576	35	Kota Mojokerto	t
3577	35	Kota Madiun	t
3578	35	Kota Surabaya	t
3579	35	Kota Batu	t
3601	36	Kabupaten Pandeglang	t
3602	36	Kabupaten Lebak	t
3603	36	Kabupaten Tangerang	t
3604	36	Kabupaten Serang	t
3671	36	Kota Tangerang	t
3672	36	Kota Cilegon	t
3673	36	Kota Serang	t
3674	36	Kota Tangerang Selatan	t
5101	51	Kabupaten Jembrana	t
5102	51	Kabupaten Tabanan	t
5103	51	Kabupaten Badung	t
5104	51	Kabupaten Gianyar	t
5105	51	Kabupaten Klungkung	t
5106	51	Kabupaten Bangli	t
5107	51	Kabupaten Karang Asem	t
5108	51	Kabupaten Buleleng	t
5171	51	Kota Denpasar	t
5201	52	Kabupaten Lombok Barat	t
5202	52	Kabupaten Lombok Tengah	t
5203	52	Kabupaten Lombok Timur	t
5204	52	Kabupaten Sumbawa	t
5205	52	Kabupaten Dompu	t
5206	52	Kabupaten Bima	t
5207	52	Kabupaten Sumbawa Barat	t
5208	52	Kabupaten Lombok Utara	t
5271	52	Kota Mataram	t
5272	52	Kota Bima	t
5301	53	Kabupaten Sumba Barat	t
5302	53	Kabupaten Sumba Timur	t
5303	53	Kabupaten Kupang	t
5304	53	Kabupaten Timor Tengah Selatan	t
5305	53	Kabupaten Timor Tengah Utara	t
5306	53	Kabupaten Belu	t
5307	53	Kabupaten Alor	t
5308	53	Kabupaten Lembata	t
5309	53	Kabupaten Flores Timur	t
5310	53	Kabupaten Sikka	t
5311	53	Kabupaten Ende	t
5312	53	Kabupaten Ngada	t
5313	53	Kabupaten Manggarai	t
5314	53	Kabupaten Rote Ndao	t
5315	53	Kabupaten Manggarai Barat	t
5316	53	Kabupaten Sumba Tengah	t
5317	53	Kabupaten Sumba Barat Daya	t
5318	53	Kabupaten Nagekeo	t
5319	53	Kabupaten Manggarai Timur	t
5320	53	Kabupaten Sabu Raijua	t
5321	53	Kabupaten Malaka	t
5371	53	Kota Kupang	t
6101	61	Kabupaten Sambas	t
6102	61	Kabupaten Bengkayang	t
6103	61	Kabupaten Landak	t
6104	61	Kabupaten Mempawah	t
6105	61	Kabupaten Sanggau	t
6106	61	Kabupaten Ketapang	t
6107	61	Kabupaten Sintang	t
6108	61	Kabupaten Kapuas Hulu	t
6109	61	Kabupaten Sekadau	t
6110	61	Kabupaten Melawi	t
6111	61	Kabupaten Kayong Utara	t
6112	61	Kabupaten Kubu Raya	t
6171	61	Kota Pontianak	t
6172	61	Kota Singkawang	t
6201	62	Kabupaten Kotawaringin Barat	t
6202	62	Kabupaten Kotawaringin Timur	t
6203	62	Kabupaten Kapuas	t
6204	62	Kabupaten Barito Selatan	t
6205	62	Kabupaten Barito Utara	t
6206	62	Kabupaten Sukamara	t
6207	62	Kabupaten Lamandau	t
6208	62	Kabupaten Seruyan	t
6209	62	Kabupaten Katingan	t
6210	62	Kabupaten Pulang Pisau	t
6211	62	Kabupaten Gunung Mas	t
6212	62	Kabupaten Barito Timur	t
6213	62	Kabupaten Murung Raya	t
6271	62	Kota Palangka Raya	t
6301	63	Kabupaten Tanah Laut	t
6302	63	Kabupaten Kota Baru	t
6303	63	Kabupaten Banjar	t
6304	63	Kabupaten Barito Kuala	t
6305	63	Kabupaten Tapin	t
6306	63	Kabupaten Hulu Sungai Selatan	t
6307	63	Kabupaten Hulu Sungai Tengah	t
6308	63	Kabupaten Hulu Sungai Utara	t
6309	63	Kabupaten Tabalong	t
6310	63	Kabupaten Tanah Bumbu	t
6311	63	Kabupaten Balangan	t
6371	63	Kota Banjarmasin	t
6372	63	Kota Banjar Baru	t
6401	64	Kabupaten Paser	t
6402	64	Kabupaten Kutai Barat	t
6403	64	Kabupaten Kutai Kartanegara	t
6404	64	Kabupaten Kutai Timur	t
6405	64	Kabupaten Berau	t
6409	64	Kabupaten Penajam Paser Utara	t
6411	64	Kabupaten Mahakam Hulu	t
6471	64	Kota Balikpapan	t
6472	64	Kota Samarinda	t
6474	64	Kota Bontang	t
6501	65	Kabupaten Malinau	t
6502	65	Kabupaten Bulungan	t
6503	65	Kabupaten Tana Tidung	t
6504	65	Kabupaten Nunukan	t
6571	65	Kota Tarakan	t
7101	71	Kabupaten Bolaang Mongondow	t
7102	71	Kabupaten Minahasa	t
7103	71	Kabupaten Kepulauan Sangihe	t
7104	71	Kabupaten Kepulauan Talaud	t
7105	71	Kabupaten Minahasa Selatan	t
7106	71	Kabupaten Minahasa Utara	t
7107	71	Kabupaten Bolaang Mongondow Utara	t
7108	71	Kabupaten Siau Tagulandang Biaro	t
7109	71	Kabupaten Minahasa Tenggara	t
7110	71	Kabupaten Bolaang Mongondow Selatan	t
7111	71	Kabupaten Bolaang Mongondow Timur	t
7171	71	Kota Manado	t
7172	71	Kota Bitung	t
7173	71	Kota Tomohon	t
7174	71	Kota Kotamobagu	t
7201	72	Kabupaten Banggai Kepulauan	t
7202	72	Kabupaten Banggai	t
7203	72	Kabupaten Morowali	t
7204	72	Kabupaten Poso	t
7205	72	Kabupaten Donggala	t
7206	72	Kabupaten Toli-Toli	t
7207	72	Kabupaten Buol	t
7208	72	Kabupaten Parigi Moutong	t
7209	72	Kabupaten Tojo Una-Una	t
7210	72	Kabupaten Sigi	t
7211	72	Kabupaten Banggai Laut	t
7212	72	Kabupaten Morowali Utara	t
7271	72	Kota Palu	t
7301	73	Kabupaten Kepulauan Selayar	t
7302	73	Kabupaten Bulukumba	t
7303	73	Kabupaten Bantaeng	t
7304	73	Kabupaten Jeneponto	t
7305	73	Kabupaten Takalar	t
7306	73	Kabupaten Gowa	t
7307	73	Kabupaten Sinjai	t
7308	73	Kabupaten Maros	t
7309	73	Kabupaten Pangkajene Dan Kepulauan	t
7310	73	Kabupaten Barru	t
7311	73	Kabupaten Bone	t
7312	73	Kabupaten Soppeng	t
7313	73	Kabupaten Wajo	t
7314	73	Kabupaten Sidenreng Rappang	t
7315	73	Kabupaten Pinrang	t
7316	73	Kabupaten Enrekang	t
7317	73	Kabupaten Luwu	t
7318	73	Kabupaten Tana Toraja	t
7322	73	Kabupaten Luwu Utara	t
7325	73	Kabupaten Luwu Timur	t
7326	73	Kabupaten Toraja Utara	t
7371	73	Kota Makassar	t
7372	73	Kota Parepare	t
7373	73	Kota Palopo	t
7401	74	Kabupaten Buton	t
7402	74	Kabupaten Muna	t
7403	74	Kabupaten Konawe	t
7404	74	Kabupaten Kolaka	t
7405	74	Kabupaten Konawe Selatan	t
7406	74	Kabupaten Bombana	t
7407	74	Kabupaten Wakatobi	t
7408	74	Kabupaten Kolaka Utara	t
7409	74	Kabupaten Buton Utara	t
7410	74	Kabupaten Konawe Utara	t
7411	74	Kabupaten Kolaka Timur	t
7412	74	Kabupaten Konawe Kepulauan	t
7413	74	Kabupaten Muna Barat	t
7414	74	Kabupaten Buton Tengah	t
7415	74	Kabupaten Buton Selatan	t
7471	74	Kota Kendari	t
7472	74	Kota Baubau	t
7501	75	Kabupaten Boalemo	t
7502	75	Kabupaten Gorontalo	t
7503	75	Kabupaten Pohuwato	t
7504	75	Kabupaten Bone Bolango	t
7505	75	Kabupaten Gorontalo Utara	t
7571	75	Kota Gorontalo	t
7601	76	Kabupaten Majene	t
7602	76	Kabupaten Polewali Mandar	t
7603	76	Kabupaten Mamasa	t
7604	76	Kabupaten Mamuju	t
7605	76	Kabupaten Mamuju Utara	t
7606	76	Kabupaten Mamuju Tengah	t
8101	81	Kabupaten Maluku Tenggara Barat	t
8102	81	Kabupaten Maluku Tenggara	t
8103	81	Kabupaten Maluku Tengah	t
8104	81	Kabupaten Buru	t
8105	81	Kabupaten Kepulauan Aru	t
8106	81	Kabupaten Seram Bagian Barat	t
8107	81	Kabupaten Seram Bagian Timur	t
8108	81	Kabupaten Maluku Barat Daya	t
8109	81	Kabupaten Buru Selatan	t
8171	81	Kota Ambon	t
8172	81	Kota Tual	t
8201	82	Kabupaten Halmahera Barat	t
8202	82	Kabupaten Halmahera Tengah	t
8203	82	Kabupaten Kepulauan Sula	t
8204	82	Kabupaten Halmahera Selatan	t
8205	82	Kabupaten Halmahera Utara	t
8206	82	Kabupaten Halmahera Timur	t
8207	82	Kabupaten Pulau Morotai	t
8208	82	Kabupaten Pulau Taliabu	t
8271	82	Kota Ternate	t
8272	82	Kota Tidore Kepulauan	t
9101	91	Kabupaten Fakfak	t
9102	91	Kabupaten Kaimana	t
9103	91	Kabupaten Teluk Wondama	t
9104	91	Kabupaten Teluk Bintuni	t
9105	91	Kabupaten Manokwari	t
9106	91	Kabupaten Sorong Selatan	t
9107	91	Kabupaten Sorong	t
9108	91	Kabupaten Raja Ampat	t
9109	91	Kabupaten Tambrauw	t
9110	91	Kabupaten Maybrat	t
9111	91	Kabupaten Manokwari Selatan	t
9112	91	Kabupaten Pegunungan Arfak	t
9171	91	Kota Sorong	t
9401	94	Kabupaten Merauke	t
9402	94	Kabupaten Jayawijaya	t
9403	94	Kabupaten Jayapura	t
9404	94	Kabupaten Nabire	t
9408	94	Kabupaten Kepulauan Yapen	t
9409	94	Kabupaten Biak Numfor	t
9410	94	Kabupaten Paniai	t
9411	94	Kabupaten Puncak Jaya	t
9412	94	Kabupaten Mimika	t
9413	94	Kabupaten Boven Digoel	t
9414	94	Kabupaten Mappi	t
9415	94	Kabupaten Asmat	t
9416	94	Kabupaten Yahukimo	t
9417	94	Kabupaten Pegunungan Bintang	t
9418	94	Kabupaten Tolikara	t
9419	94	Kabupaten Sarmi	t
9420	94	Kabupaten Keerom	t
9426	94	Kabupaten Waropen	t
9427	94	Kabupaten Supiori	t
9428	94	Kabupaten Mamberamo Raya	t
9429	94	Kabupaten Nduga	t
9430	94	Kabupaten Lanny Jaya	t
9431	94	Kabupaten Mamberamo Tengah	t
9432	94	Kabupaten Yalimo	t
9433	94	Kabupaten Puncak	t
9434	94	Kabupaten Dogiyai	t
9435	94	Kabupaten Intan Jaya	t
9436	94	Kabupaten Deiyai	t
9471	94	Kota Jayapura	t
\.


--
-- Data for Name: lab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lab (id, kode, nama, rs_id, status) FROM stdin;
2	Lab_AHP	Lab Adi Husada Pusat	2	t
3	Lab_AHK	Lab Adi Husada Kapasari	3	t
4	Lab_Darmo	Lab Darmo	4	t
5	Lab_Haji	Lab Haji	5	t
6	Lab_MU	Lab Mata Undaan	6	t
7	Lab_DMS	Lab Dr. Mohamad Soewandhie	7	t
8	Lab_Soetomo	Lab Soetomo	8	t
9	Lab_Premier	Lab Premier	9	t
10	Lab_Royal	Lab Royal	10	t
1	Lab_HU	Lab Husada Utama	1	t
\.


--
-- Data for Name: provinsi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinsi (id, nama, status) FROM stdin;
11	Aceh	t
12	Sumatera Utara	t
13	Sumatera Barat	t
14	Riau	t
15	Jambi	t
16	Sumatera Selatan	t
17	Bengkulu	t
18	Lampung	t
19	Kepulauan Bangka Belitung	t
21	Kepulauan Riau	t
31	DKI Jakarta	t
32	Jawa Barat	t
33	Jawa Tengah	t
34	DI Yogyakarta	t
35	Jawa Timur	t
36	Banten	t
51	Bali	t
52	Nusa Tenggara Barat	t
53	Nusa Tenggara Timur	t
61	Kalimantan Barat	t
62	Kalimantan Tengah	t
63	Kalimantan Selatan	t
64	Kalimantan Timur	t
65	Kalimantan Utara	t
71	Sulawesi Utara	t
72	Sulawesi Tengah	t
73	Sulawesi Selatan	t
74	Sulawesi Tenggara	t
75	Gorontalo	t
76	Sulawesi Barat	t
81	Maluku	t
82	Maluku Utara	t
91	Papua Barat	t
94	Papua	t
\.


--
-- Data for Name: refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_token (id, token, expiry_date, user_id) FROM stdin;
423	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsInJvbGUiOiJzdXBlcmFkbWluIiwidmVuZG9yX2lkIjpudWxsLCJpcCI6Ijo6ZmZmZjoxMjcuMC4wLjEiLCJpYXQiOjE2MzEyNjA3NTUsImV4cCI6MTYzMTQzMzU1NX0.iikg_mQbZCJ9Aja2YjJM3Q13acSOsvSU6F7qtAooje8	2021-09-12 03:59:15.484-04	26
372	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsInJvbGUiOiJzdXBlcmFkbWluIiwidmVuZG9yX2lkIjpudWxsLCJpcCI6Ijo6ZmZmZjoxMjcuMC4wLjEiLCJpYXQiOjE2MzA5OTk5OTQsImV4cCI6MTYzMTE3Mjc5NH0.nZsDTBc8_1XxzlOGNG5eP3OGirt0JKOMS4cmOFe375E	2021-09-09 03:33:14.474-04	27
374	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsInJvbGUiOiJzdXBlcmFkbWluIiwidmVuZG9yX2lkIjpudWxsLCJpcCI6Ijo6ZmZmZjoxMjcuMC4wLjEiLCJpYXQiOjE2MzEwNzAyMTIsImV4cCI6MTYzMTI0MzAxMn0.KnTGktRloySV1pkugosXjMC67iVV1uttvu0qdhszn-c	2021-09-09 23:03:32.002-04	27
380	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsInJvbGUiOiJzdXBlcmFkbWluIiwidmVuZG9yX2lkIjpudWxsLCJpcCI6Ijo6MSIsImlhdCI6MTYzMTA4NDcxOCwiZXhwIjoxNjMxMjU3NTE4fQ.F_j_LqnqY6kNbnAOLiv71r59rlZIrb7bGZxB-cVDKIc	2021-09-10 03:05:18.73-04	27
442	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjE5Mi4xNjguMTAwLjE0MyIsImlhdCI6MTYzMTUwMjc1OCwiZXhwIjoxNjMxNjc1NTU4fQ.0zHll_PaDV_1DCjY18eMbFGfDPVYtRDFh_ViwRv-eqc	2021-09-14 23:12:38.514-04	2
444	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjEyNy4wLjAuMSIsImlhdCI6MTYzMTUwMjkwMSwiZXhwIjoxNjMxNjc1NzAxfQ.579FZV9EUi9iroh2RTkYMX5fm4OHb5ma6LYMe5H6EYw	2021-09-14 23:15:01.816-04	1
445	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjE5Mi4xNjguMTAwLjE0MyIsImlhdCI6MTYzMTUwNjg2NCwiZXhwIjoxNjMxNjc5NjY0fQ.5GWpiK0xBeg_6tB3jvN4-eIdYdw6fC9CwXFALll_MxA	2021-09-15 00:21:04.582-04	2
446	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjE5Mi4xNjguMTAwLjE0MyIsImlhdCI6MTYzMTUwNjg2NSwiZXhwIjoxNjMxNjc5NjY1fQ.xcfoPdz59Lt5vID-zuD1cKvKUYM_qkB23yK5z9joSbs	2021-09-15 00:21:05.132-04	2
447	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjEyNy4wLjAuMSIsImlhdCI6MTYzMTUxODMwOCwiZXhwIjoxNjMxNjkxMTA4fQ.YjCAqiTx2zBA6U89Zcv3JMhx6UviMw6m3YU3zUA-bJ0	2021-09-15 03:31:48.844-04	1
448	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjE5Mi4xNjguMTAwLjE0MyIsImlhdCI6MTYzMTUyMTE2MCwiZXhwIjoxNjMxNjkzOTYwfQ.td1zoqPLkyQP3SrmhdXpp5GUCUwRP9eolrbP9GhWTmo	2021-09-15 04:19:20.725-04	2
449	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Miwicm9sZSI6InN1cGVyYWRtaW4iLCJ2ZW5kb3JfaWQiOm51bGwsImlwIjoiOjpmZmZmOjE5Mi4xNjguMTAwLjE0MyIsImlhdCI6MTYzMTUyMTE2MSwiZXhwIjoxNjMxNjkzOTYxfQ.h3r8-Wx_lQ_MJ3zsmQxBLbCJiYJy2pQe74gmPlcGqA4	2021-09-15 04:19:21.18-04	2
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, nama) FROM stdin;
1	superadmin
2	admin
3	vendor
4	rs
5	lab
\.


--
-- Data for Name: rumah_sakit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rumah_sakit (id, kode, nama, provinsi_id, kota_id, kecamatan_id, alamat, kategori_id, vendor_id, status) FROM stdin;
2	RSU_AHP	RS Adi Husada Pusat	35	3578	3578190	Jl. Undaan Wetan No.40-44, Ketabang	1	1	t
3	RSU_AHK	RS Adi Husada Kapasari	35	3578	3578220	Jl. Kapasari No.97-101, Kapasan	1	1	t
4	RSU_Darmo	RS Darmo	35	3578	3578180	Jl. Raya Darmo No.90, DR. Soetomo	1	2	t
5	RSU_Haji	RSU Haji Surabaya	35	3578	3578080	Jl. Manyar Kertoadi, Klampis Ngasem	1	2	t
6	RSUD_MU	RS Mata Undaan	35	3578	3578190	Jl. Undaan Kulon No.19, Peneleh	4	2	t
7	RSUD_MS	RSUD Dr. Mohamad Soewandhie	35	3578	3578220	Jl. Tambak Rejo No.45-47, Tambakrejo	2	3	t
8	RSS_Soetomo	RSU Dr. Soetomo	35	3578	3578100	Jl. Mayjen Prof. Dr. Moestopo No.6-8, Airlangga	2	3	t
9	RSS_Premier	RS Premier Surabaya	35	3578	3578080	Jl. Nginden Intan Barat No.B, Ngenden Jangkungan	3	4	t
10	RSS_Royal	RS Royal Surabaya	35	3578	3578070	Jl. Rungkut Industri I No.1, Kendangsari	3	4	t
1	RSU_HU	RS Husada Utama	35	3578	3578200	Jl. Mayjen Prof. Dr. Moestopo No.31-35, Pacar Keling	1	1	t
\.


--
-- Data for Name: t_pasien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pasien (id, no_lab, no_reg, no_rm, nik, nama, provinsi, kota, kecamatan, alamat, gender, usia_hari, usia_bulan, usia_tahun, diagnosa_awal, icdt, penjamin, unit_asal, dokter_pengirim, waktu_registrasi, waktu_checkin, waktu_terbit, kode_rs, kode_lab, registrasi_id) FROM stdin;
25	2360	5920	6727	1196744158950326	Linda Aqila	Berkshire	Hermawanmouth	Fujiati Turnpike	87041 Nakia Dam	Laki-laki	3	1	26	est	est	Makara Fabian	Nainggolanchester	dr.Shannon	2020-11-24 17:47:43.02-05	2021-03-19 03:49:55.291-04	2020-12-04 00:49:24.471-05	RSUD_MU	Lab_MU	1007
23	7939	2251	9459	2853317431260915	Hana Ananda S.H.	Berkshire	Bagaskarashire	Raphael Burg	15306 Cordia Manor	Perempuan	28	9	68	voluptate	vero	Elvin Prakasa	Hassanahport	dr.Esteban	2021-06-03 06:33:21.229-04	2020-12-12 00:40:13.762-05	2020-10-10 11:33:15.611-04	RSUD_MU	Lab_MU	1006
24	7634	7702	2613	3586032977570660	Martaka Lesmana S.Pd	Bedfordshire	New Margaret	Jayce Trail	03304 Derick Trace	Laki-laki	22	6	89	ea	corrupti	Hari Budiman	New Immanuel	dr.Megane	2021-07-30 23:53:05.127-04	2021-06-20 12:17:10.151-04	2020-12-12 07:36:54.906-05	RSS_Royal	Lab_Royal	1010
27	3659	8455	4298	1207481143050715	Tania Aurelia	Bedfordshire	Suwarnoville	Haryanti Route	302 Anjani Flats	Perempuan	8	6	52	nulla	assumenda	Kirana Halimah	Lake Arthurstad	dr.Josh	2021-05-22 01:58:02.442-04	2021-08-09 00:11:21.571-04	2021-01-08 04:39:39.524-05	RSS_Soetomo	Lab_Soetomo	1005
30	2623	1794	9634	3092540897484079	Zelaya Fathina	Bedfordshire	North Kelsie	Purnawati Well	784 Timmy Extensions	Laki-laki	16	2	48	hic	autem	Kayla Aqila	New Gloriaview	dr.Zander	2020-10-11 05:01:27.265-04	2021-01-21 06:43:52.909-05	2021-03-14 17:34:09.609-04	RSS_Soetomo	Lab_Soetomo	1006
17	4553	6445	5438	3189808880827887	Lintang Mayasari	Bedfordshire	Delbertberg	Donavon Squares	305 Neal Harbors	Perempuan	25	9	45	eum	nobis	Ana Astuti S.E.	Aureliaborough	dr.Walter	2020-11-21 05:38:23.937-05	2020-11-13 01:27:28.452-05	2021-06-30 13:35:24.471-04	RSS_Royal	Lab_Royal	1001
7	3946	8342	3845	165660306429878	Yoga Utama	Borders	East Julesmouth	Reymundo Vista	3910 Jarrell Loaf	Perempuan	17	10	54	ut	voluptatem	Melani Anjani	Pekalongan	dr.Brooke	2021-01-23 07:21:13.923-05	2021-02-25 13:59:27.628-05	2021-01-17 04:29:00.451-05	RSU_AHK	Lab_AHK	1007
5	9529	1149	8192	1167076193754065	Samsul Situmorang	Buckinghamshire	Soe	Nicola Street	701 Maya Harbors	Laki-laki	4	4	53	unde	non	Putri Winarsih S.Farm	West Jennyfer	dr.Sandra	2021-03-28 21:39:17.998-04	2020-11-23 03:29:59.561-05	2021-01-13 08:36:26.598-05	RSU_Darmo	Lab_Darmo	1009
3	8053	7779	1194	2101902021836313	Hartaka Sitompul	Bedfordshire	Haryantofurt	Xzavier Islands	1302 Abiputra Plaza	Perempuan	23	11	63	aut	corporis	Wulan Rachmawati	Port Bransonmouth	dr.Chance	2021-07-27 15:28:35.702-04	2020-09-25 16:36:36.355-04	2021-05-29 09:28:55.043-04	RSU_HU	Lab_HU	1009
11	2397	1567	3238	3231587375090840	Anggun Saraswati	Avon	West Novellaborough	Alanna Dam	70246 Melinda Keys	Perempuan	25	8	54	repellendus	in	Rusman Sihotang S.Gz	Bojonegoro	dr.Rosina	2021-02-11 10:10:52.066-05	2021-01-20 07:06:58.658-05	2021-05-21 21:13:29.653-04	RSU_Haji	Lab_Haji	1010
8	4487	7429	9650	3116400484876716	Victoria Anandya M.M.	Bedfordshire	East Simonefurt	Ransom Neck	877 Garland Underpass	Laki-laki	18	8	85	labore	non	Siti Anggraini	Ciamis	dr.Eda	2020-12-31 06:25:33.962-05	2021-03-03 21:24:09.471-05	2020-10-31 21:24:28.926-04	RSUD_MS	Lab_MS	1011
10	9889	5956	3263	3061338285780504	Wulandari Purwanti	Avon	Porterfurt	Jake Locks	5850 Easter Plaza	Perempuan	16	9	45	ad	aut	Ria Harini	Cikampek	dr.Carlie	2021-06-29 03:29:31.255-04	2020-10-25 10:42:32.504-04	2020-12-25 03:07:17.93-05	RSUD_MU	Lab_MU	1008
19	1479	2888	5198	110434271762522	Zaenab Handayani	Avon	Lake Newell	Eloisa Mountains	312 Garnet Mountain	Laki-laki	30	8	36	qui	animi	Prayoga Adriansyah	West Leonard	dr.Jan	2021-08-26 00:49:35.778-04	2021-07-13 07:56:57.947-04	2021-09-27 04:23:34-04	RSS_Premier	Lab_Premier	1011
6	2544	6661	7695	1022453451277557	Tantri Rahimah	Berkshire	Kayleeburgh	Zulaika Coves	95500 Mustafa Drives	Laki-laki	29	4	33	dolorum	ullam	Padmi Ramadhani	Saputristad	dr.Charley	2020-12-23 19:05:44.421-05	2021-07-02 07:11:46.413-04	2021-01-18 16:37:55.318-05	RSS_Royal	Lab_Royal	1014
12	2597	8332	2339	749988484547652	Cawisono Purnama	Berkshire	Sihombingstad	Keeley Village	79508 Wiley Square	Perempuan	13	1	60	iusto	quo	Hendri Hidayat	Saefullahton	dr.Broderick	2021-05-07 05:38:24.516-04	2021-01-19 22:27:46.236-05	2020-10-29 03:14:13.472-04	RSU_Haji	Lab_Haji	1001
9	2670	4228	5514	1786777705200287	Tri Herlambang S.H.	Avon	Westleyberg	Darby Path	442 Anggraini Wall	Laki-laki	15	2	65	tempora	consequatur	Prabowo Wardana	Sengkang	dr.Annie	2020-12-23 09:10:02.342-05	2021-03-29 11:10:50.833-04	2020-11-14 22:12:42.83-05	RSU_HU	Lab_HU	1001
18	6575	1567	9938	1479695952991074	Prayitna Manullang	Borders	East Alicia	Azzahra Glens	156 Mohamed Greens	Laki-laki	24	9	61	dolorem	facilis	Darmana Darojat	Watampone	dr.Leonie	2021-04-06 05:52:46.487-04	2021-08-10 15:03:57.299-04	2021-07-05 14:52:25.684-04	RSUD_MS	Lab_MS	1002
13	1057	3400	7256	1856565097949852	Harsana Simanjuntak S.IP	Avon	North Kelley	Haleigh Parkway	1915 Boris River	Laki-laki	22	11	41	praesentium	dolores	Ivan Prayoga	Surabaya	dr.Nils	2021-08-12 10:18:22.421-04	2020-11-12 10:29:17.497-05	2021-01-27 17:30:04.51-05	RSU_Haji	Lab_Haji	1002
15	6415	2807	1958	832423993051027	Wisnu Prasetyo S.Gz	Berkshire	Julienstad	Safitri Shoals	55991 Mahestri Gateway	Laki-laki	30	7	79	non	animi	Padmi Suryatmi	Tanjung	dr.Shawna	2021-03-11 23:03:51.559-05	2021-07-05 10:59:39.344-04	2021-01-14 15:15:43.383-05	RSUD_MU	Lab_MU	1001
16	9892	1259	8163	263692636529708	Candra Suwarno	Avon	South Hollieborough	Jeremie Forest	349 Savannah Place	Perempuan	16	1	53	et	reprehenderit	Irma Hartati	Ramadhaniview	dr.Kenyatta	2021-06-13 10:40:14.364-04	2021-06-29 02:12:08.506-04	2021-05-22 02:42:29.702-04	RSUD_MS	Lab_MS	1001
21	4681	5970	6255	234910570486497	Mahmud Agustian	Buckinghamshire	Port Jerald	Kaylie Burg	9753 Puspasari Courts	Laki-laki	19	5	31	iure	deserunt	Gilang Sihombing	Kelsiebury	dr.Elijah	2021-08-02 11:53:09.758-04	2021-05-30 06:25:37.093-04	2021-04-25 21:36:31.988-04	RSS_Premier	Lab_Premier	1001
14	5755	8260	2418	2686184001069132	Dono Maulana	Bedfordshire	Graysonside	Hutagalung Plain	799 Eliezer Locks	Laki-laki	19	1	31	est	ex	Mutia Maheswari	Winarsihton	dr.Maria	2021-05-06 11:54:33.208-04	2021-08-13 02:52:46.298-04	2021-09-06 01:25:57-04	RSU_Darmo	Lab_Darmo	1001
20	7340	9196	6109	756048171093714	Dariati Satria M.Ak	Buckinghamshire	Leonardhaven	Blair Roads	4328 Herminia Roads	Laki-laki	14	1	65	eaque	laudantium	Yessi Ramadhani	Nashiruddinchester	dr.Leo	2020-12-25 19:20:05.938-05	2021-05-27 15:18:59.423-04	2020-10-17 21:16:41.397-04	RSUD_MU	Lab_MU	1002
22	1328	9110	3522	3366560412565505	Ajimat Sirait	Buckinghamshire	Maumere	Mayasari Highway	9206 Saptono Views	Laki-laki	29	8	34	rerum	rerum	Luthfi Maulana	Fletcherburgh	dr.Paolo	2021-03-20 20:56:23.781-04	2021-01-22 09:10:27.641-05	2020-12-13 07:42:18.925-05	RSU_AHK	Lab_AHK	1001
2	1869	4027	9348	2525992168404067	Enteng Ardana	Bedfordshire	Cianjur	Lela Landing	6346 Firgantoro Curve	Perempuan	18	2	82	ut	suscipit	Yoga Aswandi	Pati	dr.Alayna	2021-07-18 00:29:48.223-04	2020-10-13 11:58:51.732-04	2021-09-04 04:07:45-04	RSU_AHP	Lab_AHP	1008
58	3125	1868	5359	1058019791526163	Sakura Usada	Bedfordshire	Kolaka	Guido Lodge	3033 Suwarno Spur	Perempuan	19	1	85	non	vero	Dina Pertiwi	Maheswaribury	dr.Lorenza	2021-02-07 10:44:19.411-05	2021-03-28 13:03:15.288-04	2021-03-23 01:24:02.621-04	RSUD_MS	Lab_MS	1005
38	4255	1530	8688	3581721164941311	Erik Marpaung	Bedfordshire	Salmaberg	Wicaksono Union	507 Juwita Curve	Perempuan	12	2	38	quibusdam	repellat	Eva Anjani M.Farm	Abimanyushire	dr.Joanny	2020-11-05 18:55:07.703-05	2021-08-20 04:43:50.102-04	2021-05-08 18:10:29.978-04	RSUD_MS	Lab_MS	1007
41	6503	4403	4574	217976330652840	Rita Sudiati	Cambridgeshire	Hartatiview	Prasetya Valleys	79329 Orval Brooks	Laki-laki	28	1	35	aliquam	accusantium	Cawuk Simbolon	South Jaquelinside	dr.Damion	2021-06-04 08:33:24.578-04	2021-06-24 00:27:28.086-04	2021-08-04 05:04:25-04	RSUD_MU	Lab_MU	1003
44	7712	4792	8604	3544528949090269	Pranawa Sirait S.I.Kom	Avon	Kierahaven	Najmudin Spur	126 Tracy Field	Perempuan	3	10	86	in	voluptates	Ami Nathania	Lillianaview	dr.Ashtyn	2021-04-13 17:59:13.448-04	2020-10-24 23:51:19.596-04	2021-04-01 01:30:32.562-04	RSS_Premier	Lab_Premier	1004
32	6865	8299	4581	3128846021353430	Candra Satria	Avon	Malikaville	Stanford Canyon	3035 Lexie Tunnel	Laki-laki	20	3	88	reiciendis	vel	Widya Mustika	Violettetown	dr.Dell	2020-12-31 13:22:24.114-05	2020-09-26 01:09:55.857-04	2020-09-14 01:12:59.976-04	RSS_Premier	Lab_Premier	1005
55	9618	7835	8914	3367400023650150	Lintang Mayasari	Borders	Andolo	Carissa Creek	0468 Donna Mount	Perempuan	27	1	61	est	quidem	Nilam Hariyah	Evashire	dr.Alba	2021-07-09 01:29:11.077-04	2020-09-06 01:36:58.632-04	2021-09-26 23:48:47-04	RSS_Premier	Lab_Premier	1007
35	8930	1936	1320	3714367485176696	Melani Namaga S.T.	Cambridgeshire	Asatown	Rahimah Cape	166 Roxanne Avenue	Laki-laki	28	1	19	vitae	sint	Simon Simanjuntak S.H.	Karanganyar	dr.Reina	2021-01-27 03:47:42.364-05	2021-02-23 21:37:13.62-05	2020-10-21 21:40:43.453-04	RSS_Premier	Lab_Premier	1010
37	8986	7738	1047	2020116273290954	Janet Nurdiyanti	Bedfordshire	Bau-Bau	Maheswari Drive	9447 Saputri Station	Laki-laki	14	7	49	est	dolor	Raisa Hartati	North Calistafort	dr.Tod	2021-05-24 19:34:51.115-04	2021-02-26 01:54:14.348-05	2020-11-21 11:56:40.333-05	RSS_Royal	Lab_Royal	1002
43	5709	8240	3609	3333690271014499	Digdaya Purwadi	Bedfordshire	West Celia	Annamae Pike	28339 Kurniawan Corner	Laki-laki	22	8	84	nostrum	odio	Anggun Ramadhani	Denpasar	dr.Genesis	2021-04-28 09:34:40.892-04	2021-06-10 04:41:56.406-04	2020-12-17 23:11:03.381-05	RSS_Royal	Lab_Royal	1005
46	6214	5728	9537	307143944759489	Carla Azizah	Borders	Polewali	Yanuar Mountain	5942 Fernanda Row	Perempuan	9	11	41	fugiat	illo	Irawati Leilani	New Emerson	dr.Bettye	2020-10-13 20:25:36.229-04	2020-12-22 09:26:13.064-05	2021-04-05 12:50:47.621-04	RSS_Royal	Lab_Royal	1009
34	6241	1723	2443	2482213310730249	Hadi Mangunsong S.IP	Avon	Fabianview	Syahreza Tunnel	3620 Mandala Route	Laki-laki	19	8	89	est	voluptatem	Lanjar Alamsyah	Port Juliet	dr.Peggie	2021-02-18 19:52:05.655-05	2020-10-08 17:52:19.006-04	2021-07-07 06:00:21.225-04	RSS_Royal	Lab_Royal	1011
52	6978	4991	2796	523775586765985	Kusuma Lesmana	Cambridgeshire	Purnawatiberg	Nurdiyanti Isle	1057 Ebony Shoals	Laki-laki	19	8	55	nam	saepe	Cahyanto Faresta S.IP	North Dolly	dr.Hans	2021-08-02 23:22:44.907-04	2020-09-29 16:43:45.778-04	2021-05-21 04:31:59.673-04	RSS_Soetomo	Lab_Soetomo	1001
48	7369	1750	2110	264791715713449	Wisnu Maulana	Cambridgeshire	South Burnicemouth	Meggie Locks	73415 Carolyne Circles	Perempuan	18	4	73	perferendis	id	Caraka Antoni	North Aylinborough	dr.Ethan	2021-03-12 16:45:41.702-05	2020-09-18 08:05:43.056-04	2021-09-12 05:55:40-04	RSS_Soetomo	Lab_Soetomo	1003
59	3790	6101	9277	242223884631745	Margana Situmorang	Berkshire	Pemalang	Zahrah Knolls	247 Narpati Alley	Laki-laki	17	1	78	tempora	et	Dian Halimah	Cilegon	dr.Dereck	2021-08-11 11:49:07.364-04	2021-07-25 08:19:06.378-04	2021-05-19 01:00:15.829-04	RSS_Soetomo	Lab_Soetomo	1007
57	2186	4192	6156	2296371511552089	Kawaca Kusumo S.Gz	Buckinghamshire	Bantaeng	Janie Coves	0630 Troy Plains	Perempuan	22	5	19	ipsum	nostrum	Bahuraksa Saefullah	West Sofiafort	dr.Jabari	2021-07-26 18:48:32.657-04	2021-05-21 08:18:16.191-04	2021-03-11 01:01:48.521-05	RSU_HU	Lab_HU	1005
45	3081	6370	2531	582172421935673	Nabila Fujiati	Cambridgeshire	Margueritebury	Alayna Lights	62671 Ahmed Road	Laki-laki	14	7	49	omnis	in	Halim Perdana M.TI.	Port Annabellview	dr.Shyann	2021-04-29 01:18:04.799-04	2020-12-22 02:43:25.32-05	2021-03-11 12:37:16.558-05	RSU_HU	Lab_HU	1008
33	8946	1687	1906	3342278232183244	Bajragin Wacana	Borders	Ninatown	Dane Cape	5336 Corrine Court	Perempuan	20	3	39	omnis	qui	Maida Azizah	Purnamachester	dr.Margarette	2020-11-19 09:49:27.94-05	2021-04-22 03:57:22.16-04	2021-04-16 06:53:38.624-04	RSU_Darmo	Lab_Darmo	1007
56	4523	9776	5944	3804503277600736	Maryadi Tamba	Bedfordshire	Waikabubak	Aryanti Courts	3803 Haryanto Mill	Laki-laki	28	8	20	quas	ea	Atma Arifin	Bumiayu	dr.Margaret	2020-10-11 21:12:07.186-04	2021-08-20 14:56:08.048-04	2021-01-07 22:37:04.379-05	RSU_Haji	Lab_Haji	1009
42	9074	6659	1416	385830411426249	Gaiman Sihombing	Bedfordshire	North Moshe	Agustina Lakes	0848 Napitupulu Ports	Perempuan	18	7	18	fugit	minima	Tedi Wijaya	Namagaville	dr.Gus	2021-01-23 15:22:46.52-05	2021-03-21 22:13:43.363-04	2021-07-08 21:17:09.641-04	RSU_Darmo	Lab_Darmo	1008
31	9165	1838	6796	3859067183680389	Rachel Saputri	Berkshire	Laurahaven	Yulianti Heights	67005 Padmasari Spring	Perempuan	3	5	76	velit	et	Cindy Fathina M.Farm	Sageborough	dr.Joyce	2020-09-11 08:10:21.946-04	2020-11-16 05:45:52.461-05	2020-12-06 21:20:12.761-05	RSU_AHK	Lab_AHK	1005
60	9757	7687	7667	3886697846795694	Vinsen Yudhistira	Berkshire	North Andrewville	Hugh Stravenue	911 Wijayanti Highway	Perempuan	16	11	88	quidem	sit	Unjani Mardhiyah	Cikampek	dr.Lyric	2021-08-09 06:01:45.949-04	2021-06-01 22:17:36.198-04	2021-03-30 21:30:53.275-04	RSU_AHK	Lab_AHK	1006
39	7175	9538	7170	467109030361570	Cahyono Antoni	Buckinghamshire	Lake Kyleefort	Ocie Overpass	1849 Saefullah Radial	Perempuan	25	7	78	enim	est	Yuni Anjani	South Jabariton	dr.Viva	2021-02-19 07:25:32.132-05	2021-06-17 05:49:30.391-04	2021-01-23 21:04:18.585-05	RSU_HU	Lab_HU	1004
49	2037	6475	2785	2481206348760150	Ria Fernanda	Borders	South Clarkmouth	Chase Underpass	37587 Natsir Throughway	Laki-laki	17	10	25	ipsum	eum	Lutfan Gunawan	Jenniehaven	dr.Orland	2021-01-15 11:45:43.389-05	2021-05-22 21:17:35.342-04	2020-11-29 05:28:33.467-05	RSU_AHK	Lab_AHK	1003
36	1602	7287	3012	2367037394725416	Ida Afifah	Buckinghamshire	Pertiwiberg	Eddie Oval	38032 Sydnee Lakes	Perempuan	24	7	62	possimus	expedita	Tania Prastuti S.Psi	Port Ryleytown	dr.Eudora	2021-08-06 01:04:06.601-04	2021-08-15 03:38:04.079-04	2020-12-16 06:40:41.645-05	RSU_AHK	Lab_AHK	1004
40	4743	9479	2279	3342454566443271	Nova Winarsih	Avon	Lestaristad	Widiastuti Trail	0695 Yudhistira Loop	Laki-laki	28	10	47	alias	placeat	Indah Anggraini	Sylvestermouth	dr.Aiyana	2020-11-13 11:35:46.847-05	2021-07-04 16:15:51.742-04	2021-06-16 11:47:02.986-04	RSU_Darmo	Lab_Darmo	1003
82	2589	9330	2867	2804478114204857	Anggun Palastri	Avon	Deshaunville	Azzahra Trail	9290 Palastri Trafficway	Laki-laki	19	5	81	saepe	velit	Banara Saputra	South Shaina	dr.Kolby	2021-08-22 19:05:51.805-04	2021-05-19 03:29:41.76-04	2021-04-09 01:49:00.66-04	RSUD_MS	Lab_MS	1003
65	4941	4488	5877	2555227304951857	Gilda Rahayu	Buckinghamshire	Port Maddisonland	Astuti Estates	142 Mangunsong Port	Perempuan	6	3	70	deserunt	sit	Elma Jelita	East Mckenzie	dr.Cordie	2021-06-09 19:51:34.305-04	2021-07-07 22:15:59.775-04	2021-03-26 15:11:48.74-04	RSUD_MS	Lab_MS	1006
69	6734	5645	6584	1381777247251188	Wahyu Tarihoran	Bedfordshire	Port Celestineville	Kuswandari Locks	60563 Palastri Mills	Perempuan	29	7	71	impedit	eos	Heryanto Gunawan	Arahaven	dr.Arnold	2021-02-16 17:52:34.719-05	2021-06-19 11:28:16.572-04	2021-05-22 19:45:06.113-04	RSUD_MS	Lab_MS	1008
83	2845	8020	7556	1730589905991967	Zizi Saputri	Avon	West Tomasview	Tristin Mews	45019 Suwarno Villages	Perempuan	2	2	63	expedita	qui	Hilda Lestari	East Green	dr.Rosemarie	2021-07-05 17:04:32.565-04	2021-01-08 00:49:59.456-05	2021-09-12 05:55:40-04	RSUD_MS	Lab_MS	1009
79	5755	2980	4568	2994486736947941	Gadis Aurelia	Bedfordshire	Trenggalek	Victor Pass	7955 Oktovian Ports	Laki-laki	4	11	43	eveniet	neque	Hafshah Aqila S.Sos	South Kaylie	dr.Shannon	2020-09-16 20:30:36.933-04	2021-04-22 01:32:32.971-04	2020-09-18 18:08:13.042-04	RSUD_MS	Lab_MS	1010
64	2816	1120	2813	3033208409944315	Titin Astuti	Cambridgeshire	Nolanfurt	Iswahyudi Passage	035 Hermina Crescent	Perempuan	16	7	34	quidem	fuga	Fathonah Pratiwi	Adhitamaburgh	dr.Samir	2021-07-06 21:09:25.878-04	2020-11-27 15:32:18.074-05	2020-10-22 18:34:07.727-04	RSS_Premier	Lab_Premier	1003
78	4655	6515	6031	1957303239050975	Hana Pudjiastuti	Buckinghamshire	Jewelfort	Puspita Extension	8001 Pratiwi Stream	Laki-laki	18	10	49	consequuntur	doloribus	Eli Handayani	Kawangkoan	dr.Lorine	2021-06-17 05:34:34.044-04	2021-04-11 07:06:20.044-04	2021-04-23 21:32:19.624-04	RSS_Premier	Lab_Premier	1006
61	3313	5908	1009	2753599332369187	Gilda Fernanda M.Kom.	Cambridgeshire	Amurang	Usamah Lake	7706 Kusmawati Causeway	Laki-laki	26	1	67	tempore	fuga	Cahya Sitompul	Winifredborough	dr.Jacey	2021-05-05 01:28:57.024-04	2021-08-31 21:53:50.756-04	2021-05-17 23:56:33.872-04	RSS_Premier	Lab_Premier	1008
88	2447	1303	4687	1307031464648620	Puput Safitri	Avon	West Molly	Saraswati Point	4918 Lazuardi Extension	Laki-laki	30	4	87	cupiditate	voluptate	Salsabila Rahimah S.IP	Port Delilah	dr.Hailie	2020-11-01 00:32:49.329-04	2021-06-06 18:17:25.243-04	2020-11-23 14:52:07.692-05	RSS_Premier	Lab_Premier	1009
63	9996	2814	7318	831263792547401	Atma Abiputra	Bedfordshire	South Bridgette	Cathryn Forge	8079 Carolyn Lock	Laki-laki	10	2	69	non	ut	Queen Astuti	Anandastad	dr.Rory	2021-02-11 09:21:14.578-05	2020-09-17 13:36:58.144-04	2021-06-04 19:36:27.84-04	RSS_Royal	Lab_Royal	1003
73	9854	8142	1961	3967908686309210	Harjo Narpati S.Kom	Avon	South Sidview	Narpati Forks	25522 Waskita Lane	Laki-laki	4	3	77	ut	enim	Silvia Ningrum S.T.	South Shyannshire	dr.Ellsworth	2021-03-10 11:32:41.235-05	2020-09-06 19:56:22.631-04	2021-07-03 18:41:11.017-04	RSS_Royal	Lab_Royal	1004
70	1650	9187	4242	1106096538992234	Hafshah Nurdiyanti	Cambridgeshire	Wilmastad	Emanuel Avenue	1782 Destiney Spur	Perempuan	16	4	37	voluptatem	quam	Yuni Susanti	Soe	dr.Ernie	2021-01-22 00:19:44.274-05	2021-05-29 07:24:09.141-04	2020-10-14 20:06:21.186-04	RSS_Royal	Lab_Royal	1006
62	3418	9809	3330	3491489880267452	Nimas Laksmiwati	Buckinghamshire	Firmansyahberg	Hutagalung Garden	5433 Vicenta Well	Perempuan	23	1	73	molestiae	sit	Jessica Winarsih	Port Maximilliantown	dr.Skyla	2021-07-23 20:08:53.218-04	2020-12-09 17:51:29.59-05	2021-09-21 01:59:20-04	RSS_Royal	Lab_Royal	1013
74	4080	3028	7599	586910310354158	Galak Manullang	Buckinghamshire	Negara,Bali	Alayna Stream	17339 Widodo Lane	Perempuan	12	4	39	ut	in	Nalar Uwais	Trenggalek	dr.Pablo	2020-09-10 06:56:20.097-04	2021-02-07 19:05:14.89-05	2020-10-26 04:13:48.176-04	RSU_Haji	Lab_Haji	1003
77	8026	8190	1410	702627255898869	Ulya Riyanti	Bedfordshire	New Madisynhaven	Damanik View	701 Mahardika Shore	Laki-laki	27	3	43	aut	harum	Intan Lailasari	Mulyaniside	dr.Wilford	2020-12-13 16:56:10.783-05	2021-06-10 14:52:10.766-04	2021-07-14 01:59:24.043-04	RSU_Haji	Lab_Haji	1005
68	2473	5252	1644	471079425520447	Adikara Pradipta S.IP	Berkshire	New Brice	Arvid Fall	756 Casimer Corners	Perempuan	30	10	28	et	velit	Icha Oktaviani	North Joanny	dr.Clint	2021-01-02 06:14:46.406-05	2021-02-09 03:12:02.27-05	2021-02-07 02:27:06.029-05	RSU_Haji	Lab_Haji	1006
71	7172	1974	6985	3906207592249620	Kambali Wibisono S.E.I	Buckinghamshire	Arifinbury	Anjani Terrace	69693 Dulce Mount	Laki-laki	2	4	87	laudantium	reiciendis	Ade Zulkarnain	New Kendallstad	dr.Sienna	2021-08-07 15:03:58.194-04	2021-07-11 19:19:19.274-04	2020-10-04 19:00:27.229-04	RSU_Darmo	Lab_Darmo	1005
66	1756	6436	2017	1411637765089409	Belinda Padmasari	Cambridgeshire	Angieborough	Gregory Junction	26770 Jared Key	Perempuan	26	7	72	praesentium	iste	Prabu Salahudin	East Macieberg	dr.Junior	2021-01-25 00:58:06.241-05	2020-11-15 17:37:30.629-05	2021-04-22 11:50:28.029-04	RSS_Soetomo	Lab_Soetomo	1002
80	2813	3372	3689	2220499547287001	Hamzah Mansur	Bedfordshire	Hunterborough	Hilario Divide	495 Waskita Mission	Perempuan	2	6	70	repellat	veniam	Jaga Irawan	Kajen	dr.Deonte	2021-07-04 08:47:48.984-04	2021-01-14 13:49:16.138-05	2021-04-24 11:30:43.472-04	RSS_Soetomo	Lab_Soetomo	1009
76	5419	2081	9468	3077495759133768	Mahesa Nainggolan	Buckinghamshire	Mandalachester	Fredrick Causeway	2438 Saraswati Path	Perempuan	16	2	45	qui	ex	Bambang Kusumo	Purbalingga	dr.Forest	2020-09-08 14:26:25.172-04	2021-05-18 05:26:57.578-04	2021-07-05 02:56:19.756-04	RSU_Haji	Lab_Haji	1008
85	5910	8920	6045	2292493829092180	Jindra Saputra	Buckinghamshire	Agustinaton	Aryani Rue	515 Suwarno Place	Perempuan	15	1	58	voluptatem	est	Gandi Saragih	West Amaya	dr.Jaylon	2021-04-28 01:05:03.195-04	2020-12-21 20:00:58.975-05	2021-05-13 15:21:12.653-04	RSS_Soetomo	Lab_Soetomo	1012
84	9102	3437	7802	3221850439385206	Pandu Nashiruddin	Bedfordshire	New Sammie	Prabowo River	74359 Orland Fort	Laki-laki	30	9	90	dicta	voluptates	Tina Winarsih S.Gz	Port Ramiroview	dr.Jarrett	2020-11-28 05:02:34.337-05	2020-12-11 21:50:00.821-05	2021-06-01 05:56:27.605-04	RSS_Soetomo	Lab_Soetomo	1013
67	3681	7946	2710	147172999990558	Jane Hastuti	Borders	New America	Permata Shoal	99087 Olin Shoal	Perempuan	8	8	90	aut	et	Hasim Wasita	Pekalongan	dr.Neva	2021-05-24 18:22:20.135-04	2021-08-07 08:57:51.4-04	2021-02-04 08:02:03.433-05	RSU_Darmo	Lab_Darmo	1006
72	5176	4596	6940	1021755780298149	Kenes Maulana	Bedfordshire	New Nikolasview	Purnawarman Village	5114 Irfandi Mission	Perempuan	10	5	18	in	corporis	Ratih Safitri	Gresik	dr.Tyrese	2021-03-19 07:12:19.023-04	2020-11-06 09:05:53.237-05	2021-03-14 09:18:24.756-04	RSU_HU	Lab_HU	1003
93	7635	4733	5858	864543461712644	Ganesha Farida	Berkshire	East Aubree	Maharani Villages	846 Damayanti Cape	Perempuan	17	6	87	cumque	ducimus	Mulyanto Rendra M.Farm	Pemalang	dr.Amos	2021-06-28 23:31:39.529-04	2021-03-31 16:41:39.708-04	2020-09-28 03:09:56.162-04	RSUD_MS	Lab_MS	1004
96	5678	6391	1017	3499073520596802	Jaga Nugraha M.Kom.	Borders	Leilaniland	Salsabilla Mission	707 Greta Skyway	Perempuan	6	4	75	sed	dignissimos	Ami Namaga	Pradanaland	dr.Jermaine	2021-04-30 22:00:08.306-04	2021-08-25 19:04:08.983-04	2020-11-11 14:18:23.932-05	RSUD_MU	Lab_MU	1005
100	7594	3781	8445	1422988472531159	Darmanto Abiputra	Borders	South Betty	Aric Corner	877 Alexandrea Hill	Perempuan	9	5	46	et	cum	Salimah Farida S.Pd	Lake Chelsie	dr.Hilario	2020-12-03 20:23:59.84-05	2021-01-12 11:26:02.243-05	2020-09-25 08:49:52.255-04	RSS_Premier	Lab_Premier	1002
26	9656	3518	7072	482288858945850	Hari Hardiansyah	Bedfordshire	Hartatichester	Arnold Stream	644 Rahayu Station	Laki-laki	23	8	38	voluptatem	dignissimos	Tri Astuti	Port Fatima	dr.Joana	2020-12-12 09:06:01.595-05	2021-05-12 00:41:10.24-04	2021-09-05 06:46:29-04	RSS_Royal	Lab_Royal	1007
29	5992	5460	4524	367903643406437	Irnanto Waluyo	Bedfordshire	South Chandler	Pradana Estate	70695 Prasetyo Inlet	Perempuan	13	9	88	recusandae	consequatur	Jumadi Herlambang	Karangasem	dr.Karelle	2020-12-15 03:22:08.487-05	2020-10-31 02:02:46.212-04	2020-11-18 18:09:16.031-05	RSS_Royal	Lab_Royal	1008
53	3326	9833	2743	3327202214063459	Rahmi Novitasari S.Pt	Bedfordshire	Kediri	Pauline Bypass	4988 Habibi Extension	Laki-laki	12	11	20	eos	sint	Rika Winarsih M.Ak	Azizahview	dr.Cierra	2021-03-01 22:08:27.983-05	2021-03-05 10:09:58.948-05	2021-07-09 03:35:02.776-04	RSS_Royal	Lab_Royal	1012
97	9763	4261	1037	3935446108478558	Dartono Hutapea	Bedfordshire	West Stantonfurt	Ulises Extensions	61327 Fatima Squares	Laki-laki	13	7	51	porro	rerum	Kezia Wulandari	Taliwang	dr.Gavin	2021-01-04 20:52:53.974-05	2021-06-20 03:31:35.911-04	2020-11-12 00:12:40.353-05	RSS_Soetomo	Lab_Soetomo	1004
95	1467	6190	5099	274632626315563	Cici Agustina	Bedfordshire	Oktavianmouth	Jarvis Club	257 Elenora Vista	Perempuan	30	7	69	et	et	Tasdik Prayoga	Yuliartiview	dr.Rhiannon	2020-10-16 02:42:13.192-04	2020-12-13 15:32:57.275-05	2020-10-02 09:31:22.923-04	RSS_Soetomo	Lab_Soetomo	1008
94	9175	8330	9726	231262720279536	Puspa Melani	Bedfordshire	Saptonofurt	Jeremy Keys	8215 Tamba Square	Laki-laki	17	2	38	voluptas	cum	Nilam Salsabilla	West Nelson	dr.Tyler	2021-01-05 11:57:12.979-05	2021-05-24 10:06:12.751-04	2021-03-23 03:01:13.963-04	RSS_Soetomo	Lab_Soetomo	1011
4	6320	9601	2812	2618044332938195	Harja Oktavian	Bedfordshire	Dallintown	Caroline Road	948 Dortha Fork	Laki-laki	18	10	67	hic	fugit	Akarsana Haikal	Bogor	dr.Kali	2021-04-07 20:45:02.689-04	2021-02-22 16:16:23.755-05	2021-07-25 02:16:24.871-04	RSU_AHP	Lab_AHP	1004
47	4532	1781	8227	3690723966986923	Novita Rachmawati	Avon	Port Joellechester	Meagan Brooks	0863 Anjani Vista	Perempuan	8	10	76	qui	et	Titin Suryatmi	East Jay	dr.Sandy	2021-04-28 02:44:31.935-04	2020-12-25 02:19:45.792-05	2021-05-12 16:42:55.681-04	RSU_AHP	Lab_AHP	1003
51	9594	2795	3840	286043790846296	Ganjaran Yanuar	Buckinghamshire	Lake Dolorestown	Cyrus Row	3296 Tamba Mall	Laki-laki	6	5	82	in	repudiandae	Lega Sirait	South Lysannefort	dr.Esmeralda	2020-11-27 17:16:24.177-05	2021-08-01 06:04:42.928-04	2021-06-06 23:03:46.72-04	RSU_AHP	Lab_AHP	1002
54	2612	7526	2522	1050970321043014	Lanjar Salahudin S.Ked	Berkshire	West Joaquintown	Susanti Spur	5368 Alexandro Cape	Laki-laki	13	2	26	magni	ut	Usman Pangestu	New Rhiannaberg	dr.Eloy	2020-11-02 15:25:05.342-05	2021-02-11 08:03:09.297-05	2021-05-23 05:47:24.041-04	RSU_AHP	Lab_AHP	1005
98	3881	1769	7916	3976500682100061	Nada Anggraini	Avon	Kurniawantown	Georgianna Oval	8211 Hartati Isle	Laki-laki	19	6	82	ab	maiores	Vania Yuliarti S.H.	East Patrickberg	dr.Mathew	2021-06-25 02:01:46.928-04	2020-09-14 01:27:36.023-04	2021-09-12 05:55:40-04	RSU_AHP	Lab_AHP	1006
28	6485	4416	9706	3042434744388331	Surya Wicaksono	Cambridgeshire	Port Anastacio	Sudiati Circle	9730 Arvel Village	Perempuan	11	8	40	voluptatum	sunt	Galuh Uwais	South Susie	dr.Shanelle	2021-08-02 12:55:41.17-04	2020-11-03 13:16:47.417-05	2021-05-07 07:37:55.75-04	RSU_HU	Lab_HU	1007
89	5947	1841	5833	100530392999918	Mumpuni Purnama M.Kom.	Avon	South Teresa	Handayani Trail	66016 Tommie River	Perempuan	11	10	61	architecto	rerum	Citra Kuswandari	North Kianaside	dr.Gaylord	2020-10-09 23:14:48.884-04	2021-06-16 20:25:49.288-04	2021-01-07 22:07:31.323-05	RSU_AHP	Lab_AHP	1001
50	6490	1206	1504	3097706028508500	Ajimin Sihombing	Berkshire	Rockyton	Rahayu Point	129 Brooke Cliffs	Laki-laki	14	6	71	numquam	rem	Hani Mustika	Rumbia	dr.Brian	2020-09-13 11:54:16.939-04	2020-09-10 17:57:29.56-04	2020-09-16 14:52:27.935-04	RSU_AHP	Lab_AHP	1009
1	9690	1315	3221	2109754265065397	Jelita Andriani S.E.I	Cambridgeshire	Afifahmouth	Maharani Fort	178 Davion Station	Laki-laki	8	1	77	iste	ut	Dariati Purnawarman	South Brenden	dr.Wendell	2020-09-30 21:54:16.503-04	2021-01-31 18:27:59.358-05	2022-02-28 18:59:59-05	RSU_AHP	Lab_AHP	1007
92	6656	8981	2791	749977405362010	Dirja Dirgantara M.Kom.	Bedfordshire	Arifinfurt	Mossie Island	21346 Brianne Points	Perempuan	8	8	17	natus	ut	Maida Amanta M.TI.	Lake Amelyhaven	dr.Grayce	2021-07-02 15:05:09.012-04	2020-12-03 05:09:02.259-05	2020-12-21 22:47:10.119-05	RSU_HU	Lab_HU	1002
91	6024	6742	4055	1773687034228018	Tari Handayani	Cambridgeshire	Nganjuk	Rachmawati Path	60015 Nikki Meadow	Laki-laki	25	6	43	est	blanditiis	Putri Fathina	Hutasoitton	dr.Verona	2021-03-08 08:37:56.362-05	2021-07-29 17:11:41.398-04	2020-09-15 09:07:55.929-04	RSU_AHK	Lab_AHK	1002
90	9687	2096	6002	3720887999329476	Salwa Fujiati	Buckinghamshire	Prasetyaville	Hutasoit Curve	036 Mark Corner	Perempuan	23	5	71	id	itaque	Prakosa Oktovian S.T.	North Isac	dr.Raleigh	2020-10-07 13:45:12.743-04	2021-04-25 14:12:23.845-04	2021-09-25 16:51:12-04	RSU_Darmo	Lab_Darmo	1002
87	2966	5296	9936	61768882871337	Hilda Maheswari	Avon	New Marcelofurt	Usada Springs	609 Hidayanto Summit	Perempuan	22	11	87	nobis	quo	Almira Utami	Lawsonshire	dr.Christy	2021-07-29 12:52:08.538-04	2021-07-13 04:58:41.986-04	2020-11-25 16:30:26.884-05	RSU_Darmo	Lab_Darmo	1004
75	2010	7432	6214	2948792045980711	Galang Rajata	Buckinghamshire	Lake Uriahbury	Leopoldo Gateway	82675 Abimanyu Isle	Perempuan	17	9	37	quae	consequatur	Chelsea Novitasari	North Tyresefort	dr.Kaycee	2021-03-08 05:45:50.036-05	2021-07-18 14:07:38.84-04	2021-05-18 07:04:53.995-04	RSU_HU	Lab_HU	1006
86	7771	2433	6468	414351863920431	Puji Nurdiyanti	Bedfordshire	Simanjuntakbury	Uyainah Stream	52477 Azizah Roads	Perempuan	30	3	78	quia	asperiores	Malika Aryani	Widiastutiview	dr.Ari	2020-11-06 18:34:55.753-05	2021-06-14 06:31:35.373-04	2020-10-28 06:58:09.226-04	RSU_Haji	Lab_Haji	1004
81	5814	2692	6247	3798563451753140	Harto Tampubolon	Bedfordshire	Aqilamouth	Hakim Springs	551 Ardana Locks	Laki-laki	27	11	36	aspernatur	voluptatem	Lestari Salma	Port Conor	dr.Myron	2020-09-20 08:42:07.125-04	2021-01-06 14:39:00.058-05	2021-01-23 16:08:38.847-05	RSU_Haji	Lab_Haji	1007
99	3199	9777	5964	3363783703508650	Dartono Siregar	Borders	Lake Brianneburgh	Philip Locks	1851 Haryanti Groves	Perempuan	29	3	79	dignissimos	modi	Prabu Halim	North Cletus	dr.Maeve	2020-11-30 08:44:56.137-05	2021-05-10 07:03:45.688-04	2020-10-15 02:34:00.186-04	RSS_Soetomo	Lab_Soetomo	1010
\.


--
-- Data for Name: t_pemeriksaan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pemeriksaan (id, kode, nama, satuan, metode, no_urut, kategori_pemeriksaan, kategori_no_urut, subkategori_pemeriksaan, subkategori_no_urut, catatan, is_duplo, total_duplo, kode_rs, kode_lab, registrasi_id) FROM stdin;
14	Shore	Urine	neque	et	5534	p	2	a	41	Rerum numquam sint.	f	212	RSU_Haji	Lab_Haji	1010
29	Oman	Glukosa	perspiciatis	expedita	9892	z	83	r	100	Necessitatibus qui sint.	t	197	RSUD_MU	Lab_MU	1008
23	orchestration	Ekokardiografi	laborum	itaque	6971	d	29	e	61	Voluptatem et voluptatum.	f	490	RSUD_MS	Lab_MS	1011
7	responsive	Glukosa	eveniet	enim	6556	k	32	d	3	Fugit quo repudiandae sed inventore voluptas ullam.	t	901	RSU_HU	Lab_HU	1009
3	Applications	Urine	iste	aut	8556	a	39	k	72	Rerum eveniet quia quis ullam eaque nam.	t	162	RSU_AHP	Lab_AHP	1009
19	bottom-line	Elektrokardiogram	molestias	expedita	621	h	96	w	45	Dolor officiis in quae eveniet iure itaque.	t	207	RSS_Premier	Lab_Premier	1000
20	Health	Darah	consectetur	repellendus	6131	t	44	c	42	Ut sint perspiciatis velit qui repellendus perferendis.	t	373	RSS_Royal	Lab_Royal	1000
33	Dollar	Glukosa	dolores	facere	8379	u	29	l	64	Ipsum expedita sequi facilis et corrupti perferendis.	f	664	RSU_AHK	Lab_AHK	1003
13	vertical	Darah	eaque	praesentium	3076	a	58	c	25	Nostrum tempore odit incidunt omnis quidem consequatur.	t	165	RSU_HU	Lab_HU	1009
8	Plastic	Urine	mollitia	sed	851	n	8	j	40	Suscipit nemo accusantium.	f	271	RSU_Darmo	Lab_Darmo	1009
44	Metal	Darah	nihil	praesentium	5669	j	63	u	2	Officia vitae ullam eos aliquid dolores quis beatae omnis rerum.	t	700	RSS_Soetomo	Lab_Soetomo	1004
46	Cape	Glukosa	soluta	sit	4070	f	77	u	2	Officiis non enim repellendus tenetur rerum est.	f	198	RSU_Darmo	Lab_Darmo	1004
38	Wooden	Elektrokardiogram	ipsum	et	8005	p	76	c	87	Voluptas nostrum non.	t	493	RSS_Soetomo	Lab_Soetomo	1005
24	AGP	Urine	sint	omnis	1896	f	99	z	51	Architecto delectus voluptas temporibus nisi repellat.	t	442	RSS_Soetomo	Lab_Soetomo	1000
12	Gloves	Elektrokardiogram	ut	et	1120	y	40	b	98	Et enim in officiis.	t	760	RSUD_MU	Lab_MU	1008
10	generate	Glukosa	qui	reprehenderit	7060	x	37	q	21	Dolor dolore dolores veniam provident.	t	440	RSU_HU	Lab_HU	1009
26	Operations	Elektrokardiogram	quo	et	9749	p	57	i	1	Sequi eos alias.	t	118	RSUD_MS	Lab_MS	1011
28	bluetooth	Urine	nostrum	et	9803	j	15	h	72	Ipsa accusamus expedita molestiae dolorum.	t	170	RSUD_MU	Lab_MU	1008
30	Dollar	Elektrokardiogram	dicta	est	4714	b	39	j	27	Aliquam ut nemo iste beatae inventore consequatur corrupti ut.	f	408	RSS_Premier	Lab_Premier	1000
41	matrices	Elektrokardiogram	dolor	et	7025	l	46	z	98	Ex quasi eius voluptate quam exercitationem.	f	613	RSUD_MU	Lab_MU	1002
37	navigate	Elektrokardiogram	praesentium	nobis	8857	n	76	s	76	Voluptas aut dolores tenetur atque.	f	344	RSS_Soetomo	Lab_Soetomo	1004
15	frictionless	Urine	quo	qui	6027	l	95	d	53	Accusantium dolores suscipit omnis eum quam explicabo et.	f	327	RSS_Premier	Lab_Premier	1000
21	product	Elektrokardiogram	rem	cum	7321	y	39	c	48	Saepe impedit sit quam ut maiores possimus iusto.	f	907	RSU_Haji	Lab_Haji	1010
6	Corner	Darah	impedit	numquam	2804	i	84	n	82	Vitae dolorem nulla delectus molestiae doloribus quia harum ex.	f	165	RSUD_MU	Lab_MU	1008
40	calculating	Darah	autem	est	8664	x	99	h	67	Aut veritatis nemo eum omnis.	t	432	RSU_HU	Lab_HU	1001
39	invoice	Ekokardiografi	porro	facere	927	j	8	y	65	Alias ut reprehenderit neque.	t	314	RSU_Haji	Lab_Haji	1009
9	Hat	Ekokardiografi	tenetur	reiciendis	9029	k	16	u	53	Totam nam ut eligendi accusantium.	f	390	RSS_Soetomo	Lab_Soetomo	1000
11	GB	Elektrokardiogram	et	ut	6674	j	22	s	94	Est corporis quae facilis quia enim omnis.	f	498	RSUD_MS	Lab_MS	1011
17	Handmade	Urine	debitis	ut	5389	q	66	x	46	Occaecati quasi sed ut quidem.	t	105	RSU_AHK	Lab_AHK	1007
35	exploit	Ekokardiografi	consequuntur	quae	4590	k	32	q	86	Dolores blanditiis ut ea sed rerum eligendi quod non dolores.	t	271	RSU_Darmo	Lab_Darmo	1006
42	payment	Glukosa	est	eum	3055	u	82	m	62	Consequuntur illum repellat aperiam.	f	819	RSU_Haji	Lab_Haji	1003
18	connecting	Darah	totam	aut	4232	n	7	d	77	Distinctio voluptates tempore rerum numquam quia quia id.	t	635	RSS_Premier	Lab_Premier	1000
50	invoice	Glukosa	quaerat	nam	8259	d	95	z	76	Praesentium porro aliquam magnam adipisci deleniti sed.	f	802	RSU_AHP	Lab_AHP	1001
16	quantifying	Ekokardiografi	autem	minus	9057	r	86	z	89	Dolor sequi voluptatem et laboriosam quod et consequatur ratione.	t	589	RSU_AHP	Lab_AHP	1009
36	concept	Urine	amet	commodi	6658	e	64	l	59	Distinctio sit ratione repudiandae at dolore quia molestiae aut autem.	f	730	RSU_Darmo	Lab_Darmo	1003
47	payment	Glukosa	hic	fugiat	1601	l	3	h	55	Unde id dolores.	t	784	RSU_AHP	Lab_AHP	1007
49	Synergized	Darah	aut	aliquam	5346	z	93	z	54	Aut veniam dolor amet est aut.	f	620	RSU_AHP	Lab_AHP	1004
2	networks	Glukosa	excepturi	omnis	6509	q	79	o	63	Modi iure omnis neque est rerum.	f	759	RSU_AHP	Lab_AHP	1009
25	transform	Glukosa	rerum	alias	3254	u	45	m	76	Qui aut laudantium eaque inventore beatae nisi et.	t	146	RSU_Darmo	Lab_Darmo	1009
22	reciprocal	Elektrokardiogram	animi	ex	757	c	97	o	60	Nihil ratione necessitatibus recusandae blanditiis voluptatem aperiam omnis eum autem.	t	206	RSU_Haji	Lab_Haji	1010
34	back	Glukosa	odit	ipsam	9787	b	100	p	19	Culpa accusamus aperiam sunt molestiae quidem reiciendis aliquam aut neque.	f	570	RSUD_MU	Lab_MU	1001
48	mindshare	Urine	totam	id	7426	w	60	i	65	Officia reiciendis error illo ea enim vero.	t	271	RSU_HU	Lab_HU	1007
31	Wooden	Urine	eum	aliquam	9812	a	15	t	79	Et ab et nisi.	t	254	RSU_HU	Lab_HU	1007
4	Rwanda	Darah	placeat	aut	7867	g	39	d	73	Veniam et necessitatibus deleniti in qui.	f	890	RSS_Premier	Lab_Premier	1000
89	Qatar	Glukosa	et	accusantium	7675	j	8	u	39	Natus qui aspernatur neque esse voluptas.	t	390	RSS_Soetomo	Lab_Soetomo	1003
83	Web	Elektrokardiogram	earum	et	58	w	51	d	77	Quaerat ut eligendi beatae corporis id sed qui.	f	281	RSS_Soetomo	Lab_Soetomo	1007
81	hack	Urine	dolor	et	728	p	42	y	32	Exercitationem nihil nisi.	f	796	RSS_Soetomo	Lab_Soetomo	1010
66	holistic	Ekokardiografi	eligendi	ullam	4121	d	100	a	88	Esse asperiores neque amet aperiam fugiat nihil nobis enim quo.	t	166	RSS_Soetomo	Lab_Soetomo	1012
53	motivating	Ekokardiografi	dignissimos	dolores	2243	h	25	j	52	Est quibusdam accusamus hic temporibus laborum voluptates eius tenetur rerum.	f	249	RSUD_MU	Lab_MU	1001
99	Operative	Glukosa	maiores	aut	7487	k	34	c	54	Aut quae qui recusandae sed ut nostrum quo ex aut.	t	396	RSUD_MU	Lab_MU	1004
84	Awesome	Urine	ut	tempora	4271	k	13	e	1	Atque quae nulla id deserunt tempora est in eos.	t	197	RSUD_MU	Lab_MU	1006
86	Frozen	Darah	ut	eum	5166	r	35	h	35	Et cumque tempore nihil ratione non.	f	477	RSS_Premier	Lab_Premier	1002
65	purple	Glukosa	in	dolorum	9661	h	24	c	43	Totam maiores illo blanditiis.	t	698	RSS_Premier	Lab_Premier	1005
76	Health	Elektrokardiogram	autem	et	6243	y	12	t	2	Quod perspiciatis illum cupiditate debitis et autem sint eum.	t	692	RSU_Darmo	Lab_Darmo	1006
97	regional	Glukosa	sunt	quaerat	7191	c	59	j	100	Deleniti architecto rerum consequatur.	t	871	RSU_HU	Lab_HU	1004
61	Customizable	Darah	architecto	consectetur	8459	z	9	p	78	Quia perspiciatis rerum officiis facere illum repellat omnis quasi.	t	811	RSU_HU	Lab_HU	1005
75	Forward	Urine	cum	officiis	1989	g	21	y	32	Fuga natus a est quo odio pariatur voluptate minima quidem.	t	667	RSU_HU	Lab_HU	1006
69	Sports	Urine	accusantium	unde	4059	x	65	f	52	Et odio eligendi dolorem incidunt ut eligendi.	f	494	RSUD_MS	Lab_MS	1001
55	Home	Elektrokardiogram	omnis	nulla	4533	x	7	r	62	Voluptatum fugit eligendi et provident quo.	f	508	RSUD_MS	Lab_MS	1002
85	ADP	Darah	iste	quia	3213	o	47	g	45	Et occaecati ut voluptatem quas.	t	777	RSUD_MS	Lab_MS	1007
54	Brand	Darah	sapiente	eius	793	i	80	c	38	Sit omnis repudiandae.	f	927	RSU_AHP	Lab_AHP	1003
62	granular	Ekokardiografi	iste	porro	5280	v	95	l	91	Dolorem facilis magni ipsum harum aliquid laudantium.	t	676	RSU_AHP	Lab_AHP	1003
56	Central	Glukosa	aut	enim	3937	r	36	u	27	Omnis delectus ea ducimus aut at laudantium.	f	396	RSU_AHP	Lab_AHP	1004
51	Technician	Glukosa	rerum	veritatis	6246	h	38	w	45	Quo saepe omnis natus minus.	f	144	RSU_Haji	Lab_Haji	1003
73	Toys	Ekokardiografi	omnis	iusto	3944	t	99	f	80	Et cumque iste adipisci atque.	t	228	RSU_Haji	Lab_Haji	1005
58	Handcrafted	Darah	voluptatum	atque	5994	a	19	y	12	Vitae labore expedita in distinctio rem dolore.	t	314	RSU_Haji	Lab_Haji	1005
70	COM	Elektrokardiogram	nam	cumque	9548	r	69	u	100	Cumque dolor modi.	t	699	RSU_Haji	Lab_Haji	1005
67	calculating	Glukosa	eius	iure	5264	o	52	o	93	Ut repudiandae voluptatem praesentium voluptatem.	f	871	RSU_Haji	Lab_Haji	1009
78	leverage	Glukosa	itaque	quis	6306	s	6	g	49	Vero accusamus non consequatur voluptate ea et soluta.	t	895	RSU_HU	Lab_HU	1003
72	Village	Darah	dolores	voluptatem	8072	l	35	y	63	Non harum nam.	f	484	RSU_HU	Lab_HU	1004
71	robust	Elektrokardiogram	tempora	sit	5460	p	41	l	44	Qui soluta blanditiis eum.	t	600	RSS_Premier	Lab_Premier	1009
82	Generic	Darah	magni	magni	2813	o	6	p	3	Doloribus vel reiciendis veniam est quis.	f	658	RSUD_MS	Lab_MS	1007
59	Avon	Elektrokardiogram	blanditiis	recusandae	2776	w	13	h	70	Animi consectetur eum officiis deleniti eveniet atque.	t	551	RSS_Soetomo	Lab_Soetomo	1000
74	Barat	Ekokardiografi	natus	eligendi	8856	y	47	r	92	Non et totam ipsum quo sequi recusandae velit sit.	f	282	RSUD_MS	Lab_MS	1009
64	Internal	Elektrokardiogram	quasi	quis	9530	w	95	w	77	Libero molestiae sit aut.	t	912	RSU_AHK	Lab_AHK	1001
94	engineer	Ekokardiografi	facilis	eos	2477	w	25	q	39	Sequi hic ducimus modi error accusamus.	f	574	RSU_AHK	Lab_AHK	1003
87	lavender	Urine	qui	quam	2710	k	19	f	98	Similique deleniti soluta sit doloribus cupiditate quibusdam.	t	792	RSU_AHK	Lab_AHK	1004
60	copying	Glukosa	omnis	aut	8131	u	29	h	18	Dolorem qui quas occaecati non.	t	479	RSU_AHP	Lab_AHP	1005
77	Optional	Urine	et	et	2671	m	18	q	83	Repudiandae qui sed.	f	470	RSU_AHP	Lab_AHP	1006
57	Down-sized	Elektrokardiogram	blanditiis	aut	4228	n	57	w	95	Et sed quos minus.	f	241	RSU_AHP	Lab_AHP	1006
63	circuit	Glukosa	ut	et	4534	l	30	g	13	Unde dolores accusamus ut.	t	646	RSU_AHP	Lab_AHP	1008
95	Account	Ekokardiografi	distinctio	dolores	6818	z	52	o	15	Sit voluptates natus consequatur id eum ut.	t	269	RSU_Darmo	Lab_Darmo	1002
130	Hat	Ekokardiografi	similique	et	5883	p	97	k	42	Rerum sed nam dolores modi doloremque illum.	t	128	RSS_Soetomo	Lab_Soetomo	1002
125	lavender	Ekokardiografi	minus	praesentium	5571	q	84	l	34	Distinctio voluptas quia.	t	957	RSS_Soetomo	Lab_Soetomo	1003
139	Dynamic	Urine	et	quae	6705	t	30	k	3	Consequatur molestiae blanditiis voluptatem harum omnis ea dolorem.	f	385	RSS_Premier	Lab_Premier	1002
107	GB	Darah	recusandae	dolor	7900	k	71	b	36	Vel reiciendis rerum tempora aut explicabo veritatis illum beatae.	t	513	RSS_Premier	Lab_Premier	1005
105	3rd	Darah	accusamus	voluptates	2885	u	84	u	91	Tempora dolore mollitia.	f	359	RSS_Premier	Lab_Premier	1009
112	Marketing	Darah	quasi	atque	3776	v	2	z	11	Itaque itaque mollitia vel consequatur recusandae veritatis neque.	t	928	RSS_Soetomo	Lab_Soetomo	1006
131	interface	Glukosa	provident	mollitia	7382	g	38	b	42	Itaque dolor explicabo perferendis repudiandae.	f	309	RSS_Soetomo	Lab_Soetomo	1011
136	Lampung	Darah	in	occaecati	2696	c	3	u	63	Sit corporis voluptatibus aut quia.	t	715	RSS_Soetomo	Lab_Soetomo	1007
137	Shoes	Glukosa	laboriosam	assumenda	1955	q	71	c	12	Et et ut id alias recusandae unde dolores nihil.	f	230	RSU_HU	Lab_HU	1002
126	Plastic	Elektrokardiogram	et	ratione	8013	v	58	b	25	Aperiam omnis consequuntur velit modi dolores dolor voluptatem consequatur sed.	f	355	RSU_AHP	Lab_AHP	1009
135	Team-oriented	Ekokardiografi	voluptatibus	debitis	3105	e	52	z	62	Consequatur illo quae eum nam quo sit est quia.	f	814	RSUD_MU	Lab_MU	1006
109	Jewelery	Ekokardiografi	quaerat	ut	2732	r	21	l	59	Voluptate doloribus in dolores natus omnis rem qui et.	t	748	RSUD_MS	Lab_MS	1003
142	Investor	Urine	dignissimos	et	3523	y	96	r	19	Debitis ducimus hic alias.	t	892	RSUD_MU	Lab_MU	1001
113	deposit	Elektrokardiogram	voluptas	eum	3064	w	49	k	82	Accusamus rerum at quidem excepturi et sit.	f	825	RSUD_MU	Lab_MU	1003
120	pink	Ekokardiografi	animi	amet	1275	q	83	a	11	Praesentium voluptatibus sapiente corrupti dolorem autem magnam non.	t	597	RSUD_MU	Lab_MU	1005
118	improvement	Ekokardiografi	sit	minus	9319	t	8	r	48	Accusamus culpa est dicta quae.	f	864	RSUD_MU	Lab_MU	1007
129	SCSI	Urine	sed	maiores	3730	d	17	c	4	Iure qui consequatur nesciunt ipsum.	f	307	RSUD_MU	Lab_MU	1006
122	e-enable	Urine	adipisci	quidem	9484	q	2	d	26	Dolorem vel veniam eos illo dicta possimus ipsam repellendus et.	t	171	RSS_Soetomo	Lab_Soetomo	1001
103	User	Glukosa	quos	autem	6359	j	99	f	31	Quas veritatis error possimus.	f	596	RSUD_MU	Lab_MU	1006
115	Cheese	Elektrokardiogram	officia	quod	2138	d	95	d	1	Libero rerum dolorem totam non sed eaque earum.	t	426	RSS_Premier	Lab_Premier	1001
124	Intelligent	Urine	ut	nesciunt	7058	t	2	y	85	Sit ipsum esse quae sit quia.	t	756	RSS_Premier	Lab_Premier	1001
146	Tasty	Glukosa	eligendi	voluptatem	3803	t	83	h	62	Sapiente ut nostrum.	f	374	RSUD_MU	Lab_MU	1007
127	Wooden	Elektrokardiogram	aut	quia	1314	n	62	a	34	Et eum excepturi neque libero.	t	403	RSS_Premier	Lab_Premier	1001
123	Movies	Glukosa	aut	impedit	8151	e	36	l	62	Id sequi delectus qui praesentium aut quis.	t	977	RSU_Haji	Lab_Haji	1008
143	USB	Darah	suscipit	tempore	3066	u	8	k	20	Incidunt voluptatem rerum sapiente labore.	f	228	RSU_Haji	Lab_Haji	1008
110	Operative	Ekokardiografi	nisi	dolores	5149	t	11	q	10	Magni at quos.	t	285	RSU_HU	Lab_HU	1004
119	pink	Elektrokardiogram	consequatur	tempora	6867	w	97	c	22	Accusantium omnis et labore inventore delectus quia et vel.	f	228	RSUD_MS	Lab_MS	1002
140	Tengah	Ekokardiografi	expedita	modi	5902	u	3	s	26	Voluptatem eos earum.	f	115	RSUD_MS	Lab_MS	1004
138	calculate	Darah	non	ut	6525	k	77	j	4	Autem ut repellat ratione tempora minima.	f	127	RSU_Haji	Lab_Haji	1001
106	El	Elektrokardiogram	itaque	accusantium	9354	t	28	l	48	Consequatur rerum dolore nesciunt.	f	952	RSU_Haji	Lab_Haji	1002
111	Martinique	Darah	sequi	quo	613	j	24	f	57	Sunt quisquam pariatur voluptatibus optio aliquid.	t	120	RSU_Haji	Lab_Haji	1003
132	indigo	Elektrokardiogram	veniam	possimus	4060	t	11	u	42	Cum dolorem corrupti aliquid id mollitia nemo repellendus magni.	t	969	RSU_AHP	Lab_AHP	1008
116	Gorgeous	Glukosa	esse	iure	6983	n	9	t	78	Velit quisquam nihil voluptatem corporis ipsa.	t	403	RSU_Darmo	Lab_Darmo	1001
121	programming	Glukosa	eum	accusamus	2698	e	43	o	62	At doloremque rerum ab iusto ea.	f	922	RSU_Darmo	Lab_Darmo	1002
108	calculating	Glukosa	nesciunt	error	2533	z	21	s	81	Perspiciatis similique voluptate.	t	455	RSU_Haji	Lab_Haji	1007
134	matrix	Glukosa	quia	ea	3037	b	8	k	61	Assumenda asperiores optio nihil doloremque sapiente.	f	922	RSU_Darmo	Lab_Darmo	1004
114	Keyboard	Ekokardiografi	ut	omnis	7925	w	44	p	98	Sed quaerat voluptatem aut et.	f	738	RSUD_MS	Lab_MS	1007
133	unleash	Glukosa	eum	sequi	7558	f	44	x	13	Nihil in rerum consequuntur repellendus alias esse eos dolore.	f	877	RSUD_MS	Lab_MS	1006
145	Refined	Glukosa	ut	ipsa	2971	p	19	r	64	Perspiciatis accusamus culpa unde occaecati.	f	821	RSU_AHK	Lab_AHK	1002
117	cyan	Ekokardiografi	quia	eaque	5161	v	88	t	79	Autem suscipit id.	f	956	RSU_AHK	Lab_AHK	1005
141	Rustic	Glukosa	quis	quidem	8223	d	38	m	7	Cum ratione incidunt provident.	f	290	RSU_AHP	Lab_AHP	1004
198	National	Glukosa	voluptatem	amet	1634	k	29	s	22	Et eligendi ex est nam quasi beatae fuga.	t	896	RSS_Premier	Lab_Premier	1008
156	green	Darah	eum	illum	7292	w	84	r	91	Quas hic architecto ad recusandae nam explicabo est consequuntur similique.	t	632	RSS_Premier	Lab_Premier	1006
179	value-added	Glukosa	vero	reprehenderit	6450	w	11	o	13	Laboriosam ipsam et doloremque vel amet.	t	801	RSS_Soetomo	Lab_Soetomo	1003
190	Plains	Urine	soluta	omnis	3558	d	3	x	10	Amet est aut rerum placeat et.	t	563	RSS_Soetomo	Lab_Soetomo	1003
180	Legacy	Ekokardiografi	repudiandae	ut	1525	d	97	f	80	Ut mollitia voluptates numquam voluptatum nisi ut.	f	326	RSS_Soetomo	Lab_Soetomo	1005
188	Credit	Urine	recusandae	suscipit	3753	p	50	e	4	Quam consectetur accusantium ipsum eos.	t	411	RSU_Haji	Lab_Haji	1010
164	Future	Elektrokardiogram	voluptas	ipsa	7338	w	16	o	95	Est aspernatur autem omnis velit.	f	122	RSS_Soetomo	Lab_Soetomo	1010
194	invoice	Glukosa	quod	at	4027	y	12	k	20	Cupiditate quod ducimus tempora omnis dolor qui.	f	574	RSS_Soetomo	Lab_Soetomo	1007
195	azure	Elektrokardiogram	quia	dolores	9127	n	88	v	12	Et sapiente veritatis blanditiis quia quod id quia.	t	245	RSU_AHK	Lab_AHK	1007
175	e-business	Elektrokardiogram	facilis	voluptas	2833	u	92	t	70	Expedita velit esse laborum repudiandae ut sed delectus maiores nostrum.	f	643	RSS_Soetomo	Lab_Soetomo	1010
191	Gibraltar	Glukosa	praesentium	ut	4144	q	61	t	6	Ipsa et et qui harum vel consequuntur et aut.	t	578	RSU_Darmo	Lab_Darmo	1009
189	Buckinghamshire	Glukosa	rerum	quae	4608	b	4	m	83	Et quibusdam qui.	f	929	RSUD_MS	Lab_MS	1004
200	Gloves	Urine	molestiae	sit	9409	g	12	s	55	Consequatur eos aliquam necessitatibus vitae molestias et voluptas.	f	902	RSUD_MU	Lab_MU	1005
168	Customer-focused	Elektrokardiogram	ea	est	408	a	43	y	43	Optio quaerat reprehenderit aut sapiente corporis.	f	687	RSS_Premier	Lab_Premier	1004
176	engage	Elektrokardiogram	voluptas	perferendis	7964	h	12	s	21	Qui et non dolor sapiente eos dolores.	t	718	RSS_Premier	Lab_Premier	1007
154	empower	Ekokardiografi	sed	error	8669	n	42	m	35	Dolorem iusto enim quia.	t	865	RSUD_MS	Lab_MS	1004
174	mobile	Glukosa	officiis	in	9410	a	99	i	72	Eum nulla dolorem aspernatur facilis consequatur quia rem qui error.	f	537	RSS_Premier	Lab_Premier	1007
171	connecting	Elektrokardiogram	consequuntur	veniam	4234	c	97	q	46	Fugit saepe voluptas.	t	821	RSU_Haji	Lab_Haji	1008
163	Unbranded	Darah	quos	impedit	4609	d	80	y	38	Asperiores sed quibusdam impedit eligendi labore.	t	696	RSU_HU	Lab_HU	1005
152	invoice	Ekokardiografi	sed	optio	1633	c	39	c	55	Sapiente eos quia tempora aliquid est alias ut nostrum sit.	f	130	RSUD_MS	Lab_MS	1005
187	gold	Elektrokardiogram	adipisci	quia	5545	k	86	l	11	Et ut excepturi doloremque eum distinctio fugit.	f	420	RSUD_MS	Lab_MS	1001
160	sensor	Urine	velit	cupiditate	4565	r	9	c	98	Maiores dolore aut.	t	534	RSU_Haji	Lab_Haji	1001
199	virtual	Darah	eos	ea	7221	b	65	p	26	Sequi illo voluptatem aut.	t	577	RSU_Haji	Lab_Haji	1003
170	black	Glukosa	autem	sit	7889	n	43	t	26	Sapiente nemo nostrum.	f	367	RSUD_MS	Lab_MS	1010
167	Technician	Darah	nobis	est	7657	z	28	v	94	Earum tenetur nulla autem aut aut esse et ipsum exercitationem.	t	777	RSU_Darmo	Lab_Darmo	1008
159	deposit	Darah	ut	harum	8137	n	67	f	55	Dicta dignissimos qui sit est.	t	955	RSU_Haji	Lab_Haji	1006
197	bus	Glukosa	quia	qui	443	f	84	f	4	Dicta cumque repellendus beatae esse ab aut ut.	t	697	RSU_Haji	Lab_Haji	1001
183	Fundamental	Ekokardiografi	aut	accusantium	7788	b	12	u	32	Et vitae rem impedit.	t	280	RSU_AHP	Lab_AHP	1006
184	Face	Darah	doloribus	ipsam	8041	p	40	d	60	Repellendus voluptatem quia culpa quibusdam eos.	t	576	RSU_AHK	Lab_AHK	1003
165	Tunnel	Elektrokardiogram	explicabo	dolore	8729	m	65	g	60	Facere architecto quo libero et asperiores rerum similique deserunt quisquam.	t	341	RSU_AHK	Lab_AHK	1005
153	transmitting	Darah	et	similique	8442	l	3	d	88	Qui aut modi sunt numquam.	t	632	RSU_AHK	Lab_AHK	1006
155	Money	Ekokardiografi	veniam	ut	6241	e	79	k	8	Necessitatibus quis excepturi eos et aperiam ab laboriosam blanditiis ipsa.	t	757	RSU_AHP	Lab_AHP	1001
169	intranet	Darah	possimus	veritatis	9988	w	53	c	35	Deserunt velit corrupti accusamus nam.	f	666	RSU_AHP	Lab_AHP	1005
182	payment	Ekokardiografi	beatae	at	949	a	69	h	66	Omnis sapiente enim iure nam consequatur suscipit et.	t	732	RSU_AHK	Lab_AHK	1005
151	quantifying	Urine	aut	mollitia	5269	o	21	q	63	Totam autem quia consequatur odit.	t	855	RSU_Darmo	Lab_Darmo	1005
186	Islands	Urine	quia	perspiciatis	9452	o	38	h	32	Qui reiciendis aut dolor culpa.	f	327	RSU_Darmo	Lab_Darmo	1006
178	paradigms	Elektrokardiogram	qui	ut	1540	j	40	p	35	Omnis rerum accusantium tenetur sit soluta.	f	342	RSU_Haji	Lab_Haji	1006
177	cross-media	Glukosa	voluptatem	nihil	3009	g	21	d	38	Enim veritatis ipsum.	f	922	RSUD_MS	Lab_MS	1009
162	teal	Darah	ea	esse	705	o	12	a	45	Tempore eos ab fugiat accusantium voluptatum dolorem.	f	814	RSU_AHK	Lab_AHK	1001
157	grey	Ekokardiografi	dolor	neque	1297	z	47	z	20	Dicta illum nobis dolorem.	t	416	RSU_AHK	Lab_AHK	1002
196	Clothing	Urine	velit	saepe	8210	l	63	b	8	Consequatur est eius et vel aut voluptatem ullam dolorem unde.	f	405	RSU_AHK	Lab_AHK	1002
209	override	Ekokardiografi	iusto	aliquam	5700	f	26	e	16	Iusto alias voluptas repellat voluptas exercitationem.	t	421	RSS_Soetomo	Lab_Soetomo	1009
201	migration	Urine	aperiam	incidunt	6561	x	41	c	22	Repellat atque minus corporis doloremque.	f	271	RSU_Darmo	Lab_Darmo	1003
245	Quality	Urine	voluptas	quo	2439	j	26	f	2	Aut ab et.	t	532	RSU_AHK	Lab_AHK	1007
227	transmitting	Darah	non	et	2478	f	69	y	39	Nesciunt aut sequi iure.	t	443	RSUD_MS	Lab_MS	1005
230	reboot	Elektrokardiogram	laborum	commodi	5919	b	86	u	53	Voluptatem et optio qui quos et officia.	f	529	RSUD_MU	Lab_MU	1001
216	Representative	Urine	vel	aperiam	3055	b	84	x	22	Pariatur voluptatem fugit non sint omnis.	f	209	RSUD_MU	Lab_MU	1003
228	Infrastructure	Darah	beatae	quidem	9240	b	95	o	89	Ut cupiditate quaerat hic eius id facilis.	f	342	RSUD_MU	Lab_MU	1004
229	haptic	Elektrokardiogram	accusamus	eum	1972	b	71	l	13	Id eaque ut tenetur quidem vel inventore.	f	716	RSS_Premier	Lab_Premier	1010
218	invoice	Ekokardiografi	est	exercitationem	1185	z	97	o	74	Quae illo aspernatur tempora et quidem reiciendis distinctio voluptatibus.	f	760	RSS_Premier	Lab_Premier	1010
208	Skyway	Elektrokardiogram	quod	libero	2413	k	69	d	98	Amet aut rem eum voluptatibus.	t	452	RSS_Soetomo	Lab_Soetomo	1004
231	enhance	Glukosa	culpa	natus	4522	h	95	b	58	Qui nihil aut et adipisci sequi at quo.	t	935	RSUD_MU	Lab_MU	1004
211	Soap	Urine	voluptas	laboriosam	5479	d	80	t	67	Facilis et dolorum qui quas voluptatem et.	f	851	RSS_Soetomo	Lab_Soetomo	1008
222	virtual	Glukosa	ut	aut	7130	o	72	c	51	Esse minima non occaecati dolores sequi voluptatem.	t	950	RSUD_MU	Lab_MU	1007
214	pink	Urine	totam	nisi	4682	x	61	t	55	Explicabo quia cumque soluta est rerum.	f	961	RSU_Haji	Lab_Haji	1008
213	Cheese	Darah	ut	aliquam	9469	u	35	t	52	Totam quasi nihil voluptates mollitia facere.	t	729	RSU_HU	Lab_HU	1007
226	Shoes	Elektrokardiogram	aut	explicabo	9093	x	43	a	9	Harum corporis voluptatem aperiam voluptatem et sapiente assumenda aut.	t	566	RSU_HU	Lab_HU	1001
235	withdrawal	Darah	inventore	reprehenderit	2838	h	90	h	65	Vero error sed dolorem hic rerum consequuntur velit sequi.	t	373	RSU_HU	Lab_HU	1002
249	Polynesia	Darah	repudiandae	exercitationem	1335	p	58	m	63	Commodi ratione assumenda doloribus voluptatem tempora.	t	311	RSU_HU	Lab_HU	1003
210	Phased	Darah	et	similique	8473	e	96	v	68	Et non delectus ut molestiae aut repudiandae.	t	324	RSU_Haji	Lab_Haji	1001
247	Fantastic	Glukosa	excepturi	quia	9077	p	28	l	24	Vel impedit quibusdam nobis dolorem neque sit non sed.	t	447	RSU_Haji	Lab_Haji	1004
238	Market	Ekokardiografi	labore	suscipit	6962	t	60	w	37	Suscipit ex quod voluptatem.	t	532	RSU_Darmo	Lab_Darmo	1007
233	ADP	Darah	et	ut	3632	p	86	l	43	Fugit ipsa dolor sed ex aperiam minima nostrum eos.	f	226	RSU_Haji	Lab_Haji	1007
248	Movies	Darah	quo	non	2814	k	49	z	11	Molestias sint alias quas voluptatem perspiciatis.	t	137	RSU_Haji	Lab_Haji	1007
219	Branding	Elektrokardiogram	sint	error	6315	u	80	a	22	Molestiae rerum totam doloribus.	f	809	RSU_AHP	Lab_AHP	1005
224	deposit	Urine	odio	veritatis	6975	h	28	l	52	Quasi quisquam et maxime commodi dolores iusto.	f	781	RSU_AHK	Lab_AHK	1006
246	Designer	Ekokardiografi	vero	eius	6475	z	69	b	55	Similique eaque maxime expedita nobis commodi alias.	f	302	RSU_AHP	Lab_AHP	1005
215	Cambridgeshire	Urine	nihil	ea	575	w	45	y	14	Sunt magni soluta dolores iusto minima alias reprehenderit.	f	590	RSU_AHK	Lab_AHK	1006
207	Dollar	Glukosa	quia	sunt	9845	y	61	z	45	Voluptate illo voluptas quae veritatis expedita.	t	733	RSU_AHP	Lab_AHP	1002
203	Versatile	Elektrokardiogram	ut	omnis	9770	j	84	s	72	Vel sit expedita ut nam velit et labore.	t	633	RSU_Darmo	Lab_Darmo	1007
205	incremental	Ekokardiografi	et	ratione	8731	n	5	x	75	Autem quo ad qui ullam quia voluptatem soluta consequatur qui.	t	827	RSU_AHP	Lab_AHP	1008
221	Soap	Urine	dolor	impedit	3746	b	37	y	22	Ut vitae quia sed nihil sequi commodi soluta suscipit quia.	t	375	RSU_Darmo	Lab_Darmo	1004
237	national	Urine	eum	qui	9524	y	45	a	78	Id mollitia nihil alias fugiat laboriosam.	t	778	RSU_Darmo	Lab_Darmo	1008
204	Focused	Elektrokardiogram	et	id	2366	n	71	a	24	Dicta praesentium quia dignissimos repellat quia vero ducimus quae quia.	t	350	RSUD_MU	Lab_MU	1002
239	National	Urine	omnis	possimus	2409	a	63	j	38	Officia autem ut neque cupiditate deleniti.	t	138	RSUD_MU	Lab_MU	1003
206	Handmade	Elektrokardiogram	voluptate	a	1542	w	78	t	11	Rem quis quia qui eos rerum sunt sint consequatur beatae.	f	986	RSU_HU	Lab_HU	1008
202	grow	Glukosa	facilis	quo	2926	k	76	c	18	Nihil tempore qui accusamus eligendi.	t	245	RSUD_MS	Lab_MS	1010
225	Plastic	Darah	vero	quo	3103	j	21	f	91	Fugiat impedit omnis in corporis odit possimus totam quia similique.	f	306	RSUD_MS	Lab_MS	1010
242	Ergonomic	Urine	suscipit	qui	1919	z	87	t	16	Provident itaque pariatur odit.	t	533	RSU_AHK	Lab_AHK	1001
223	homogeneous	Darah	sed	earum	1613	a	58	l	72	Quos iure id iste iure blanditiis repudiandae est blanditiis.	f	150	RSU_AHK	Lab_AHK	1003
234	protocol	Glukosa	consequatur	tempora	7645	d	17	c	10	Voluptatem exercitationem et nostrum animi numquam magnam.	t	809	RSU_AHK	Lab_AHK	1004
282	Aceh	Elektrokardiogram	voluptas	et	297	u	57	i	21	Quasi maiores labore nihil atque quos rerum optio perferendis facere.	t	911	RSS_Soetomo	Lab_Soetomo	1001
286	Borders	Glukosa	ut	optio	1630	i	55	y	66	Aut beatae reprehenderit tempore dignissimos quia.	f	239	RSS_Soetomo	Lab_Soetomo	1004
273	Buckinghamshire	Urine	sapiente	nobis	1173	f	48	c	37	Odit dolorem fuga autem iste.	f	669	RSUD_MS	Lab_MS	1009
283	up	Elektrokardiogram	itaque	excepturi	5899	j	42	s	79	Consequatur et ipsam ad magnam pariatur.	f	940	RSUD_MS	Lab_MS	1001
285	B2B	Glukosa	cum	reiciendis	8979	o	77	c	27	Officiis illo adipisci deserunt.	f	902	RSUD_MU	Lab_MU	1005
266	Republic	Glukosa	tenetur	dolorem	7773	c	76	q	95	Et repellat et voluptate recusandae.	f	823	RSUD_MU	Lab_MU	1006
270	withdrawal	Elektrokardiogram	corporis	blanditiis	7246	o	1	e	26	Et beatae iste ducimus.	f	799	RSS_Soetomo	Lab_Soetomo	1007
255	Plastic	Elektrokardiogram	similique	possimus	7607	t	1	u	2	Qui rerum laborum.	f	166	RSS_Premier	Lab_Premier	1001
278	Branding	Elektrokardiogram	accusamus	atque	1868	y	55	n	8	Quis eius dolor libero.	t	292	RSS_Soetomo	Lab_Soetomo	1010
295	Cambridgeshire	Darah	aspernatur	aut	1345	p	71	g	69	Modi temporibus facilis dolor.	f	129	RSU_Darmo	Lab_Darmo	1005
258	Selatan	Urine	autem	tempora	6962	q	20	s	52	Magnam in et ipsum itaque aut labore.	t	403	RSU_HU	Lab_HU	1008
251	Papua	Ekokardiografi	quibusdam	eaque	5020	z	38	q	73	Sit hic nisi voluptate quos exercitationem enim.	f	284	RSU_Haji	Lab_Haji	1009
253	state	Elektrokardiogram	nisi	laborum	3785	w	8	y	82	Non praesentium nostrum aliquid corporis dolorem.	f	358	RSU_HU	Lab_HU	1001
284	Fantastic	Ekokardiografi	aut	sint	9714	z	54	s	39	Eum officiis atque tempore voluptatem ipsam.	f	114	RSU_HU	Lab_HU	1004
280	SMS	Glukosa	vero	nihil	792	w	18	z	51	Aperiam saepe odit.	f	902	RSU_HU	Lab_HU	1004
263	Accounts	Glukosa	omnis	eos	5985	h	87	z	45	Consequuntur enim et beatae consequatur maiores eum.	f	288	RSU_HU	Lab_HU	1006
267	Granite	Elektrokardiogram	sed	ab	8286	k	5	u	34	Aliquam corrupti rerum nihil vel magnam ex consequuntur nobis.	f	873	RSU_Haji	Lab_Haji	1002
279	monitor	Ekokardiografi	est	libero	9526	i	8	a	73	Quia facilis dolor voluptatem soluta et consequuntur quam.	f	346	RSU_Haji	Lab_Haji	1003
261	up	Elektrokardiogram	ut	voluptatem	9109	t	52	l	15	Quibusdam voluptatibus vero ad quasi sed omnis optio doloremque.	f	230	RSU_Haji	Lab_Haji	1004
257	virtual	Urine	omnis	et	9455	b	100	j	87	Sed et sit et rem voluptatem.	t	179	RSU_AHP	Lab_AHP	1001
297	Metal	Elektrokardiogram	architecto	omnis	4640	o	70	k	59	Possimus vel dolorem et dolor ab sunt fugit.	t	964	RSU_AHP	Lab_AHP	1003
260	Path	Ekokardiografi	perspiciatis	suscipit	8022	g	55	f	11	Vel illo quis eum.	f	597	RSU_AHP	Lab_AHP	1008
289	array	Urine	quia	pariatur	6709	y	7	p	9	Numquam commodi et tempora quo rerum.	f	231	RSU_Darmo	Lab_Darmo	1002
290	Soft	Darah	asperiores	qui	4027	h	4	k	4	Nisi voluptatem velit ut eveniet.	f	742	RSU_Darmo	Lab_Darmo	1008
256	up	Ekokardiografi	quibusdam	quia	7824	y	83	c	25	Numquam officia beatae reiciendis velit aut accusantium omnis.	f	809	RSU_Haji	Lab_Haji	1006
277	AGP	Ekokardiografi	omnis	eligendi	3519	d	61	v	35	Quae et nihil ipsam est hic voluptatem.	t	210	RSU_Haji	Lab_Haji	1008
272	blue	Darah	laborum	dolores	8368	c	57	p	82	Ipsam consequatur voluptas quo delectus quod quo nobis velit esse.	t	428	RSU_HU	Lab_HU	1006
254	Mouse	Glukosa	ex	illum	5802	d	34	s	88	Voluptatem commodi incidunt dignissimos.	f	326	RSUD_MS	Lab_MS	1001
252	Salad	Elektrokardiogram	qui	omnis	1786	l	55	m	98	Voluptatibus numquam est nisi perferendis dolor ipsa sit dolore.	f	374	RSS_Premier	Lab_Premier	1005
276	copy	Urine	eius	odit	6335	t	50	y	59	Voluptas ut quidem dolores voluptas qui aut dolorum aperiam maiores.	t	340	RSUD_MS	Lab_MS	1004
262	benchmark	Glukosa	distinctio	omnis	5649	o	66	y	68	Ratione sunt aperiam repellendus ipsum illo.	f	528	RSUD_MS	Lab_MS	1006
268	protocol	Urine	fugiat	numquam	1861	d	55	f	24	Cupiditate perspiciatis quidem eum labore eaque quidem et.	f	118	RSUD_MS	Lab_MS	1006
259	firewall	Urine	perspiciatis	ad	7983	z	62	b	100	Quas et est et quo architecto ex sequi facilis non.	t	951	RSUD_MS	Lab_MS	1008
269	haptic	Elektrokardiogram	accusantium	illum	7921	l	73	d	25	Consequatur aut et nulla est consequatur voluptatibus.	f	347	RSU_AHK	Lab_AHK	1001
292	Sausages	Darah	saepe	dolores	1426	h	59	v	2	Rerum rerum et voluptatibus et enim distinctio distinctio.	f	653	RSU_AHK	Lab_AHK	1002
265	synthesize	Elektrokardiogram	et	labore	9619	j	22	x	78	Qui ad veniam.	f	761	RSU_AHK	Lab_AHK	1002
264	mobile	Ekokardiografi	eius	sint	9323	h	46	u	75	Et pariatur doloremque vel in est in magni.	t	768	RSU_AHK	Lab_AHK	1003
274	synthesize	Elektrokardiogram	ut	soluta	1121	y	61	x	20	Consequatur optio aut omnis alias possimus molestias.	t	345	RSU_AHK	Lab_AHK	1005
275	lavender	Glukosa	eos	temporibus	1419	e	94	f	94	Rerum consectetur sit libero animi aut placeat fugit in.	f	171	RSU_AHK	Lab_AHK	1006
312	payment	Ekokardiografi	quod	reiciendis	818	r	40	o	44	Consequuntur dolor laboriosam sint enim pariatur aspernatur.	t	622	RSS_Soetomo	Lab_Soetomo	1008
305	disintermediate	Ekokardiografi	facilis	cumque	7326	w	64	x	16	Eaque atque similique.	t	714	RSS_Soetomo	Lab_Soetomo	1012
314	invoice	Elektrokardiogram	quis	perspiciatis	6039	i	83	b	96	Eligendi eos autem quos quibusdam non nihil eveniet.	t	979	RSU_HU	Lab_HU	1009
315	Decentralized	Glukosa	enim	explicabo	331	p	75	n	45	Autem eveniet inventore tenetur non animi.	f	937	RSUD_MU	Lab_MU	1006
324	Frozen	Elektrokardiogram	hic	dolorum	6549	m	19	o	83	Vero iusto laboriosam dolorem qui et rerum commodi.	t	955	RSUD_MU	Lab_MU	1007
331	Agent	Darah	et	qui	3314	p	54	v	100	Cum animi omnis hic.	f	885	RSS_Premier	Lab_Premier	1003
316	Drive	Urine	eos	est	2002	k	74	v	14	Quidem minima non dolorem iure et corrupti.	t	821	RSS_Premier	Lab_Premier	1006
300	bi-directional	Darah	reiciendis	maiores	7500	q	53	j	12	Aut officiis cumque voluptatum nulla soluta.	t	707	RSS_Premier	Lab_Premier	1006
337	Gorontalo	Ekokardiografi	velit	quis	9166	d	32	p	59	Sit odio ut et architecto est rerum quisquam fugit.	f	634	RSU_Haji	Lab_Haji	1005
306	Marino	Darah	consectetur	deserunt	9827	a	56	g	86	Qui ea consequatur veniam tempore aut necessitatibus architecto.	t	401	RSU_Haji	Lab_Haji	1005
327	neural	Urine	aperiam	qui	3502	p	72	b	64	Asperiores est aliquid quod unde maiores iste eos tempore qui.	t	639	RSU_HU	Lab_HU	1007
339	Path	Glukosa	et	tempora	3106	s	56	e	72	Dicta voluptas enim dolorem debitis explicabo blanditiis.	t	780	RSU_Haji	Lab_Haji	1006
310	generate	Darah	voluptatem	esse	8668	j	75	l	79	Voluptate odit aut odio dicta optio praesentium eius soluta.	t	545	RSU_HU	Lab_HU	1001
321	Regional	Elektrokardiogram	eaque	recusandae	6228	f	10	d	50	Eos et hic nobis et dolorem ratione ratione autem sit.	t	303	RSU_HU	Lab_HU	1003
304	GB	Elektrokardiogram	soluta	voluptatem	8926	j	9	c	40	Ducimus architecto debitis facilis aut quos.	f	504	RSU_AHP	Lab_AHP	1006
333	Borders	Elektrokardiogram	quia	eligendi	1438	k	99	j	35	Similique est error aut modi et rerum.	t	220	RSU_AHP	Lab_AHP	1007
313	olive	Glukosa	tenetur	at	3165	p	86	m	31	Rerum autem incidunt ut aliquid non.	t	502	RSU_Darmo	Lab_Darmo	1001
299	Kip	Urine	velit	amet	7406	h	5	v	35	Laudantium suscipit quo possimus aut voluptas dignissimos voluptatem.	f	785	RSU_Darmo	Lab_Darmo	1005
322	Berkshire	Glukosa	ut	odit	4814	g	33	q	42	Repellat optio incidunt asperiores culpa molestiae est odio.	f	727	RSU_HU	Lab_HU	1005
332	lavender	Ekokardiografi	dolores	autem	5821	v	66	q	7	Explicabo sit vel fuga perspiciatis voluptatem.	t	450	RSU_Darmo	Lab_Darmo	1006
318	synthesizing	Darah	et	nostrum	8284	z	68	z	35	Doloremque vero fugiat labore autem quia aut consectetur.	t	885	RSU_Haji	Lab_Haji	1002
303	program	Glukosa	repellat	laudantium	5403	j	67	e	54	Dolores ex aut modi ut voluptatum laudantium velit.	f	124	RSU_HU	Lab_HU	1005
319	indigo	Elektrokardiogram	voluptatem	omnis	4938	c	97	d	35	Odio est eligendi.	t	115	RSU_Haji	Lab_Haji	1004
326	SCSI	Elektrokardiogram	maxime	expedita	9746	f	92	n	73	Sed soluta fugit sunt accusamus aut qui voluptatibus.	f	997	RSUD_MS	Lab_MS	1003
308	migration	Elektrokardiogram	nesciunt	autem	2285	k	10	k	56	Voluptas et et id cum impedit fugit consequatur.	t	519	RSUD_MS	Lab_MS	1005
301	program	Elektrokardiogram	qui	et	7423	o	6	t	16	Mollitia minima dolorum minus.	f	758	RSS_Premier	Lab_Premier	1010
323	transmit	Elektrokardiogram	qui	sed	3725	n	95	f	49	Laudantium harum qui nihil et rem.	t	936	RSUD_MU	Lab_MU	1001
307	deposit	Darah	dolorem	non	1755	t	11	m	7	Quo blanditiis totam mollitia ipsam id aliquid.	t	216	RSUD_MU	Lab_MU	1005
340	expedite	Ekokardiografi	voluptatem	laudantium	3700	b	34	c	80	Accusantium corporis accusantium consequatur omnis veritatis ex.	f	987	RSS_Soetomo	Lab_Soetomo	1001
329	algorithm	Glukosa	enim	perspiciatis	8447	g	18	g	47	Dolorum recusandae perspiciatis sapiente.	f	563	RSU_AHK	Lab_AHK	1001
325	Mouse	Darah	possimus	impedit	104	z	94	o	17	Consequatur et et sunt.	f	160	RSU_AHK	Lab_AHK	1002
345	Berkshire	Glukosa	velit	quia	9552	m	4	m	26	Ut facere illum repellat dolor dolorum fuga sunt.	f	413	RSU_AHK	Lab_AHK	1004
302	indexing	Urine	suscipit	sit	2285	f	42	w	91	Quae reiciendis earum qui labore perferendis ipsam.	f	299	RSU_AHP	Lab_AHP	1001
320	sensor	Ekokardiografi	occaecati	voluptatibus	4460	h	68	x	36	Veritatis inventore eveniet adipisci ex expedita in quia numquam corporis.	t	325	RSU_AHP	Lab_AHP	1002
336	Corporate	Elektrokardiogram	eligendi	eum	954	z	90	d	22	Aperiam quod commodi pariatur voluptate eum recusandae dolorem.	f	661	RSU_AHP	Lab_AHP	1005
309	composite	Ekokardiografi	et	quia	4756	r	69	a	89	Natus architecto incidunt aut voluptatum reprehenderit voluptatibus praesentium a.	f	661	RSU_AHP	Lab_AHP	1006
358	Chief	Darah	atque	illum	5196	y	81	h	78	Sint aut quis magni aut.	t	610	RSS_Soetomo	Lab_Soetomo	1011
348	Land	Elektrokardiogram	mollitia	eos	3512	c	90	f	59	Itaque molestiae nostrum unde maxime et porro.	f	879	RSS_Premier	Lab_Premier	1009
391	Ball	Glukosa	eum	deleniti	115	o	61	t	13	In voluptatem sunt harum eum eum tenetur.	t	286	RSU_HU	Lab_HU	1001
387	productize	Elektrokardiogram	veniam	voluptates	1050	a	27	s	40	Dolorum modi occaecati quis dolor autem voluptas.	f	461	RSU_AHP	Lab_AHP	1009
353	Chicken	Glukosa	molestiae	eum	6195	i	37	x	37	Voluptatum molestias et distinctio enim sapiente consequatur consequatur officia praesentium.	t	244	RSUD_MU	Lab_MU	1005
354	partnerships	Urine	quos	non	8407	l	25	u	31	Vel itaque consequatur natus officiis molestiae nihil ea.	f	223	RSUD_MU	Lab_MU	1007
385	Springs	Glukosa	corporis	in	7871	n	31	f	63	Ad aut mollitia alias amet.	f	342	RSUD_MS	Lab_MS	1009
350	Automotive	Glukosa	tempora	totam	3031	j	90	u	3	Iusto molestias hic cumque.	t	216	RSUD_MS	Lab_MS	1010
356	communities	Glukosa	deleniti	qui	5951	t	69	h	47	Et quibusdam odit vero dignissimos.	f	107	RSUD_MS	Lab_MS	1008
363	infrastructures	Elektrokardiogram	aliquid	et	84	k	47	d	8	Earum nobis unde laborum autem.	f	415	RSS_Premier	Lab_Premier	1002
384	metrics	Elektrokardiogram	deserunt	omnis	9903	k	5	n	30	Cum adipisci voluptatem expedita rerum laudantium nihil minus quia harum.	t	351	RSS_Soetomo	Lab_Soetomo	1000
349	Hat	Elektrokardiogram	ab	et	8959	x	97	p	20	Ratione dolorem ducimus et voluptas aut ullam distinctio nesciunt.	f	706	RSS_Soetomo	Lab_Soetomo	1006
369	monitor	Darah	quam	optio	1715	t	50	a	99	Occaecati totam est quia impedit rerum itaque nesciunt incidunt.	f	202	RSS_Premier	Lab_Premier	1005
352	Won	Elektrokardiogram	rerum	sequi	6226	s	87	u	94	Quo unde eveniet inventore sapiente.	t	965	RSS_Soetomo	Lab_Soetomo	1008
394	generating	Darah	mollitia	voluptatibus	6943	i	82	k	39	Non quas rerum blanditiis dignissimos odio voluptatibus.	t	246	RSU_Haji	Lab_Haji	1004
378	wireless	Darah	saepe	incidunt	4830	i	30	z	83	Eos est aperiam recusandae nihil consectetur.	t	314	RSU_HU	Lab_HU	1005
376	success	Glukosa	quia	quisquam	4485	w	93	a	14	Distinctio molestias laborum corporis.	t	251	RSU_Haji	Lab_Haji	1006
357	Infrastructure	Ekokardiografi	aspernatur	sapiente	3614	s	54	u	11	Quas quam vero laudantium recusandae aut.	f	448	RSU_AHK	Lab_AHK	1006
351	parsing	Elektrokardiogram	tempore	necessitatibus	5135	p	56	v	26	Maiores ut cumque harum animi rem libero molestiae ut eos.	t	262	RSU_AHP	Lab_AHP	1004
392	Executive	Elektrokardiogram	harum	quia	4609	n	26	o	37	Aliquam non neque.	t	106	RSU_AHP	Lab_AHP	1002
370	encryption	Glukosa	quo	cumque	4724	p	83	o	93	Impedit est quod.	t	761	RSU_AHP	Lab_AHP	1003
386	Utara	Glukosa	quasi	qui	2640	z	79	p	22	Voluptas debitis fugiat voluptates fuga nihil.	t	863	RSU_AHP	Lab_AHP	1004
379	auxiliary	Elektrokardiogram	omnis	rerum	2308	b	67	u	37	Et et sit earum.	f	802	RSU_AHP	Lab_AHP	1007
395	Netherlands	Urine	est	eum	1269	u	21	q	37	Eum amet voluptatem sed aut.	t	165	RSU_HU	Lab_HU	1005
389	Hryvnia	Urine	dolores	accusantium	89	o	92	v	88	Iure nulla optio beatae voluptatem amet est exercitationem.	f	909	RSU_HU	Lab_HU	1008
383	Loan	Elektrokardiogram	vero	rerum	1158	y	77	o	41	Tenetur corporis eum quis accusamus.	f	455	RSU_AHP	Lab_AHP	1008
364	payment	Urine	eos	sunt	8862	q	99	b	45	Incidunt quis qui recusandae eum.	f	626	RSU_Darmo	Lab_Darmo	1007
360	Forward	Ekokardiografi	id	unde	3986	m	67	u	31	A laborum quibusdam assumenda praesentium.	f	585	RSU_Haji	Lab_Haji	1001
381	Legacy	Darah	blanditiis	corrupti	1788	o	64	r	39	Expedita ad quod ipsa quae eum minus quos facere libero.	t	110	RSUD_MS	Lab_MS	1001
368	Buckinghamshire	Glukosa	aperiam	sapiente	1646	y	42	x	95	Est ut harum ducimus voluptatem quia iste.	t	787	RSUD_MU	Lab_MU	1002
374	visualize	Elektrokardiogram	atque	iure	400	l	31	g	93	Animi voluptas eius aliquid magnam eaque veritatis dolorem provident.	t	155	RSUD_MS	Lab_MS	1005
375	relationships	Glukosa	sunt	ut	4363	w	77	w	21	Et pariatur quos atque cupiditate cupiditate optio.	t	367	RSUD_MU	Lab_MU	1004
366	Fresh	Elektrokardiogram	similique	aut	1930	f	10	x	19	Aspernatur eos atque amet illum numquam hic tempore iste velit.	f	765	RSUD_MS	Lab_MS	1007
359	Computer	Urine	rerum	tempora	6441	f	24	o	23	Nulla sed est quam consequuntur sequi ut.	t	685	RSU_AHK	Lab_AHK	1001
372	firewall	Glukosa	quaerat	nihil	9169	w	33	x	64	Optio quae qui itaque numquam placeat et perferendis.	t	875	RSU_AHK	Lab_AHK	1001
355	holistic	Elektrokardiogram	laborum	assumenda	7793	c	49	b	99	Omnis voluptas aut architecto consequuntur temporibus et dolorem possimus.	t	242	RSU_AHK	Lab_AHK	1003
362	Vatu	Ekokardiografi	aliquam	cumque	2547	n	68	o	84	Omnis vel voluptatibus labore ex ipsa quia dolores illum neque.	t	639	RSU_AHK	Lab_AHK	1005
377	Harbors	Darah	aspernatur	voluptas	8789	j	8	k	36	Enim et non velit sapiente exercitationem expedita aspernatur.	f	705	RSU_AHK	Lab_AHK	1005
361	orchid	Urine	et	dolores	7856	f	30	m	99	Dolorum corporis iusto porro est aut alias.	t	144	RSU_HU	Lab_HU	1009
407	SDD	Urine	voluptas	quos	6163	s	3	u	73	Quo esse nihil et qui ut distinctio.	f	989	RSS_Soetomo	Lab_Soetomo	1003
405	Designer	Ekokardiografi	expedita	dolorem	6358	n	16	f	92	Sit rerum libero delectus eveniet ut.	f	902	RSS_Soetomo	Lab_Soetomo	1004
430	quantify	Urine	impedit	iure	6419	b	85	b	80	Est sed officia.	f	542	RSU_HU	Lab_HU	1003
403	cross-media	Elektrokardiogram	mollitia	ipsam	3268	x	55	a	65	Quia quisquam quod soluta quia pariatur voluptas omnis.	t	427	RSS_Soetomo	Lab_Soetomo	1005
436	enable	Elektrokardiogram	quia	optio	9678	h	88	k	69	Enim doloribus qui fuga minus asperiores.	t	776	RSU_AHK	Lab_AHK	1007
428	Keyboard	Glukosa	vel	autem	9701	m	61	i	45	Iure blanditiis odio odit et dolor.	t	493	RSU_AHK	Lab_AHK	1007
429	Hat	Ekokardiografi	dicta	assumenda	4467	u	38	p	55	Dolorem reiciendis eum ipsam minus sit.	t	334	RSUD_MU	Lab_MU	1008
432	e-enable	Darah	saepe	dolor	8931	s	63	j	60	Omnis inventore qui accusantium nostrum ratione dolores voluptatem voluptatem.	f	236	RSUD_MS	Lab_MS	1009
422	Falkland	Darah	ea	velit	2634	s	89	s	37	Similique architecto sit dolor sint non ducimus mollitia.	t	248	RSUD_MU	Lab_MU	1004
417	Ergonomic	Urine	aliquam	et	4491	u	30	o	42	Iure reiciendis soluta animi.	t	921	RSUD_MS	Lab_MS	1010
398	Cheese	Glukosa	iusto	natus	4839	l	14	s	22	Totam totam necessitatibus.	t	567	RSUD_MU	Lab_MU	1007
399	pink	Elektrokardiogram	et	nulla	9614	b	35	f	49	Esse ut ipsam quo.	t	720	RSS_Premier	Lab_Premier	1008
409	Shoes	Elektrokardiogram	qui	enim	7864	u	22	a	63	Hic sit animi maxime cum omnis dolores laboriosam.	f	247	RSS_Soetomo	Lab_Soetomo	1011
418	parsing	Elektrokardiogram	molestiae	rerum	3320	h	3	j	81	Eos aperiam iusto.	f	969	RSS_Soetomo	Lab_Soetomo	1012
402	digital	Elektrokardiogram	aliquid	ut	1963	r	44	i	18	Recusandae voluptate molestias porro omnis.	f	492	RSS_Premier	Lab_Premier	1008
404	National	Urine	quia	ipsa	3780	g	63	p	61	Unde consequatur temporibus a perferendis quis.	t	367	RSS_Soetomo	Lab_Soetomo	1002
416	Holy	Elektrokardiogram	et	et	1766	l	14	s	5	Sed velit et aut distinctio eaque.	f	593	RSU_Haji	Lab_Haji	1008
445	Analyst	Glukosa	porro	omnis	8580	w	97	r	84	Commodi eos ab provident illum quam eligendi.	f	423	RSU_HU	Lab_HU	1001
410	FTP	Glukosa	impedit	ipsa	9536	g	42	g	55	Minus officiis et expedita dignissimos nesciunt.	f	269	RSU_HU	Lab_HU	1008
424	Fantastic	Elektrokardiogram	aut	architecto	5576	g	63	f	23	Voluptates ad perspiciatis accusantium.	f	291	RSU_HU	Lab_HU	1003
415	Operative	Glukosa	accusantium	quo	6588	g	36	g	30	Ut voluptatem molestiae itaque doloribus dolores.	t	511	RSU_HU	Lab_HU	1003
440	red	Ekokardiografi	minima	distinctio	2691	g	22	d	41	Esse voluptatem quas voluptatem.	f	748	RSU_HU	Lab_HU	1006
421	empowering	Ekokardiografi	tempore	et	3424	y	96	d	38	Eius nostrum praesentium totam pariatur alias.	f	814	RSU_Darmo	Lab_Darmo	1003
414	generate	Darah	id	odio	2366	o	83	l	100	Rem eos inventore vel.	f	647	RSU_Darmo	Lab_Darmo	1005
433	Cote	Glukosa	sint	vero	2469	l	38	t	29	Nulla nihil et ipsum omnis voluptas consequatur perferendis perferendis.	f	814	RSU_AHK	Lab_AHK	1005
420	Consultant	Ekokardiografi	tempore	repellat	3657	q	22	f	89	Sit quod sed accusantium assumenda ea.	t	344	RSU_AHP	Lab_AHP	1002
437	Sleek	Glukosa	tempora	consectetur	7918	g	45	u	45	Consequatur ad corporis autem eligendi laudantium qui possimus.	f	974	RSU_AHP	Lab_AHP	1002
412	Account	Urine	aut	reiciendis	441	c	54	z	55	Qui culpa qui inventore architecto totam recusandae nam expedita.	t	912	RSU_Haji	Lab_Haji	1001
442	Concrete	Glukosa	quas	ratione	6480	v	52	m	38	Temporibus eveniet rerum sunt quod corporis.	t	150	RSU_Darmo	Lab_Darmo	1001
423	Tools	Glukosa	qui	distinctio	5858	y	92	p	65	Ea cupiditate explicabo ipsum enim et ad vel.	t	114	RSU_Darmo	Lab_Darmo	1003
411	USB	Urine	incidunt	dolores	8435	a	13	s	29	Modi fuga et praesentium dolores est quia voluptatum quas quia.	t	983	RSU_Haji	Lab_Haji	1002
427	Tunnel	Darah	saepe	alias	597	t	70	p	74	Quam voluptatibus necessitatibus deserunt.	f	414	RSU_Haji	Lab_Haji	1004
397	Health	Elektrokardiogram	eum	recusandae	9229	o	89	w	93	Explicabo molestiae occaecati deleniti occaecati ut cum nemo.	f	129	RSUD_MU	Lab_MU	1002
419	supply-chains	Ekokardiografi	aliquam	occaecati	3052	e	91	h	20	Qui assumenda nostrum voluptatem autem laudantium corrupti velit.	t	510	RSUD_MS	Lab_MS	1006
441	payment	Ekokardiografi	sit	vel	3621	u	14	o	10	Nam in ad ex quis exercitationem quam eos qui minima.	t	860	RSUD_MU	Lab_MU	1004
408	Legacy	Glukosa	sunt	eum	2494	h	50	b	10	Ut laudantium dolorem.	t	368	RSUD_MS	Lab_MS	1006
444	magnetic	Glukosa	numquam	voluptatum	335	i	87	r	86	Officia ratione sint doloribus.	t	750	RSUD_MS	Lab_MS	1008
435	Licensed	Urine	esse	ut	5596	w	86	x	14	Est sint accusantium vero.	t	107	RSU_AHK	Lab_AHK	1002
400	Sausages	Ekokardiografi	consequatur	in	7153	l	58	p	49	Commodi dolores molestiae quibusdam fuga nihil dolorem.	t	229	RSU_AHK	Lab_AHK	1003
431	Factors	Ekokardiografi	dignissimos	maiores	30	p	57	z	80	Rerum dolore voluptatem et voluptas cupiditate dolorum et.	t	222	RSU_AHK	Lab_AHK	1004
463	Table	Darah	delectus	rerum	7364	k	77	p	28	Eveniet maxime nulla voluptas molestias est ea expedita eaque delectus.	f	377	RSS_Premier	Lab_Premier	1009
448	Luxembourg	Elektrokardiogram	dolores	quisquam	5570	k	83	d	26	Accusamus eaque rem qui nobis.	t	822	RSS_Premier	Lab_Premier	1006
466	Mobility	Elektrokardiogram	ea	sunt	8609	z	74	m	2	Aut rerum nisi odio itaque.	t	696	RSS_Premier	Lab_Premier	1008
457	Orchestrator	Darah	error	sed	2048	l	85	r	2	Eum aliquid iste sint.	t	458	RSS_Soetomo	Lab_Soetomo	1001
461	Plastic	Urine	odit	autem	9802	k	91	y	9	Et ex aliquid.	t	925	RSS_Soetomo	Lab_Soetomo	1000
449	withdrawal	Glukosa	autem	enim	5189	o	6	w	13	Rerum itaque cumque vitae in quaerat.	t	553	RSU_HU	Lab_HU	1001
450	relationships	Urine	dicta	sint	6014	r	48	w	60	Quaerat ex quisquam laudantium nihil illum quidem similique suscipit possimus.	t	822	RSS_Soetomo	Lab_Soetomo	1009
496	Account	Urine	corporis	necessitatibus	3252	c	64	u	27	Numquam possimus magni iusto consequuntur sint dolor voluptatem quas.	t	361	RSS_Soetomo	Lab_Soetomo	1006
454	Fresh	Darah	architecto	ex	8558	q	2	x	82	Quis aut ut.	t	495	RSU_AHK	Lab_AHK	1007
491	Sharable	Urine	laudantium	in	2904	j	61	w	82	Temporibus non molestiae enim odit.	f	442	RSS_Soetomo	Lab_Soetomo	1012
488	Avon	Darah	tenetur	quia	9417	g	98	w	63	Inventore quod non quisquam aut architecto et velit.	f	485	RSUD_MU	Lab_MU	1002
470	deposit	Urine	similique	ut	7673	w	70	m	94	Et rerum ab.	f	391	RSUD_MS	Lab_MS	1003
482	Shilling	Ekokardiografi	ab	optio	8417	m	34	f	73	Dolorem et atque perspiciatis explicabo quisquam aut.	t	741	RSUD_MU	Lab_MU	1003
476	driver	Ekokardiografi	deserunt	molestias	1434	l	87	h	65	Et rerum repellat itaque cupiditate dicta alias.	f	797	RSUD_MS	Lab_MS	1008
472	compressing	Glukosa	quasi	et	5652	p	90	s	63	Sit repellendus nostrum omnis quidem corrupti dicta odit fugiat.	t	675	RSUD_MS	Lab_MS	1002
456	invoice	Urine	repellendus	distinctio	9738	y	80	h	6	Quia omnis ipsum eaque veniam laborum explicabo fugiat.	f	579	RSS_Premier	Lab_Premier	1002
487	Research	Urine	quam	libero	1419	y	24	u	6	Nulla placeat ex occaecati nemo.	f	291	RSUD_MU	Lab_MU	1003
455	Avon	Elektrokardiogram	dolorem	qui	5639	w	87	h	96	Sed voluptatum occaecati placeat inventore maxime quo veniam et.	f	471	RSS_Premier	Lab_Premier	1003
452	technologies	Ekokardiografi	fugiat	ad	7655	r	76	c	62	Sunt et cumque aut quo.	f	200	RSUD_MU	Lab_MU	1003
474	alarm	Glukosa	consequatur	et	1847	p	100	p	5	Eligendi amet earum.	f	410	RSU_Haji	Lab_Haji	1009
490	Frozen	Elektrokardiogram	dolor	vitae	2572	b	98	h	41	Omnis ea voluptatum sapiente aut ut.	f	895	RSU_Haji	Lab_Haji	1007
447	morph	Darah	suscipit	autem	937	c	1	h	65	Dolorum enim error est quia commodi debitis ipsum.	t	573	RSU_Haji	Lab_Haji	1007
493	violet	Glukosa	eligendi	est	1	z	64	w	90	Officiis a ut ipsum qui.	t	499	RSUD_MS	Lab_MS	1011
484	violet	Urine	eum	ut	981	q	32	y	100	Repudiandae dicta soluta velit nihil.	f	362	RSU_HU	Lab_HU	1002
475	Digitized	Elektrokardiogram	ut	id	5359	l	78	g	53	Doloremque dolor doloribus sit cumque.	t	879	RSU_HU	Lab_HU	1002
481	eyeballs	Darah	qui	qui	7179	p	49	w	96	Ut odio cupiditate quae nisi alias dolores.	t	825	RSU_Darmo	Lab_Darmo	1007
462	Rubber	Urine	est	illum	3660	l	12	z	56	Vero perferendis non rerum alias dolores dolorum dolorem magni itaque.	f	1000	RSU_Haji	Lab_Haji	1002
464	Strategist	Darah	debitis	et	6296	q	8	h	43	Laboriosam sed ipsum libero eos corrupti.	t	699	RSU_AHK	Lab_AHK	1006
473	Fresh	Elektrokardiogram	minus	quisquam	5262	n	54	t	64	Voluptatum id et qui aut quae consequuntur vero voluptatibus aut.	f	931	RSU_AHP	Lab_AHP	1001
451	attitude-oriented	Urine	quaerat	in	2372	e	91	f	36	Neque libero voluptate perspiciatis commodi id et.	f	424	RSU_AHP	Lab_AHP	1001
453	transmit	Darah	omnis	tempore	9922	v	65	k	53	Quia non hic accusamus.	f	724	RSU_AHP	Lab_AHP	1002
489	redundant	Urine	pariatur	excepturi	9158	c	94	h	95	Eius iure nihil.	t	157	RSU_AHP	Lab_AHP	1003
479	technologies	Elektrokardiogram	quam	qui	4306	e	18	o	54	Officiis et exercitationem modi facere eaque neque dolorem molestiae praesentium.	t	940	RSU_AHP	Lab_AHP	1007
465	program	Elektrokardiogram	voluptates	error	2839	a	63	m	98	Numquam earum est sapiente minus vel.	f	429	RSU_Darmo	Lab_Darmo	1004
478	Gibraltar	Elektrokardiogram	est	et	2823	d	86	s	60	Illo quis sed et hic vel.	t	205	RSU_Darmo	Lab_Darmo	1008
486	Synergized	Darah	quasi	harum	6731	m	49	h	6	Dolorum impedit assumenda non quibusdam blanditiis fuga quia et suscipit.	f	127	RSUD_MS	Lab_MS	1003
458	hack	Darah	temporibus	neque	9071	z	10	x	33	Non beatae placeat sint.	f	507	RSU_HU	Lab_HU	1006
483	Granite	Elektrokardiogram	vel	nemo	9526	i	98	t	48	Ad quidem quo qui repellat aspernatur blanditiis qui sunt.	t	904	RSU_HU	Lab_HU	1007
494	array	Glukosa	voluptatum	in	1680	v	68	y	39	Tenetur omnis sed.	f	635	RSU_HU	Lab_HU	1007
467	Loan	Ekokardiografi	reiciendis	expedita	3112	y	75	c	98	Voluptas nulla molestiae quia ea nam magni nostrum maxime commodi.	t	371	RSU_Haji	Lab_Haji	1010
471	Incredible	Urine	qui	reprehenderit	721	t	67	n	97	Maiores ipsam fugiat incidunt.	t	905	RSU_HU	Lab_HU	1006
459	lime	Urine	ut	amet	9034	f	55	n	58	Aut quis nesciunt ea fugit dolorum aliquam dolores laborum dolorum.	t	989	RSU_Haji	Lab_Haji	1010
495	Practical	Darah	nesciunt	veniam	2729	f	12	e	89	Nisi eveniet minus vitae fuga consequuntur dolor.	t	763	RSU_AHK	Lab_AHK	1006
500	Crest	Urine	in	in	8690	y	8	c	86	Reprehenderit est dolorem illum quo quo similique nulla est.	f	874	RSS_Premier	Lab_Premier	1010
236	client-server	Glukosa	molestiae	laborum	8765	n	48	d	50	Sint magnam et aut perspiciatis voluptatem et et quod beatae.	t	461	RSS_Royal	Lab_Royal	1000
499	strategic	Urine	occaecati	amet	9428	b	56	l	93	Placeat ab repellat deleniti illo dolorem aut natus repellendus.	f	856	RSUD_MS	Lab_MS	1007
497	Utara	Elektrokardiogram	et	minima	674	u	66	e	58	Maiores at dolores ut a enim.	f	158	RSS_Premier	Lab_Premier	1007
5	Kalimantan	Urine	nulla	recusandae	3775	x	91	k	88	Deleniti atque quo.	f	597	RSS_Royal	Lab_Royal	1000
27	demand-driven	Ekokardiografi	assumenda	quo	8675	a	30	e	95	Tempore earum deserunt magni vel consequatur aperiam aut quae.	t	363	RSS_Royal	Lab_Royal	1000
498	override	Glukosa	pariatur	tempora	641	c	58	o	69	Repellendus magnam alias.	f	147	RSU_HU	Lab_HU	1004
173	Up-sized	Ekokardiografi	animi	enim	3679	t	77	r	53	Sit quibusdam vel sint facere.	f	314	RSS_Royal	Lab_Royal	1001
311	Salad	Ekokardiografi	deserunt	ut	9410	v	24	l	45	Optio omnis alias aperiam aut aut.	f	680	RSS_Royal	Lab_Royal	1001
101	policy	Darah	quasi	sit	9387	p	97	n	8	Et suscipit rerum ipsa dolor occaecati soluta ad eum.	t	376	RSS_Royal	Lab_Royal	1001
328	Ball	Urine	molestiae	molestias	1447	r	78	n	38	Nisi nihil quia earum.	f	715	RSS_Royal	Lab_Royal	1001
413	Mouse	Darah	voluptatem	ut	3061	x	8	j	84	Illo quia minus illo quod saepe saepe rerum voluptate qui.	t	228	RSS_Royal	Lab_Royal	1002
220	HDD	Darah	natus	est	5512	k	34	t	69	Ipsa beatae debitis autem impedit blanditiis.	t	259	RSS_Royal	Lab_Royal	1002
166	methodology	Urine	quis	cupiditate	9086	p	26	n	70	Sed quibusdam consequatur.	t	131	RSS_Royal	Lab_Royal	1002
148	Bulgaria	Glukosa	perferendis	eveniet	9704	s	98	z	30	Reprehenderit aliquid minus.	t	695	RSS_Royal	Lab_Royal	1002
45	Archipelago)	Darah	reiciendis	dolorem	8488	l	78	k	96	Cum aut natus similique.	f	738	RSS_Royal	Lab_Royal	1003
317	Investment	Urine	voluptatem	asperiores	6606	w	50	t	22	Tempora saepe et et.	t	929	RSS_Royal	Lab_Royal	1003
212	recontextualize	Elektrokardiogram	laboriosam	eos	1693	g	90	l	69	Eum ducimus ut libero voluptatum quidem molestias quidem.	f	261	RSS_Royal	Lab_Royal	1003
373	Savings	Elektrokardiogram	dolorem	corrupti	1478	v	4	x	74	Ex illo cupiditate.	f	663	RSS_Royal	Lab_Royal	1004
185	Rial	Elektrokardiogram	harum	dolorem	4616	x	28	d	30	Sint aut voluptatem qui quia eveniet et id.	f	787	RSS_Royal	Lab_Royal	1004
161	Ergonomic	Glukosa	totam	ad	552	l	59	p	16	Amet exercitationem a laboriosam.	t	961	RSS_Royal	Lab_Royal	1004
172	Global	Darah	voluptatem	veritatis	3846	v	82	o	56	Quos est ut cumque praesentium animi dolorum architecto praesentium.	t	258	RSS_Royal	Lab_Royal	1005
287	projection	Glukosa	voluptas	esse	3281	e	25	y	22	Et sint velit iure iusto cupiditate.	t	215	RSS_Royal	Lab_Royal	1005
347	Developer	Ekokardiografi	quas	fuga	370	s	62	h	52	Vel dicta ipsa nisi.	t	858	RSS_Royal	Lab_Royal	1005
281	backing	Darah	vitae	dolores	6334	o	26	n	7	Magni quia rerum rerum magnam labore repudiandae quaerat eos.	f	879	RSS_Royal	Lab_Royal	1006
477	Licensed	Elektrokardiogram	provident	aliquid	691	e	94	j	62	Quod rerum eius.	f	924	RSS_Royal	Lab_Royal	1006
52	backing	Ekokardiografi	fugit	a	8932	u	45	j	72	Ex quo voluptates quae quod voluptatem aut nemo.	f	586	RSS_Royal	Lab_Royal	1006
192	Investor	Darah	quia	sint	1168	h	78	c	19	Repellendus tempora vel neque necessitatibus.	t	379	RSS_Royal	Lab_Royal	1007
367	Lithuania	Darah	dolores	qui	1873	k	26	q	24	Quasi nostrum debitis autem.	t	372	RSS_Royal	Lab_Royal	1007
104	Cotton	Elektrokardiogram	et	totam	607	f	56	q	91	Unde voluptas earum ut cumque qui ullam et voluptatum.	f	362	RSS_Royal	Lab_Royal	1008
158	hacking	Ekokardiografi	aspernatur	dolorem	9999	f	78	g	19	Et et dolores dicta quam voluptate id explicabo.	f	921	RSS_Royal	Lab_Royal	1008
102	e-markets	Elektrokardiogram	recusandae	adipisci	7307	p	8	i	24	Officiis exercitationem ut molestiae.	f	449	RSS_Royal	Lab_Royal	1008
68	channels	Urine	et	odit	4755	x	23	l	73	Est voluptatem hic et non illo consequatur voluptatem facilis.	t	194	RSS_Royal	Lab_Royal	1009
181	Sleek	Darah	omnis	occaecati	7026	p	25	v	49	Nam et voluptatem beatae repudiandae adipisci culpa.	t	610	RSS_Royal	Lab_Royal	1009
32	communities	Darah	fuga	officia	6686	e	54	x	10	Laboriosam ut assumenda corporis vel voluptatum accusantium adipisci.	f	494	RSS_Royal	Lab_Royal	1009
271	Sheqel	Elektrokardiogram	temporibus	odio	1655	u	29	m	30	Praesentium eos dolores similique.	f	796	RSS_Royal	Lab_Royal	1010
401	withdrawal	Ekokardiografi	ut	omnis	3318	y	50	k	42	Inventore quo esse similique culpa voluptas facere amet veniam id.	f	351	RSS_Royal	Lab_Royal	1010
460	driver	Elektrokardiogram	quae	laboriosam	7822	a	64	c	1	Libero velit consequatur nulla et ut libero adipisci aperiam.	t	951	RSS_Royal	Lab_Royal	1010
128	homogeneous	Darah	est	autem	6715	x	46	c	39	Repellendus recusandae itaque saepe ipsum fugit velit accusantium natus.	f	937	RSS_Royal	Lab_Royal	1011
469	overriding	Glukosa	aliquam	quia	2758	s	40	n	11	Voluptatum velit ut illum.	f	190	RSS_Royal	Lab_Royal	1011
43	deposit	Darah	explicabo	est	2711	x	13	k	71	Veniam repellat commodi dolorem dicta.	f	854	RSS_Royal	Lab_Royal	1011
100	initiative	Elektrokardiogram	nemo	assumenda	5377	v	87	y	50	Aut quaerat illum.	f	547	RSS_Royal	Lab_Royal	1012
371	Producer	Ekokardiografi	accusantium	aliquam	7169	e	14	r	15	Voluptas quam ut earum inventore provident occaecati.	f	244	RSS_Royal	Lab_Royal	1012
150	mobile	Urine	corrupti	saepe	2632	o	89	a	87	Libero officia hic culpa.	t	572	RSS_Royal	Lab_Royal	1012
193	Research	Glukosa	soluta	qui	8641	u	89	k	50	Magni nobis perferendis repudiandae atque consequatur nulla doloremque temporibus quis.	t	971	RSS_Royal	Lab_Royal	1013
250	magenta	Glukosa	dolorem	hic	9159	r	93	r	94	Nisi aut deleniti placeat.	f	319	RSS_Royal	Lab_Royal	1013
1	Seamless	Ekokardiografi	eaque	consequatur	5854	z	84	h	7	Et recusandae aut dolor.	f	356	RSU_AHP	Lab_AHP	1009
443	program	Ekokardiografi	occaecati	enim	206	l	20	p	71	Aut temporibus officia aperiam sunt fuga.	f	603	RSU_AHK	Lab_AHK	1004
438	Shoes	Darah	odit	nulla	2279	n	77	q	7	Adipisci magni officiis dicta cumque ut dicta.	t	921	RSU_AHK	Lab_AHK	1004
390	hack	Darah	earum	saepe	5662	c	93	a	71	Omnis molestias repellat et.	t	615	RSU_AHK	Lab_AHK	1004
342	Home	Ekokardiografi	quia	magni	6678	c	63	l	32	Molestias et dolorem facere ea commodi saepe in quod pariatur.	f	853	RSU_Haji	Lab_Haji	1002
91	encoding	Glukosa	placeat	sunt	6999	t	67	p	13	Dolorem voluptas sunt quos sit et numquam.	t	701	RSU_Haji	Lab_Haji	1003
80	Yogyakarta	Ekokardiografi	enim	consequuntur	667	a	43	i	97	Minus et occaecati unde illo maxime quod.	t	103	RSU_Haji	Lab_Haji	1004
492	optimizing	Darah	nobis	dolorem	2694	i	66	t	48	Repellendus occaecati quaerat magnam cupiditate.	f	233	RSU_Haji	Lab_Haji	1005
291	implement	Urine	delectus	et	4185	f	11	e	38	Dignissimos accusantium eligendi mollitia neque consequatur voluptas atque.	t	172	RSU_Haji	Lab_Haji	1006
341	Agent	Elektrokardiogram	reiciendis	et	4362	j	65	l	82	Et id et dolores eaque dolorem.	f	865	RSU_Haji	Lab_Haji	1007
79	Handmade	Glukosa	aperiam	quidem	586	h	81	g	96	Est ut vel assumenda voluptatem dolor voluptatem inventore qui facilis.	f	631	RSU_Haji	Lab_Haji	1009
330	PCI	Darah	dolorem	neque	6258	z	90	t	63	Laudantium eum ut reprehenderit id quis sit adipisci inventore sed.	f	131	RSU_HU	Lab_HU	1002
334	Factors	Glukosa	et	ut	2108	l	94	l	21	Accusantium et exercitationem.	f	964	RSU_HU	Lab_HU	1008
335	invoice	Urine	at	quia	4644	w	87	p	80	Rerum exercitationem ipsam nisi eligendi.	t	357	RSU_HU	Lab_HU	1008
388	teal	Ekokardiografi	quam	distinctio	6765	z	31	p	35	Quae pariatur veritatis adipisci odio exercitationem quam.	f	913	RSUD_MS	Lab_MS	1002
88	Manager	Glukosa	ut	maxime	9960	l	48	u	56	Incidunt omnis eaque voluptatem quia.	f	627	RSUD_MS	Lab_MS	1003
90	hard	Glukosa	sapiente	qui	5170	l	2	h	98	Animi omnis laboriosam qui molestias animi dolore natus voluptatem perspiciatis.	f	358	RSUD_MS	Lab_MS	1004
96	Kuwait	Glukosa	mollitia	voluptas	5328	q	20	l	55	Perspiciatis quidem iste culpa.	f	304	RSUD_MS	Lab_MS	1005
298	cross-platform	Darah	atque	enim	1574	x	24	s	20	Quasi optio et ut porro vel vitae ut.	t	793	RSUD_MS	Lab_MS	1008
294	Infrastructure	Urine	esse	accusantium	6031	m	86	o	7	Quae adipisci aut ut non voluptates voluptas et occaecati.	f	183	RSUD_MS	Lab_MS	1002
243	1080p	Glukosa	modi	amet	8325	v	23	s	66	Dolores perspiciatis eius non sit quia sint quae optio sed.	f	346	RSUD_MU	Lab_MU	1002
240	deposit	Ekokardiografi	beatae	necessitatibus	7333	t	67	i	97	Corrupti occaecati earum quasi illum modi blanditiis et dolore ut.	t	495	RSUD_MU	Lab_MU	1002
343	Sterling	Darah	alias	consequatur	8590	s	27	p	30	Ipsam ducimus distinctio.	f	344	RSUD_MU	Lab_MU	1005
144	Senior	Elektrokardiogram	molestias	accusamus	4930	a	62	m	88	Voluptatum eos culpa nemo et repellendus deleniti.	f	753	RSS_Premier	Lab_Premier	1001
92	port	Darah	aut	voluptatem	4398	o	35	k	3	Unde blanditiis omnis veniam dignissimos odio officia nihil.	t	457	RSS_Premier	Lab_Premier	1002
365	Vista	Ekokardiografi	quas	minus	4230	d	95	g	22	Ea blanditiis magni ex ea ad alias aliquid dignissimos inventore.	t	492	RSS_Premier	Lab_Premier	1003
380	Agent	Elektrokardiogram	nostrum	tempore	2680	g	12	u	91	Et qui esse hic.	f	147	RSS_Premier	Lab_Premier	1003
93	Quality-focused	Urine	minima	voluptas	8545	n	21	d	68	Similique ullam laboriosam ullam et similique impedit corporis voluptatem.	t	538	RSS_Premier	Lab_Premier	1003
149	killer	Glukosa	beatae	ducimus	9111	y	8	e	39	Nesciunt ut commodi.	f	334	RSS_Premier	Lab_Premier	1004
425	Ports	Darah	in	asperiores	647	a	5	n	59	Error aut perspiciatis ut et enim esse non odit.	t	643	RSS_Premier	Lab_Premier	1004
147	Dobra	Ekokardiografi	error	nam	1536	e	80	n	17	Cum facere consequatur consequatur omnis repellendus vitae.	f	980	RSS_Premier	Lab_Premier	1004
468	Escudo	Elektrokardiogram	delectus	ullam	4281	o	93	d	97	Id totam et dignissimos facilis culpa.	f	650	RSS_Premier	Lab_Premier	1004
346	EXE	Ekokardiografi	possimus	sit	226	y	99	a	98	Voluptatem eius possimus.	f	288	RSS_Premier	Lab_Premier	1005
406	matrices	Urine	ab	amet	5635	x	4	k	15	Doloribus quod voluptatum vitae voluptas rerum.	f	385	RSS_Premier	Lab_Premier	1006
426	Account	Ekokardiografi	amet	aliquam	9122	f	88	s	83	Ab placeat nesciunt quia.	f	415	RSS_Premier	Lab_Premier	1007
439	Interactions	Urine	similique	incidunt	6679	d	36	w	48	Voluptatibus natus similique consequatur sequi voluptas.	t	902	RSS_Premier	Lab_Premier	1007
480	supply-chains	Urine	dolor	voluptatibus	8880	t	10	t	60	In et similique ullam quo et ut consequatur ea.	f	408	RSS_Royal	Lab_Royal	1007
485	International	Ekokardiografi	quidem	corrupti	5705	x	19	f	29	Tenetur molestias sint.	f	986	RSS_Royal	Lab_Royal	1013
393	Re-engineered	Glukosa	velit	eius	9563	j	44	w	41	Amet maxime fugit sunt occaecati error necessitatibus.	f	398	RSS_Soetomo	Lab_Soetomo	1001
296	Rubber	Glukosa	eveniet	qui	1098	z	43	e	12	Quia vel rerum ab.	f	466	RSS_Soetomo	Lab_Soetomo	1002
241	Games	Darah	dolorum	neque	4663	j	12	l	40	Accusantium rem autem occaecati aut autem necessitatibus corporis.	f	429	RSS_Soetomo	Lab_Soetomo	1002
217	deposit	Urine	voluptatem	eum	5055	j	92	u	47	Ipsa accusantium suscipit est quia laudantium nostrum laborum autem.	f	241	RSS_Soetomo	Lab_Soetomo	1002
288	array	Darah	explicabo	sint	5093	z	27	g	97	Vel at rerum modi sequi repellendus iusto dolor nam beatae.	t	526	RSS_Soetomo	Lab_Soetomo	1006
293	programming	Elektrokardiogram	enim	quae	9951	e	64	a	72	Voluptatum fugiat aut sunt minus quia molestiae officiis itaque.	f	832	RSS_Soetomo	Lab_Soetomo	1008
434	Factors	Darah	voluptatem	ut	429	t	47	f	67	Aut nemo quos recusandae omnis.	t	825	RSS_Soetomo	Lab_Soetomo	1009
244	Intelligent	Elektrokardiogram	eveniet	quas	495	c	73	y	71	Ad minus ea in.	t	214	RSS_Soetomo	Lab_Soetomo	1009
232	explicit	Darah	deserunt	molestiae	4708	r	46	b	55	Ut rerum odio.	f	379	RSS_Soetomo	Lab_Soetomo	1011
98	grey	Ekokardiografi	quia	ipsum	8491	w	33	k	77	Et quia eius dolore consequatur velit quo rerum repellendus saepe.	t	560	RSU_AHP	Lab_AHP	1007
338	Organic	Urine	magnam	aut	5433	v	2	n	41	Aut magnam aut saepe id et.	f	365	RSU_HU	Lab_HU	1002
396	International	Darah	quia	non	9495	h	7	e	46	Perferendis aut expedita deleniti recusandae repudiandae fugiat dolor dolorem.	f	401	RSS_Soetomo	Lab_Soetomo	1005
382	Assistant	Ekokardiografi	qui	libero	619	e	38	c	40	Atque eum id quis sit est.	t	239	RSU_AHK	Lab_AHK	1007
446	indexing	Glukosa	eum	voluptas	4796	c	80	q	93	Labore vero ea placeat cum.	f	315	RSU_HU	Lab_HU	1009
344	bottom-line	Glukosa	ab	minus	9837	o	31	t	92	Soluta totam explicabo voluptate adipisci aliquid autem dolor aliquam ut.	f	636	RSU_HU	Lab_HU	1009
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, nama, username, password, role_id, vendor_id) FROM stdin;
1	superadmin	superadmin	$2a$08$omRGeWgShE4mTmWtcRN2s.Mv0ciRfFeB8dAUeUTbCZ.vnBgOSIpJC	1	\N
2	superadmin2	superadmin2	$2a$08$BXRD8w7NCdzIHxETnNb.w.7ZFLmchJGCjCV4MHfx1NWTLUXY0Uv6O	1	\N
3	superadmin3	superadmin3	$2a$08$OYGHU2ZRdGAu3J4JzudbdOI4HOCNtB3Rh0sgXfYjKgIRcbOXGJBHm	1	\N
4	coba user	coba	$2a$08$N22FB.Qvs6whec6Bo5ZKNe.v94ztBpacvRCMK/6tkqClWKaQVZHiC	3	1
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor (id, nama, provinsi_id, kota_id, status) FROM stdin;
1	PT Wahana Rizky Gumilang	35	3578	t
2	PT Good People	35	3578	t
4	PT Wahana Meditek Indonesia	35	3578	t
3	PT Indonesia Sehat	36	3603	t
5	PT Medika Indonesia	35	3508	t
6	PT Citra Medika	11	1173	t
\.


--
-- Name: kategori_rs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_rs_id_seq', 83, true);


--
-- Name: kecamatan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kecamatan_id_seq', 1, false);


--
-- Name: kota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kota_id_seq', 1, false);


--
-- Name: lab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lab_id_seq', 10, true);


--
-- Name: provinsi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinsi_id_seq', 1, false);


--
-- Name: refresh_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refresh_token_id_seq', 449, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 5, true);


--
-- Name: rumah_sakit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rumah_sakit_id_seq', 10, true);


--
-- Name: t_pasien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pasien_id_seq', 100, true);


--
-- Name: t_pemeriksaan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pemeriksaan_id_seq', 500, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: vendor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_id_seq', 6, true);


--
-- Name: kategori_rs kategori_rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori_rs
    ADD CONSTRAINT kategori_rs_pkey PRIMARY KEY (id);


--
-- Name: kecamatan kecamatan_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pk PRIMARY KEY (id);


--
-- Name: kota kota_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kota
    ADD CONSTRAINT kota_pk PRIMARY KEY (id);


--
-- Name: lab lab_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab
    ADD CONSTRAINT lab_kode_key UNIQUE (kode);


--
-- Name: lab lab_nama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab
    ADD CONSTRAINT lab_nama_key UNIQUE (nama);


--
-- Name: lab lab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lab
    ADD CONSTRAINT lab_pkey PRIMARY KEY (id);


--
-- Name: provinsi provinsi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinsi
    ADD CONSTRAINT provinsi_pk PRIMARY KEY (id);


--
-- Name: refresh_token refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token
    ADD CONSTRAINT refresh_token_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: rumah_sakit rumah_sakit_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rumah_sakit
    ADD CONSTRAINT rumah_sakit_kode_key UNIQUE (kode);


--
-- Name: rumah_sakit rumah_sakit_nama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rumah_sakit
    ADD CONSTRAINT rumah_sakit_nama_key UNIQUE (nama);


--
-- Name: rumah_sakit rumah_sakit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rumah_sakit
    ADD CONSTRAINT rumah_sakit_pkey PRIMARY KEY (id);


--
-- Name: t_pasien t_pasien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pasien
    ADD CONSTRAINT t_pasien_pkey PRIMARY KEY (id, registrasi_id);


--
-- Name: t_pemeriksaan t_pemeriksaan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pemeriksaan
    ADD CONSTRAINT t_pemeriksaan_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: vendor vendor_nama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_nama_key UNIQUE (nama);


--
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

