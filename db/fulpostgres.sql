--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-01 20:56:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE fulscrum;
--
-- TOC entry 2318 (class 1262 OID 16384)
-- Name: fulscrum; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE fulscrum WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE fulscrum OWNER TO postgres;

\connect fulscrum

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2319 (class 1262 OID 16384)
-- Dependencies: 2318
-- Name: fulscrum; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE fulscrum IS 'Scrum Project';


--
-- TOC entry 10 (class 2615 OID 16385)
-- Name: charts; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA charts;


ALTER SCHEMA charts OWNER TO postgres;

--
-- TOC entry 4 (class 2615 OID 16386)
-- Name: process; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA process;


ALTER SCHEMA process OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 16387)
-- Name: profile; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA profile;


ALTER SCHEMA profile OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = process, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16388)
-- Name: dailyScrum; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "dailyScrum" (
    id integer NOT NULL,
    "sprintId" integer NOT NULL,
    date date NOT NULL,
    start time without time zone NOT NULL,
    "end" time without time zone NOT NULL,
    notes character varying(300)
);


ALTER TABLE "dailyScrum" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16391)
-- Name: daily_scrum_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE daily_scrum_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE daily_scrum_id_seq OWNER TO postgres;

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 189
-- Name: daily_scrum_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE daily_scrum_id_seq OWNED BY "dailyScrum".id;


--
-- TOC entry 192 (class 1259 OID 16403)
-- Name: origins; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE origins (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "desc" character varying(25)
);


ALTER TABLE origins OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16406)
-- Name: origins_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE origins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE origins_id_seq OWNER TO postgres;

--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 193
-- Name: origins_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE origins_id_seq OWNED BY origins.id;


--
-- TOC entry 190 (class 1259 OID 16398)
-- Name: priorities; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE priorities (
    id integer NOT NULL,
    "desc" character varying(50) NOT NULL
);


ALTER TABLE priorities OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16694)
-- Name: projectStatus; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "projectStatus" (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    "desc" character varying(25)
);


ALTER TABLE "projectStatus" OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16408)
-- Name: projects; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE projects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "desc" character varying(100),
    "productOwnerId" integer,
    "scrumMasterId" integer,
    "scrumTeam" integer[],
    stakeholders integer[] DEFAULT ARRAY[]::integer[],
    "statusId" integer DEFAULT 0
);


ALTER TABLE projects OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16411)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO postgres;

--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 195
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- TOC entry 196 (class 1259 OID 16413)
-- Name: sprintUserStories; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "sprintUserStories" (
    id integer NOT NULL,
    "sprintId" integer NOT NULL,
    "userStoryId" integer NOT NULL
);


ALTER TABLE "sprintUserStories" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16416)
-- Name: sprint_user_stories_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE sprint_user_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sprint_user_stories_id_seq OWNER TO postgres;

--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 197
-- Name: sprint_user_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE sprint_user_stories_id_seq OWNED BY "sprintUserStories".id;


--
-- TOC entry 198 (class 1259 OID 16418)
-- Name: sprints; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE sprints (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL,
    "projectId" integer NOT NULL
);


ALTER TABLE sprints OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16421)
-- Name: sprints_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE sprints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sprints_id_seq OWNER TO postgres;

--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 199
-- Name: sprints_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE sprints_id_seq OWNED BY sprints.id;


--
-- TOC entry 200 (class 1259 OID 16423)
-- Name: status; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE status (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    "desc" character varying(25)
);


ALTER TABLE status OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16426)
-- Name: status_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_id_seq OWNER TO postgres;

--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 201
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- TOC entry 215 (class 1259 OID 16683)
-- Name: taskPoints; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "taskPoints" (
    "taskId" integer NOT NULL,
    date date NOT NULL,
    points integer DEFAULT 0 NOT NULL
);


ALTER TABLE "taskPoints" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16428)
-- Name: tasks; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE tasks (
    id integer NOT NULL,
    "userStoryId" integer NOT NULL,
    name character varying(100) NOT NULL,
    "desc" character varying(250),
    "parentTaskId" integer,
    "statusId" integer NOT NULL,
    "userId" integer NOT NULL,
    "originId" integer NOT NULL,
    points integer NOT NULL,
    "executedPoints" integer NOT NULL
);


ALTER TABLE tasks OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16431)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO postgres;

--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 203
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- TOC entry 212 (class 1259 OID 16638)
-- Name: user_stories_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE user_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_stories_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16640)
-- Name: userStories; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "userStories" (
    id integer DEFAULT nextval('user_stories_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    "desc" character varying(250),
    "projectId" integer NOT NULL,
    "priorityId" integer,
    "statusId" integer NOT NULL
);


ALTER TABLE "userStories" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16663)
-- Name: userStoryStatus; Type: TABLE; Schema: process; Owner: postgres
--

CREATE TABLE "userStoryStatus" (
    id integer NOT NULL,
    name character varying(15),
    "desc" character varying(30)
);


ALTER TABLE "userStoryStatus" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16401)
-- Name: user_stories_priorities_id_seq; Type: SEQUENCE; Schema: process; Owner: postgres
--

CREATE SEQUENCE user_stories_priorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_stories_priorities_id_seq OWNER TO postgres;

--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 191
-- Name: user_stories_priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: process; Owner: postgres
--

ALTER SEQUENCE user_stories_priorities_id_seq OWNED BY priorities.id;


SET search_path = profile, pg_catalog;

--
-- TOC entry 204 (class 1259 OID 16433)
-- Name: rolePrivileges; Type: TABLE; Schema: profile; Owner: postgres
--

CREATE TABLE "rolePrivileges" (
    id integer NOT NULL,
    "roleId" integer NOT NULL,
    "create" boolean NOT NULL,
    read boolean NOT NULL,
    update boolean NOT NULL,
    delete boolean NOT NULL,
    execute boolean NOT NULL
);


ALTER TABLE "rolePrivileges" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16436)
-- Name: roles; Type: TABLE; Schema: profile; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16439)
-- Name: rolesPrivileges_id_seq; Type: SEQUENCE; Schema: profile; Owner: postgres
--

CREATE SEQUENCE "rolesPrivileges_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "rolesPrivileges_id_seq" OWNER TO postgres;

--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 206
-- Name: rolesPrivileges_id_seq; Type: SEQUENCE OWNED BY; Schema: profile; Owner: postgres
--

ALTER SEQUENCE "rolesPrivileges_id_seq" OWNED BY "rolePrivileges".id;


--
-- TOC entry 207 (class 1259 OID 16441)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: profile; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 207
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: profile; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 208 (class 1259 OID 16443)
-- Name: tokens; Type: TABLE; Schema: profile; Owner: postgres
--

CREATE TABLE tokens (
    id integer NOT NULL,
    salt character varying(100) NOT NULL,
    token character varying(150) NOT NULL,
    expiration date
);


ALTER TABLE tokens OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16446)
-- Name: userRoles; Type: TABLE; Schema: profile; Owner: postgres
--

CREATE TABLE "userRoles" (
    "userId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE "userRoles" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16449)
-- Name: users; Type: TABLE; Schema: profile; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    "user" character varying(50) NOT NULL,
    "firstName" character varying(100) NOT NULL,
    "lastName" character varying(100) NOT NULL,
    email character varying(150),
    admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16452)
-- Name: users_id_seq; Type: SEQUENCE; Schema: profile; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: profile; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


SET search_path = process, pg_catalog;

--
-- TOC entry 2095 (class 2604 OID 16454)
-- Name: dailyScrum id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "dailyScrum" ALTER COLUMN id SET DEFAULT nextval('daily_scrum_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 16455)
-- Name: origins id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY origins ALTER COLUMN id SET DEFAULT nextval('origins_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 16456)
-- Name: priorities id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY priorities ALTER COLUMN id SET DEFAULT nextval('user_stories_priorities_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 16457)
-- Name: projects id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 16458)
-- Name: sprintUserStories id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "sprintUserStories" ALTER COLUMN id SET DEFAULT nextval('sprint_user_stories_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 16459)
-- Name: sprints id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY sprints ALTER COLUMN id SET DEFAULT nextval('sprints_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 16460)
-- Name: status id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 16461)
-- Name: tasks id; Type: DEFAULT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


SET search_path = profile, pg_catalog;

--
-- TOC entry 2105 (class 2604 OID 16463)
-- Name: rolePrivileges id; Type: DEFAULT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "rolePrivileges" ALTER COLUMN id SET DEFAULT nextval('"rolesPrivileges_id_seq"'::regclass);


--
-- TOC entry 2106 (class 2604 OID 16464)
-- Name: roles id; Type: DEFAULT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 16465)
-- Name: users id; Type: DEFAULT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


SET search_path = process, pg_catalog;

--
-- TOC entry 2285 (class 0 OID 16388)
-- Dependencies: 188
-- Data for Name: dailyScrum; Type: TABLE DATA; Schema: process; Owner: postgres
--



--
-- TOC entry 2289 (class 0 OID 16403)
-- Dependencies: 192
-- Data for Name: origins; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO origins VALUES (1, 'Poorly Defined', 'badge-warning');
INSERT INTO origins VALUES (0, 'New', 'badge-success');
INSERT INTO origins VALUES (3, 'New Requirement', 'badge-info');
INSERT INTO origins VALUES (2, 'Process Change', 'badge-danger');


--
-- TOC entry 2287 (class 0 OID 16398)
-- Dependencies: 190
-- Data for Name: priorities; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO priorities VALUES (0, 'Highest');
INSERT INTO priorities VALUES (1, 'Higher');
INSERT INTO priorities VALUES (2, 'High');
INSERT INTO priorities VALUES (3, 'Normal Highest');
INSERT INTO priorities VALUES (4, 'Normal High');
INSERT INTO priorities VALUES (5, 'Normal');
INSERT INTO priorities VALUES (6, 'Normal Low');
INSERT INTO priorities VALUES (7, 'Normal Lowest');
INSERT INTO priorities VALUES (8, 'Low');
INSERT INTO priorities VALUES (9, 'Lower');
INSERT INTO priorities VALUES (10, 'Lowest');


--
-- TOC entry 2313 (class 0 OID 16694)
-- Dependencies: 216
-- Data for Name: projectStatus; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO "projectStatus" VALUES (1, 'In Progress', 'primary');
INSERT INTO "projectStatus" VALUES (0, 'New', 'warning');
INSERT INTO "projectStatus" VALUES (2, 'Done', 'success');


--
-- TOC entry 2291 (class 0 OID 16408)
-- Dependencies: 194
-- Data for Name: projects; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO projects VALUES (2, 'Project 2', 'Testing', 0, 2, '{10,11,12}', '{1,9}', 0);
INSERT INTO projects VALUES (3, 'Testing Scrum Tool', 'Testing scrum tool for final realese tag.', 0, 2, '{12,11,10,1}', '{9}', 0);
INSERT INTO projects VALUES (1, 'Project 1', 'This is an updated project from web app', 0, 2, '{1,9,11}', '{10,12}', 0);


--
-- TOC entry 2293 (class 0 OID 16413)
-- Dependencies: 196
-- Data for Name: sprintUserStories; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO "sprintUserStories" VALUES (78, 1, 32);
INSERT INTO "sprintUserStories" VALUES (83, 1, 3);
INSERT INTO "sprintUserStories" VALUES (84, 3, 38);
INSERT INTO "sprintUserStories" VALUES (87, 1, 1);
INSERT INTO "sprintUserStories" VALUES (88, 2, 42);
INSERT INTO "sprintUserStories" VALUES (98, 4, 39);
INSERT INTO "sprintUserStories" VALUES (99, 4, 40);
INSERT INTO "sprintUserStories" VALUES (100, 5, 41);
INSERT INTO "sprintUserStories" VALUES (101, 1, 2);


--
-- TOC entry 2295 (class 0 OID 16418)
-- Dependencies: 198
-- Data for Name: sprints; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO sprints VALUES (2, 'New Sprint VSCode', '2017-10-02', '2017-11-30', 2);
INSERT INTO sprints VALUES (3, 'New Sprint', '2017-10-28', '2017-11-28', 1);
INSERT INTO sprints VALUES (1, 'Old Sprint', '2017-10-01', '2017-10-31', 1);
INSERT INTO sprints VALUES (4, 'Testing Scrum basic functionality.', '2017-11-01', '2017-12-01', 3);
INSERT INTO sprints VALUES (5, 'Testing Scrum Tool Tasks', '2017-11-01', '2017-12-01', 3);


--
-- TOC entry 2297 (class 0 OID 16423)
-- Dependencies: 200
-- Data for Name: status; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO status VALUES (1, 'In Progress', 'badge-primary');
INSERT INTO status VALUES (0, 'To Do', 'badge-secondary');
INSERT INTO status VALUES (3, 'Done', 'badge-success');
INSERT INTO status VALUES (2, 'Testing', 'badge-info');


--
-- TOC entry 2312 (class 0 OID 16683)
-- Dependencies: 215
-- Data for Name: taskPoints; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO "taskPoints" VALUES (4, '2017-10-17', 4);
INSERT INTO "taskPoints" VALUES (9, '2017-10-16', 1);
INSERT INTO "taskPoints" VALUES (19, '2017-10-13', 2);
INSERT INTO "taskPoints" VALUES (16, '2017-10-14', 1);
INSERT INTO "taskPoints" VALUES (11, '2017-10-17', 3);
INSERT INTO "taskPoints" VALUES (15, '2017-10-15', 4);
INSERT INTO "taskPoints" VALUES (20, '2017-10-12', 3);
INSERT INTO "taskPoints" VALUES (10, '2017-10-18', 4);
INSERT INTO "taskPoints" VALUES (5, '2017-10-07', 4);
INSERT INTO "taskPoints" VALUES (7, '2017-10-09', 2);
INSERT INTO "taskPoints" VALUES (10, '2017-10-10', 3);
INSERT INTO "taskPoints" VALUES (13, '2017-10-08', 4);
INSERT INTO "taskPoints" VALUES (19, '2017-10-18', 2);
INSERT INTO "taskPoints" VALUES (6, '2017-10-19', 4);
INSERT INTO "taskPoints" VALUES (12, '2017-10-20', 3);
INSERT INTO "taskPoints" VALUES (14, '2017-10-21', 3);
INSERT INTO "taskPoints" VALUES (18, '2017-10-22', 4);
INSERT INTO "taskPoints" VALUES (17, '2017-10-22', 4);
INSERT INTO "taskPoints" VALUES (10, '2017-10-22', 2);
INSERT INTO "taskPoints" VALUES (7, '2017-10-24', 1);
INSERT INTO "taskPoints" VALUES (15, '2017-10-24', 2);
INSERT INTO "taskPoints" VALUES (14, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (12, '2017-10-28', 2);
INSERT INTO "taskPoints" VALUES (17, '2017-10-28', 2);
INSERT INTO "taskPoints" VALUES (11, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (5, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (21, '2017-10-28', 5);
INSERT INTO "taskPoints" VALUES (10, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (9, '2017-10-28', 2);
INSERT INTO "taskPoints" VALUES (7, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (20, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (13, '2017-10-28', 3);
INSERT INTO "taskPoints" VALUES (15, '2017-10-28', 1);
INSERT INTO "taskPoints" VALUES (8, '2017-10-28', 2);
INSERT INTO "taskPoints" VALUES (14, '2017-10-29', 2);
INSERT INTO "taskPoints" VALUES (14, '2017-10-30', 1);
INSERT INTO "taskPoints" VALUES (6, '2017-10-30', 1);


--
-- TOC entry 2299 (class 0 OID 16428)
-- Dependencies: 202
-- Data for Name: tasks; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO tasks VALUES (11, 3, 'Testing 8', NULL, NULL, 3, 1, 0, 4, 4);
INSERT INTO tasks VALUES (5, 1, 'Testing 2', 'Testint 2 test', NULL, 3, 11, 0, 5, 5);
INSERT INTO tasks VALUES (21, 32, 'Testing 14', 'This is a new test.', NULL, 3, 11, 0, 5, 5);
INSERT INTO tasks VALUES (10, 1, 'Testing 7', NULL, NULL, 3, 0, 0, 10, 10);
INSERT INTO tasks VALUES (12, 2, 'Testing 9', NULL, NULL, 3, 1, 0, 5, 5);
INSERT INTO tasks VALUES (9, 1, 'Testing 5', NULL, NULL, 3, 2, 0, 3, 3);
INSERT INTO tasks VALUES (7, 3, 'Testing 4', NULL, NULL, 3, 1, 0, 4, 4);
INSERT INTO tasks VALUES (20, 32, 'Task 16', 'Testing task creation.', NULL, 3, 2, 0, 7, 7);
INSERT INTO tasks VALUES (19, 32, 'Task 15', 'Testing new insert', NULL, 1, 1, 0, 5, 4);
INSERT INTO tasks VALUES (8, 1, 'Testing 6', NULL, NULL, 2, 0, 0, 4, 2);
INSERT INTO tasks VALUES (13, 2, 'Testing 10', NULL, NULL, 3, 1, 0, 5, 5);
INSERT INTO tasks VALUES (14, 2, 'Testing 11', 'Testing 11 task edition.', NULL, 3, 11, 0, 7, 7);
INSERT INTO tasks VALUES (6, 1, 'Testing 3', NULL, NULL, 3, 1, 0, 5, 5);
INSERT INTO tasks VALUES (18, 32, 'Task 14', 'Creating a new task for testing', NULL, 2, 2, 0, 5, 4);
INSERT INTO tasks VALUES (4, 1, 'Testing', 'This is a test to save tasks', NULL, 1, 1, 0, 8, 4);
INSERT INTO tasks VALUES (15, 3, 'Testing 12', 'Testing 12 edition successful.', NULL, 3, 2, 0, 7, 7);
INSERT INTO tasks VALUES (16, 1, 'Testing 13', NULL, NULL, 3, 1, 0, 5, 5);
INSERT INTO tasks VALUES (17, 32, 'Task 13', 'Creating task 13 for testing', NULL, 3, 1, 0, 6, 6);


--
-- TOC entry 2310 (class 0 OID 16640)
-- Dependencies: 213
-- Data for Name: userStories; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO "userStories" VALUES (32, 'New Story for testing', 'Testing', 1, 2, 1);
INSERT INTO "userStories" VALUES (3, 'User story 2 from DB', 'Testing new user stories', 1, 6, 1);
INSERT INTO "userStories" VALUES (38, 'New user Story 20/10/2017', 'Testing', 1, 1, 1);
INSERT INTO "userStories" VALUES (1, 'First User Story', 'Testing user story creation.', 1, 3, 1);
INSERT INTO "userStories" VALUES (42, 'Testing Tool', 'Testing tool to search errors', 2, 0, 1);
INSERT INTO "userStories" VALUES (39, 'Testing Scrum Tool', 'Testing scrum tool for realese tag.', 3, 0, 1);
INSERT INTO "userStories" VALUES (40, 'Testing project data form.', 'Testing project data form to create user stories and sprints.', 3, 1, 1);
INSERT INTO "userStories" VALUES (41, 'Test Sprint Data', 'Testing sprint data form to update user stories, create task for stories and and change task around the kanban board.', 3, 2, 1);
INSERT INTO "userStories" VALUES (2, 'User story from DB', 'Testing new user stories', 1, 5, 1);


--
-- TOC entry 2311 (class 0 OID 16663)
-- Dependencies: 214
-- Data for Name: userStoryStatus; Type: TABLE DATA; Schema: process; Owner: postgres
--

INSERT INTO "userStoryStatus" VALUES (1, 'In Progress', 'badge-primary');
INSERT INTO "userStoryStatus" VALUES (0, 'Pending', 'badge-warning');
INSERT INTO "userStoryStatus" VALUES (2, 'Done', 'badge-success');


SET search_path = profile, pg_catalog;

--
-- TOC entry 2301 (class 0 OID 16433)
-- Dependencies: 204
-- Data for Name: rolePrivileges; Type: TABLE DATA; Schema: profile; Owner: postgres
--



--
-- TOC entry 2302 (class 0 OID 16436)
-- Dependencies: 205
-- Data for Name: roles; Type: TABLE DATA; Schema: profile; Owner: postgres
--

INSERT INTO roles VALUES (1, 'Product Owner');
INSERT INTO roles VALUES (2, 'Scrum Master');
INSERT INTO roles VALUES (3, 'Scrum Team');
INSERT INTO roles VALUES (4, 'Stakeholders');
INSERT INTO roles VALUES (5, 'Administrators');


--
-- TOC entry 2305 (class 0 OID 16443)
-- Dependencies: 208
-- Data for Name: tokens; Type: TABLE DATA; Schema: profile; Owner: postgres
--



--
-- TOC entry 2306 (class 0 OID 16446)
-- Dependencies: 209
-- Data for Name: userRoles; Type: TABLE DATA; Schema: profile; Owner: postgres
--



--
-- TOC entry 2307 (class 0 OID 16449)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: profile; Owner: postgres
--

INSERT INTO users VALUES (0, 'admin', 'Master', 'Administrator', 'fulblind@gmail.com', true);
INSERT INTO users VALUES (9, 'jcastro', 'José Luis', 'Castro', 'joseluiscastro23@gmail.com', false);
INSERT INTO users VALUES (10, 'nkful', 'Nicolle', 'Ful Rojas', 'nkful@gmail.com', false);
INSERT INTO users VALUES (11, 'ikful', 'Iker', 'Ful Rojas', 'ikful@gmail.com', false);
INSERT INTO users VALUES (2, 'lrojas', 'Liss ', 'Rojas', 'lissetterojas8@hotmail.com', false);
INSERT INTO users VALUES (12, 'kdful', 'Krysta Daniela', 'Ful Rojas', 'kdful@gmail.com', false);
INSERT INTO users VALUES (1, 'cful', 'Carlos', 'Ful', 'fulblind@hotmail.com', false);


SET search_path = process, pg_catalog;

--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 189
-- Name: daily_scrum_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('daily_scrum_id_seq', 1, false);


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 193
-- Name: origins_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('origins_id_seq', 4, true);


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 195
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('projects_id_seq', 3, true);


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 197
-- Name: sprint_user_stories_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('sprint_user_stories_id_seq', 101, true);


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 199
-- Name: sprints_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('sprints_id_seq', 5, true);


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 201
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('status_id_seq', 4, true);


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 203
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('tasks_id_seq', 21, true);


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_stories_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('user_stories_id_seq', 42, true);


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 191
-- Name: user_stories_priorities_id_seq; Type: SEQUENCE SET; Schema: process; Owner: postgres
--

SELECT pg_catalog.setval('user_stories_priorities_id_seq', 11, true);


SET search_path = profile, pg_catalog;

--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 206
-- Name: rolesPrivileges_id_seq; Type: SEQUENCE SET; Schema: profile; Owner: postgres
--

SELECT pg_catalog.setval('"rolesPrivileges_id_seq"', 1, false);


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 207
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: profile; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: profile; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 12, true);


SET search_path = process, pg_catalog;

--
-- TOC entry 2112 (class 2606 OID 16467)
-- Name: dailyScrum dailyScrum_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "dailyScrum"
    ADD CONSTRAINT "dailyScrum_pkey" PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 16469)
-- Name: origins origins_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY origins
    ADD CONSTRAINT origins_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 16471)
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 16473)
-- Name: priorities priorities_uq; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY priorities
    ADD CONSTRAINT priorities_uq UNIQUE ("desc");


--
-- TOC entry 2150 (class 2606 OID 16698)
-- Name: projectStatus projectStatus_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "projectStatus"
    ADD CONSTRAINT "projectStatus_pkey" PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 16475)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 16477)
-- Name: sprintUserStories sprintUserStories_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "sprintUserStories"
    ADD CONSTRAINT "sprintUserStories_pkey" PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 16479)
-- Name: sprints sprints_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY sprints
    ADD CONSTRAINT sprints_pkey PRIMARY KEY (id);


--
-- TOC entry 2126 (class 2606 OID 16481)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 16688)
-- Name: taskPoints tasksPoints_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "taskPoints"
    ADD CONSTRAINT "tasksPoints_pkey" PRIMARY KEY ("taskId", date);


--
-- TOC entry 2128 (class 2606 OID 16483)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 16647)
-- Name: userStories userStories_name_uq; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStories"
    ADD CONSTRAINT "userStories_name_uq" UNIQUE (name);


--
-- TOC entry 2144 (class 2606 OID 16645)
-- Name: userStories user_stories_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStories"
    ADD CONSTRAINT user_stories_pkey PRIMARY KEY (id);


--
-- TOC entry 2146 (class 2606 OID 16667)
-- Name: userStoryStatus user_story_status_pkey; Type: CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStoryStatus"
    ADD CONSTRAINT user_story_status_pkey PRIMARY KEY (id);


SET search_path = profile, pg_catalog;

--
-- TOC entry 2130 (class 2606 OID 16489)
-- Name: rolePrivileges rolesPrivileges_pkey; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "rolePrivileges"
    ADD CONSTRAINT "rolesPrivileges_pkey" PRIMARY KEY (id);


--
-- TOC entry 2134 (class 2606 OID 16491)
-- Name: tokens roles_pkey; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 16493)
-- Name: roles roles_pkey1; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey1 PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 16495)
-- Name: userRoles userRoles_pkey; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "userRoles"
    ADD CONSTRAINT "userRoles_pkey" PRIMARY KEY ("userId", "roleId");


--
-- TOC entry 2138 (class 2606 OID 16611)
-- Name: users users_email_uq; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_uq UNIQUE (email);


--
-- TOC entry 2140 (class 2606 OID 16497)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


SET search_path = process, pg_catalog;

--
-- TOC entry 2151 (class 2606 OID 16498)
-- Name: dailyScrum dailyScrum_sprint_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "dailyScrum"
    ADD CONSTRAINT "dailyScrum_sprint_fk" FOREIGN KEY ("sprintId") REFERENCES sprints(id) ON UPDATE CASCADE;


--
-- TOC entry 2152 (class 2606 OID 16592)
-- Name: projects project_product_owner_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT project_product_owner_fk FOREIGN KEY ("productOwnerId") REFERENCES profile.users(id);


--
-- TOC entry 2153 (class 2606 OID 16597)
-- Name: projects project_scrum_master_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT project_scrum_master_fk FOREIGN KEY ("scrumMasterId") REFERENCES profile.users(id);


--
-- TOC entry 2154 (class 2606 OID 16508)
-- Name: sprintUserStories sprintStories_sprint_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "sprintUserStories"
    ADD CONSTRAINT "sprintStories_sprint_fk" FOREIGN KEY ("sprintId") REFERENCES sprints(id) ON UPDATE CASCADE;


--
-- TOC entry 2155 (class 2606 OID 16518)
-- Name: sprints sprints_project_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY sprints
    ADD CONSTRAINT sprints_project_fk FOREIGN KEY ("projectId") REFERENCES projects(id) ON UPDATE CASCADE;


--
-- TOC entry 2167 (class 2606 OID 16689)
-- Name: taskPoints taskPoints_task_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "taskPoints"
    ADD CONSTRAINT "taskPoints_task_fk" FOREIGN KEY ("taskId") REFERENCES tasks(id);


--
-- TOC entry 2156 (class 2606 OID 16523)
-- Name: tasks task_origin_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT task_origin_fk FOREIGN KEY ("originId") REFERENCES origins(id) ON UPDATE CASCADE;


--
-- TOC entry 2157 (class 2606 OID 16528)
-- Name: tasks task_parent_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT task_parent_fk FOREIGN KEY ("parentTaskId") REFERENCES tasks(id) ON UPDATE CASCADE;


--
-- TOC entry 2158 (class 2606 OID 16533)
-- Name: tasks task_status_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT task_status_fk FOREIGN KEY ("statusId") REFERENCES status(id) ON UPDATE CASCADE;


--
-- TOC entry 2159 (class 2606 OID 16538)
-- Name: tasks task_user_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT task_user_fk FOREIGN KEY ("userId") REFERENCES profile.users(id) ON UPDATE CASCADE;


--
-- TOC entry 2166 (class 2606 OID 16653)
-- Name: userStories user_stories_priority_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStories"
    ADD CONSTRAINT user_stories_priority_fk FOREIGN KEY ("priorityId") REFERENCES priorities(id) ON UPDATE CASCADE;


--
-- TOC entry 2165 (class 2606 OID 16678)
-- Name: userStories user_stories_project_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStories"
    ADD CONSTRAINT user_stories_project_fk FOREIGN KEY ("projectId") REFERENCES projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2164 (class 2606 OID 16668)
-- Name: userStories user_stories_status_fk; Type: FK CONSTRAINT; Schema: process; Owner: postgres
--

ALTER TABLE ONLY "userStories"
    ADD CONSTRAINT user_stories_status_fk FOREIGN KEY ("statusId") REFERENCES "userStoryStatus"(id);


SET search_path = profile, pg_catalog;

--
-- TOC entry 2160 (class 2606 OID 16558)
-- Name: rolePrivileges rolePrivileges_role_fk; Type: FK CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "rolePrivileges"
    ADD CONSTRAINT "rolePrivileges_role_fk" FOREIGN KEY ("roleId") REFERENCES roles(id) ON UPDATE CASCADE;


--
-- TOC entry 2161 (class 2606 OID 16563)
-- Name: tokens tokens_user_fk; Type: FK CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_user_fk FOREIGN KEY (id) REFERENCES users(id) ON UPDATE CASCADE;


--
-- TOC entry 2162 (class 2606 OID 16568)
-- Name: userRoles userRoles_user_fk; Type: FK CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "userRoles"
    ADD CONSTRAINT "userRoles_user_fk" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE;


--
-- TOC entry 2163 (class 2606 OID 16573)
-- Name: userRoles usereRoles_role_fk; Type: FK CONSTRAINT; Schema: profile; Owner: postgres
--

ALTER TABLE ONLY "userRoles"
    ADD CONSTRAINT "usereRoles_role_fk" FOREIGN KEY ("roleId") REFERENCES roles(id) ON UPDATE CASCADE;


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 9
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-11-01 20:56:25

--
-- PostgreSQL database dump complete
--

