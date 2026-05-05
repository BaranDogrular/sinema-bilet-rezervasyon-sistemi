--
-- PostgreSQL database dump
--

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-04 14:29:19

--
-- TOC entry 219 (class 1259 OID 16434)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    tmdb_id integer,
    title character varying(200) NOT NULL,
    genre character varying(150),
    duration character varying(50),
    rating character varying(20),
    image text,
    description text,
    release_date character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'now_showing'::character varying,
    trailer_url text
);

--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.movies_id_seq OWNER TO postgres;

--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 220
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;

--
-- TOC entry 221 (class 1259 OID 16443)
-- Name: reservation_seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_seats (
    id integer NOT NULL,
    reservation_id integer,
    seat_id integer
);

--
-- TOC entry 222 (class 1259 OID 16447)
-- Name: reservation_seats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_seats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.reservation_seats_id_seq OWNER TO postgres;

--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 222
-- Name: reservation_seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_seats_id_seq OWNED BY public.reservation_seats.id;

--
-- TOC entry 223 (class 1259 OID 16448)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    user_id integer,
    movie_id integer,
    showtime_id integer,
    total_price integer NOT NULL,
    status character varying(30) DEFAULT 'Onaylandı'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

--
-- TOC entry 224 (class 1259 OID 16455)
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.reservations_id_seq OWNER TO postgres;

--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 224
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;

--
-- TOC entry 225 (class 1259 OID 16456)
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    id integer NOT NULL,
    showtime_id integer,
    seat_no character varying(10) NOT NULL,
    is_reserved boolean DEFAULT false
);

--
-- TOC entry 226 (class 1259 OID 16462)
-- Name: seats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.seats_id_seq OWNER TO postgres;

--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 226
-- Name: seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seats_id_seq OWNED BY public.seats.id;

--
-- TOC entry 227 (class 1259 OID 16463)
-- Name: showtimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.showtimes (
    id integer NOT NULL,
    movie_id integer,
    hall character varying(50) NOT NULL,
    date character varying(50) NOT NULL,
    "time" character varying(20) NOT NULL,
    price integer NOT NULL,
    format character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

--
-- TOC entry 228 (class 1259 OID 16473)
-- Name: showtimes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.showtimes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.showtimes_id_seq OWNER TO postgres;

--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 228
-- Name: showtimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.showtimes_id_seq OWNED BY public.showtimes.id;

--
-- TOC entry 229 (class 1259 OID 16474)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

--
-- TOC entry 230 (class 1259 OID 16485)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;

--
-- TOC entry 4881 (class 2604 OID 16486)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);

--
-- TOC entry 4884 (class 2604 OID 16487)
-- Name: reservation_seats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_seats ALTER COLUMN id SET DEFAULT nextval('public.reservation_seats_id_seq'::regclass);

--
-- TOC entry 4885 (class 2604 OID 16488)
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);

--
-- TOC entry 4888 (class 2604 OID 16489)
-- Name: seats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats ALTER COLUMN id SET DEFAULT nextval('public.seats_id_seq'::regclass);

--
-- TOC entry 4890 (class 2604 OID 16490)
-- Name: showtimes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showtimes ALTER COLUMN id SET DEFAULT nextval('public.showtimes_id_seq'::regclass);

--
-- TOC entry 4892 (class 2604 OID 16491)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);

--
-- TOC entry 5065 (class 0 OID 16434)
-- Dependencies: 219
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, tmdb_id, title, genre, duration, rating, image, description, release_date, created_at, status, trailer_url) FROM stdin;
37	1300968	The Hunger Games: Sunrise on the Reaping	Science Fiction / Action / Adventure	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/jNcZH8yplxttRlf0wwqfGGMKHxX.jpg	Return to the world of Panem 24 years before the events of The Hunger Games, starting on the morning of the reaping of the 50th Hunger Games, also known as the Second Quarter Quell.	2026-11-18	2026-05-03 19:44:53.329132	coming_soon	https://www.youtube.com/watch?v=fS35YSjopjE
38	1003596	Avengers: Doomsday	Science Fiction / Action / Adventure	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/8HkIe2i4ScpCkcX9SzZ9IPasqWV.jpg	Beloved heroes from three distinct universes are set on a deadly collision course and face an existential threat unlike anything they've ever encountered.	2026-12-16	2026-05-03 19:44:53.468684	coming_soon	\N
39	1170608	Dune: Part Three	Science Fiction / Drama	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/b4wekkUaxExzOeGe7hKXzhnyXHt.jpg	As Emperor, Paul Atreides grapples with the consequences of his rise to power as political conspiracies and a galaxy-spanning holy war threaten the future he alone can foresee.	2026-12-16	2026-05-03 19:44:53.61468	coming_soon	https://www.youtube.com/watch?v=3_9vCamtuPY
1	687163	Project Hail Mary	Science Fiction / Adventure	157 dk	8.2	https://image.tmdb.org/t/p/original/yihdXomYb5kTeSivtFndMy5iDmf.jpg	Science teacher Ryland Grace wakes up on a spaceship light years from home with no recollection of who he is or how he got there. As his memory returns, he begins to uncover his mission: solve the riddle of the mysterious substance causing the sun to die out. He must call on his scientific knowledge and unorthodox ideas to save everything on Earth from extinction.	2026-03-15	2026-04-24 11:17:44.926907	now_showing	https://www.youtube.com/watch?v=NKYea63tQmI
2	872585	Oppenheimer	Drama / History	181 dk	8.0	https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg	The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.	2023-07-19	2026-04-24 11:17:44.956574	now_showing	https://www.youtube.com/watch?v=qiuSBWVdgLI
3	157336	Interstellar	Adventure / Drama / Science Fiction	169 dk	8.5	https://image.tmdb.org/t/p/original/yQvGrMoipbRoddT0ZR8tPoR7NfX.jpg	The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.	2014-11-05	2026-04-24 11:17:44.98254	now_showing	https://www.youtube.com/watch?v=LY19rHKAaAg
32	83533	Avatar: Fire and Ash	Science Fiction / Adventure / Fantasy	198 dk	7.4	https://image.tmdb.org/t/p/original/aabwWZWx6z1aYP4PX2ADvbDKktd.jpg	In the wake of the devastating war against the RDA and the loss of their eldest son, Jake Sully and Neytiri face a new threat on Pandora: the Ash People, a violent and power-hungry Na'vi tribe led by the ruthless Varang. Jake's family must fight for their survival and the future of Pandora in a conflict that pushes them to their emotional and physical limits.	2025-12-17	2026-05-03 19:44:52.61149	now_showing	https://www.youtube.com/watch?v=Ma1x7ikpid8
4	414906	The Batman	Crime / Mystery / Thriller	177 dk	7.7	https://image.tmdb.org/t/p/original/74xTEgt7R36Fpooo50r9T25onhq.jpg	In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.	2022-03-01	2026-04-24 11:17:45.150125	now_showing	https://www.youtube.com/watch?v=vc7_mH2PWHs
5	1325734	The Drama	Romance / Comedy / Drama	105 dk	7.0	https://image.tmdb.org/t/p/original/ikcNOWB6Qo1ER1H1BJL6Vf0W22s.jpg	A happily engaged couple is put to the test when an unexpected turn sends their wedding week off the rails.	2026-03-26	2026-04-24 11:17:45.174961	now_showing	https://www.youtube.com/watch?v=0ZDzsH3XGFA
6	693134	Dune: Part Two	Science Fiction / Adventure	167 dk	8.1	https://image.tmdb.org/t/p/original/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg	Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.	2024-02-27	2026-04-24 11:17:45.242456	now_showing	https://www.youtube.com/watch?v=U2Qp5pL3ovA
8	858024	Hamnet	Drama / Romance / History	125 dk	7.7	https://image.tmdb.org/t/p/original/vbeyOZm2bvBXcbgPD3v6o94epPX.jpg	The powerful story of love and loss that inspired the creation of Shakespeare's timeless masterpiece, Hamlet.	2025-11-26	2026-04-24 11:17:45.436822	now_showing	https://www.youtube.com/watch?v=xYcgQMxQwmk
28	1314481	The Devil Wears Prada 2	Comedy / Drama	119 dk	6.8	https://image.tmdb.org/t/p/original/sRTYF65JvbHLoC3LoBj4UKYqIlA.jpg	Andy Sachs returns to Runway as Miranda Priestly navigates a new media landscape and Runway's position within. The duo reconnect with former assistant Emily Charlton, now the head of a luxury brand that possesses funding which could ensure Runway's survival.	2026-04-29	2026-05-03 19:44:52.031467	now_showing	https://www.youtube.com/watch?v=PMd1at7OwiE
33	1083381	Backrooms	Horror / Mystery / Science Fiction	105 dk	N/A	https://image.tmdb.org/t/p/original/vpkNMkbisv5cTaIfCzUduYzXnjb.jpg	A strange doorway appears in the basement of a furniture showroom.	2026-05-27	2026-05-03 19:44:52.75588	coming_soon	https://www.youtube.com/watch?v=0HjdiohVOik
35	1315772	Minions & Monsters	Animation / Family / Comedy / Adventure / Fantasy	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/s2IruLQG6577vX9SBMhuoEqK4WF.jpg	This is the rambunctious, ridiculous and totally true story of how the Minions conquered Hollywood, became movie stars, lost everything, unleashed monsters onto the world and then banded together to try and save the planet from the mayhem they had just created.	2026-06-24	2026-05-03 19:44:53.04303	coming_soon	https://www.youtube.com/watch?v=ZSdOwt-G49w
36	1084244	Toy Story 5	Animation / Family / Comedy / Adventure	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/dWIAOC9EKFehGs3CYvDQih3hxaG.jpg	When Bonnie receives a Lilypad tablet as a gift and becomes obsessed, Buzz, Woody, Jessie and the rest of the gang's jobs become exponentially harder when they have to go head to head with the all-new threat to playtime.	2026-06-17	2026-05-03 19:44:53.186622	coming_soon	https://www.youtube.com/watch?v=c51ND9Hdbw0
29	936075	Michael	Music / Drama	128 dk	7.5	https://image.tmdb.org/t/p/original/3Qud19bBUrrJAzy0Ilm8gRJlJXP.jpg	The story of Michael Jackson, one of the most influential artists the world has ever known, and his life beyond the music. His journey from the discovery of his extraordinary talent as the lead of the Jackson Five, to the visionary artist whose creative ambition fueled a relentless pursuit to become the biggest entertainer in the world, highlighting both his life off-stage and some of the most iconic performances from his early solo career.	2026-04-22	2026-05-03 19:44:52.180357	now_showing	https://www.youtube.com/watch?v=k-YAcjaLuSI
30	1084242	Zootopia 2	Adventure / Animation / Comedy / Family / Mystery	108 dk	7.6	https://image.tmdb.org/t/p/original/oJ7g2CifqpStmoYQyaLQgEU32qO.jpg	After cracking the biggest case in Zootopia's history, rookie cops Judy Hopps and Nick Wilde find themselves on the twisting trail of a great mystery when Gary De'Snake arrives and turns the animal metropolis upside down. To crack the case, Judy and Nick must go undercover to unexpected new parts of town, where their growing partnership is tested like never before.	2025-11-26	2026-05-03 19:44:52.323535	now_showing	https://www.youtube.com/watch?v=sEgPQ7HKoBA
31	1317149	I Swear	Drama / History	120 dk	8.2	https://image.tmdb.org/t/p/original/vUwyhNWBKkSwK8ELvEeBRwV724h.jpg	Diagnosed with Tourette Syndrome at 15, John Davidson navigates his way against the odds through troubled teenage years and into adulthood, finding inspiration in the kindness of others to discover his true purpose in life.	2025-09-22	2026-05-03 19:44:52.467984	now_showing	https://www.youtube.com/watch?v=10ynpduiRpM
34	1368337	The Odyssey	Adventure / Drama / Fantasy	179 dk	N/A	https://image.tmdb.org/t/p/original/pe5cCoX5iIb5IWKPsbPkCwjLFHt.jpg	Odysseus, the legendary Greek king of Ithaca, embarks on a long and perilous journey home following the Trojan War, chronicling his encounters with mythical beings such as the Cyclops Polyphemus, the Sirens, and the witch-goddess Circe, while attempting to reunite with his wife, Penelope.	2026-07-15	2026-05-03 19:44:52.89919	coming_soon	https://www.youtube.com/watch?v=Mzw2ttJD2qQ
7	969681	Spider-Man: Brand New Day	Science Fiction / Action / Adventure	Bilinmiyor	N/A	https://image.tmdb.org/t/p/original/pspkSVP39NGa6G2rvK5KlMjvYUe.jpg	Four years have passed since the events of No Way Home, and Peter is now an adult living entirely alone, having voluntarily erased himself from the lives and memories of those he loves. Crime-fighting in a New York that no longer knows his name, he's devoted himself entirely to protecting his city — a full-time Spider-Man — but as the demands on him intensify, the pressure sparks a surprising physical evolution that threatens his existence, even as a strange new pattern of crimes gives rise to one of the most powerful threats he has ever faced.	2026-07-29	2026-04-24 11:17:45.41256	coming_soon	https://www.youtube.com/watch?v=8TZMtslA3UY

--
-- TOC entry 5067 (class 0 OID 16443)
-- Dependencies: 221
-- Data for Name: reservation_seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation_seats (id, reservation_id, seat_id) FROM stdin;
1	1	302
2	2	316
3	2	317
4	3	247
5	3	248
6	4	288
7	5	1421
8	6	2428
9	6	2398
10	6	2413
11	6	2443
12	6	2458
13	6	2473
14	7	1424

--
-- TOC entry 5069 (class 0 OID 16448)
-- Dependencies: 223
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (id, user_id, movie_id, showtime_id, total_price, status, created_at) FROM stdin;
1	2	2	4	170	Onaylandı	2026-04-24 12:27:15.584584
2	2	2	4	340	Onaylandı	2026-04-24 12:32:28.822472
3	3	2	4	340	Onaylandı	2026-04-24 12:43:58.571907
4	4	2	4	200	Onaylandı	2026-04-24 13:02:07.23001
5	5	32	27	140	Onaylandı	2026-05-03 21:34:55.981183
6	5	30	29	780	Onaylandı	2026-05-03 21:35:50.26376
7	5	30	30	130	Onaylandı	2026-05-03 21:56:31.339217

--
-- TOC entry 5071 (class 0 OID 16456)
-- Dependencies: 225
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seats (id, showtime_id, seat_no, is_reserved) FROM stdin;
1	1	A1	f
2	1	A2	f
3	1	A3	f
4	1	A4	f
5	1	A5	t
6	1	A6	f
7	1	A7	f
8	1	A8	f
9	1	A9	f
10	1	A10	f
11	1	B1	f
12	1	B2	t
13	1	B3	f
14	1	B4	f
15	1	B5	f
16	1	B6	f
17	1	B7	f
18	1	B8	t
19	1	B9	f
20	1	B10	f
21	1	C1	t
22	1	C2	f
23	1	C3	f
24	1	C4	f
25	1	C5	f
26	1	C6	f
27	1	C7	f
28	1	C8	f
29	1	C9	f
30	1	C10	f
31	1	D1	f
32	1	D2	f
33	1	D3	f
34	1	D4	f
35	1	D5	f
36	1	D6	t
37	1	D7	f
38	1	D8	f
39	1	D9	f
40	1	D10	f
41	1	E1	f
42	1	E2	f
43	1	E3	f
44	1	E4	t
45	1	E5	t
46	1	E6	f
47	1	E7	f
48	1	E8	f
49	1	E9	f
50	1	E10	f
51	1	F1	f
52	1	F2	f
53	1	F3	f
54	1	F4	f
55	1	F5	f
56	1	F6	f
57	1	F7	f
58	1	F8	f
59	1	F9	t
60	1	F10	f
61	1	G1	f
62	1	G2	f
63	1	G3	f
64	1	G4	f
65	1	G5	f
66	1	G6	f
67	1	G7	f
68	1	G8	f
69	1	G9	f
70	1	G10	f
71	1	H1	f
72	1	H2	f
73	1	H3	t
74	1	H4	f
75	1	H5	f
76	1	H6	f
77	1	H7	f
78	1	H8	f
79	1	H9	f
80	1	H10	f
81	2	A1	f
82	2	A2	f
83	2	A3	f
84	2	A4	f
85	2	A5	t
86	2	A6	f
87	2	A7	f
88	2	A8	f
89	2	A9	f
90	2	A10	f
91	2	B1	f
92	2	B2	t
93	2	B3	f
94	2	B4	f
95	2	B5	f
96	2	B6	f
97	2	B7	f
98	2	B8	t
99	2	B9	f
100	2	B10	f
101	2	C1	t
102	2	C2	f
103	2	C3	f
104	2	C4	f
105	2	C5	f
106	2	C6	f
107	2	C7	f
108	2	C8	f
109	2	C9	f
110	2	C10	f
111	2	D1	f
112	2	D2	f
113	2	D3	f
114	2	D4	f
115	2	D5	f
116	2	D6	t
117	2	D7	f
118	2	D8	f
119	2	D9	f
120	2	D10	f
121	2	E1	f
122	2	E2	f
123	2	E3	f
124	2	E4	t
125	2	E5	t
126	2	E6	f
127	2	E7	f
128	2	E8	f
129	2	E9	f
130	2	E10	f
131	2	F1	f
132	2	F2	f
133	2	F3	f
134	2	F4	f
135	2	F5	f
136	2	F6	f
137	2	F7	f
138	2	F8	f
139	2	F9	t
140	2	F10	f
141	2	G1	f
142	2	G2	f
143	2	G3	f
144	2	G4	f
145	2	G5	f
146	2	G6	f
147	2	G7	f
148	2	G8	f
149	2	G9	f
150	2	G10	f
151	2	H1	f
152	2	H2	f
153	2	H3	t
154	2	H4	f
155	2	H5	f
156	2	H6	f
157	2	H7	f
158	2	H8	f
159	2	H9	f
160	2	H10	f
161	3	A1	f
162	3	A2	f
163	3	A3	f
164	3	A4	f
165	3	A5	t
166	3	A6	f
167	3	A7	f
168	3	A8	f
169	3	A9	f
170	3	A10	f
171	3	B1	f
172	3	B2	t
173	3	B3	f
174	3	B4	f
175	3	B5	f
176	3	B6	f
177	3	B7	f
178	3	B8	t
179	3	B9	f
180	3	B10	f
181	3	C1	t
182	3	C2	f
183	3	C3	f
184	3	C4	f
185	3	C5	f
186	3	C6	f
187	3	C7	f
188	3	C8	f
189	3	C9	f
190	3	C10	f
191	3	D1	f
192	3	D2	f
193	3	D3	f
194	3	D4	f
195	3	D5	f
196	3	D6	t
197	3	D7	f
198	3	D8	f
199	3	D9	f
200	3	D10	f
201	3	E1	f
202	3	E2	f
203	3	E3	f
204	3	E4	t
205	3	E5	t
206	3	E6	f
207	3	E7	f
208	3	E8	f
209	3	E9	f
210	3	E10	f
211	3	F1	f
212	3	F2	f
213	3	F3	f
214	3	F4	f
215	3	F5	f
216	3	F6	f
217	3	F7	f
218	3	F8	f
219	3	F9	t
220	3	F10	f
221	3	G1	f
222	3	G2	f
223	3	G3	f
224	3	G4	f
225	3	G5	f
226	3	G6	f
227	3	G7	f
228	3	G8	f
229	3	G9	f
230	3	G10	f
231	3	H1	f
232	3	H2	f
233	3	H3	t
234	3	H4	f
235	3	H5	f
236	3	H6	f
237	3	H7	f
238	3	H8	f
239	3	H9	f
240	3	H10	f
241	4	A1	f
242	4	A2	f
243	4	A3	f
244	4	A4	f
245	4	A5	t
246	4	A6	f
249	4	A9	f
250	4	A10	f
251	4	B1	f
252	4	B2	t
253	4	B3	f
254	4	B4	f
255	4	B5	f
256	4	B6	f
257	4	B7	f
258	4	B8	t
259	4	B9	f
260	4	B10	f
261	4	C1	t
262	4	C2	f
263	4	C3	f
264	4	C4	f
265	4	C5	f
266	4	C6	f
267	4	C7	f
268	4	C8	f
269	4	C9	f
270	4	C10	f
271	4	D1	f
272	4	D2	f
273	4	D3	f
274	4	D4	f
275	4	D5	f
276	4	D6	t
277	4	D7	f
278	4	D8	f
279	4	D9	f
280	4	D10	f
281	4	E1	f
282	4	E2	f
283	4	E3	f
284	4	E4	t
285	4	E5	t
286	4	E6	f
287	4	E7	f
289	4	E9	f
290	4	E10	f
291	4	F1	f
292	4	F2	f
293	4	F3	f
294	4	F4	f
295	4	F5	f
296	4	F6	f
297	4	F7	f
298	4	F8	f
299	4	F9	t
300	4	F10	f
301	4	G1	f
303	4	G3	f
304	4	G4	f
305	4	G5	f
306	4	G6	f
307	4	G7	f
308	4	G8	f
309	4	G9	f
310	4	G10	f
311	4	H1	f
312	4	H2	f
313	4	H3	t
314	4	H4	f
315	4	H5	f
318	4	H8	f
319	4	H9	f
320	4	H10	f
321	5	A1	f
322	5	A2	f
323	5	A3	f
324	5	A4	f
325	5	A5	t
326	5	A6	f
329	5	A9	f
330	5	A10	f
331	5	B1	f
332	5	B2	t
333	5	B3	f
334	5	B4	f
335	5	B5	f
336	5	B6	f
337	5	B7	f
338	5	B8	t
339	5	B9	f
340	5	B10	f
341	5	C1	t
342	5	C2	f
343	5	C3	f
344	5	C4	f
345	5	C5	f
346	5	C6	f
347	5	C7	f
348	5	C8	f
349	5	C9	f
350	5	C10	f
351	5	D1	f
352	5	D2	f
353	5	D3	f
354	5	D4	f
355	5	D5	f
356	5	D6	t
357	5	D7	f
358	5	D8	f
359	5	D9	f
360	5	D10	f
361	5	E1	f
362	5	E2	f
363	5	E3	f
364	5	E4	t
365	5	E5	t
366	5	E6	f
367	5	E7	f
368	5	E8	f
369	5	E9	f
370	5	E10	f
302	4	G2	t
316	4	H6	t
317	4	H7	t
247	4	A7	t
248	4	A8	t
288	4	E8	t
371	5	F1	f
372	5	F2	f
373	5	F3	f
374	5	F4	f
375	5	F5	f
376	5	F6	f
377	5	F7	f
378	5	F8	f
379	5	F9	t
380	5	F10	f
381	5	G1	f
382	5	G2	f
383	5	G3	f
384	5	G4	f
385	5	G5	f
386	5	G6	f
387	5	G7	f
388	5	G8	f
389	5	G9	f
390	5	G10	f
391	5	H1	f
392	5	H2	f
393	5	H3	t
394	5	H4	f
395	5	H5	f
396	5	H6	f
397	5	H7	f
398	5	H8	f
399	5	H9	f
400	5	H10	f
401	6	A1	f
402	6	A2	f
403	6	A3	f
404	6	A4	f
405	6	A5	t
406	6	A6	f
407	6	A7	f
408	6	A8	f
409	6	A9	f
410	6	A10	f
411	6	B1	f
412	6	B2	t
413	6	B3	f
414	6	B4	f
415	6	B5	f
416	6	B6	f
417	6	B7	f
418	6	B8	t
419	6	B9	f
420	6	B10	f
421	6	C1	t
422	6	C2	f
423	6	C3	f
424	6	C4	f
425	6	C5	f
426	6	C6	f
427	6	C7	f
428	6	C8	f
429	6	C9	f
430	6	C10	f
431	6	D1	f
432	6	D2	f
433	6	D3	f
434	6	D4	f
435	6	D5	f
436	6	D6	t
437	6	D7	f
438	6	D8	f
439	6	D9	f
440	6	D10	f
441	6	E1	f
442	6	E2	f
443	6	E3	f
444	6	E4	t
445	6	E5	t
446	6	E6	f
447	6	E7	f
448	6	E8	f
449	6	E9	f
450	6	E10	f
451	6	F1	f
452	6	F2	f
453	6	F3	f
454	6	F4	f
455	6	F5	f
456	6	F6	f
457	6	F7	f
458	6	F8	f
459	6	F9	t
460	6	F10	f
461	6	G1	f
462	6	G2	f
463	6	G3	f
464	6	G4	f
465	6	G5	f
466	6	G6	f
467	6	G7	f
468	6	G8	f
469	6	G9	f
470	6	G10	f
471	6	H1	f
472	6	H2	f
473	6	H3	t
474	6	H4	f
475	6	H5	f
476	6	H6	f
477	6	H7	f
478	6	H8	f
479	6	H9	f
480	6	H10	f
481	7	A1	f
482	7	A2	f
483	7	A3	f
484	7	A4	f
485	7	A5	t
486	7	A6	f
487	7	A7	f
488	7	A8	f
489	7	A9	f
490	7	A10	f
491	7	B1	f
492	7	B2	t
493	7	B3	f
494	7	B4	f
495	7	B5	f
496	7	B6	f
497	7	B7	f
498	7	B8	t
499	7	B9	f
500	7	B10	f
501	7	C1	t
502	7	C2	f
503	7	C3	f
504	7	C4	f
505	7	C5	f
506	7	C6	f
507	7	C7	f
508	7	C8	f
509	7	C9	f
510	7	C10	f
511	7	D1	f
512	7	D2	f
513	7	D3	f
514	7	D4	f
515	7	D5	f
516	7	D6	t
517	7	D7	f
518	7	D8	f
519	7	D9	f
520	7	D10	f
521	7	E1	f
522	7	E2	f
523	7	E3	f
524	7	E4	t
525	7	E5	t
526	7	E6	f
527	7	E7	f
528	7	E8	f
529	7	E9	f
530	7	E10	f
531	7	F1	f
532	7	F2	f
533	7	F3	f
534	7	F4	f
535	7	F5	f
536	7	F6	f
537	7	F7	f
538	7	F8	f
539	7	F9	t
540	7	F10	f
541	7	G1	f
542	7	G2	f
543	7	G3	f
544	7	G4	f
545	7	G5	f
546	7	G6	f
547	7	G7	f
548	7	G8	f
549	7	G9	f
550	7	G10	f
551	7	H1	f
552	7	H2	f
553	7	H3	t
554	7	H4	f
555	7	H5	f
556	7	H6	f
557	7	H7	f
558	7	H8	f
559	7	H9	f
560	7	H10	f
561	8	A1	f
562	8	A2	f
563	8	A3	f
564	8	A4	f
565	8	A5	t
566	8	A6	f
567	8	A7	f
568	8	A8	f
569	8	A9	f
570	8	A10	f
571	8	B1	f
572	8	B2	t
573	8	B3	f
574	8	B4	f
575	8	B5	f
576	8	B6	f
577	8	B7	f
578	8	B8	t
579	8	B9	f
580	8	B10	f
581	8	C1	t
582	8	C2	f
583	8	C3	f
584	8	C4	f
585	8	C5	f
586	8	C6	f
587	8	C7	f
588	8	C8	f
589	8	C9	f
590	8	C10	f
591	8	D1	f
592	8	D2	f
593	8	D3	f
594	8	D4	f
595	8	D5	f
596	8	D6	t
597	8	D7	f
598	8	D8	f
599	8	D9	f
600	8	D10	f
601	8	E1	f
602	8	E2	f
603	8	E3	f
604	8	E4	t
605	8	E5	t
606	8	E6	f
607	8	E7	f
608	8	E8	f
609	8	E9	f
610	8	E10	f
611	8	F1	f
612	8	F2	f
613	8	F3	f
614	8	F4	f
615	8	F5	f
616	8	F6	f
617	8	F7	f
618	8	F8	f
619	8	F9	t
620	8	F10	f
621	8	G1	f
622	8	G2	f
623	8	G3	f
624	8	G4	f
625	8	G5	f
626	8	G6	f
627	8	G7	f
628	8	G8	f
629	8	G9	f
630	8	G10	f
631	8	H1	f
632	8	H2	f
633	8	H3	t
634	8	H4	f
635	8	H5	f
636	8	H6	f
637	8	H7	f
638	8	H8	f
639	8	H9	f
640	8	H10	f
641	9	A1	f
642	9	A2	f
643	9	A3	f
644	9	A4	f
645	9	A5	t
646	9	A6	f
647	9	A7	f
648	9	A8	f
649	9	A9	f
650	9	A10	f
651	9	B1	f
652	9	B2	t
653	9	B3	f
654	9	B4	f
655	9	B5	f
656	9	B6	f
657	9	B7	f
658	9	B8	t
659	9	B9	f
660	9	B10	f
661	9	C1	t
662	9	C2	f
663	9	C3	f
664	9	C4	f
665	9	C5	f
666	9	C6	f
667	9	C7	f
668	9	C8	f
669	9	C9	f
670	9	C10	f
671	9	D1	f
672	9	D2	f
673	9	D3	f
674	9	D4	f
675	9	D5	f
676	9	D6	t
677	9	D7	f
678	9	D8	f
679	9	D9	f
680	9	D10	f
681	9	E1	f
682	9	E2	f
683	9	E3	f
684	9	E4	t
685	9	E5	t
686	9	E6	f
687	9	E7	f
688	9	E8	f
689	9	E9	f
690	9	E10	f
691	9	F1	f
692	9	F2	f
693	9	F3	f
694	9	F4	f
695	9	F5	f
696	9	F6	f
697	9	F7	f
698	9	F8	f
699	9	F9	t
700	9	F10	f
701	9	G1	f
702	9	G2	f
703	9	G3	f
704	9	G4	f
705	9	G5	f
706	9	G6	f
707	9	G7	f
708	9	G8	f
709	9	G9	f
710	9	G10	f
711	9	H1	f
712	9	H2	f
713	9	H3	t
714	9	H4	f
715	9	H5	f
716	9	H6	f
717	9	H7	f
718	9	H8	f
719	9	H9	f
720	9	H10	f
721	10	A1	f
722	10	A2	f
723	10	A3	f
724	10	A4	f
725	10	A5	t
726	10	A6	f
727	10	A7	f
728	10	A8	f
729	10	A9	f
730	10	A10	f
731	10	B1	f
732	10	B2	t
733	10	B3	f
734	10	B4	f
735	10	B5	f
736	10	B6	f
737	10	B7	f
738	10	B8	t
739	10	B9	f
740	10	B10	f
741	10	C1	t
742	10	C2	f
743	10	C3	f
744	10	C4	f
745	10	C5	f
746	10	C6	f
747	10	C7	f
748	10	C8	f
749	10	C9	f
750	10	C10	f
751	10	D1	f
752	10	D2	f
753	10	D3	f
754	10	D4	f
755	10	D5	f
756	10	D6	t
757	10	D7	f
758	10	D8	f
759	10	D9	f
760	10	D10	f
761	10	E1	f
762	10	E2	f
763	10	E3	f
764	10	E4	t
765	10	E5	t
766	10	E6	f
767	10	E7	f
768	10	E8	f
769	10	E9	f
770	10	E10	f
771	10	F1	f
772	10	F2	f
773	10	F3	f
774	10	F4	f
775	10	F5	f
776	10	F6	f
777	10	F7	f
778	10	F8	f
779	10	F9	t
780	10	F10	f
781	10	G1	f
782	10	G2	f
783	10	G3	f
784	10	G4	f
785	10	G5	f
786	10	G6	f
787	10	G7	f
788	10	G8	f
789	10	G9	f
790	10	G10	f
791	10	H1	f
792	10	H2	f
793	10	H3	t
794	10	H4	f
795	10	H5	f
796	10	H6	f
797	10	H7	f
798	10	H8	f
799	10	H9	f
800	10	H10	f
801	11	A1	f
802	11	A2	f
803	11	A3	f
804	11	A4	f
805	11	A5	t
806	11	A6	f
807	11	A7	f
808	11	A8	f
809	11	A9	f
810	11	A10	f
811	11	B1	f
812	11	B2	t
813	11	B3	f
814	11	B4	f
815	11	B5	f
816	11	B6	f
817	11	B7	f
818	11	B8	t
819	11	B9	f
820	11	B10	f
821	11	C1	t
822	11	C2	f
823	11	C3	f
824	11	C4	f
825	11	C5	f
826	11	C6	f
827	11	C7	f
828	11	C8	f
829	11	C9	f
830	11	C10	f
831	11	D1	f
832	11	D2	f
833	11	D3	f
834	11	D4	f
835	11	D5	f
836	11	D6	t
837	11	D7	f
838	11	D8	f
839	11	D9	f
840	11	D10	f
841	11	E1	f
842	11	E2	f
843	11	E3	f
844	11	E4	t
845	11	E5	t
846	11	E6	f
847	11	E7	f
848	11	E8	f
849	11	E9	f
850	11	E10	f
851	11	F1	f
852	11	F2	f
853	11	F3	f
854	11	F4	f
855	11	F5	f
856	11	F6	f
857	11	F7	f
858	11	F8	f
859	11	F9	t
860	11	F10	f
861	11	G1	f
862	11	G2	f
863	11	G3	f
864	11	G4	f
865	11	G5	f
866	11	G6	f
867	11	G7	f
868	11	G8	f
869	11	G9	f
870	11	G10	f
871	11	H1	f
872	11	H2	f
873	11	H3	t
874	11	H4	f
875	11	H5	f
876	11	H6	f
877	11	H7	f
878	11	H8	f
879	11	H9	f
880	11	H10	f
881	12	A1	f
882	12	A2	f
883	12	A3	f
884	12	A4	f
885	12	A5	t
886	12	A6	f
887	12	A7	f
888	12	A8	f
889	12	A9	f
890	12	A10	f
891	12	B1	f
892	12	B2	t
893	12	B3	f
894	12	B4	f
895	12	B5	f
896	12	B6	f
897	12	B7	f
898	12	B8	t
899	12	B9	f
900	12	B10	f
901	12	C1	t
902	12	C2	f
903	12	C3	f
904	12	C4	f
905	12	C5	f
906	12	C6	f
907	12	C7	f
908	12	C8	f
909	12	C9	f
910	12	C10	f
911	12	D1	f
912	12	D2	f
913	12	D3	f
914	12	D4	f
915	12	D5	f
916	12	D6	t
917	12	D7	f
918	12	D8	f
919	12	D9	f
920	12	D10	f
921	12	E1	f
922	12	E2	f
923	12	E3	f
924	12	E4	t
925	12	E5	t
926	12	E6	f
927	12	E7	f
928	12	E8	f
929	12	E9	f
930	12	E10	f
931	12	F1	f
932	12	F2	f
933	12	F3	f
934	12	F4	f
935	12	F5	f
936	12	F6	f
937	12	F7	f
938	12	F8	f
939	12	F9	t
940	12	F10	f
941	12	G1	f
942	12	G2	f
943	12	G3	f
944	12	G4	f
945	12	G5	f
946	12	G6	f
947	12	G7	f
948	12	G8	f
949	12	G9	f
950	12	G10	f
951	12	H1	f
952	12	H2	f
953	12	H3	t
954	12	H4	f
955	12	H5	f
956	12	H6	f
957	12	H7	f
958	12	H8	f
959	12	H9	f
960	12	H10	f
961	13	A1	f
962	13	A2	f
963	13	A3	f
964	13	A4	f
965	13	A5	t
966	13	A6	f
967	13	A7	f
968	13	A8	f
969	13	A9	f
970	13	A10	f
971	13	B1	f
972	13	B2	t
973	13	B3	f
974	13	B4	f
975	13	B5	f
976	13	B6	f
977	13	B7	f
978	13	B8	t
979	13	B9	f
980	13	B10	f
981	13	C1	t
982	13	C2	f
983	13	C3	f
984	13	C4	f
985	13	C5	f
986	13	C6	f
987	13	C7	f
988	13	C8	f
989	13	C9	f
990	13	C10	f
991	13	D1	f
992	13	D2	f
993	13	D3	f
994	13	D4	f
995	13	D5	f
996	13	D6	t
997	13	D7	f
998	13	D8	f
999	13	D9	f
1000	13	D10	f
1001	13	E1	f
1002	13	E2	f
1003	13	E3	f
1004	13	E4	t
1005	13	E5	t
1006	13	E6	f
1007	13	E7	f
1008	13	E8	f
1009	13	E9	f
1010	13	E10	f
1011	13	F1	f
1012	13	F2	f
1013	13	F3	f
1014	13	F4	f
1015	13	F5	f
1016	13	F6	f
1017	13	F7	f
1018	13	F8	f
1019	13	F9	t
1020	13	F10	f
1021	13	G1	f
1022	13	G2	f
1023	13	G3	f
1024	13	G4	f
1025	13	G5	f
1026	13	G6	f
1027	13	G7	f
1028	13	G8	f
1029	13	G9	f
1030	13	G10	f
1031	13	H1	f
1032	13	H2	f
1033	13	H3	t
1034	13	H4	f
1035	13	H5	f
1036	13	H6	f
1037	13	H7	f
1038	13	H8	f
1039	13	H9	f
1040	13	H10	f
1041	14	A1	f
1042	14	A2	f
1043	14	A3	f
1044	14	A4	f
1045	14	A5	t
1046	14	A6	f
1047	14	A7	f
1048	14	A8	f
1049	14	A9	f
1050	14	A10	f
1051	14	B1	f
1052	14	B2	t
1053	14	B3	f
1054	14	B4	f
1055	14	B5	f
1056	14	B6	f
1057	14	B7	f
1058	14	B8	t
1059	14	B9	f
1060	14	B10	f
1061	14	C1	t
1062	14	C2	f
1063	14	C3	f
1064	14	C4	f
1065	14	C5	f
1066	14	C6	f
1067	14	C7	f
1068	14	C8	f
1069	14	C9	f
1070	14	C10	f
1071	14	D1	f
1072	14	D2	f
1073	14	D3	f
1074	14	D4	f
1075	14	D5	f
1076	14	D6	t
1077	14	D7	f
1078	14	D8	f
1079	14	D9	f
1080	14	D10	f
1081	14	E1	f
1082	14	E2	f
1083	14	E3	f
1084	14	E4	t
1085	14	E5	t
1086	14	E6	f
1087	14	E7	f
1088	14	E8	f
1089	14	E9	f
1090	14	E10	f
1091	14	F1	f
1092	14	F2	f
1093	14	F3	f
1094	14	F4	f
1095	14	F5	f
1096	14	F6	f
1097	14	F7	f
1098	14	F8	f
1099	14	F9	t
1100	14	F10	f
1101	14	G1	f
1102	14	G2	f
1103	14	G3	f
1104	14	G4	f
1105	14	G5	f
1106	14	G6	f
1107	14	G7	f
1108	14	G8	f
1109	14	G9	f
1110	14	G10	f
1111	14	H1	f
1112	14	H2	f
1113	14	H3	t
1114	14	H4	f
1115	14	H5	f
1116	14	H6	f
1117	14	H7	f
1118	14	H8	f
1119	14	H9	f
1120	14	H10	f
1121	15	A1	f
1122	15	A2	f
1123	15	A3	f
1124	15	A4	f
1125	15	A5	t
1126	15	A6	f
1127	15	A7	f
1128	15	A8	f
1129	15	A9	f
1130	15	A10	f
1131	15	B1	f
1132	15	B2	t
1133	15	B3	f
1134	15	B4	f
1135	15	B5	f
1136	15	B6	f
1137	15	B7	f
1138	15	B8	t
1139	15	B9	f
1140	15	B10	f
1141	15	C1	t
1142	15	C2	f
1143	15	C3	f
1144	15	C4	f
1145	15	C5	f
1146	15	C6	f
1147	15	C7	f
1148	15	C8	f
1149	15	C9	f
1150	15	C10	f
1151	15	D1	f
1152	15	D2	f
1153	15	D3	f
1154	15	D4	f
1155	15	D5	f
1156	15	D6	t
1157	15	D7	f
1158	15	D8	f
1159	15	D9	f
1160	15	D10	f
1161	15	E1	f
1162	15	E2	f
1163	15	E3	f
1164	15	E4	t
1165	15	E5	t
1166	15	E6	f
1167	15	E7	f
1168	15	E8	f
1169	15	E9	f
1170	15	E10	f
1171	15	F1	f
1172	15	F2	f
1173	15	F3	f
1174	15	F4	f
1175	15	F5	f
1176	15	F6	f
1177	15	F7	f
1178	15	F8	f
1179	15	F9	t
1180	15	F10	f
1181	15	G1	f
1182	15	G2	f
1183	15	G3	f
1184	15	G4	f
1185	15	G5	f
1186	15	G6	f
1187	15	G7	f
1188	15	G8	f
1189	15	G9	f
1190	15	G10	f
1191	15	H1	f
1192	15	H2	f
1193	15	H3	t
1194	15	H4	f
1195	15	H5	f
1196	15	H6	f
1197	15	H7	f
1198	15	H8	f
1199	15	H9	f
1200	15	H10	f
1201	16	A1	f
1202	16	A2	f
1203	16	A3	f
1204	16	A4	f
1205	16	A5	t
1206	16	A6	f
1207	16	A7	f
1208	16	A8	f
1209	16	A9	f
1210	16	A10	f
1211	16	B1	f
1212	16	B2	t
1213	16	B3	f
1214	16	B4	f
1215	16	B5	f
1216	16	B6	f
1217	16	B7	f
1218	16	B8	t
1219	16	B9	f
1220	16	B10	f
1221	16	C1	t
1222	16	C2	f
1223	16	C3	f
1224	16	C4	f
1225	16	C5	f
1226	16	C6	f
1227	16	C7	f
1228	16	C8	f
1229	16	C9	f
1230	16	C10	f
1231	16	D1	f
1232	16	D2	f
1233	16	D3	f
1234	16	D4	f
1235	16	D5	f
1236	16	D6	t
1237	16	D7	f
1238	16	D8	f
1239	16	D9	f
1240	16	D10	f
1241	16	E1	f
1242	16	E2	f
1243	16	E3	f
1244	16	E4	t
1245	16	E5	t
1246	16	E6	f
1247	16	E7	f
1248	16	E8	f
1249	16	E9	f
1250	16	E10	f
1251	16	F1	f
1252	16	F2	f
1253	16	F3	f
1254	16	F4	f
1255	16	F5	f
1256	16	F6	f
1257	16	F7	f
1258	16	F8	f
1259	16	F9	t
1260	16	F10	f
1261	16	G1	f
1262	16	G2	f
1263	16	G3	f
1264	16	G4	f
1265	16	G5	f
1266	16	G6	f
1267	16	G7	f
1268	16	G8	f
1269	16	G9	f
1270	16	G10	f
1271	16	H1	f
1272	16	H2	f
1273	16	H3	t
1274	16	H4	f
1275	16	H5	f
1276	16	H6	f
1277	16	H7	f
1278	16	H8	f
1279	16	H9	f
1280	16	H10	f
327	5	A7	t
328	5	A8	t
1281	22	A1	f
1282	23	A1	f
1283	24	A1	f
1284	25	A1	f
1285	26	A1	f
1286	27	A1	f
1287	28	A1	f
1288	29	A1	f
1289	30	A1	f
1290	31	A1	f
1291	32	A1	f
1292	33	A1	f
1293	34	A1	f
1294	35	A1	f
1295	36	A1	f
1296	22	A2	f
1297	23	A2	f
1298	24	A2	f
1299	25	A2	f
1300	26	A2	f
1301	27	A2	f
1302	28	A2	f
1303	29	A2	f
1304	30	A2	f
1305	31	A2	f
1306	32	A2	f
1307	33	A2	f
1308	34	A2	f
1309	35	A2	f
1310	36	A2	f
1311	22	A3	f
1312	23	A3	f
1313	24	A3	f
1314	25	A3	f
1315	26	A3	f
1316	27	A3	f
1317	28	A3	f
1318	29	A3	f
1319	30	A3	f
1320	31	A3	f
1321	32	A3	f
1322	33	A3	f
1323	34	A3	f
1324	35	A3	f
1325	36	A3	f
1326	22	A4	f
1327	23	A4	f
1328	24	A4	f
1329	25	A4	f
1330	26	A4	f
1331	27	A4	f
1332	28	A4	f
1333	29	A4	f
1334	30	A4	f
1335	31	A4	f
1336	32	A4	f
1337	33	A4	f
1338	34	A4	f
1339	35	A4	f
1340	36	A4	f
1341	22	A5	f
1342	23	A5	f
1343	24	A5	f
1344	25	A5	f
1345	26	A5	f
1346	27	A5	f
1347	28	A5	f
1348	29	A5	f
1349	30	A5	f
1350	31	A5	f
1351	32	A5	f
1352	33	A5	f
1353	34	A5	f
1354	35	A5	f
1355	36	A5	f
1356	22	A6	f
1357	23	A6	f
1358	24	A6	f
1359	25	A6	f
1360	26	A6	f
1361	27	A6	f
1362	28	A6	f
1363	29	A6	f
1364	30	A6	f
1365	31	A6	f
1366	32	A6	f
1367	33	A6	f
1368	34	A6	f
1369	35	A6	f
1370	36	A6	f
1371	22	A7	f
1372	23	A7	f
1373	24	A7	f
1374	25	A7	f
1375	26	A7	f
1376	27	A7	f
1377	28	A7	f
1378	29	A7	f
1379	30	A7	f
1380	31	A7	f
1381	32	A7	f
1382	33	A7	f
1383	34	A7	f
1384	35	A7	f
1385	36	A7	f
1386	22	A8	f
1387	23	A8	f
1388	24	A8	f
1389	25	A8	f
1390	26	A8	f
1391	27	A8	f
1392	28	A8	f
1393	29	A8	f
1394	30	A8	f
1395	31	A8	f
1396	32	A8	f
1397	33	A8	f
1398	34	A8	f
1399	35	A8	f
1400	36	A8	f
1401	22	A9	f
1402	23	A9	f
1403	24	A9	f
1404	25	A9	f
1405	26	A9	f
1406	27	A9	f
1407	28	A9	f
1408	29	A9	f
1409	30	A9	f
1410	31	A9	f
1411	32	A9	f
1412	33	A9	f
1413	34	A9	f
1414	35	A9	f
1415	36	A9	f
1416	22	A10	f
1417	23	A10	f
1418	24	A10	f
1419	25	A10	f
1420	26	A10	f
1422	28	A10	f
1423	29	A10	f
1425	31	A10	f
1426	32	A10	f
1427	33	A10	f
1428	34	A10	f
1429	35	A10	f
1430	36	A10	f
1431	22	B1	f
1432	23	B1	f
1433	24	B1	f
1434	25	B1	f
1435	26	B1	f
1436	27	B1	f
1437	28	B1	f
1438	29	B1	f
1439	30	B1	f
1440	31	B1	f
1441	32	B1	f
1442	33	B1	f
1443	34	B1	f
1444	35	B1	f
1445	36	B1	f
1446	22	B2	f
1447	23	B2	f
1448	24	B2	f
1449	25	B2	f
1450	26	B2	f
1451	27	B2	f
1452	28	B2	f
1453	29	B2	f
1454	30	B2	f
1455	31	B2	f
1456	32	B2	f
1457	33	B2	f
1458	34	B2	f
1459	35	B2	f
1460	36	B2	f
1461	22	B3	f
1462	23	B3	f
1463	24	B3	f
1464	25	B3	f
1465	26	B3	f
1466	27	B3	f
1467	28	B3	f
1468	29	B3	f
1469	30	B3	f
1470	31	B3	f
1471	32	B3	f
1472	33	B3	f
1473	34	B3	f
1474	35	B3	f
1475	36	B3	f
1476	22	B4	f
1477	23	B4	f
1478	24	B4	f
1479	25	B4	f
1480	26	B4	f
1424	30	A10	t
1481	27	B4	f
1482	28	B4	f
1483	29	B4	f
1484	30	B4	f
1485	31	B4	f
1486	32	B4	f
1487	33	B4	f
1488	34	B4	f
1489	35	B4	f
1490	36	B4	f
1491	22	B5	f
1492	23	B5	f
1493	24	B5	f
1494	25	B5	f
1495	26	B5	f
1496	27	B5	f
1497	28	B5	f
1498	29	B5	f
1499	30	B5	f
1500	31	B5	f
1501	32	B5	f
1502	33	B5	f
1503	34	B5	f
1504	35	B5	f
1505	36	B5	f
1506	22	B6	f
1507	23	B6	f
1508	24	B6	f
1509	25	B6	f
1510	26	B6	f
1511	27	B6	f
1512	28	B6	f
1513	29	B6	f
1514	30	B6	f
1515	31	B6	f
1516	32	B6	f
1517	33	B6	f
1518	34	B6	f
1519	35	B6	f
1520	36	B6	f
1521	22	B7	f
1522	23	B7	f
1523	24	B7	f
1524	25	B7	f
1525	26	B7	f
1526	27	B7	f
1527	28	B7	f
1528	29	B7	f
1529	30	B7	f
1530	31	B7	f
1531	32	B7	f
1532	33	B7	f
1533	34	B7	f
1534	35	B7	f
1535	36	B7	f
1536	22	B8	f
1537	23	B8	f
1538	24	B8	f
1539	25	B8	f
1540	26	B8	f
1541	27	B8	f
1542	28	B8	f
1543	29	B8	f
1544	30	B8	f
1545	31	B8	f
1546	32	B8	f
1547	33	B8	f
1548	34	B8	f
1549	35	B8	f
1550	36	B8	f
1551	22	B9	f
1552	23	B9	f
1553	24	B9	f
1554	25	B9	f
1555	26	B9	f
1556	27	B9	f
1557	28	B9	f
1558	29	B9	f
1559	30	B9	f
1560	31	B9	f
1561	32	B9	f
1562	33	B9	f
1563	34	B9	f
1564	35	B9	f
1565	36	B9	f
1566	22	B10	f
1567	23	B10	f
1568	24	B10	f
1569	25	B10	f
1570	26	B10	f
1571	27	B10	f
1572	28	B10	f
1573	29	B10	f
1574	30	B10	f
1575	31	B10	f
1576	32	B10	f
1577	33	B10	f
1578	34	B10	f
1579	35	B10	f
1580	36	B10	f
1581	22	C1	f
1582	23	C1	f
1583	24	C1	f
1584	25	C1	f
1585	26	C1	f
1586	27	C1	f
1587	28	C1	f
1588	29	C1	f
1589	30	C1	f
1590	31	C1	f
1591	32	C1	f
1592	33	C1	f
1593	34	C1	f
1594	35	C1	f
1595	36	C1	f
1596	22	C2	f
1597	23	C2	f
1598	24	C2	f
1599	25	C2	f
1600	26	C2	f
1601	27	C2	f
1602	28	C2	f
1603	29	C2	f
1604	30	C2	f
1605	31	C2	f
1606	32	C2	f
1607	33	C2	f
1608	34	C2	f
1609	35	C2	f
1610	36	C2	f
1611	22	C3	f
1612	23	C3	f
1613	24	C3	f
1614	25	C3	f
1615	26	C3	f
1616	27	C3	f
1617	28	C3	f
1618	29	C3	f
1619	30	C3	f
1620	31	C3	f
1621	32	C3	f
1622	33	C3	f
1623	34	C3	f
1624	35	C3	f
1625	36	C3	f
1626	22	C4	f
1627	23	C4	f
1628	24	C4	f
1629	25	C4	f
1630	26	C4	f
1631	27	C4	f
1632	28	C4	f
1633	29	C4	f
1634	30	C4	f
1635	31	C4	f
1636	32	C4	f
1637	33	C4	f
1638	34	C4	f
1639	35	C4	f
1640	36	C4	f
1641	22	C5	f
1642	23	C5	f
1643	24	C5	f
1644	25	C5	f
1645	26	C5	f
1646	27	C5	f
1647	28	C5	f
1648	29	C5	f
1649	30	C5	f
1650	31	C5	f
1651	32	C5	f
1652	33	C5	f
1653	34	C5	f
1654	35	C5	f
1655	36	C5	f
1656	22	C6	f
1657	23	C6	f
1658	24	C6	f
1659	25	C6	f
1660	26	C6	f
1661	27	C6	f
1662	28	C6	f
1663	29	C6	f
1664	30	C6	f
1665	31	C6	f
1666	32	C6	f
1667	33	C6	f
1668	34	C6	f
1669	35	C6	f
1670	36	C6	f
1671	22	C7	f
1672	23	C7	f
1673	24	C7	f
1674	25	C7	f
1675	26	C7	f
1676	27	C7	f
1677	28	C7	f
1678	29	C7	f
1679	30	C7	f
1680	31	C7	f
1681	32	C7	f
1682	33	C7	f
1683	34	C7	f
1684	35	C7	f
1685	36	C7	f
1686	22	C8	f
1687	23	C8	f
1688	24	C8	f
1689	25	C8	f
1690	26	C8	f
1691	27	C8	f
1692	28	C8	f
1693	29	C8	f
1694	30	C8	f
1695	31	C8	f
1696	32	C8	f
1697	33	C8	f
1698	34	C8	f
1699	35	C8	f
1700	36	C8	f
1701	22	C9	f
1702	23	C9	f
1703	24	C9	f
1704	25	C9	f
1705	26	C9	f
1706	27	C9	f
1707	28	C9	f
1708	29	C9	f
1709	30	C9	f
1710	31	C9	f
1711	32	C9	f
1712	33	C9	f
1713	34	C9	f
1714	35	C9	f
1715	36	C9	f
1716	22	C10	f
1717	23	C10	f
1718	24	C10	f
1719	25	C10	f
1720	26	C10	f
1721	27	C10	f
1722	28	C10	f
1723	29	C10	f
1724	30	C10	f
1725	31	C10	f
1726	32	C10	f
1727	33	C10	f
1728	34	C10	f
1729	35	C10	f
1730	36	C10	f
1731	22	D1	f
1732	23	D1	f
1733	24	D1	f
1734	25	D1	f
1735	26	D1	f
1736	27	D1	f
1737	28	D1	f
1738	29	D1	f
1739	30	D1	f
1740	31	D1	f
1741	32	D1	f
1742	33	D1	f
1743	34	D1	f
1744	35	D1	f
1745	36	D1	f
1746	22	D2	f
1747	23	D2	f
1748	24	D2	f
1749	25	D2	f
1750	26	D2	f
1751	27	D2	f
1752	28	D2	f
1753	29	D2	f
1754	30	D2	f
1755	31	D2	f
1756	32	D2	f
1757	33	D2	f
1758	34	D2	f
1759	35	D2	f
1760	36	D2	f
1761	22	D3	f
1762	23	D3	f
1763	24	D3	f
1764	25	D3	f
1765	26	D3	f
1766	27	D3	f
1767	28	D3	f
1768	29	D3	f
1769	30	D3	f
1770	31	D3	f
1771	32	D3	f
1772	33	D3	f
1773	34	D3	f
1774	35	D3	f
1775	36	D3	f
1776	22	D4	f
1777	23	D4	f
1778	24	D4	f
1779	25	D4	f
1780	26	D4	f
1781	27	D4	f
1782	28	D4	f
1783	29	D4	f
1784	30	D4	f
1785	31	D4	f
1786	32	D4	f
1787	33	D4	f
1788	34	D4	f
1789	35	D4	f
1790	36	D4	f
1791	22	D5	f
1792	23	D5	f
1793	24	D5	f
1794	25	D5	f
1795	26	D5	f
1796	27	D5	f
1797	28	D5	f
1798	29	D5	f
1799	30	D5	f
1800	31	D5	f
1801	32	D5	f
1802	33	D5	f
1803	34	D5	f
1804	35	D5	f
1805	36	D5	f
1806	22	D6	f
1807	23	D6	f
1808	24	D6	f
1809	25	D6	f
1810	26	D6	f
1811	27	D6	f
1812	28	D6	f
1813	29	D6	f
1814	30	D6	f
1815	31	D6	f
1816	32	D6	f
1817	33	D6	f
1818	34	D6	f
1819	35	D6	f
1820	36	D6	f
1821	22	D7	f
1822	23	D7	f
1823	24	D7	f
1824	25	D7	f
1825	26	D7	f
1826	27	D7	f
1827	28	D7	f
1828	29	D7	f
1829	30	D7	f
1830	31	D7	f
1831	32	D7	f
1832	33	D7	f
1833	34	D7	f
1834	35	D7	f
1835	36	D7	f
1836	22	D8	f
1837	23	D8	f
1838	24	D8	f
1839	25	D8	f
1840	26	D8	f
1841	27	D8	f
1842	28	D8	f
1843	29	D8	f
1844	30	D8	f
1845	31	D8	f
1846	32	D8	f
1847	33	D8	f
1848	34	D8	f
1849	35	D8	f
1850	36	D8	f
1851	22	D9	f
1852	23	D9	f
1853	24	D9	f
1854	25	D9	f
1855	26	D9	f
1856	27	D9	f
1857	28	D9	f
1858	29	D9	f
1859	30	D9	f
1860	31	D9	f
1861	32	D9	f
1862	33	D9	f
1863	34	D9	f
1864	35	D9	f
1865	36	D9	f
1866	22	D10	f
1867	23	D10	f
1868	24	D10	f
1869	25	D10	f
1870	26	D10	f
1871	27	D10	f
1872	28	D10	f
1873	29	D10	f
1874	30	D10	f
1875	31	D10	f
1876	32	D10	f
1877	33	D10	f
1878	34	D10	f
1879	35	D10	f
1880	36	D10	f
1881	22	E1	f
1882	23	E1	f
1883	24	E1	f
1884	25	E1	f
1885	26	E1	f
1886	27	E1	f
1887	28	E1	f
1888	29	E1	f
1889	30	E1	f
1890	31	E1	f
1891	32	E1	f
1892	33	E1	f
1893	34	E1	f
1894	35	E1	f
1895	36	E1	f
1896	22	E2	f
1897	23	E2	f
1898	24	E2	f
1899	25	E2	f
1900	26	E2	f
1901	27	E2	f
1902	28	E2	f
1903	29	E2	f
1904	30	E2	f
1905	31	E2	f
1906	32	E2	f
1907	33	E2	f
1908	34	E2	f
1909	35	E2	f
1910	36	E2	f
1911	22	E3	f
1912	23	E3	f
1913	24	E3	f
1914	25	E3	f
1915	26	E3	f
1916	27	E3	f
1917	28	E3	f
1918	29	E3	f
1919	30	E3	f
1920	31	E3	f
1921	32	E3	f
1922	33	E3	f
1923	34	E3	f
1924	35	E3	f
1925	36	E3	f
1926	22	E4	f
1927	23	E4	f
1928	24	E4	f
1929	25	E4	f
1930	26	E4	f
1931	27	E4	f
1932	28	E4	f
1933	29	E4	f
1934	30	E4	f
1935	31	E4	f
1936	32	E4	f
1937	33	E4	f
1938	34	E4	f
1939	35	E4	f
1940	36	E4	f
1941	22	E5	f
1942	23	E5	f
1943	24	E5	f
1944	25	E5	f
1945	26	E5	f
1946	27	E5	f
1947	28	E5	f
1948	29	E5	f
1949	30	E5	f
1950	31	E5	f
1951	32	E5	f
1952	33	E5	f
1953	34	E5	f
1954	35	E5	f
1955	36	E5	f
1956	22	E6	f
1957	23	E6	f
1958	24	E6	f
1959	25	E6	f
1960	26	E6	f
1961	27	E6	f
1962	28	E6	f
1963	29	E6	f
1964	30	E6	f
1965	31	E6	f
1966	32	E6	f
1967	33	E6	f
1968	34	E6	f
1969	35	E6	f
1970	36	E6	f
1971	22	E7	f
1972	23	E7	f
1973	24	E7	f
1974	25	E7	f
1975	26	E7	f
1976	27	E7	f
1977	28	E7	f
1978	29	E7	f
1979	30	E7	f
1980	31	E7	f
1981	32	E7	f
1982	33	E7	f
1983	34	E7	f
1984	35	E7	f
1985	36	E7	f
1986	22	E8	f
1987	23	E8	f
1988	24	E8	f
1989	25	E8	f
1990	26	E8	f
1991	27	E8	f
1992	28	E8	f
1993	29	E8	f
1994	30	E8	f
1995	31	E8	f
1996	32	E8	f
1997	33	E8	f
1998	34	E8	f
1999	35	E8	f
2000	36	E8	f
2001	22	E9	f
2002	23	E9	f
2003	24	E9	f
2004	25	E9	f
2005	26	E9	f
2006	27	E9	f
2007	28	E9	f
2008	29	E9	f
2009	30	E9	f
2010	31	E9	f
2011	32	E9	f
2012	33	E9	f
2013	34	E9	f
2014	35	E9	f
2015	36	E9	f
2016	22	E10	f
2017	23	E10	f
2018	24	E10	f
2019	25	E10	f
2020	26	E10	f
2021	27	E10	f
2022	28	E10	f
2023	29	E10	f
2024	30	E10	f
2025	31	E10	f
2026	32	E10	f
2027	33	E10	f
2028	34	E10	f
2029	35	E10	f
2030	36	E10	f
2031	22	F1	f
2032	23	F1	f
2033	24	F1	f
2034	25	F1	f
2035	26	F1	f
2036	27	F1	f
2037	28	F1	f
2038	29	F1	f
2039	30	F1	f
2040	31	F1	f
2041	32	F1	f
2042	33	F1	f
2043	34	F1	f
2044	35	F1	f
2045	36	F1	f
2046	22	F2	f
2047	23	F2	f
2048	24	F2	f
2049	25	F2	f
2050	26	F2	f
2051	27	F2	f
2052	28	F2	f
2053	29	F2	f
2054	30	F2	f
2055	31	F2	f
2056	32	F2	f
2057	33	F2	f
2058	34	F2	f
2059	35	F2	f
2060	36	F2	f
2061	22	F3	f
2062	23	F3	f
2063	24	F3	f
2064	25	F3	f
2065	26	F3	f
2066	27	F3	f
2067	28	F3	f
2068	29	F3	f
2069	30	F3	f
2070	31	F3	f
2071	32	F3	f
2072	33	F3	f
2073	34	F3	f
2074	35	F3	f
2075	36	F3	f
2076	22	F4	f
2077	23	F4	f
2078	24	F4	f
2079	25	F4	f
2080	26	F4	f
2081	27	F4	f
2082	28	F4	f
2083	29	F4	f
2084	30	F4	f
2085	31	F4	f
2086	32	F4	f
2087	33	F4	f
2088	34	F4	f
2089	35	F4	f
2090	36	F4	f
2091	22	F5	f
2092	23	F5	f
2093	24	F5	f
2094	25	F5	f
2095	26	F5	f
2096	27	F5	f
2097	28	F5	f
2098	29	F5	f
2099	30	F5	f
2100	31	F5	f
2101	32	F5	f
2102	33	F5	f
2103	34	F5	f
2104	35	F5	f
2105	36	F5	f
2106	22	F6	f
2107	23	F6	f
2108	24	F6	f
2109	25	F6	f
2110	26	F6	f
2111	27	F6	f
2112	28	F6	f
2113	29	F6	f
2114	30	F6	f
2115	31	F6	f
2116	32	F6	f
2117	33	F6	f
2118	34	F6	f
2119	35	F6	f
2120	36	F6	f
2121	22	F7	f
2122	23	F7	f
2123	24	F7	f
2124	25	F7	f
2125	26	F7	f
2126	27	F7	f
2127	28	F7	f
2128	29	F7	f
2129	30	F7	f
2130	31	F7	f
2131	32	F7	f
2132	33	F7	f
2133	34	F7	f
2134	35	F7	f
2135	36	F7	f
2136	22	F8	f
2137	23	F8	f
2138	24	F8	f
2139	25	F8	f
2140	26	F8	f
2141	27	F8	f
2142	28	F8	f
2143	29	F8	f
2144	30	F8	f
2145	31	F8	f
2146	32	F8	f
2147	33	F8	f
2148	34	F8	f
2149	35	F8	f
2150	36	F8	f
2151	22	F9	f
2152	23	F9	f
2153	24	F9	f
2154	25	F9	f
2155	26	F9	f
2156	27	F9	f
2157	28	F9	f
2158	29	F9	f
2159	30	F9	f
2160	31	F9	f
2161	32	F9	f
2162	33	F9	f
2163	34	F9	f
2164	35	F9	f
2165	36	F9	f
2166	22	F10	f
2167	23	F10	f
2168	24	F10	f
2169	25	F10	f
2170	26	F10	f
2171	27	F10	f
2172	28	F10	f
2173	29	F10	f
2174	30	F10	f
2175	31	F10	f
2176	32	F10	f
2177	33	F10	f
2178	34	F10	f
2179	35	F10	f
2180	36	F10	f
2181	22	G1	f
2182	23	G1	f
2183	24	G1	f
2184	25	G1	f
2185	26	G1	f
2186	27	G1	f
2187	28	G1	f
2188	29	G1	f
2189	30	G1	f
2190	31	G1	f
2191	32	G1	f
2192	33	G1	f
2193	34	G1	f
2194	35	G1	f
2195	36	G1	f
2196	22	G2	f
2197	23	G2	f
2198	24	G2	f
2199	25	G2	f
2200	26	G2	f
2201	27	G2	f
2202	28	G2	f
2203	29	G2	f
2204	30	G2	f
2205	31	G2	f
2206	32	G2	f
2207	33	G2	f
2208	34	G2	f
2209	35	G2	f
2210	36	G2	f
2211	22	G3	f
2212	23	G3	f
2213	24	G3	f
2214	25	G3	f
2215	26	G3	f
2216	27	G3	f
2217	28	G3	f
2218	29	G3	f
2219	30	G3	f
2220	31	G3	f
2221	32	G3	f
2222	33	G3	f
2223	34	G3	f
2224	35	G3	f
2225	36	G3	f
2226	22	G4	f
2227	23	G4	f
2228	24	G4	f
2229	25	G4	f
2230	26	G4	f
2231	27	G4	f
2232	28	G4	f
2233	29	G4	f
2234	30	G4	f
2235	31	G4	f
2236	32	G4	f
2237	33	G4	f
2238	34	G4	f
2239	35	G4	f
2240	36	G4	f
2241	22	G5	f
2242	23	G5	f
2243	24	G5	f
2244	25	G5	f
2245	26	G5	f
2246	27	G5	f
2247	28	G5	f
2248	29	G5	f
2249	30	G5	f
2250	31	G5	f
2251	32	G5	f
2252	33	G5	f
2253	34	G5	f
2254	35	G5	f
2255	36	G5	f
2256	22	G6	f
2257	23	G6	f
2258	24	G6	f
2259	25	G6	f
2260	26	G6	f
2261	27	G6	f
2262	28	G6	f
2263	29	G6	f
2264	30	G6	f
2265	31	G6	f
2266	32	G6	f
2267	33	G6	f
2268	34	G6	f
2269	35	G6	f
2270	36	G6	f
2271	22	G7	f
2272	23	G7	f
2273	24	G7	f
2274	25	G7	f
2275	26	G7	f
2276	27	G7	f
2277	28	G7	f
2278	29	G7	f
2279	30	G7	f
2280	31	G7	f
2281	32	G7	f
2282	33	G7	f
2283	34	G7	f
2284	35	G7	f
2285	36	G7	f
2286	22	G8	f
2287	23	G8	f
2288	24	G8	f
2289	25	G8	f
2290	26	G8	f
2291	27	G8	f
2292	28	G8	f
2293	29	G8	f
2294	30	G8	f
2295	31	G8	f
2296	32	G8	f
2297	33	G8	f
2298	34	G8	f
2299	35	G8	f
2300	36	G8	f
2301	22	G9	f
2302	23	G9	f
2303	24	G9	f
2304	25	G9	f
2305	26	G9	f
2306	27	G9	f
2307	28	G9	f
2308	29	G9	f
2309	30	G9	f
2310	31	G9	f
2311	32	G9	f
2312	33	G9	f
2313	34	G9	f
2314	35	G9	f
2315	36	G9	f
2316	22	G10	f
2317	23	G10	f
2318	24	G10	f
2319	25	G10	f
2320	26	G10	f
2321	27	G10	f
2322	28	G10	f
2323	29	G10	f
2324	30	G10	f
2325	31	G10	f
2326	32	G10	f
2327	33	G10	f
2328	34	G10	f
2329	35	G10	f
2330	36	G10	f
2331	22	H1	f
2332	23	H1	f
2333	24	H1	f
2334	25	H1	f
2335	26	H1	f
2336	27	H1	f
2337	28	H1	f
2338	29	H1	f
2339	30	H1	f
2340	31	H1	f
2341	32	H1	f
2342	33	H1	f
2343	34	H1	f
2344	35	H1	f
2345	36	H1	f
2346	22	H2	f
2347	23	H2	f
2348	24	H2	f
2349	25	H2	f
2350	26	H2	f
2351	27	H2	f
2352	28	H2	f
2353	29	H2	f
2354	30	H2	f
2355	31	H2	f
2356	32	H2	f
2357	33	H2	f
2358	34	H2	f
2359	35	H2	f
2360	36	H2	f
2361	22	H3	f
2362	23	H3	f
2363	24	H3	f
2364	25	H3	f
2365	26	H3	f
2366	27	H3	f
2367	28	H3	f
2368	29	H3	f
2369	30	H3	f
2370	31	H3	f
2371	32	H3	f
2372	33	H3	f
2373	34	H3	f
2374	35	H3	f
2375	36	H3	f
2376	22	H4	f
2377	23	H4	f
2378	24	H4	f
2379	25	H4	f
2380	26	H4	f
2381	27	H4	f
2382	28	H4	f
2383	29	H4	f
2384	30	H4	f
2385	31	H4	f
2386	32	H4	f
2387	33	H4	f
2388	34	H4	f
2389	35	H4	f
2390	36	H4	f
2391	22	H5	f
2392	23	H5	f
2393	24	H5	f
2394	25	H5	f
2395	26	H5	f
2396	27	H5	f
2397	28	H5	f
2399	30	H5	f
2400	31	H5	f
2401	32	H5	f
2402	33	H5	f
2403	34	H5	f
2404	35	H5	f
2405	36	H5	f
2406	22	H6	f
2407	23	H6	f
2408	24	H6	f
2409	25	H6	f
2410	26	H6	f
2411	27	H6	f
2412	28	H6	f
2414	30	H6	f
2415	31	H6	f
2416	32	H6	f
2417	33	H6	f
2418	34	H6	f
2419	35	H6	f
2420	36	H6	f
2421	22	H7	f
2422	23	H7	f
2423	24	H7	f
2424	25	H7	f
2425	26	H7	f
2426	27	H7	f
2427	28	H7	f
2429	30	H7	f
2430	31	H7	f
2431	32	H7	f
2432	33	H7	f
2433	34	H7	f
2434	35	H7	f
2435	36	H7	f
2436	22	H8	f
2437	23	H8	f
2438	24	H8	f
2439	25	H8	f
2440	26	H8	f
2441	27	H8	f
2442	28	H8	f
2444	30	H8	f
2445	31	H8	f
2446	32	H8	f
2447	33	H8	f
2448	34	H8	f
2449	35	H8	f
2450	36	H8	f
2451	22	H9	f
2452	23	H9	f
2453	24	H9	f
2454	25	H9	f
2455	26	H9	f
2456	27	H9	f
2457	28	H9	f
2459	30	H9	f
2460	31	H9	f
2461	32	H9	f
2462	33	H9	f
2463	34	H9	f
2464	35	H9	f
2465	36	H9	f
2466	22	H10	f
2467	23	H10	f
2468	24	H10	f
2469	25	H10	f
2470	26	H10	f
2471	27	H10	f
2472	28	H10	f
2474	30	H10	f
2475	31	H10	f
2476	32	H10	f
2477	33	H10	f
2478	34	H10	f
2479	35	H10	f
2480	36	H10	f
1421	27	A10	t
2428	29	H7	t
2398	29	H5	t
2413	29	H6	t
2443	29	H8	t
2458	29	H9	t
2473	29	H10	t

--
-- TOC entry 5073 (class 0 OID 16463)
-- Dependencies: 227
-- Data for Name: showtimes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.showtimes (id, movie_id, hall, date, "time", price, format, created_at) FROM stdin;
1	1	Salon 1	15 Nisan 2026	13:00	180	2D	2026-04-24 11:37:42.331111
2	1	Salon 3	15 Nisan 2026	16:30	220	IMAX	2026-04-24 11:37:42.331111
3	1	Salon 2	15 Nisan 2026	20:00	200	3D	2026-04-24 11:37:42.331111
4	2	Salon 4	15 Nisan 2026	14:00	170	2D	2026-04-24 11:37:42.331111
5	2	Salon 1	15 Nisan 2026	18:30	210	IMAX	2026-04-24 11:37:42.331111
6	3	Salon 5	15 Nisan 2026	17:00	190	2D	2026-04-24 11:37:42.331111
7	4	Salon 2	15 Nisan 2026	21:00	200	3D	2026-04-24 11:37:42.331111
8	5	Salon 1	16 Nisan 2026	14:00	200	IMAX	2026-04-24 11:37:42.331111
9	6	Salon 2	16 Nisan 2026	17:00	180	2D	2026-04-24 11:37:42.331111
10	7	Salon 3	16 Nisan 2026	19:30	170	2D	2026-04-24 11:37:42.331111
11	8	Salon 4	16 Nisan 2026	21:30	220	IMAX	2026-04-24 11:37:42.331111
12	8	Salon 7	17 Nisan 2026	13:30	220	3D	2026-04-24 11:37:42.331111
13	7	Salon 1	17 Nisan 2026	00:00	220	2D	2026-04-24 11:37:42.331111
14	6	Salon 3	16 Nisan 2026	19:30	220	IMAX	2026-04-24 11:37:42.331111
15	5	Salon 5	16 Nisan 2026	21:30	220	IMAX	2026-04-24 11:37:42.331111
16	4	Salon 9	16 Nisan 2026	21:30	220	IMAX	2026-04-24 11:37:42.331111
22	31	Salon 1	2026-05-05	14:00	150	2D	2026-05-03 21:27:46.642936
23	31	Salon 1	2026-05-05	18:00	150	2D	2026-05-03 21:27:46.642936
24	31	Salon 1	2026-05-05	21:00	150	IMAX	2026-05-03 21:27:46.642936
25	32	Salon 2	2026-05-05	13:30	140	2D	2026-05-03 21:27:46.642936
26	32	Salon 2	2026-05-05	17:00	140	2D	2026-05-03 21:27:46.642936
27	32	Salon 2	2026-05-05	20:30	140	3D	2026-05-03 21:27:46.642936
28	30	Salon 3	2026-05-05	15:00	130	2D	2026-05-03 21:27:46.642936
29	30	Salon 3	2026-05-05	19:00	130	IMAX	2026-05-03 21:27:46.642936
30	30	Salon 3	2026-05-05	22:00	130	IMAX	2026-05-03 21:27:46.642936
31	29	Salon 4	2026-05-05	14:30	120	2D	2026-05-03 21:27:46.642936
32	29	Salon 4	2026-05-05	18:30	120	2D	2026-05-03 21:27:46.642936
33	29	Salon 4	2026-05-05	21:30	120	3D	2026-05-03 21:27:46.642936
34	28	Salon 5	2026-05-05	13:00	110	2D	2026-05-03 21:27:46.642936
35	28	Salon 5	2026-05-05	16:30	110	2D	2026-05-03 21:27:46.642936
36	28	Salon 5	2026-05-05	20:00	110	3D	2026-05-03 21:27:46.642936

--
-- TOC entry 5075 (class 0 OID 16474)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, created_at) FROM stdin;
1	Admin User	admin@example.com	123456	admin	2026-04-24 12:03:17.573523
2	Normal User	user@example.com	123456	user	2026-04-24 12:03:17.573523
3	efe	efe@example.com	efe	user	2026-04-24 12:43:32.060238
4	Merve beçit	abc@example.com	123	user	2026-04-24 13:01:53.73037
5	efe	efe@gmail.com	efe	user	2026-05-03 21:34:37.541898

--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 220
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 222
-- Name: reservation_seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 224
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 226
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 228
-- Name: showtimes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

--
-- TOC entry 4896 (class 2606 OID 16493)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);

--
-- TOC entry 4898 (class 2606 OID 16495)
-- Name: movies movies_tmdb_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_tmdb_id_key UNIQUE (tmdb_id);

--
-- TOC entry 4900 (class 2606 OID 16497)
-- Name: reservation_seats reservation_seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_seats
    ADD CONSTRAINT reservation_seats_pkey PRIMARY KEY (id);

--
-- TOC entry 4902 (class 2606 OID 16499)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);

--
-- TOC entry 4904 (class 2606 OID 16501)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (id);

--
-- TOC entry 4906 (class 2606 OID 16503)
-- Name: showtimes showtimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showtimes
    ADD CONSTRAINT showtimes_pkey PRIMARY KEY (id);

--
-- TOC entry 4908 (class 2606 OID 16505)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);

--
-- TOC entry 4910 (class 2606 OID 16507)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

--
-- TOC entry 4911 (class 2606 OID 16508)
-- Name: reservation_seats reservation_seats_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_seats
    ADD CONSTRAINT reservation_seats_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(id) ON DELETE CASCADE;

--
-- TOC entry 4912 (class 2606 OID 16513)
-- Name: reservation_seats reservation_seats_seat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_seats
    ADD CONSTRAINT reservation_seats_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES public.seats(id) ON DELETE CASCADE;

--
-- TOC entry 4913 (class 2606 OID 16518)
-- Name: reservations reservations_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;

--
-- TOC entry 4914 (class 2606 OID 16523)
-- Name: reservations reservations_showtime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_showtime_id_fkey FOREIGN KEY (showtime_id) REFERENCES public.showtimes(id) ON DELETE CASCADE;

--
-- TOC entry 4915 (class 2606 OID 16528)
-- Name: reservations reservations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;

--
-- TOC entry 4916 (class 2606 OID 16533)
-- Name: seats seats_showtime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_showtime_id_fkey FOREIGN KEY (showtime_id) REFERENCES public.showtimes(id) ON DELETE CASCADE;

--
-- TOC entry 4917 (class 2606 OID 16538)
-- Name: showtimes showtimes_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showtimes
    ADD CONSTRAINT showtimes_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;

-- Completed on 2026-05-04 14:29:19

--
-- PostgreSQL database dump complete
--

