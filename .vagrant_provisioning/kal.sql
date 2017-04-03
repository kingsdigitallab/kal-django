--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO kal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO kal;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO kal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO kal;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO kal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO kal;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO kal;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO kal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO kal;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO kal;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO kal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO kal;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_blogindexpage; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_blogindexpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cms_blogindexpage OWNER TO kal;

--
-- Name: cms_blogpost; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_blogpost (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    date date NOT NULL,
    feed_image_id integer
);


ALTER TABLE public.cms_blogpost OWNER TO kal;

--
-- Name: cms_blogposttag; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_blogposttag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.cms_blogposttag OWNER TO kal;

--
-- Name: cms_blogposttag_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE cms_blogposttag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_blogposttag_id_seq OWNER TO kal;

--
-- Name: cms_blogposttag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE cms_blogposttag_id_seq OWNED BY cms_blogposttag.id;


--
-- Name: cms_homepage; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_homepage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cms_homepage OWNER TO kal;

--
-- Name: cms_indexpage; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_indexpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cms_indexpage OWNER TO kal;

--
-- Name: cms_richtextpage; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE cms_richtextpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cms_richtextpage OWNER TO kal;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO kal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO kal;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO kal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO kal;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO kal;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO kal;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO kal;

--
-- Name: kaldb_department; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_department (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    faculty_id integer NOT NULL
);


ALTER TABLE public.kaldb_department OWNER TO kal;

--
-- Name: kaldb_department_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_department_id_seq OWNER TO kal;

--
-- Name: kaldb_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_department_id_seq OWNED BY kaldb_department.id;


--
-- Name: kaldb_faculty; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_faculty (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_faculty OWNER TO kal;

--
-- Name: kaldb_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_faculty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_faculty_id_seq OWNER TO kal;

--
-- Name: kaldb_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_faculty_id_seq OWNED BY kaldb_faculty.id;


--
-- Name: kaldb_interest; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_interest (
    id integer NOT NULL,
    name character varying(1024) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.kaldb_interest OWNER TO kal;

--
-- Name: kaldb_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_interest_id_seq OWNER TO kal;

--
-- Name: kaldb_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_interest_id_seq OWNED BY kaldb_interest.id;


--
-- Name: kaldb_interest_related_interests; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_interest_related_interests (
    id integer NOT NULL,
    from_interest_id integer NOT NULL,
    to_interest_id integer NOT NULL
);


ALTER TABLE public.kaldb_interest_related_interests OWNER TO kal;

--
-- Name: kaldb_interest_related_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_interest_related_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_interest_related_interests_id_seq OWNER TO kal;

--
-- Name: kaldb_interest_related_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_interest_related_interests_id_seq OWNED BY kaldb_interest_related_interests.id;


--
-- Name: kaldb_jobposition; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_jobposition (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_jobposition OWNER TO kal;

--
-- Name: kaldb_jobposition_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_jobposition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_jobposition_id_seq OWNER TO kal;

--
-- Name: kaldb_jobposition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_jobposition_id_seq OWNED BY kaldb_jobposition.id;


--
-- Name: kaldb_jobrole; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_jobrole (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_jobrole OWNER TO kal;

--
-- Name: kaldb_jobrole_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_jobrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_jobrole_id_seq OWNER TO kal;

--
-- Name: kaldb_jobrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_jobrole_id_seq OWNED BY kaldb_jobrole.id;


--
-- Name: kaldb_outreachcity; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachcity (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.kaldb_outreachcity OWNER TO kal;

--
-- Name: kaldb_outreachcity_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachcity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachcity_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachcity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachcity_id_seq OWNED BY kaldb_outreachcity.id;


--
-- Name: kaldb_outreachcountry; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachcountry (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_outreachcountry OWNER TO kal;

--
-- Name: kaldb_outreachcountry_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachcountry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachcountry_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachcountry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachcountry_id_seq OWNED BY kaldb_outreachcountry.id;


--
-- Name: kaldb_outreachevent; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachevent (
    id integer NOT NULL,
    name character varying(1024) NOT NULL,
    description text NOT NULL,
    frequency_id integer,
    location_id integer,
    medium_id integer,
    researcher_id integer NOT NULL
);


ALTER TABLE public.kaldb_outreachevent OWNER TO kal;

--
-- Name: kaldb_outreachevent_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachevent_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachevent_id_seq OWNED BY kaldb_outreachevent.id;


--
-- Name: kaldb_outreachfrequency; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachfrequency (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_outreachfrequency OWNER TO kal;

--
-- Name: kaldb_outreachfrequency_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachfrequency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachfrequency_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachfrequency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachfrequency_id_seq OWNED BY kaldb_outreachfrequency.id;


--
-- Name: kaldb_outreachlocation; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachlocation (
    id integer NOT NULL,
    coord_lat character varying(120) NOT NULL,
    coord_long character varying(120) NOT NULL,
    city_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.kaldb_outreachlocation OWNER TO kal;

--
-- Name: kaldb_outreachlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachlocation_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachlocation_id_seq OWNED BY kaldb_outreachlocation.id;


--
-- Name: kaldb_outreachmedium; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_outreachmedium (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_outreachmedium OWNER TO kal;

--
-- Name: kaldb_outreachmedium_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_outreachmedium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_outreachmedium_id_seq OWNER TO kal;

--
-- Name: kaldb_outreachmedium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_outreachmedium_id_seq OWNED BY kaldb_outreachmedium.id;


--
-- Name: kaldb_researcher; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_researcher (
    id integer NOT NULL,
    first_name character varying(120) NOT NULL,
    middle_name character varying(120) NOT NULL,
    last_name character varying(120) NOT NULL,
    role_id integer,
    email character varying(120) NOT NULL,
    phone character varying(120) NOT NULL,
    can_email boolean NOT NULL,
    can_phone boolean NOT NULL,
    pure_url character varying(512) NOT NULL,
    profile_url character varying(512) NOT NULL,
    other_url character varying(512) NOT NULL,
    position_id integer,
    title_id integer,
    department_id integer
);


ALTER TABLE public.kaldb_researcher OWNER TO kal;

--
-- Name: kaldb_researcher_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_researcher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_researcher_id_seq OWNER TO kal;

--
-- Name: kaldb_researcher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_researcher_id_seq OWNED BY kaldb_researcher.id;


--
-- Name: kaldb_researcher_research_interests; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_researcher_research_interests (
    id integer NOT NULL,
    researcher_id integer NOT NULL,
    interest_id integer NOT NULL
);


ALTER TABLE public.kaldb_researcher_research_interests OWNER TO kal;

--
-- Name: kaldb_researcher_research_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_researcher_research_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_researcher_research_interests_id_seq OWNER TO kal;

--
-- Name: kaldb_researcher_research_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_researcher_research_interests_id_seq OWNED BY kaldb_researcher_research_interests.id;


--
-- Name: kaldb_researcher_specialisms; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_researcher_specialisms (
    id integer NOT NULL,
    researcher_id integer NOT NULL,
    specialism_id integer NOT NULL
);


ALTER TABLE public.kaldb_researcher_specialisms OWNER TO kal;

--
-- Name: kaldb_researcher_specialism_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_researcher_specialism_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_researcher_specialism_id_seq OWNER TO kal;

--
-- Name: kaldb_researcher_specialism_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_researcher_specialism_id_seq OWNED BY kaldb_researcher_specialisms.id;


--
-- Name: kaldb_researcher_teaching_interests; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_researcher_teaching_interests (
    id integer NOT NULL,
    researcher_id integer NOT NULL,
    interest_id integer NOT NULL
);


ALTER TABLE public.kaldb_researcher_teaching_interests OWNER TO kal;

--
-- Name: kaldb_researcher_teaching_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_researcher_teaching_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_researcher_teaching_interests_id_seq OWNER TO kal;

--
-- Name: kaldb_researcher_teaching_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_researcher_teaching_interests_id_seq OWNED BY kaldb_researcher_teaching_interests.id;


--
-- Name: kaldb_specialism; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_specialism (
    id integer NOT NULL,
    name character varying(1024) NOT NULL,
    description text NOT NULL,
    london_related boolean NOT NULL,
    kcl_related boolean NOT NULL
);


ALTER TABLE public.kaldb_specialism OWNER TO kal;

--
-- Name: kaldb_specialism_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_specialism_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_specialism_id_seq OWNER TO kal;

--
-- Name: kaldb_specialism_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_specialism_id_seq OWNED BY kaldb_specialism.id;


--
-- Name: kaldb_title; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE kaldb_title (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.kaldb_title OWNER TO kal;

--
-- Name: kaldb_title_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE kaldb_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kaldb_title_id_seq OWNER TO kal;

--
-- Name: kaldb_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE kaldb_title_id_seq OWNED BY kaldb_title.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO kal;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO kal;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO kal;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO kal;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO kal;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO kal;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_collection_id_seq OWNED BY wagtailcore_collection.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO kal;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO kal;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_groupcollectionpermission_id_seq OWNED BY wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO kal;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO kal;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO kal;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO kal;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO kal;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO kal;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO kal;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO kal;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO kal;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_groups_id_seq OWNED BY wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO kal;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO kal;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO kal;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtaildocs_document OWNER TO kal;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO kal;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO kal;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO kal;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO kal;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO kal;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


ALTER TABLE public.wagtailimages_filter OWNER TO kal;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_filter_id_seq OWNER TO kal;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO kal;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO kal;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id integer NOT NULL,
    filter_spec character varying(255) NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO kal;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO kal;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO kal;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO kal;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_editorspick OWNER TO kal;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO kal;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO kal;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO kal;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO kal;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO kal;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: kal; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO kal;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: kal
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO kal;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kal
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogposttag ALTER COLUMN id SET DEFAULT nextval('cms_blogposttag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_department ALTER COLUMN id SET DEFAULT nextval('kaldb_department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_faculty ALTER COLUMN id SET DEFAULT nextval('kaldb_faculty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_interest ALTER COLUMN id SET DEFAULT nextval('kaldb_interest_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_interest_related_interests ALTER COLUMN id SET DEFAULT nextval('kaldb_interest_related_interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_jobposition ALTER COLUMN id SET DEFAULT nextval('kaldb_jobposition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_jobrole ALTER COLUMN id SET DEFAULT nextval('kaldb_jobrole_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachcity ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachcity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachcountry ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachcountry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachevent ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachfrequency ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachfrequency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachlocation ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachmedium ALTER COLUMN id SET DEFAULT nextval('kaldb_outreachmedium_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher ALTER COLUMN id SET DEFAULT nextval('kaldb_researcher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_research_interests ALTER COLUMN id SET DEFAULT nextval('kaldb_researcher_research_interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_specialisms ALTER COLUMN id SET DEFAULT nextval('kaldb_researcher_specialism_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_teaching_interests ALTER COLUMN id SET DEFAULT nextval('kaldb_researcher_teaching_interests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_specialism ALTER COLUMN id SET DEFAULT nextval('kaldb_specialism_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_title ALTER COLUMN id SET DEFAULT nextval('kaldb_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('wagtailcore_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can access Wagtail admin	3	access_admin
5	Can add document	4	add_document
6	Can change document	4	change_document
7	Can delete document	4	delete_document
8	Can add log entry	5	add_logentry
9	Can change log entry	5	change_logentry
10	Can delete log entry	5	delete_logentry
11	Can add group	6	add_group
12	Can change group	6	change_group
13	Can delete group	6	delete_group
14	Can add permission	7	add_permission
15	Can change permission	7	change_permission
16	Can delete permission	7	delete_permission
17	Can add user	8	add_user
18	Can change user	8	change_user
19	Can delete user	8	delete_user
20	Can add content type	9	add_contenttype
21	Can change content type	9	change_contenttype
22	Can delete content type	9	delete_contenttype
23	Can add session	10	add_session
24	Can change session	10	change_session
25	Can delete session	10	delete_session
26	Can add Tagged Item	11	add_taggeditem
27	Can change Tagged Item	11	change_taggeditem
28	Can delete Tagged Item	11	delete_taggeditem
29	Can add Tag	12	add_tag
30	Can change Tag	12	change_tag
31	Can delete Tag	12	delete_tag
32	Can add group collection permission	13	add_groupcollectionpermission
33	Can change group collection permission	13	change_groupcollectionpermission
34	Can delete group collection permission	13	delete_groupcollectionpermission
35	Can add page view restriction	14	add_pageviewrestriction
36	Can change page view restriction	14	change_pageviewrestriction
37	Can delete page view restriction	14	delete_pageviewrestriction
38	Can add group page permission	15	add_grouppagepermission
39	Can change group page permission	15	change_grouppagepermission
40	Can delete group page permission	15	delete_grouppagepermission
41	Can add page revision	16	add_pagerevision
42	Can change page revision	16	change_pagerevision
43	Can delete page revision	16	delete_pagerevision
44	Can add site	17	add_site
45	Can change site	17	change_site
46	Can delete site	17	delete_site
47	Can add page	1	add_page
48	Can change page	1	change_page
49	Can delete page	1	delete_page
50	Can add collection	18	add_collection
51	Can change collection	18	change_collection
52	Can delete collection	18	delete_collection
53	Can add user profile	19	add_userprofile
54	Can change user profile	19	change_userprofile
55	Can delete user profile	19	delete_userprofile
56	Can add filter	20	add_filter
57	Can change filter	20	change_filter
58	Can delete filter	20	delete_filter
59	Can add rendition	21	add_rendition
60	Can change rendition	21	change_rendition
61	Can delete rendition	21	delete_rendition
62	Can add embed	22	add_embed
63	Can change embed	22	change_embed
64	Can delete embed	22	delete_embed
65	Can add query	23	add_query
66	Can change query	23	change_query
67	Can delete query	23	delete_query
68	Can add Query Daily Hits	24	add_querydailyhits
69	Can change Query Daily Hits	24	change_querydailyhits
70	Can delete Query Daily Hits	24	delete_querydailyhits
71	Can add redirect	25	add_redirect
72	Can change redirect	25	change_redirect
73	Can delete redirect	25	delete_redirect
74	Can add form submission	26	add_formsubmission
75	Can change form submission	26	change_formsubmission
76	Can delete form submission	26	delete_formsubmission
77	Can add blog index page	27	add_blogindexpage
78	Can change blog index page	27	change_blogindexpage
79	Can delete blog index page	27	delete_blogindexpage
80	Can add blog post tag	28	add_blogposttag
81	Can change blog post tag	28	change_blogposttag
82	Can delete blog post tag	28	delete_blogposttag
83	Can add home page	29	add_homepage
84	Can change home page	29	change_homepage
85	Can delete home page	29	delete_homepage
86	Can add blog post	30	add_blogpost
87	Can change blog post	30	change_blogpost
88	Can delete blog post	30	delete_blogpost
89	Can add rich text page	31	add_richtextpage
90	Can change rich text page	31	change_richtextpage
91	Can delete rich text page	31	delete_richtextpage
92	Can add index page	32	add_indexpage
93	Can change index page	32	change_indexpage
94	Can delete index page	32	delete_indexpage
95	Can add job role	33	add_jobrole
96	Can change job role	33	change_jobrole
97	Can delete job role	33	delete_jobrole
98	Can add out reach city	34	add_outreachcity
99	Can change out reach city	34	change_outreachcity
100	Can delete out reach city	34	delete_outreachcity
101	Can add job position	35	add_jobposition
102	Can change job position	35	change_jobposition
103	Can delete job position	35	delete_jobposition
104	Can add specialism	36	add_specialism
105	Can change specialism	36	change_specialism
106	Can delete specialism	36	delete_specialism
107	Can add out reach event	37	add_outreachevent
108	Can change out reach event	37	change_outreachevent
109	Can delete out reach event	37	delete_outreachevent
110	Can add title	38	add_title
111	Can change title	38	change_title
112	Can delete title	38	delete_title
113	Can add out reach country	39	add_outreachcountry
114	Can change out reach country	39	change_outreachcountry
115	Can delete out reach country	39	delete_outreachcountry
116	Can add interest	40	add_interest
117	Can change interest	40	change_interest
118	Can delete interest	40	delete_interest
119	Can add faculty	41	add_faculty
120	Can change faculty	41	change_faculty
121	Can delete faculty	41	delete_faculty
122	Can add department	42	add_department
123	Can change department	42	change_department
124	Can delete department	42	delete_department
125	Can add out reach frequency	43	add_outreachfrequency
126	Can change out reach frequency	43	change_outreachfrequency
127	Can delete out reach frequency	43	delete_outreachfrequency
128	Can add researcher	44	add_researcher
129	Can change researcher	44	change_researcher
130	Can delete researcher	44	delete_researcher
131	Can add out reach location	45	add_outreachlocation
132	Can change out reach location	45	change_outreachlocation
133	Can delete out reach location	45	delete_outreachlocation
134	Can add out reach medium	46	add_outreachmedium
135	Can change out reach medium	46	change_outreachmedium
136	Can delete out reach medium	46	delete_outreachmedium
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_permission_id_seq', 136, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$ZKxoueftOZyZ$5tzM/301sDqauG8iKGbeciPn6reEvjw3UuxAMCLY2j8=	2017-04-03 20:14:11.771809+00	t	vagrant				t	t	2017-04-03 20:13:17.982306+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_blogindexpage; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_blogindexpage (page_ptr_id, body) FROM stdin;
\.


--
-- Data for Name: cms_blogpost; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_blogpost (page_ptr_id, body, date, feed_image_id) FROM stdin;
\.


--
-- Data for Name: cms_blogposttag; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_blogposttag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: cms_blogposttag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('cms_blogposttag_id_seq', 1, false);


--
-- Data for Name: cms_homepage; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_homepage (page_ptr_id, body) FROM stdin;
3	[{"type": "paragraph", "value": "<p>This is the homepage.</p><p>Login using vagrant/vagrant - <a href=\\"/admin\\">admin</a> / <a href=\\"/wagtail\\">wagtail</a></p>"}]
\.


--
-- Data for Name: cms_indexpage; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_indexpage (page_ptr_id, body) FROM stdin;
\.


--
-- Data for Name: cms_richtextpage; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY cms_richtextpage (page_ptr_id, body) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-04-03 20:14:21.411061+00	1	Classics	3		42	1
2	2017-04-03 20:14:29.256294+00	1	Arts & Humanities	3		41	1
3	2017-04-03 20:14:37.003397+00	2	Bronze Age Cyprus, and comparative island archaeology	3		40	1
4	2017-04-03 20:14:37.004853+00	7	Exhibiting Classical Antiquities	3		40	1
5	2017-04-03 20:14:37.005744+00	6	Greek Religion	3		40	1
6	2017-04-03 20:14:37.006666+00	1	Minoan (Neopalatial) Crete	3		40	1
7	2017-04-03 20:14:37.00755+00	5	Minoans and Mycenaeans	3		40	1
8	2017-04-03 20:14:37.008441+00	3	The ancient world in modern London (history of museums)	3		40	1
9	2017-04-03 20:14:37.009321+00	4	The broken body: disability studies, Classics and collections	3		40	1
10	2017-04-03 20:21:01.012921+00	51	20th Century Irish literature, culture and politics	3		36	1
11	2017-04-03 20:21:01.014793+00	145	Adjustment to serious negative life events, behaviour change, and facilitating informed choice	3		36	1
12	2017-04-03 20:21:01.015701+00	144	Adjustment to serious negative life events, behaviour change, and facilitating informed choice	3		36	1
13	2017-04-03 20:21:01.016587+00	143	Adjustment to serious negative life events, behaviour change, and facilitating informed choice	3		36	1
14	2017-04-03 20:21:01.01747+00	87	Aeroallergens	3		36	1
15	2017-04-03 20:21:01.018337+00	226	Allergen immunotherapy	3		36	1
16	2017-04-03 20:21:01.019204+00	20	Anglo-German cultural exchange during the Occupation of German	3		36	1
17	2017-04-03 20:21:01.020071+00	140	Applying epidemiology in palliative care	3		36	1
18	2017-04-03 20:21:01.020936+00	139	Applying epidemiology in palliative care	3		36	1
19	2017-04-03 20:21:01.02178+00	138	Applying epidemiology in palliative care	3		36	1
20	2017-04-03 20:21:01.022624+00	155	Applying epidemiology in palliative care.	3		36	1
21	2017-04-03 20:21:01.02351+00	154	Applying epidemiology in palliative care.	3		36	1
22	2017-04-03 20:21:01.024372+00	153	Applying epidemiology in palliative care.	3		36	1
23	2017-04-03 20:21:01.025203+00	152	Applying epidemiology in palliative care.	3		36	1
24	2017-04-03 20:21:01.02627+00	151	Applying epidemiology in palliative care.	3		36	1
25	2017-04-03 20:21:01.027194+00	150	Applying epidemiology in palliative care.	3		36	1
26	2017-04-03 20:21:01.028062+00	99	Assessment of integrated carbon surface fluxes in urban and rural areas.	3		36	1
27	2017-04-03 20:21:01.029082+00	98	Assessment of integrated carbon surface fluxes in urban and rural areas.	3		36	1
28	2017-04-03 20:21:01.030018+00	97	Assessment of integrated carbon surface fluxes in urban and rural areas.	3		36	1
29	2017-04-03 20:21:01.030867+00	21	Autobiographical writing generated by colonial wars.	3		36	1
30	2017-04-03 20:21:01.031742+00	134	Breathlessness in COPD and cancer patients	3		36	1
31	2017-04-03 20:21:01.032576+00	45	Charters and documentary culture	3		36	1
32	2017-04-03 20:21:01.033465+00	197	Chronic disease	3		36	1
33	2017-04-03 20:21:01.034292+00	196	Chronic disease	3		36	1
34	2017-04-03 20:21:01.035181+00	195	Chronic disease	3		36	1
35	2017-04-03 20:21:01.036043+00	194	Chronic disease	3		36	1
36	2017-04-03 20:21:01.0369+00	193	Chronic disease	3		36	1
37	2017-04-03 20:21:01.037752+00	72	Cognitive behavioural therapy for dental fear	3		36	1
38	2017-04-03 20:21:01.038663+00	71	Cognitive behavioural therapy for dental fear	3		36	1
39	2017-04-03 20:21:01.039715+00	240	Cognitive machine-to-machine communications	3		36	1
40	2017-04-03 20:21:01.040587+00	48	Colonial and postcolonial encounters with the metropole	3		36	1
41	2017-04-03 20:21:01.041452+00	47	Colonial and postcolonial encounters with the metropole	3		36	1
42	2017-04-03 20:21:01.042501+00	46	Colonial and postcolonial encounters with the metropole	3		36	1
43	2017-04-03 20:21:01.043466+00	35	Colonial Women Writers	3		36	1
44	2017-04-03 20:21:01.044423+00	34	Colonial Women Writers	3		36	1
45	2017-04-03 20:21:01.045455+00	64	Common mental disorders and oral health	3		36	1
46	2017-04-03 20:21:01.046355+00	11	Contested cultures	3		36	1
47	2017-04-03 20:21:01.047284+00	239	Criminal law	3		36	1
48	2017-04-03 20:21:01.048097+00	14	Cultural management in small arts and cultural organisations	3		36	1
49	2017-04-03 20:21:01.048911+00	10	Culture and the city	3		36	1
50	2017-04-03 20:21:01.049719+00	158	Developing guidelines	3		36	1
51	2017-04-03 20:21:01.050521+00	157	Developing guidelines	3		36	1
52	2017-04-03 20:21:01.051324+00	156	Developing guidelines	3		36	1
53	2017-04-03 20:21:01.052124+00	96	Developing hybrid human exposure models which combine air quality models, peoples movements through cities and personal exposure measurements	3		36	1
54	2017-04-03 20:21:01.052985+00	95	Developing hybrid human exposure models which combine air quality models, peoples movements through cities and personal exposure measurements	3		36	1
55	2017-04-03 20:21:01.053811+00	94	Developing hybrid human exposure models which combine air quality models, peoples movements through cities and personal exposure measurements	3		36	1
56	2017-04-03 20:21:01.054609+00	23	Eighteenth-century studies	3		36	1
57	2017-04-03 20:21:01.055446+00	22	Eighteenth-century studies	3		36	1
58	2017-04-03 20:21:01.056301+00	58	English-to-Spanish translation	3		36	1
59	2017-04-03 20:21:01.057207+00	15	Enterpreneurial opportunity in arts and culture	3		36	1
60	2017-04-03 20:21:01.058035+00	2	Exhibiting Classical Antiquities	3		36	1
61	2017-04-03 20:21:01.058967+00	1	Exhibiting Classical Antiquities	3		36	1
62	2017-04-03 20:21:01.059829+00	36	Feminist film theory	3		36	1
63	2017-04-03 20:21:01.060773+00	13	Gender, media and culture	3		36	1
64	2017-04-03 20:21:01.061676+00	39	German politics and culture	3		36	1
65	2017-04-03 20:21:01.062875+00	216	Global health	3		36	1
66	2017-04-03 20:21:01.063924+00	215	Global health	3		36	1
67	2017-04-03 20:21:01.064776+00	214	Global health	3		36	1
68	2017-04-03 20:21:01.065636+00	213	Global health	3		36	1
69	2017-04-03 20:21:01.06649+00	212	Global health	3		36	1
70	2017-04-03 20:21:01.067414+00	211	Global health	3		36	1
71	2017-04-03 20:21:01.068326+00	210	Global health	3		36	1
72	2017-04-03 20:21:01.069187+00	209	Global health	3		36	1
73	2017-04-03 20:21:01.070029+00	3	Greek Religion	3		36	1
74	2017-04-03 20:21:01.070883+00	199	Healthcare-associated infections	3		36	1
75	2017-04-03 20:21:01.071731+00	198	Healthcare-associated infections	3		36	1
76	2017-04-03 20:21:01.07258+00	86	Health effects of air pollution.	3		36	1
77	2017-04-03 20:21:01.07344+00	108	Health effects of environmental stressors, mainly outdoor air pollution	3		36	1
78	2017-04-03 20:21:01.074331+00	107	Health effects of environmental stressors, mainly outdoor air pollution	3		36	1
153	2017-04-03 20:21:01.141988+00	126	Population health	3		36	1
79	2017-04-03 20:21:01.0752+00	106	Health effects of environmental stressors, mainly outdoor air pollution	3		36	1
80	2017-04-03 20:21:01.076133+00	246	Health informatics	3		36	1
81	2017-04-03 20:21:01.077014+00	41	History of the body.\r�Women�s work in early modern England	3		36	1
82	2017-04-03 20:21:01.077939+00	103	Incorporation of the GUM measurement approaches to uncertainty assessment into source apportionment models.	3		36	1
83	2017-04-03 20:21:01.079031+00	102	Incorporation of the GUM measurement approaches to uncertainty assessment into source apportionment models.	3		36	1
84	2017-04-03 20:21:01.079951+00	101	Incorporation of the GUM measurement approaches to uncertainty assessment into source apportionment models.	3		36	1
85	2017-04-03 20:21:01.080786+00	100	Incorporation of the GUM measurement approaches to uncertainty assessment into source apportionment models.	3		36	1
86	2017-04-03 20:21:01.081614+00	17	Indian texts and their historic contexts	3		36	1
87	2017-04-03 20:21:01.082474+00	16	Indian texts and their historic contexts	3		36	1
88	2017-04-03 20:21:01.083408+00	201	Infectious diseases biobank	3		36	1
89	2017-04-03 20:21:01.084279+00	200	Infectious diseases biobank	3		36	1
90	2017-04-03 20:21:01.085113+00	42	Interdisciplinary connections between history and other branches of the humanities and social sciences, particularly anthropology, cultural geography, theology and sociology	3		36	1
91	2017-04-03 20:21:01.085969+00	9	International heritage and cultural tourism	3		36	1
92	2017-04-03 20:21:01.086809+00	8	International heritage and cultural tourism	3		36	1
93	2017-04-03 20:21:01.087641+00	183	Inverse problem, state space models and their applications to medical research	3		36	1
94	2017-04-03 20:21:01.088483+00	182	Inverse problem, state space models and their applications to medical research	3		36	1
95	2017-04-03 20:21:01.089307+00	181	Inverse problem, state space models and their applications to medical research	3		36	1
96	2017-04-03 20:21:01.090128+00	61	Jewish Perspectives on Religion, Culture and Public Space	3		36	1
97	2017-04-03 20:21:01.091009+00	50	Jews and Judaism	3		36	1
98	2017-04-03 20:21:01.091839+00	49	Jews and Judaism	3		36	1
99	2017-04-03 20:21:01.092659+00	117	Low emission zone	3		36	1
100	2017-04-03 20:21:01.09353+00	116	Low emission zone	3		36	1
101	2017-04-03 20:21:01.094452+00	115	Low emission zone	3		36	1
102	2017-04-03 20:21:01.095343+00	114	Low emission zone	3		36	1
103	2017-04-03 20:21:01.096417+00	74	Management of dental anxiety and fear	3		36	1
104	2017-04-03 20:21:01.097375+00	63	Measuring the burden of oral diseases	3		36	1
105	2017-04-03 20:21:01.098239+00	112	Mechanism(s) of air pollution-induced lung injury	3		36	1
106	2017-04-03 20:21:01.099135+00	111	Mechanism(s) of air pollution-induced lung injury	3		36	1
107	2017-04-03 20:21:01.099974+00	110	Mechanism(s) of air pollution-induced lung injury	3		36	1
108	2017-04-03 20:21:01.100801+00	109	Mechanism(s) of air pollution-induced lung injury	3		36	1
109	2017-04-03 20:21:01.101628+00	236	Medical under- and postgraduate education	3		36	1
110	2017-04-03 20:21:01.10246+00	235	Medical under- and postgraduate education	3		36	1
111	2017-04-03 20:21:01.10329+00	234	Medical under- and postgraduate education	3		36	1
112	2017-04-03 20:21:01.104191+00	233	Medical under- and postgraduate education	3		36	1
113	2017-04-03 20:21:01.105101+00	232	Medical under- and postgraduate education	3		36	1
114	2017-04-03 20:21:01.105975+00	231	Medical under- and postgraduate education	3		36	1
115	2017-04-03 20:21:01.106864+00	53	Melodrama	3		36	1
116	2017-04-03 20:21:01.107765+00	52	Melodrama	3		36	1
117	2017-04-03 20:21:01.108583+00	186	Methodological development and health professions	3		36	1
118	2017-04-03 20:21:01.109585+00	185	Methodological development and health professions	3		36	1
119	2017-04-03 20:21:01.110517+00	184	Methodological development and health professions	3		36	1
120	2017-04-03 20:21:01.111327+00	137	Methods of evaluation of hospital palliative care teams.	3		36	1
121	2017-04-03 20:21:01.112308+00	24	Modern Northern Irish culture.	3		36	1
122	2017-04-03 20:21:01.113364+00	241	Network virtualization	3		36	1
123	2017-04-03 20:21:01.114397+00	192	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
124	2017-04-03 20:21:01.116241+00	191	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
125	2017-04-03 20:21:01.117263+00	190	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
126	2017-04-03 20:21:01.118167+00	189	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
127	2017-04-03 20:21:01.119077+00	188	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
128	2017-04-03 20:21:01.119952+00	187	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	3		36	1
129	2017-04-03 20:21:01.120824+00	238	Obstetrics	3		36	1
130	2017-04-03 20:21:01.1217+00	237	Obstetrics	3		36	1
131	2017-04-03 20:21:01.122564+00	55	Opera analysis	3		36	1
132	2017-04-03 20:21:01.123429+00	54	Opera analysis	3		36	1
133	2017-04-03 20:21:01.124317+00	57	Opera on film	3		36	1
134	2017-04-03 20:21:01.125167+00	56	Opera on film	3		36	1
135	2017-04-03 20:21:01.125991+00	131	Palliative care and medical humanities	3		36	1
136	2017-04-03 20:21:01.126863+00	130	Palliative care and medical humanities	3		36	1
137	2017-04-03 20:21:01.127738+00	129	Palliative care and medical humanities	3		36	1
138	2017-04-03 20:21:01.128876+00	105	Particulate matter measurements used to assess concentrations for statutory regulation	3		36	1
139	2017-04-03 20:21:01.12991+00	104	Particulate matter measurements used to assess concentrations for statutory regulation	3		36	1
140	2017-04-03 20:21:01.130835+00	121	Patient and treatment related factors that affect the survival of cancer patients	3		36	1
141	2017-04-03 20:21:01.131714+00	120	Patient and treatment related factors that affect the survival of cancer patients	3		36	1
142	2017-04-03 20:21:01.132556+00	44	Performance and commodification in medicine and science	3		36	1
143	2017-04-03 20:21:01.133399+00	93	Personal monitoring	3		36	1
144	2017-04-03 20:21:01.134255+00	92	Personal monitoring	3		36	1
145	2017-04-03 20:21:01.135142+00	91	Personal monitoring	3		36	1
146	2017-04-03 20:21:01.135986+00	90	Personal monitoring	3		36	1
147	2017-04-03 20:21:01.13685+00	89	Personal monitoring	3		36	1
148	2017-04-03 20:21:01.137771+00	88	Personal monitoring	3		36	1
149	2017-04-03 20:21:01.138652+00	6	Plato	3		36	1
150	2017-04-03 20:21:01.139489+00	5	Plato	3		36	1
151	2017-04-03 20:21:01.140325+00	128	Population health	3		36	1
152	2017-04-03 20:21:01.141159+00	127	Population health	3		36	1
154	2017-04-03 20:21:01.142868+00	125	Population health	3		36	1
155	2017-04-03 20:21:01.143893+00	124	Population health	3		36	1
156	2017-04-03 20:21:01.14477+00	123	Population health	3		36	1
157	2017-04-03 20:21:01.145768+00	122	Population health	3		36	1
158	2017-04-03 20:21:01.146652+00	70	Prevention of early childhood caries.	3		36	1
159	2017-04-03 20:21:01.147491+00	69	Promoting oral health and prevention of disease	3		36	1
160	2017-04-03 20:21:01.148325+00	68	Promoting oral health and prevention of disease	3		36	1
161	2017-04-03 20:21:01.149154+00	67	Promoting oral health and prevention of disease	3		36	1
162	2017-04-03 20:21:01.149977+00	66	Promoting oral health and prevention of disease	3		36	1
163	2017-04-03 20:21:01.150851+00	65	Promoting oral health and prevention of disease	3		36	1
164	2017-04-03 20:21:01.151677+00	225	Public and patient involvement in research	3		36	1
165	2017-04-03 20:21:01.152536+00	224	Public and patient involvement in research	3		36	1
166	2017-04-03 20:21:01.153394+00	223	Public and patient involvement in research	3		36	1
167	2017-04-03 20:21:01.154235+00	159	Regulation of the stress response	3		36	1
168	2017-04-03 20:21:01.155138+00	60	Religion, Politics and Global Media	3		36	1
169	2017-04-03 20:21:01.156015+00	59	Religion, Politics and Global Media	3		36	1
170	2017-04-03 20:21:01.156897+00	38	Representation of London on film.	3		36	1
171	2017-04-03 20:21:01.157757+00	37	Representation of London on film.	3		36	1
172	2017-04-03 20:21:01.158569+00	227	Respiratory muscle physiology	3		36	1
173	2017-04-03 20:21:01.159417+00	31	Salman Rushdie and Hanif Kureshi	3		36	1
174	2017-04-03 20:21:01.1603+00	230	Sarcoidosis	3		36	1
175	2017-04-03 20:21:01.161224+00	229	Sarcoidosis	3		36	1
176	2017-04-03 20:21:01.162164+00	228	Sarcoidosis	3		36	1
177	2017-04-03 20:21:01.163165+00	113	Scientific communicator, disseminating key research outcomes and findings on the health effects of air pollution through the preparation of a wide range of written material.	3		36	1
178	2017-04-03 20:21:01.164183+00	142	Service development and management in palliative care	3		36	1
179	2017-04-03 20:21:01.165227+00	141	Service development and management in palliative care	3		36	1
180	2017-04-03 20:21:01.166126+00	149	Service policy and development in palliative care	3		36	1
181	2017-04-03 20:21:01.166955+00	148	Service policy and development in palliative care	3		36	1
182	2017-04-03 20:21:01.167795+00	147	Service policy and development in palliative care	3		36	1
183	2017-04-03 20:21:01.168655+00	146	Service policy and development in palliative care	3		36	1
184	2017-04-03 20:21:01.169504+00	119	Severe breathlessness.	3		36	1
185	2017-04-03 20:21:01.170372+00	118	Severe breathlessness.	3		36	1
186	2017-04-03 20:21:01.171217+00	136	Sexuality and gender variance	3		36	1
187	2017-04-03 20:21:01.17208+00	135	Sexuality and gender variance	3		36	1
188	2017-04-03 20:21:01.172928+00	78	Social factors in the aetiology and treatment of common mental disorders.	3		36	1
189	2017-04-03 20:21:01.173816+00	77	Social factors in the aetiology and treatment of common mental disorders.	3		36	1
190	2017-04-03 20:21:01.174664+00	76	Social factors in the aetiology and treatment of common mental disorders.	3		36	1
191	2017-04-03 20:21:01.175498+00	75	Statistical learning methods for prognostic models and stratified medicine	3		36	1
192	2017-04-03 20:21:01.17637+00	33	Theatre capital	3		36	1
193	2017-04-03 20:21:01.177266+00	32	Theatre capital	3		36	1
194	2017-04-03 20:21:01.1781+00	4	The City of Rome	3		36	1
195	2017-04-03 20:21:01.179205+00	62	The Codicology of Buddhist Manuscripts	3		36	1
196	2017-04-03 20:21:01.180144+00	133	The impact of volunteering within health links on UK health professionals.	3		36	1
197	2017-04-03 20:21:01.181086+00	132	The impact of volunteering within health links on UK health professionals.	3		36	1
198	2017-04-03 20:21:01.181919+00	82	The management of refractory psychosis.	3		36	1
199	2017-04-03 20:21:01.182756+00	81	The management of refractory psychosis.	3		36	1
200	2017-04-03 20:21:01.183621+00	80	The management of refractory psychosis.	3		36	1
201	2017-04-03 20:21:01.184432+00	79	The management of refractory psychosis.	3		36	1
202	2017-04-03 20:21:01.185245+00	30	The role of ageing and memory in the theatre.	3		36	1
203	2017-04-03 20:21:01.186062+00	29	The role of ageing and memory in the theatre.	3		36	1
204	2017-04-03 20:21:01.18694+00	28	The role of ageing and memory in the theatre.	3		36	1
205	2017-04-03 20:21:01.187748+00	27	The role of ageing and memory in the theatre.	3		36	1
206	2017-04-03 20:21:01.188574+00	7	The World Novel	3		36	1
207	2017-04-03 20:21:01.189437+00	222	Toxicology of environmental pollutants	3		36	1
208	2017-04-03 20:21:01.190265+00	221	Toxicology of environmental pollutants	3		36	1
209	2017-04-03 20:21:01.191218+00	220	Toxicology of environmental pollutants	3		36	1
210	2017-04-03 20:21:01.192082+00	219	Toxicology of environmental pollutants	3		36	1
211	2017-04-03 20:21:01.192944+00	218	Toxicology of environmental pollutants	3		36	1
212	2017-04-03 20:21:01.19382+00	217	Toxicology of environmental pollutants	3		36	1
213	2017-04-03 20:21:01.194726+00	40	Transnational history	3		36	1
214	2017-04-03 20:21:01.19586+00	85	Tubercolosis	3		36	1
215	2017-04-03 20:21:01.196794+00	84	Tubercolosis	3		36	1
216	2017-04-03 20:21:01.197609+00	83	Tubercolosis	3		36	1
217	2017-04-03 20:21:01.198421+00	204	Understanding how patients make decisions about whether or not to use medicines they have been prescribed to manage their chronic condition	3		36	1
218	2017-04-03 20:21:01.199257+00	203	Understanding how patients make decisions about whether or not to use medicines they have been prescribed to manage their chronic condition	3		36	1
219	2017-04-03 20:21:01.200092+00	202	Understanding how patients make decisions about whether or not to use medicines they have been prescribed to manage their chronic condition	3		36	1
220	2017-04-03 20:21:01.2009+00	12	Undertaking PhD entitled 'Banking for Culture: The Rise of Financial Instruments as a Cultural Policy Tool'	3		36	1
221	2017-04-03 20:21:01.20173+00	25	Undertaking PhD entitled 'Colonial Encounters during the First World War: the West Indies, South Africa and New Zealand, South Africa and the West Indies'	3		36	1
222	2017-04-03 20:21:01.20269+00	43	Undertaking PhD entitled 'Deconstructing Westminster: a four nations history of the Irish Home Rule crisis, c.1886-1893'	3		36	1
223	2017-04-03 20:21:01.203616+00	26	Undertaking PhD entitled 'The representation of childhood and futurity in contemporary performance of Shakespeare'	3		36	1
224	2017-04-03 20:21:01.204469+00	180	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
225	2017-04-03 20:21:01.205303+00	179	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
226	2017-04-03 20:21:01.206224+00	178	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
227	2017-04-03 20:21:01.207116+00	177	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
228	2017-04-03 20:21:01.207963+00	176	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
229	2017-04-03 20:21:01.208793+00	175	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
230	2017-04-03 20:21:01.209615+00	174	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
231	2017-04-03 20:21:01.210478+00	173	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
232	2017-04-03 20:21:01.211302+00	172	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
233	2017-04-03 20:21:01.212216+00	171	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
234	2017-04-03 20:21:01.213196+00	170	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
235	2017-04-03 20:21:01.214292+00	169	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
236	2017-04-03 20:21:01.215135+00	168	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
237	2017-04-03 20:21:01.21616+00	167	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
238	2017-04-03 20:21:01.217051+00	166	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
239	2017-04-03 20:21:01.218033+00	165	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
240	2017-04-03 20:21:01.219179+00	164	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
241	2017-04-03 20:21:01.220168+00	163	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
242	2017-04-03 20:21:01.221067+00	162	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
243	2017-04-03 20:21:01.221946+00	161	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
244	2017-04-03 20:21:01.222806+00	160	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	3		36	1
245	2017-04-03 20:21:01.223696+00	73	Undertaking research degree on 'Patient expectations: The relationship between patient expectations of treatment and the outcome of treatment - the case of orthodontics'	3		36	1
246	2017-04-03 20:21:01.224603+00	206	Using electronic health records to study quality and outcomes in cardiovascular conditions	3		36	1
247	2017-04-03 20:21:01.225474+00	205	Using electronic health records to study quality and outcomes in cardiovascular conditions	3		36	1
248	2017-04-03 20:21:01.226313+00	245	Wired and wireless internet	3		36	1
249	2017-04-03 20:21:01.227392+00	244	Wired and wireless internet	3		36	1
250	2017-04-03 20:21:01.228279+00	243	Wired and wireless internet	3		36	1
251	2017-04-03 20:21:01.229178+00	242	Wired and wireless internet	3		36	1
252	2017-04-03 20:21:01.230168+00	19	Working with early modern literary texts	3		36	1
253	2017-04-03 20:21:01.231042+00	18	Working with early modern literary texts	3		36	1
254	2017-04-03 20:21:01.231871+00	208	�World Food Study�,investigating the nutritional intake and role of traditional foods in the diets of people of West African and Caribbean origin in the UK and in Ghana.	3		36	1
255	2017-04-03 20:21:01.232732+00	207	�World Food Study�,investigating the nutritional intake and role of traditional foods in the diets of people of West African and Caribbean origin in the UK and in Ghana.	3		36	1
256	2017-04-03 20:21:47.77214+00	2	Arts & Humanities	3		41	1
257	2017-04-03 20:21:47.773736+00	3	Dentistry	3		41	1
258	2017-04-03 20:21:47.774575+00	4	Institute of Psychiatry, Psychology & Neuroscience	3		41	1
259	2017-04-03 20:21:47.775405+00	6	Law	3		41	1
260	2017-04-03 20:21:47.776235+00	5	Life Sciences & Medicine	3		41	1
261	2017-04-03 20:21:47.77706+00	7	Natural & Mathematical Sciences	3		41	1
262	2017-04-03 20:21:47.777877+00	8	Nursing	3		41	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 262, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	wagtailadmin	admin
4	wagtaildocs	document
5	admin	logentry
6	auth	group
7	auth	permission
8	auth	user
9	contenttypes	contenttype
10	sessions	session
11	taggit	taggeditem
12	taggit	tag
13	wagtailcore	groupcollectionpermission
14	wagtailcore	pageviewrestriction
15	wagtailcore	grouppagepermission
16	wagtailcore	pagerevision
17	wagtailcore	site
18	wagtailcore	collection
19	wagtailusers	userprofile
20	wagtailimages	filter
21	wagtailimages	rendition
22	wagtailembeds	embed
23	wagtailsearch	query
24	wagtailsearch	querydailyhits
25	wagtailredirects	redirect
26	wagtailforms	formsubmission
27	cms	blogindexpage
28	cms	blogposttag
29	cms	homepage
30	cms	blogpost
31	cms	richtextpage
32	cms	indexpage
33	kaldb	jobrole
34	kaldb	outreachcity
35	kaldb	jobposition
36	kaldb	specialism
37	kaldb	outreachevent
38	kaldb	title
39	kaldb	outreachcountry
40	kaldb	interest
41	kaldb	faculty
42	kaldb	department
43	kaldb	outreachfrequency
44	kaldb	researcher
45	kaldb	outreachlocation
46	kaldb	outreachmedium
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('django_content_type_id_seq', 46, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-03 20:11:47.704006+00
2	auth	0001_initial	2017-04-03 20:11:47.75778+00
3	admin	0001_initial	2017-04-03 20:11:47.77692+00
4	admin	0002_logentry_remove_auto_add	2017-04-03 20:11:47.786855+00
5	contenttypes	0002_remove_content_type_name	2017-04-03 20:11:47.812476+00
6	auth	0002_alter_permission_name_max_length	2017-04-03 20:11:47.82594+00
7	auth	0003_alter_user_email_max_length	2017-04-03 20:11:47.839909+00
8	auth	0004_alter_user_username_opts	2017-04-03 20:11:47.850339+00
9	auth	0005_alter_user_last_login_null	2017-04-03 20:11:47.861623+00
10	auth	0006_require_contenttypes_0002	2017-04-03 20:11:47.86309+00
11	auth	0007_alter_validators_add_error_messages	2017-04-03 20:11:47.874215+00
12	auth	0008_alter_user_username_max_length	2017-04-03 20:11:47.891383+00
13	taggit	0001_initial	2017-04-03 20:11:47.916982+00
14	wagtailimages	0001_initial	2017-04-03 20:11:48.05493+00
15	wagtailcore	0001_initial	2017-04-03 20:11:48.296039+00
16	wagtailcore	0002_initial_data	2017-04-03 20:11:48.297361+00
17	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2017-04-03 20:11:48.298605+00
18	wagtailcore	0004_page_locked	2017-04-03 20:11:48.299747+00
19	wagtailcore	0005_add_page_lock_permission_to_moderators	2017-04-03 20:11:48.300855+00
20	wagtailcore	0006_add_lock_page_permission	2017-04-03 20:11:48.302019+00
21	wagtailcore	0007_page_latest_revision_created_at	2017-04-03 20:11:48.303279+00
22	wagtailcore	0008_populate_latest_revision_created_at	2017-04-03 20:11:48.304588+00
23	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2017-04-03 20:11:48.306222+00
24	wagtailcore	0010_change_page_owner_to_null_on_delete	2017-04-03 20:11:48.307683+00
25	wagtailcore	0011_page_first_published_at	2017-04-03 20:11:48.308895+00
26	wagtailcore	0012_extend_page_slug_field	2017-04-03 20:11:48.31004+00
27	wagtailcore	0013_update_golive_expire_help_text	2017-04-03 20:11:48.311215+00
28	wagtailcore	0014_add_verbose_name	2017-04-03 20:11:48.312373+00
29	wagtailcore	0015_add_more_verbose_names	2017-04-03 20:11:48.313519+00
30	wagtailcore	0016_change_page_url_path_to_text_field	2017-04-03 20:11:48.314652+00
31	wagtailimages	0002_initial_data	2017-04-03 20:11:48.329076+00
32	wagtailimages	0003_fix_focal_point_fields	2017-04-03 20:11:48.397273+00
33	wagtailimages	0004_make_focal_point_key_not_nullable	2017-04-03 20:11:48.425503+00
34	wagtailimages	0005_make_filter_spec_unique	2017-04-03 20:11:48.4616+00
35	wagtailimages	0006_add_verbose_names	2017-04-03 20:11:48.545877+00
36	wagtailimages	0007_image_file_size	2017-04-03 20:11:48.565746+00
37	wagtailimages	0008_image_created_at_index	2017-04-03 20:11:48.590084+00
38	wagtailimages	0009_capitalizeverbose	2017-04-03 20:11:48.715776+00
39	wagtailimages	0010_change_on_delete_behaviour	2017-04-03 20:11:48.747126+00
40	wagtailcore	0017_change_edit_page_permission_description	2017-04-03 20:11:48.767435+00
41	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2017-04-03 20:11:48.78679+00
42	wagtailcore	0019_verbose_names_cleanup	2017-04-03 20:11:48.918191+00
43	wagtailcore	0020_add_index_on_page_first_published_at	2017-04-03 20:11:48.938892+00
44	wagtailcore	0021_capitalizeverbose	2017-04-03 20:11:49.531433+00
45	wagtailcore	0022_add_site_name	2017-04-03 20:11:49.556756+00
46	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2017-04-03 20:11:49.644647+00
47	wagtailcore	0024_collection	2017-04-03 20:11:49.654844+00
48	wagtailcore	0025_collection_initial_data	2017-04-03 20:11:49.659415+00
49	wagtailcore	0026_group_collection_permission	2017-04-03 20:11:49.707816+00
50	wagtailimages	0011_image_collection	2017-04-03 20:11:49.740168+00
51	wagtailimages	0012_copy_image_permissions_to_collections	2017-04-03 20:11:49.7507+00
52	wagtailimages	0013_make_rendition_upload_callable	2017-04-03 20:11:49.768512+00
53	wagtailimages	0014_add_filter_spec_field	2017-04-03 20:11:49.83017+00
54	wagtailimages	0015_fill_filter_spec_field	2017-04-03 20:11:49.834068+00
55	wagtailimages	0016_deprecate_rendition_filter_relation	2017-04-03 20:11:49.914224+00
56	wagtailimages	0017_reduce_focal_point_key_max_length	2017-04-03 20:11:49.940999+00
57	wagtailimages	0018_remove_rendition_filter	2017-04-03 20:11:49.975303+00
58	wagtailcore	0027_fix_collection_path_collation	2017-04-03 20:11:49.98231+00
59	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2017-04-03 20:11:50.015945+00
60	wagtailcore	0028_merge	2017-04-03 20:11:50.01749+00
61	wagtailcore	0029_unicode_slugfield_dj19	2017-04-03 20:11:50.037601+00
62	wagtailcore	0030_index_on_pagerevision_created_at	2017-04-03 20:11:50.061502+00
63	wagtailcore	0031_add_page_view_restriction_types	2017-04-03 20:11:50.134414+00
64	wagtailcore	0032_add_bulk_delete_page_permission	2017-04-03 20:11:50.159003+00
65	taggit	0002_auto_20150616_2121	2017-04-03 20:11:50.185303+00
66	cms	0001_initial	2017-04-03 20:11:50.374159+00
67	cms	0002_auto_20170314_2009	2017-04-03 20:11:50.561351+00
68	kaldb	0001_initial	2017-04-03 20:11:50.698803+00
69	kaldb	0002_auto_20170314_2022	2017-04-03 20:11:50.737117+00
70	kaldb	0003_researcher_department	2017-04-03 20:11:50.754141+00
71	kaldb	0004_auto_20170314_2026	2017-04-03 20:11:50.782897+00
72	kaldb	0005_auto_20170314_2032	2017-04-03 20:11:51.027627+00
73	kaldb	0006_auto_20170314_2037	2017-04-03 20:11:51.08808+00
74	kaldb	0007_auto_20170314_2053	2017-04-03 20:11:51.130314+00
75	kaldb	0008_auto_20170314_2054	2017-04-03 20:11:51.170453+00
76	kaldb	0009_auto_20170403_1859	2017-04-03 20:11:51.211137+00
77	kaldb	0010_auto_20170403_1915	2017-04-03 20:11:51.233111+00
78	kaldb	0011_auto_20170403_1937	2017-04-03 20:11:51.277814+00
79	kaldb	0012_auto_20170403_2038	2017-04-03 20:11:51.409565+00
80	kaldb	0013_auto_20170403_2040	2017-04-03 20:11:51.433331+00
81	kaldb	0014_auto_20170403_2043	2017-04-03 20:11:51.679656+00
82	kaldb	0015_auto_20170403_2100	2017-04-03 20:11:51.725517+00
83	kaldb	0016_auto_20170403_2101	2017-04-03 20:11:51.916251+00
84	kaldb	0017_auto_20170403_2106	2017-04-03 20:11:51.975964+00
85	sessions	0001_initial	2017-04-03 20:11:51.987057+00
86	wagtailadmin	0001_create_admin_access_permissions	2017-04-03 20:11:51.998264+00
87	wagtaildocs	0001_initial	2017-04-03 20:11:52.031272+00
88	wagtaildocs	0002_initial_data	2017-04-03 20:11:52.047524+00
89	wagtaildocs	0003_add_verbose_names	2017-04-03 20:11:52.143106+00
90	wagtaildocs	0004_capitalizeverbose	2017-04-03 20:11:52.316471+00
91	wagtaildocs	0005_document_collection	2017-04-03 20:11:52.350408+00
92	wagtaildocs	0006_copy_document_permissions_to_collections	2017-04-03 20:11:52.360497+00
93	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2017-04-03 20:11:52.406315+00
94	wagtaildocs	0007_merge	2017-04-03 20:11:52.407829+00
95	wagtailembeds	0001_initial	2017-04-03 20:11:52.423568+00
96	wagtailembeds	0002_add_verbose_names	2017-04-03 20:11:52.429588+00
97	wagtailembeds	0003_capitalizeverbose	2017-04-03 20:11:52.437793+00
98	wagtailforms	0001_initial	2017-04-03 20:11:52.533797+00
99	wagtailforms	0002_add_verbose_names	2017-04-03 20:11:52.590445+00
100	wagtailforms	0003_capitalizeverbose	2017-04-03 20:11:52.658249+00
101	wagtailredirects	0001_initial	2017-04-03 20:11:52.698642+00
102	wagtailredirects	0002_add_verbose_names	2017-04-03 20:11:52.790518+00
103	wagtailredirects	0003_make_site_field_editable	2017-04-03 20:11:52.845562+00
104	wagtailredirects	0004_set_unique_on_path_and_site	2017-04-03 20:11:52.933423+00
105	wagtailredirects	0005_capitalizeverbose	2017-04-03 20:11:53.147303+00
106	wagtailsearch	0001_initial	2017-04-03 20:11:53.249281+00
107	wagtailsearch	0002_add_verbose_names	2017-04-03 20:11:53.455749+00
108	wagtailsearch	0003_remove_editors_pick	2017-04-03 20:11:53.487034+00
109	wagtailusers	0001_initial	2017-04-03 20:11:53.520596+00
110	wagtailusers	0002_add_verbose_name_on_userprofile	2017-04-03 20:11:53.610907+00
111	wagtailusers	0003_add_verbose_names	2017-04-03 20:11:53.643546+00
112	wagtailusers	0004_capitalizeverbose	2017-04-03 20:11:53.764268+00
113	wagtailusers	0005_make_related_name_wagtail_specific	2017-04-03 20:11:53.815354+00
114	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2017-04-03 20:11:53.818633+00
115	kaldb	0018_auto_20170403_2115	2017-04-03 20:15:27.227559+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('django_migrations_id_seq', 115, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ztdwvvdcrqmkj9ddsngas95nce795s6m	ODA1ODBiZDU1NDQ2ZDU0OWY2NmViN2ZjNDg5NjY5N2M1MTM1ZjM3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0ZjdlNTUwMWU3ZTBhNWZmMGU5ZjQ5YmU5ZjVjNjc0OGFlYjkyMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-04-17 20:14:11.773754+00
\.


--
-- Data for Name: kaldb_department; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_department (id, name, faculty_id) FROM stdin;
42	Adult Nursing	9
43	Child & Adolescent Nursing	9
44	Mental Health Nursing	9
45	Midwifery	9
46	Nursing & Midwifery Research	9
47	Classics	10
48	Comparative Literature	10
49	Culture, Media and Creative Industries	10
50	English	10
51	Film Studies	10
52	German	10
53	History	10
54	Liberal Arts	10
55	Music	10
56	Spanish, Potuguese and Latin American Studies	10
57	Theology and Religious Studies	10
58	Population & Patient Health	11
59	Biostatistics and Health Informatics	12
60	Health Service and Population Research�	12
61	Psychosis Studies	12
62	Allergy, Respiratory, Critical Care, Anaesthetics and Pain Therapies Clinical Academic Group	13
63	Analytical and Environmental Science	13
64	Asthma, Allergy & Lung Biology	13
65	Cancer Studies	13
66	Cancer Studies/Health & Social Care	13
67	Centre for Global Health	13
68	Cicely Saunders Institute Of Palliative Care, Policy & Rehabilitation	13
69	Diabetes and Nutritional Science	13
70	Diabetes, Endocrinology, Nutrition, Obesity, Vision and Related Surgeries Clinical Academic Group	13
71	Emergency Medicine	13
72	Health & Social Care	13
73	Immunology, Infection & Inflammatory Disease	13
74	Infectious Disease	13
75	Institute of Pharmaceutical Science	13
76	Medicine Clinical Academic Group	13
77	Nutrition	13
78	Orthopaedics, Trauma and Plastics Clinical Academic Group	13
79	Pharmaceutical Science Clinical Academic Group	13
80	Physiotherapy	13
81	Respiratory Medicine and Allergy	13
82	Rheumatology	13
83	Women's Health	13
84	Dickinson Poon School of Law	14
85	Informatics	15
86	Defence Studies	16
87	Education, Communication & Society	16
88	European & International Studies	16
89	Geography	16
90	Global Health & Social Medicine	16
91	Institute of Contemporary British History	16
92	Management & Business	16
93	Policy Institute	16
94	War Studies	16
\.


--
-- Name: kaldb_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_department_id_seq', 94, true);


--
-- Data for Name: kaldb_faculty; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_faculty (id, name) FROM stdin;
9	Nursing
10	Arts & Humanities
11	Dentistry
12	Institute of Psychiatry, Psychology & Neuroscience
13	Life Sciences & Medicine
14	Law
15	Natural & Mathematical Sciences
16	Social Science & Public Policy
\.


--
-- Name: kaldb_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_faculty_id_seq', 16, true);


--
-- Data for Name: kaldb_interest; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_interest (id, name, description) FROM stdin;
8	Minoan (Neopalatial) Crete	
9	Bronze Age Cyprus, and comparative island archaeology	
10	The ancient world in modern London (history of museums)	
11	The broken body: disability studies, Classics and collections	
12	Minoans and Mycenaeans	
13	Greek Religion	
14	Exhibiting Classical Antiquities	
15	Greek religion	
16	Religion and cognition	
17	Alexander the Great	
18	Archaic and classical Greek history (fifth and fourth centuries BC)	
19	Ancient History (c. 1200 BC-AD 600)	
20	Democracy, Empire and War: Greece 446-338 BC	
21	Archaeology of the Roman Empire, especially Rome's north-west provinces and Roman Italy	
22	Archaeology of death and burial	
23	Archaeology of documents and literacy	
24	Archaeology of Roman and pre-Roman landscapes	
25	Roman small finds	
26	Visual culture and Roman bronzes	
27	Art and Archaeology of Ancient Greece and Rome	
28	Roman Britain	
29	The City of Rome	
30	Greek literature and thought of the first two centuries CE.	
31	Philosophy as an institution in the ancient world.	
32	The depiction and use of  Socrates in antiquity and since.	
33	Classical survivals, real and imagined.	
34	The history of Classics at King's College London.	
35	Ancient Philosophy	
36	Death in Greek Literature	
37	Plato	
38	Caribbean literature	
39	Classical reception studies	
40	Epic and orality	
41	Performance	
42	Postcolonial theory	
43	Comparative Literature: Conceptions and Methods	
44	Genres of World Literature	
45	The Canon	
46	The World Novel	
47	National identities and the discourse of �heritage�	
48	New media usage by cultural institutions	
49	Youth subcultures	
50	Cultures of the left	
51	Cultural institutions and society	
52	Cultural consumption and social class	
53	Postcolonial identities and culture	
54	Culture and commerce	
55	Museums	
56	International heritage and cultural tourism	
57	Relationship between public and private investments in the arts	
58	Art and cultural regeneration	
59	Creative and cultural industries and knowledge and production networks	
60	Social network analysis	
61	Creative graduates and creative careers	
62	Higher education and the creative economy	
63	Complexity theory and its connections with the creative economy	
64	Role of creative industries in local and regional development	
65	Culture and the city	
66	Media distribution	
67	Copyright infringement (media piracy)	
68	Media Industries	
69	Gatekeepers and Cultural Intermediaries	
70	Media audiences and fandom	
71	Research approaches	
72	Contested cultures	
73	Undertaking PhD entitled 'Banking for Culture: The Rise of Financial Instruments as a Cultural Policy Tool'	
74	Engagements with feminism	
75	Young femininities	
76	Cultural work	
77	Inequalities in cultural work	
78	Entrepreneurial subjectivities	
79	Feminist research methods	
80	Gender, media and culture	
81	Cultural creativity and everyday art	
82	Critical realism and aesthetics	
83	Arts-based learning and education	
84	Arts and cultural management	
85	Cultural management in small arts and cultural organisations	
86	The changing role of museums, heritage sites, collections, and material culture in contemporary society	
87	What entrepreneurship and resilience means for the museum and heritage sector	
88	Museums and Mega-Events (Large sporting events in particular)	
89	Museum and heritage policy	
90	Enterpreneurial opportunity in arts and culture	
91	The Orientalization of Victorian Reading Cultures	
92	Rudyard Kipling and W.B. Yeats	
93	Migratory Imperial Lives and the Making of Modern India	
94	Global approaches to Victorian and modernist literature	
95	Travelogues, novels written in exile and imperial networks of translation	
96	Indian texts and their historic contexts	
97	Milton	
98	Early Modern English literature and culture	
99	Poetics	
100	Reading Paradise Lost	
101	Family politics in early modern England	
102	Shakespeare in London	
103	Early modern literary cultures	
104	Renaissance wordplay	
105	Working with early modern literary texts	
106	The engagement between literature and cinema in the 1930s and 40s	
107	Second World War lives and literature	
108	Anglo-German cultural exchange during the Occupation of German	
109	Postcolonial studies, particularly with regard to London, postimperial melancholia and the emplotment of English victimage.	
110	Literature and cultural politics of European decolonisation.	
111	African American intellectual and cultural history, literature and philosophy.	
112	Formation and reproduction of national identity especially with regard to race and �identity�.	
113	Literary and theoretical significance of port cities and pelagics.	
114	Writing of Alain Locke.	
115	Cultural significance of aerial bombardment.	
116	Autobiographical writing generated by colonial wars.	
117	Music, literature and religious dissent.	
118	Eighteenth- and nineteenth-century London.	
119	William Cobbett and the radical press.	
120	The Godwin-Wollstonecraft-Shelley circle	
121	Poetry	
122	Life-writing	
123	History of the novel	
124	Eighteenth-century studies	
125	Literature, culture and politics in early 20th C Ireland and contemporary Northern Ireland	
126	Post-colonial literature and theory	
127	Film, television and news media	
128	Literary theory	
129	20th century Irish literature	
130	James Joyce and Ulysses	
131	Modernist poetry	
132	Literature of World War One	
133	Irish literary revival	
134	Modern Northern Irish culture.	
135	Undertaking PhD entitled 'Colonial Encounters during the First World War: the West Indies, South Africa and New Zealand, South Africa and the West Indies'	
136	Undertaking PhD entitled 'The representation of childhood and futurity in contemporary performance of Shakespeare'	
137	The dynamic relationship between old and new in literary cultures and their afterlives.	
138	The place of youth in early modern theatre.	
139	The function of outmoded style in early modern literary culture.	
140	The revival and reshaping of old plays in performance.	
141	The role of ageing and memory in the theatre.	
142	Postcolonial literature and theory	
143	Post-1945 and contemporary fiction	
144	Immigration and gender studies	
145	The history of the book.	
146	Writing global cities	
147	Postcolonial perspectives	
148	Contemporary South Asian women's writing	
149	Salman Rushdie and Hanif Kureshi	
150	Ethics, politics, philosophies and critical theories of theatre and performance; performance	
151	Architecture and location in the urban realm	
152	Theatre and everyday life	
153	Socially engaged art practices	
154	Performed communities	
155	Performance philosophy	
156	Theatre capital	
157	Virginia Woolf	
158	Modernism and empire	
159	Colonial writers in London	
160	Modernist women writers	
161	Virginia Woolf and the Politics of Reading	
162	Mapping Modernism	
163	Reading Poetry	
164	Text, Culture, Theory: London 1950-1950	
165	Colonial Women Writers	
166	World cinema post-1945	
167	Queer cinemas	
168	Film theory, especially issues of aesthetics and politics	
169	Comparative European cinemas	
170	Cultures of economic crisis	
171	Film theory	
172	European cinema	
173	World cinema	
174	Queer cinema	
175	Experimental film	
176	Realism and the cinematic image	
177	Feminist film theory	
178	British cinema and popular culture before 1970.	
179	Silent cinema.	
180	Film adaptation and cross media connections.	
181	Musicals.	
182	Film archiving.	
183	Representations of the First World War.	
184	Silent cinema	
185	British cinema	
186	Cinema and war	
187	Hollywood Musicals	
188	Representation of London on film.	
189	German and Austrian identity in transnational contexts, including Anglo-Germanic and US-Germanic relations.	
190	German Theatre, theory and performance, including Shakespeare and Germany.	
191	19th Century realism, popular culture and the rise of the bestseller.	
192	Cultural representations of nationhood in global contexts.	
193	German culture's relationship with global culture	
194	Germany and global literature	
195	Contempotary German culture	
196	Post-1989 film and literature	
197	German politics and culture	
198	How empires shape economy, society, politics, and culture at both their centres and peripheries	
199	How ideas and sensibility have a Weberian long dur�e, and how, reciprocally, material facts - in particular nature, technology, and economy - order culture and feeling	
200	The British Empire (from Tudor expansion to decolonisation), and the impact of imperial expansion on the British isles	
201	French expansion and its impact on economy and society (c. 1500-1850)	
202	The History of the Caribbean, in particular its intellectual life (both elite and �from below�) since 1800	
203	The worlds of the British Empire, 1700-1960	
204	History and memory	
205	Caribbean intellectual history: c.1800 to the present	
206	Advanced skills For modern and world historians	
207	Transnational history	
208	Women and gender in England 1500-1700.	
209	Early modern social history.	
210	History of crime.	
211	History of London.	
212	History of the body.\r�Women�s work in early modern England	
213	Religion and secularization.	
214	Gender and sexuality.	
215	Modern history of London.	
216	Ethnicity and diasporic identities.	
217	Ritual, material cultures and pilgrimage.	
218	Film, visual sources and oral history.	
219	History of London	
220	Modern constructions and experiences of gender identities, ethnicity and sexuality.	
418	Epidemiology.	
221	Interdisciplinary connections between history and other branches of the humanities and social sciences, particularly anthropology, cultural geography, theology and sociology	
222	Undertaking PhD entitled 'Deconstructing Westminster: a four nations history of the Irish Home Rule crisis, c.1886-1893'	
223	The material and visual culture of medicine and science since the eighteenth century	
224	The history of expertise	
225	Science, the state and the public in historical perspective	
226	Performance and commodification in medicine and science	
227	Anglo-Saxon England and its neighbours	
228	Earlier medieval economic and social history	
229	Coinage and monetary history	
230	Charters and documentary culture	
231	Australian history and the Australian community in Britain	
232	The history of children and young people	
233	Urban history (particularly 1850 to present) and the production of space	
234	Social and cultural history	
235	The history of experience	
236	Interdisciplinary history, especially links between history and geography	
237	The use of visual evidence in historical research	
238	Sources on Australian history	
239	Approaches to the history of children and	
240	hildhood	
241	Approaches to urban history	
242	Experience of modernity in London, Melbourne, New York and Paris, 1870-1929	
243	History of Australia since 1788	
244	Crime and punishment	
245	Colonial and postcolonial encounters with the metropole	
246	Intellectual history of early modern Europe	
247	Jews and Judaism	
248	The aesthetics and politics of capitalism, particularly as it relates to violence.	
249	London�s post-1945 cultural history.	
250	20th Century Irish literature, culture and politics	
251	Historical urban geography (especially 19C London and Paris).	
252	Street music.	
253	Politics of public space.	
254	Melodrama	
255	19th-century opera	
256	Critical theory	
257	Music in 19th-century London	
258	Music techniques,	
259	Nineteenth-century music and society	
260	Film music	
261	Nineteenth-century Italian opera	
262	Introduction to musicology	
263	Opera analysis	
264	Nineteenth-century opera and operatic culture	
265	Music�s role in nineteenth-century urban development.	
266	Opera and material culture.	
267	Musical circulation via networks of communications media and international travel	
268	Nineteenth-century music culture in London	
269	Nineteenth-century opera in Paris	
270	Opera on film	
271	Modern Spanish Literature (18th and 19th centuries).	
272	Spanish political exiles in London.	
273	Cultural history of Spain in the long eighteenth century.	
274	Literature of social observation or literatura de costumbres.	
275	Spanish horror film.	
276	Spanish literature, film and visual arts	
277	Conversing in Spanish	
278	English-to-Spanish translation	
279	Religion, politics, and contemporary governance.	
280	Transnational Muslim networks.	
281	Religious international NGOs	
282	London as a global city of migration.	
283	Religion and secularity in theory and practice.	
284	Religion and Politics	
285	Religion in International Relations	
286	Religion, Politics and Global Media	
287	Jewish thought and practice in early modern and modern times.	
288	Jewish-Christian contacts between Venice and Amsterdam, Berlin and London.	
289	The Enlightenment and its critics.	
290	Jewish and post-colonial perspectives on religion, secularism, and the "Orient".	
291	Jews and multi-religious societies in literature and film	
292	Jewish Interpretations of Tradition	
293	Religious Difference: Jewish, Christian and Other Perspectives	
294	European Jews and the �Orient�.	
295	Texts & Methods in Jewish Studies	
296	Jewish Perspectives on Religion, Culture and Public Space	
297	Buddhist literature, especially sutra literature	
298	Buddhist texts in Sanskrit and Pali	
299	The Samadhiraja Sutra	
300	Buddhist meditation	
301	Traditional Theravada	
302	Buddhism in application	
303	Transmission of Buddhism to the UK	
304	Buddhism	
305	Buddhist Ethics	
306	The Codicology of Buddhist Manuscripts	
307	Social determinants of oral health	
308	Measuring the burden of oral diseases	
309	Income and ethnic inequalities in oral health	
310	Common mental disorders and oral health	
311	The dental workforce	
312	Oral care for vulnerable groups	
313	Promoting oral health and prevention of disease	
314	Clinical research in paediatric dentistry: child management	
315	Prevention of early childhood caries.	
316	Design and testing of interventions to enhance health related behaviour in patients	
317	Social epidemiology: modelling the social determinants of oral health	
318	Cognitive behavioural therapy for dental fear	
319	Undertaking research degree on 'Patient expectations: The relationship between patient expectations of treatment and the outcome of treatment - the case of orthodontics'	
320	Psychology applied to dentistry and medicine	
321	Understanding help-seeking behaviour and promotion of early recognition of cancer	
322	Management of dental anxiety and fear	
323	Applying statistical and machine learning methods to identify predictors, mediators and moderators of treatment success.	
324	Using model-based cluster analysis methods to identify subgroups among psychiatric patients.	
325	Model selection problems	
326	Evolution of social system in primates.	
327	Statistics, mediation and moderation	
328	Model selection	
329	Multiple testing	
330	Structural equation modelling	
331	Scale development	
332	Statistical learning methods for prognostic models and stratified medicine	
333	Social factors in the aetiology and treatment of common mental disorders.	
334	Translating research into clinical practice.	
335	The interface between physical health and severe mental illness.	
336	The management of refractory psychosis.	
337	Tubercolosis	
338	Epidemiology of asthma	
339	Health effects of air pollution.	
340	Statistical methods in epidemiology	
341	Air pollution epidemiology	
342	Aeroallergens	
343	Air pollution monitoring	
344	Air quality network	
345	Low emission zone	
346	Exposure	
347	Personal monitoring	
348	Combining regional and local scale air quality models for applications to epidemiological studies of air quality and health.	
349	Developing UK emissions inventories in 2050	
350	Assessing the air quality impacts of transport strategies in London	
351	Developing hybrid human exposure models which combine air quality models, peoples movements through cities and personal exposure measurements	
352	Assessment of integrated carbon surface fluxes in urban and rural areas.	
353	Development of network data analysis techniques to characterise trends and changes in urban air pollution - particular focus on focused on the source apportionment of PM10 concentrations.	
354	Incorporation of the GUM measurement approaches to uncertainty assessment into source apportionment models.	
355	Particulate matter measurements used to assess concentrations for statutory regulation	
356	Health effects of environmental stressors, mainly outdoor air pollution	
357	Free radical and antioxidant biochemistry in relation to human diseases	
358	Mechanism(s) of air pollution-induced lung injury	
359	Scientific communicator, disseminating key research outcomes and findings on the health effects of air pollution through the preparation of a wide range of written material.	
360	Human lung	
361	Wood smoke	
362	Diesel exhaust	
363	Oxidative potential	
364	How breathing muscles work in healthy people and adults with cystic fibrosis.	
365	Severe breathlessness.	
366	Patient and treatment related factors that affect the survival of cancer patients	
367	Cancer epidemiology	
368	Health services research	
369	Population health	
370	Cancer inequalities	
371	Patient experience	
372	Palliative care and medical humanities	
373	Educational value and ethics of medical student electives	
374	Health partnerships for research capacity building	
375	The impact of volunteering within health links on UK health professionals.	
376	Palliative care	
377	Breathlessness in COPD and cancer patients	
378	Communication between health professionals and patients in clinical encounters, and how that interaction shapes the experience for patients and their families	
379	Communication in Palliative Care, Obstetrics, and Surgical specialties, in inpatient, outpatient and community settings.	
380	Questionnaire design	
381	Qualitative methods	
382	The ethics of communication and choice	
383	Sexuality and gender variance	
384	Management of neuropathic pain and breathlessness	
385	Methods of evaluation of hospital palliative care teams.	
386	Routine data based palliative care and end of life care research	
387	Design and evaluation of complex interventions in palliative care and end of life care populations	
388	Applied statistical methodology in palliative care and end of life care research	
389	Development and Ppychometric evaluations of outcome measures in palliative care and end of life care	
390	Research methods and statistics in palliative care	
391	Applying epidemiology in palliative care	
392	Preferences and decision-making	
393	Place of death	
394	Epidemiology	
395	Symptom assessment	
396	Evaluation of palliative care	
397	Effectiveness and cost-effectiveness	
398	Cancer care	
399	Home care	
400	Public education about end of life care issues	
401	Bereavement	
402	Cross-national research.	
403	Service organisation and policy in palliative care	
404	Service development and management in palliative care	
405	Adjustment to serious negative life events, behaviour change, and facilitating informed choice	
406	Palliative care: non-cancer (heart failure, HIV)	
407	Informal carers	
408	Complex interventions	
409	Sub-Saharan Africa	
410	Global Health	
411	Audit and quality improvement	
412	Mixed methods	
413	Intervention development and testing.	
414	Psychosocial, cultural, ethical and spiritual issues in palliative care	
415	Service policy and development in palliative care	
416	Quality of life and outcome measurements.	
417	Evaluation of palliative care especially of new services and interventions.	
419	Clinical audit.effectiveness.	
420	Psychosocial factors and care.	
421	Symptom assessment.	
422	Cachexia/anorexia.	
423	Elderly care.	
424	Biology and management of symptoms in advanced disease	
425	Applying epidemiology in palliative care.	
426	End of life care	
427	End stage kidney disease	
428	Renal palliative care	
429	Non-cancer palliative care	
430	Complexity and casemix	
431	Costs and cost-effectiveness of palliative and end of life care: research ethics, outcome measures and tool validation	
432	Communication, complexity and costs in palliative care	
433	Research ethics	
434	Clinical ethics	
435	Evidence-based medicine	
436	Clinical pathways	
437	Developing guidelines	
438	Molecular basis of metal uptake and toxicity	
439	Regulation of the stress response	
440	Undertaking PhD on South London Diabetes Ethnicity Phenotyping Study	
441	Cognitive impairment, stroke and dementia	
442	Diagnostic tests, predictive models and decision trees	
443	Inverse problem, state space models and their applications to medical research	
444	Relationships between transport systems and health	
445	Questions of how evidence travels from one setting to another	
446	Methodological development and health professions	
447	Epidemiology as applied to public health and health services research	
448	Design and analysis of studies with clustered data	
449	Large datasets and electronic patient records	
450	Obesity, chronic disease prevention, ageing and antimicrobial utilisation	
451	Anthropology of health and illness	
452	Stroke	
453	Chronic disease	
454	Bacterial disease pathogenesis	
455	Staphylococcus aureus	
456	Intensive care unit infections	
457	Healthcare-associated infections	
458	Human immunodeficiency virus	
459	Viral quasi-species evolution	
460	Human papillomaviruses	
461	Infectious diseases biobank	
462	Understanding how patients make decisions about whether or not to use medicines they have been prescribed to manage their chronic condition	
463	Healthcare quality	
464	Using electronic health records to study quality and outcomes in cardiovascular conditions	
465	The role of diet in modulating insulin sensitivity and cardiovascular risk	
466	The pathophysiology of type 2 diabetes development in black African and Caribbean communities and the impact of environmental influences on this development.	
467	�World Food Study�,investigating the nutritional intake and role of traditional foods in the diets of people of West African and Caribbean origin in the UK and in Ghana.	
468	Social and ethnic inequalities in health	
469	Child and adolescent health	
470	Implementation Science	
471	Life course studies	
472	Global health	
473	Biological functions of zinc	
474	Toxicology of environmental pollutants	
475	Impact of socio-economic deprivation on quality of life and health care access in patients with COPD as well as the role of psychosocial factors within that relationship	
476	Antiphospholipid (Hughes) syndrome, systemic lupus erythematosus and rheumatoid arthritis	
477	Psychological approaches such as motivational interviewing and provision of social support in improving patient-physician communication and patients	
478	quality of life, self-management and coping skills in rheumatic diseases	
479	Health psychology	
480	Psychoneuroimmunology	
481	Public and patient involvement in research	
482	Severe phenotypes of asthma	
483	Environmental influences on asthma control	
484	Mechanisms of airways remodelling in asthma	
485	Allergen immunotherapy	
486	Respiratory muscle physiology	
487	Biologic therapies	
488	Clinical trials (including early phase)	
489	Inflammatory arthritis	
490	Sarcoidosis	
491	Applied medical sociology and health service research in musculoskeletal long-term conditions	
492	Psycho-social impact and the physical and mental interface in long-term conditions	
493	Evaluation of non-medicinal interventions, e.g. psychology, physiotherapy	
494	Patient generated outcome measures	
495	Service user involvement in research and health system strengthening in low and middle income countries	
496	Medical under- and postgraduate education	
497	Obstetrics	
498	International criminal law	
499	Transitional justice	
500	Compatibility of plural responses to violence	
501	Criminal justice in post-genocide Rwanda	
502	Criminal law	
503	Next generation mobile networks	
504	IP-based radio access networks	
505	Mobile internet	
506	Internet of things	
507	Cognitive machine-to-machine communications	
508	Quality of service architectures	
509	Wireless queueing	
510	Delay tolerant networking for cellular networks	
511	Routing in multi hop wireless networks	
512	Energy efficient resource management	
513	Scheduling, routing, admission control algorithms for wireless multi (or single) hop wireless networks	
514	Network optimisation, mobility management, all-IP wireless networks	
515	Mathematical programming (linear and/or integer programming), heuristic and greedy algorithms	
516	Network virtualization	
517	Dynamic spectrum access and cognitive radio	
518	Green mobile and wireless communications	
519	Cross-layer optimisation	
520	Software defined radio and mobile terminal reconfiguration	
521	Network traffic modelling	
522	End-to-end and network-assisted software download methodologies	
523	End-to-end and network-assisted reliable multicast	
524	Beyond 3G mobile communications systems	
525	Wired and wireless internet	
526	Service-oriented architecture	
527	Distributed software engineering	
528	Global software development	
529	Agent-based software engineering and model-driven development	
530	Health informatics	
531	Critical care nursing	
532	Critical care competencies	
533	Older person care	
534	Care home sector	
535	Nursing workforce.	
536	Chronic disease management	
537	Initiatives for improving the delivery of health and social care	
538	e-health methods to support diabetes care	
539	Workforce	
540	New and extended roles	
541	Recruitment and retention;	
542	Work environments	
543	International migration	
544	Staff wellbeing and links to patient experience	
545	Careers of nurses, in particular job satisfaction and retention	
546	Longitudinal research.	
547	People living with advanced frailty in old age	
548	Participatory action research	
549	Narrative research	
550	Mixed method research	
551	Complex intervention development.	
552	Infectious diseases and immunology	
553	Systematic review and meta-analysis.	
554	Chronic diseases/long term care especially outside hospitals	
555	Outcomes of nursing contributions for patients	
556	Staff and services	
557	Nurse prescribing	
558	Telecare	
559	Nursing in the Middle East and China.	
560	Mental health nursing and care	
561	Inter-professional working amongst health and social care professionals	
562	Workforce related education and training for health and social care delivery	
563	Genetic risk communication within families,  and between health professionals and families.	
564	Family functioning and coping when affected or at risk from an inherited genetic condition.	
565	Development of tools to measure the effectiveness of genetic risk communication and family functioning	
566	The Second World War	
567	British history during the Twentieth Century (imperial, military and diplomatic)	
568	Professional military education	
569	Contemporary security issues in the Horn of Africa and Eastern Africa	
570	British Commonwealth and the War in Africa (1940-43)	
571	Identities and inequalities of �race�, gender and social class within compulsory and post-compulsory education	
572	Undertaking PhD on 'Investigating the ways in which family culture shapes student engagement in learning in an outdoor context: a study of second-generation West African pupils'	
573	Science education	
574	Learning and engagement in early years, families and school groups	
575	History and development of English curriculum, pedagogy and assessment	
576	Subject associations	
577	Teachers' professional life histories	
578	Outdoor teaching	
579	Pre-service and in-service professional development	
580	Psychology and learning	
581	Classroom pedagogy	
582	Content and language-integrated curriculum development	
583	Language assessment	
584	Language policy	
585	English language & communication	
586	Language, ethnicity & education	
587	Ethnographic and interactional discourse analysis	
588	Anthropology, sociology and cultural studies	
589	Language and literacy	
590	Ethnographic methods	
591	Analysing discourse data	
592	Ethnography, language & communication	
593	Language contact, bilingualism and black Englishes	
594	Language and power	
595	Researching linguistic diversity	
596	Language, identity and culture	
597	Analysing spoken discourse	
598	Language, culture and society	
599	International political economy and the Middle East	
600	European political economy	
601	The crisis of the Euro-Zone	
602	The City of London and the British financial sector	
603	Italy and the EMU	
604	Urban and cultural geography with regards to issues of identity and representation	
605	Queer urban culture	
606	Social identities in relation to religion, race, gender and sexuality	
607	Cinema and the city	
608	Geographies of consumption and production	
609	Chinese investment in Africa	
610	Clothing, fashion and textile industries	
611	Critical development studies	
612	Economic and political change in Southern Africa	
613	Second-hand geographies	
614	Education in the city	
615	Social mixing	
616	Gentrification	
617	Regeneration of East London	
618	Social class in British society	
619	Aquatic ecology	
620	Rivers	
621	Estuaries	
622	Invertebrates	
623	Fish	
624	Ecosystem function	
625	Biodiversity	
626	Environmental managment	
627	Postcolonial geopolitics	
628	Decolonisation and the �modern	
629	Commonwealth	
630	The historical and contemporary politics of development	
631	Race and migration	
632	Modern architecture and planning	
633	Volunteering, heritage and enthusiasm	
634	Colonial and postcolonial Zambia and Zimbabwe	
635	Undertaking PhD on 'Applications of microwave remote sensing to wildfire danger modelling'	
636	Undertaking PhD on 'Nature as Diplomat: Scale, Agency, and Purpose in Environmental Peacebuilding'	
637	Food	
638	Water	
639	Environmental peacebuilding	
640	Environmental conflict and cooperation	
641	International diplomacy	
642	Middle East and North Africa	
643	Biogeomorphology and ecohydrology	
644	Urban ecosystems and ecological engineering	
645	Reconciliation ecology	
646	Warfare ecology	
647	Invasive species	
648	Undertaking PhD on 'A historical geography of educational power: Comparing fields and circuits of education in Sheffield and London'	
649	Health and wellbeing	
650	Consumption	
651	Lifestyle	
652	Political economy of behavioural risk	
653	Urban political ecology	
654	Critical global health	
655	Urban health	
656	Water politics	
657	Marxist thought	
658	Radical geography	
659	Natural and environmental hazards (wildfires, earthquakes, landslides, floods tornadoes, multi-hazard interactions and heavy-metal contamination)	
660	Observational data: gathering, analysis, exploration and visualisation	
661	Synthetic data	
662	Time-series analyses and mathematical models	
663	Tools from the complexity sciences: fractals, self-organized behaviour, cellular-automata models	
664	Comparison of models with data in the broad environmental sciences	
665	Communciations of science to stakeholders	
666	Agent-based modelling of geographical systems	
667	Spatial modelling of ecological succession-disturbance dynamics	
668	Socio-ecological modelling for natural resource management	
669	Epistemology of modelling and simulation	
670	Disaster risk reduction	
671	Adaptation to climate change	
672	Sustainable urbanisation	
673	Social and economic networks	
674	Firm location, innovation, and growth	
675	Impact of embedded, networked technologies on urban environments ('smart cities')	
676	'Big Data' from digitally-enabled communications and transportation networks as a platform for research	
677	Houseing and socioeconomic trends	
678	Undertaking PhD on 'Multi-religious Publics: A Comparative Study of the Dialectics between the Secular and the Sacred in Hackney (London) and Neukoelln (Berlin)'	
679	Spatial analysis & modelling	
680	GIScience & geo-visualisation	
681	Urban & regional analysis	
682	Big and open data & neo-geography	
683	Biomass burning emissions from Australian savanna and UK moorland ecosystems	
684	Open-path and solar occultation FTIR field spectroscopy	
685	Automatic classification of cloud cover and cloud type from LIDAR ceilometry	
686	The influence of clouds and aerosols on atmospheric transmissivity	
687	Using remote sensing and fire spread modelling to improve wildfire training within the UK Fire and Rescue Services	
688	Earth observation	
689	Remote sensing	
690	Global biomass burning	
691	Atmospheric pollution	
692	Carbon cycle	
693	Volcanology	
694	Spatial data mining	
695	Spatiotemporal visualization	
696	Complex network analysis	
697	Urban and transport planning	
698	Sociology of medical knowledge	
699	Factors affecting clinicians	
700	behaviour	
701	Financial history	
702	Business history	
703	Modern economic history	
704	Film and history	
705	Financial crises and history	
706	Organisational studie	
707	Public services management	
708	Healthcare	
709	Universities	
710	Organisational change	
711	Professionals	
712	Organisation and management of the public sector	
713	Strategy, organisation and change in healthcare	
714	Innovation	
715	Social innovation	
716	Social entrepreneurship	
717	Organisation change	
718	Interaction and experience of museums	
719	Cultural organisations	
720	Shopping environments	
721	Healthcare interaction	
722	Social media	
723	Ethnomethodology	
724	Ethnography	
725	Video analysis of interaction	
726	Undertaking PhD on redevelopment of London�s Docklands and the emergence of Canary Wharf in the 1980s	
727	Homelessness	
728	Intelligence analysis and methodologies, especially relating to open-source intelligence	
729	National security in comparative and historical perspective	
730	Patterns of national security co-ordination at the centre of government	
731	National security policy-making and preparation for government by political parties when in opposition	
732	Biomedical and health R&D policy	
733	Research impact assessment	
734	Use of research and evidence in policy and decision making	
735	Labour-migration, sociology and economics	
736	Ageing, family dynamics, migration and long term care.	
737	Homelessness and social exclusion	
738	Delivery of health care to people who are homeless	
739	Interprofessional and interagency working	
740	New models and roles in delivering health and social care	
741	Gambling-related harm	
742	Adult safeguarding	
743	Older people and care homes	
744	Interprofessional working	
745	Professional migration	
746	Barriers and facilitators to accessing services for people with dementia from different ethnic groups	
747	Transitioning from 'memory problems' to 'having dementia'	
748	Change and continuity in quality of life with dementia	
749	Decision-making in housing with care	
750	End of life care in dementia	
751	Mental health services and population research	
752	Qualitative research methods	
753	Intelligence studies	
754	Cold War history	
755	The Cuban Missile Crisis	
756	State security	
757	Joint Intelligence Committee	
758	Intelligence	
759	Nuclear proliferation and non-proliferation	
760	Proliferation behaviour\rOpen source intelligence	
761	Nuclear security education	
762	Riots and public disorder	
763	Armchair intelligence: open sources and online investigation	
764	Current issues in science and security	
765	Proliferation and international security	
766	The nature of riots	
767	Homegrown radicalisation and counter-radicalisation in Western Europe and North America	
\.


--
-- Name: kaldb_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_interest_id_seq', 767, true);


--
-- Data for Name: kaldb_interest_related_interests; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_interest_related_interests (id, from_interest_id, to_interest_id) FROM stdin;
\.


--
-- Name: kaldb_interest_related_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_interest_related_interests_id_seq', 1, false);


--
-- Data for Name: kaldb_jobposition; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_jobposition (id, name) FROM stdin;
1	Lecturer
2	Professor
3	Senior Lecturer
4	Research Student
5	Reader
6	Leverhulme Early Career Research Fellow
7	Rhodes Professor
8	Teaching Fellow
9	Research Fellow
10	Thurston Dart Professor
11	British Academy Postdoctoral Research Fellow
12	Senior Research Fellow
13	Clinical Senior Lecturer
14	Post-Doctoral Research Associate and Dental Public Health Tutor
15	Newland Pedley Professor of Oral Health Strategy and Honorary Consultant
16	Professor of and Honorary Consultant
17	Consultant
18	Honorary Research Fellow
19	Air Quality Analyst
20	Research Fellow and Deputy Air Quality Monitoring Manager
21	Honorary Research Associate
22	MSc Academic Lead
23	Research Associate
24	Consultant and Honorary Senior Lecturer
25	Honorary Fellow
26	BuildCARE PhD Training Fellowship (non-clinical)
27	
28	Research Lead
29	Epidemiologist
30	Chair
31	National Institute for Health Research In-Practice Fellow
32	Non-clinical Senior Lecturer
33	Clinical Senior Lecturer at Guy's & St Thomas
34	Academic Public Health Doctor
35	Trauma Consultant at King's College Hospital
36	Clinical Scientist at King's College Hospital
37	Professor and Director
38	Senior Lecturer and Honorary Consultant
39	Honorary Professor
40	Executive Dean
41	Doctoral Research Fellow
42	Visiting Research Fellow
43	Principal Research Fellow (Chair)
\.


--
-- Name: kaldb_jobposition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_jobposition_id_seq', 43, true);


--
-- Data for Name: kaldb_jobrole; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_jobrole (id, name) FROM stdin;
1	Classical Art & Archaeology
2	Ancient History
3	Archaeology
4	Greek Literature and Thought
5	Comparative Literature
6	Cultural and Creative Industries
7	Creative and Cultural Industries
8	Culture, Media and Creative Industries
9	Creativity, Arts & Cultural Management
10	Arts and Cultural Management
11	Shakespeare Studies
12	Modern Literature
13	American and English Literature
14	Eighteenth-Century Literature and Culture
15	Irish Literature
16	Early Modern English Literature (Drama)
17	Theatre
18	Twentieth-Century Literature
19	Film Studies
20	German
21	Imperial History
22	Early Modern History
23	Modern British History
24	History of Medicine
25	Medieval British History
26	Australian History
27	European History
28	Liberal Arts
29	Music
30	Modern Spanish Studies
31	Political Science and Religion
32	Jewish Studies
33	Buddhist Studies
34	Dental Public Health
35	Paediatric Dentistry
36	Psychology as Applied to Dentistry amd Honorary Consultant Health Psychologist
37	Health Psychology
38	Biostatistics
39	Psychopharmacology and Physical Health 
40	Respiratory Medicine at Guy's and St Thomas' NHS Foundation Trus
41	Air Quality Science
42	Air Quality Modelling
43	Air Management
44	Environmental Epidemiology
45	Environmental Health and Director
46	Respiratory Toxicology
47	Cancer Epidemiology
48	Cancer and Public Health
49	Palliative Medicine
50	Statistics and Epidemiology
51	Palliative Care
52	Palliative Care and Director
53	Aquatic Toxicology
54	Emergency Medicine
55	Primary Care
56	Translational Epidemiology
57	Sociology of Health
58	Public Health
59	Social Sciences & Health
60	Clinical Infectious Diseases
61	Virology
62	Medicines Use
63	Nutritional Sciences
64	Social Epidemiology & Nutrition
65	Molecular Ecotoxicology
66	Asthma, Allergy and Immunology
67	Clinical Strategy for King's Health Partners
68	Medical Sociology
69	Women's Health
70	Telecommunications
71	the Centre for Telecommunications Research
72	Computer Science
73	Healthcare Improvement
74	Clinical Diabetes Nursing
75	Adult Nursing
76	Nursing Research
77	the Florence Nightingale Faculty
78	Healthcare Research
79	Conflict and Diplomacy
80	Sociology
81	English Education
82	Science Education
83	Educational Linguistics
84	Applied and Socio-Linguistics
85	International Political Economy
86	Developmental Geography
87	Human Geography
88	Physical and Environmental Geography
89	Cultural and Historical Geography
90	Environment and Development
91	Natural and Environmental Hazards
92	Physical & Quantative Geography
93	Quantative Human Geography
94	Geocomputation and Spatial Analysis
95	Physical & Environmental Geography
96	Earth Observation Science
97	Spatial Analysis
98	Medicine and Sociology
99	Public Services Management
100	Business
101	Applied Social Research
102	Public Policy
103	Intelligence and International Security
\.


--
-- Name: kaldb_jobrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_jobrole_id_seq', 103, true);


--
-- Data for Name: kaldb_outreachcity; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachcity (id, name, country_id) FROM stdin;
\.


--
-- Name: kaldb_outreachcity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachcity_id_seq', 1, false);


--
-- Data for Name: kaldb_outreachcountry; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachcountry (id, name) FROM stdin;
\.


--
-- Name: kaldb_outreachcountry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachcountry_id_seq', 1, false);


--
-- Data for Name: kaldb_outreachevent; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachevent (id, name, description, frequency_id, location_id, medium_id, researcher_id) FROM stdin;
58	Awarded OBE for services to nursing and healthcare		\N	\N	\N	124
59	Has appeared on Radio 3 and 4		\N	\N	\N	135
60	Secretary of Gilbert Murray Trust Classical Committee.		\N	\N	\N	138
61	Was the Academic Consultant on the Almeida Theatre�s Odyssey in 2015, and also advised on Teatro Vivo�s production of that same epic at the Albany Theatre		\N	\N	\N	139
62	Has taken part in post-show discussion panels at Southwark Playhouse and at the Vintage Theatre Collective in Chicago		\N	\N	\N	139
63	Has curated a number of poetry events		\N	\N	\N	139
64	Has made various appearances in broadcast and print media, including BBC Radio 4 Thinking Allowed (April 2013), Sky News & Channel 5 News, Korean television (KBS), BBC Radio Wales and Metro newspaper.		\N	\N	\N	140
65	Has previously worked with cultural and public sector partners (e.g. Fuel Theatre; London Music Masters and Mulberry School for Girls).		\N	\N	\N	144
66	Previously curated an exhibition at the regional museum of Sm�land in Sweden		\N	\N	\N	147
67	Has written for Indian newspapers before		\N	\N	\N	147
68	As part of the Shakespeare400 season, she has co-edited a collection of poems by contemporary writers responding to Shakespeare�s Sonnets (to be published by Arden in January 2016), and is helping to organize a major exhibition with the National Archives of Shakespeare-related documents		\N	\N	\N	148
69	Trustee of Keats-Shelley Memorial Association		\N	\N	\N	151
70	Has worked extensively with theatre organisations such as Shakespeare�s Globe.		\N	\N	\N	155
71	Member of the Architecture Research Group at Shakespeare�s Globe.		\N	\N	\N	155
72	Member of steering group of London Renaissance Seminar.		\N	\N	\N	155
73	Formerly director of Rotherhithe Theatre Workshop		\N	\N	\N	157
74	Director of the Performance Foundation		\N	\N	\N	157
75	Co-organised public events at the BFI, London Lesbian and Gay Film Festival, and CineCity: Brighton Film Festival		\N	\N	\N	159
76	Served on the jury of the Mediterranean Film Festival in Croatia		\N	\N	\N	159
77	Programmed a film series that screened at the Pacific Film Archive in Berkeley, CA and Anthology Film Archives in New York		\N	\N	\N	159
78	Has appeared on BBC4 television documentaries including The Cinema Show: The Forgotten Decade, and Glamour's Golden Age: Hooked on Hollywood.		\N	\N	\N	160
79	Previous outreach work includes speaking as part of the Southbank�s The Rest is Noise season.		\N	\N	\N	161
80	Executive committee member of Association for German Studies.		\N	\N	\N	161
81	Member of Advisory Board of Institute of Germanic and Romance Studies.		\N	\N	\N	161
82	Advisor to European project A Soul for Europe.		\N	\N	\N	161
83	Has appeared on BBC Radio 3 and 4		\N	\N	\N	162
84	Has written opinion pieces for The Guardian		\N	\N	\N	162
85	Has acted as historical consultant for the BBC and the Young Vic.		\N	\N	\N	164
86	Has frequently collaborated with museums and collections, including consultancy for the Wellcome Collection�s �Exquisite Bodies		\N	\N	\N	166
87	exhibition, and content development for the Science Museum�s website �Brought to Life�, and for the Hunterian Museum�s showcase on �Model Anatomy�		\N	\N	\N	166
88	Involved through the K-Link Widening Participation programme with history students at Haberdashers' Aske's Hatcham College in Lewisham.		\N	\N	\N	168
89	Has written for the Irish Times and Belfast�s monthly newspaper The Vacuum.		\N	\N	\N	170
90	In 2016, he was involved in two public engagement projects relating to the 1996 Manchester and London Docklands IRA bombings.		\N	\N	\N	170
91	Writes regular reviews for Opera magazine.		\N	\N	\N	172
92	Written numerous programme books for the major opera houses (Royal Opera, ENO, Glyndebourne).		\N	\N	\N	172
93	Appears often on BBC Radio 3.		\N	\N	\N	172
94	Repertory Consultant for the recording company Opera Rara.		\N	\N	\N	172
95	Frequently writes programme notes and gives pre-performance talks for major opera houses and venues including Barbican, Glyndebourne, English National Opera, Royal Festival Hall and Royal Opera House.		\N	\N	\N	173
96	Written articles and reviews for Opera magazine.		\N	\N	\N	173
97	Acted as consultant for a new website for 9-18-year olds produced by Glyndebourne to support its Performances for Schools programme.		\N	\N	\N	173
98	Regular invited guest on BBC Radio 3.		\N	\N	\N	173
99	Provided advice to print and audio-visual media on issues such as Anglo-Spanish relations or the work of Francisco de Goya.		\N	\N	\N	174
100	Interviewed for the feature documentary Why Horror? (2014).		\N	\N	\N	174
101	Awarded MBE for services to oral health		\N	\N	\N	180
102	Lead consultant for National Psychosis Service.		\N	\N	\N	187
103	Works with local authorities on air quality monitoring issues		\N	\N	\N	191
104	Consultant Physiotherapist in Chronic Respiratory Disease at King�s College Hospital.		\N	\N	\N	200
105	Her work has been referred in several national policy documents in the UK and Portugal and debated at the House of Lords		\N	\N	\N	209
106	Several independent organisations have used her work to highlight issues surrounding place and care of death (World Health Organization, Nuffield Trust, King�s Fund, Calouste Gulbenkian Foundation and National Palliative Care Associations)		\N	\N	\N	209
107	Her studies have also reached the public arena via press coverage (by the BBC, NPR, Guardian and Huffington Post among others)		\N	\N	\N	209
108	Executive member of the Association for Palliative Medicine.		\N	\N	\N	212
109	Chair of the European Association of Palliative Care Scientific Committee for the 2015 Conference.		\N	\N	\N	212
110	Member of the Commissioned Research Board of NIHR Health Services Development and Research Board.		\N	\N	\N	212
111	Fellow of the Academy of Medical Sciences.		\N	\N	\N	212
112	Developed Palliative Care Outcome Scale which is used across the world.		\N	\N	\N	212
113	Pioneered the move for Palliative Care to extend beyond Cancer with extensive research into non-cancer conditions.		\N	\N	\N	212
114	Awarded Order of the British Empire.		\N	\N	\N	212
115	Has been interviewed by BBC, Rai, Al jezeera, La Stampa, CNN		\N	\N	\N	258
116	Has written opinion pieces for Independent and Cap Ex		\N	\N	\N	284
117	Researcher in residence at 10 Downing Street		\N	\N	\N	284
118	Trustee of the Centre for Policy on Ageing		\N	\N	\N	290
119	Patron of the Greater London Forum of Older People.		\N	\N	\N	290
\.


--
-- Name: kaldb_outreachevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachevent_id_seq', 119, true);


--
-- Data for Name: kaldb_outreachfrequency; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachfrequency (id, name) FROM stdin;
\.


--
-- Name: kaldb_outreachfrequency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachfrequency_id_seq', 1, false);


--
-- Data for Name: kaldb_outreachlocation; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachlocation (id, coord_lat, coord_long, city_id, country_id) FROM stdin;
\.


--
-- Name: kaldb_outreachlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachlocation_id_seq', 1, false);


--
-- Data for Name: kaldb_outreachmedium; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_outreachmedium (id, name) FROM stdin;
\.


--
-- Name: kaldb_outreachmedium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_outreachmedium_id_seq', 1, false);


--
-- Data for Name: kaldb_researcher; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_researcher (id, first_name, middle_name, last_name, role_id, email, phone, can_email, can_phone, pure_url, profile_url, other_url, position_id, title_id, department_id) FROM stdin;
178	Eduardo		Bernabe	34	eduardo.bernabe@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/eduardo-bernabe(23163b7c-53eb-4181-8a01-0971ed73a3e8).html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Division-Staff/Eduardo-Bernab%C3%A9.aspx		13	\N	58
179	Elsa	K.	Delgado-Angulo	\N			t	t	https://kclpure.kcl.ac.uk/portal/en/persons/elsa-delgado-angulo(ad42a5c8-2e8d-4539-9bac-6475d3905b56).html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Research-Areas/Dental-Public-Health.aspx		14	\N	58
180	Jennifer		Gallagher	34	jenny.gallagher@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/jenny-gallagher(f10929b2-cd5d-4d45-9bb9-705158805dbb).html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Division-Staff/Jennifer-Gallagher.aspx		15	\N	58
181	Marie	Therese	Hosey	35	m.t.hosey@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/m.t.hosey.html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Division-Staff/Marie-Therese-Hosey.aspx		16	\N	58
182	Tim		Newton	36	tim.newton@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/tim-newton(9f734418-de18-4c63-b01f-e9af887d1adf).html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Division-Staff/Tim-Newton.aspx		2	\N	58
183	Mark		Sayers	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/publications/how-patient-and-carer-expectations-of-orthodontic-treatment-vary-with-ethnicity(eab7fa57-ac94-48d4-90d1-d8b58e235033).html	N/A		4	\N	58
184	Suzanne		Scott	37	suzanne.scott@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/suzanne-scott(b41ade98-a521-42d3-b7bc-967fc2f1e47c).html	http://www.kcl.ac.uk/dentistry/research/divisions/population/Division-Staff/Suzanne-Scott.aspx		3	\N	58
238	Natasha	S.	Khan	\N	natasha.s.khan@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/natasha.s.khan.html	N/A		36	\N	79
239	Sofia		Georgopoulou	\N	sofia.1.georgopoulou@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/sofia-georgopoulou(06404c1a-6ccb-4269-95bc-76efac9a3b6b)/biography.html	http://www.kcl.ac.uk/lsm/research/divisions/diiid/departments/rheumatology/research/clinical/currentstaff.aspx		9	\N	80
240	Chris		Corrigan	66	chris.corrigan@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/christopher-corrigan(6242626b-db61-406b-90f6-2d842bd03173).html	N/A		2	\N	81
241	John		Moxham	67	john.moxham@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/john.moxham.html	N/A		37	\N	81
242	James		Galloway	\N	james.galloway@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/james-galloway(d4ca396d-17d3-4a77-9931-c85804cf2d3e).html	https://www.kch.nhs.uk/profiles/47184/james-galloway		38	\N	82
243	Heidi		Lempp	68	heidi.lempp@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/heidi-lempp(096c284e-bdcd-4411-b3a2-f40d32d20512).html	N/A		3	\N	82
244	Susan		Bewley	69	susan.bewley@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/susan-bewley(c7f46fad-501c-401e-a101-a2af72fde35f).html	N/A		2	\N	83
246	Hamid		Aghvami	70	hamid.aghvami@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/hamid-aghvami(d3264925-f2af-447f-a4c7-15a815c3187c).html	http://www.kcl.ac.uk/nms/depts/informatics/people/atoz/aghvamih.aspx		2	\N	85
247	Vasilis		Friderikos	71	vasilis.friderikos@kcl.ac.uk		t	t	http://www.kcl.ac.uk/nms/depts/informatics/people/atoz/friderikosv.aspx	http://www.kcl.ac.uk/nms/depts/informatics/people/atoz/friderikosv.aspx		5	\N	85
248	Oliver		Holland	71	oliver.holland@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/oliver-holland(6977a008-63d6-4a98-9d79-1b2e2b807206).html	http://www.kcl.ac.uk/nms/depts/informatics/people/atoz/hollando.aspx		9	\N	85
249	Adel		Taweel	72	adel.taweel@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/adel-taweel(a26765a5-c1dc-4f64-8b40-13d50be2d9db)/publications.html?query=london	http://www.kcl.ac.uk/nms/depts/informatics/people/atoz/taweela.aspx		1	\N	85
280	Richard		Roberts	\N	richard.roberts@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/richard-roberts(df3e416a-bfff-42d5-8923-5f3a98754dfe)/publications.html	http://www.kcl.ac.uk/sspp/departments/icbh/people/roberts/index.aspx		2	\N	91
281	Ewan		Ferlie	99	ewan.ferlie@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/ewan-ferlie(99e3ee0d-66f5-4788-b066-9d9d942f6168).html	http://www.kcl.ac.uk/sspp/departments/management/people/Academics/ferlie.aspx		2	\N	92
282	Susan		Trenholm	100	susan.trenholm@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/susan.trenholm.html	http://www.kcl.ac.uk/sspp/departments/management/people/Academics/Trenholm.aspx		3	\N	92
283	Dirk		Von Lehn	\N	dirk.vom_lehn@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/dirk.vom_lehn.html	http://www.kcl.ac.uk/sspp/departments/management/people/Academics/vomlehn.aspx		3	\N	92
284	Jack		Brown	\N	j.w.brown@qmul.ac.uk		t	t	N/A	http://www.politics.qmul.ac.uk/research/degrees/postgraduateresearch/Brown_J_Docklands/111213.html		42	\N	93
285	Maureen		Crane	101	maureen_ann.crane@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/maureen-crane(a5434b5a-d6a7-498b-9157-aef2d408c67a).html	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/crane/index.aspx		5	\N	93
286	Joe		Devanny	\N	joseph.devanny@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/joe-devanny(c7c78146-742e-4f7d-8b29-269cf9a36474).html	http://www.kcl.ac.uk/sspp/policy-institute/icsa/Staff/jdevanny.aspx		9	\N	93
287	Jonathan		Grant	102	jonathan.grant@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/jonathan-grant(708499b2-7a70-49da-9896-410c79bc3bec).html	http://www.kcl.ac.uk/sspp/policy-institute/people/staff/grant.aspx		2	\N	93
288	Shereen		Hussein	\N	shereen.hussein@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/publications/active-ageing(7f269a03-6565-4217-ab09-f32eec128dd4).html	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/hussein/index.aspx		43	\N	93
289	Louise		Joly	\N	louise.m.joly@kcl.ac.uk		t	t	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/joly/index.aspx	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/joly/index.aspx		9	\N	93
290	Jill		Manthorpe	\N	jill.manthorpe@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jill.manthorpe.html	http://www.kcl.ac.uk/sspp/policy-Institute/scwru/people/manthorpe/index.aspx		2	\N	93
291	Caroline		Norrie	\N	caroline.norrie@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/caroline-norrie(8db53dae-1638-4a72-8b91-df9d2ec94481).html	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/norrie/index.aspx		9	\N	93
292	Kritika		Samsi	\N	kritika.1.samsi@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/kritika-samsi(044b5819-014b-4ba1-9147-762f399399d0).html	http://www.kcl.ac.uk/sspp/policy-institute/scwru/people/samsi/index.aspx		9	\N	93
293	Huw		Dylan	103	huw.dylan@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/huw-dylan(31d2035c-5f45-48db-a330-025fcc3a6edc).html	http://www.kcl.ac.uk/sspp/departments/warstudies/people/lecturers/dylan.aspx		1	\N	94
185	Daniel		Stahl	38	daniel.r.stahl@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/daniel-stahl(1b8d9e0f-fb2e-426e-a1a9-98e6a3c356d5).html	N/A		5	\N	59
186	Thomas		Jamieson-Craig	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/thomas-jamiesoncraig(5f878e25-cafa-450e-a49c-8ab861714a79).html	N/A		2	\N	60
187	Fiona		Gaugharan	39	N/A		t	t	https://kclpure.kcl.ac.uk/portal/fiona.p.gaughran.html	N/A		5	\N	61
245	Nicola		Palmer	\N	nicola.palmer@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/nicola-palmer(3f4a43be-35b7-41d0-9a6c-dc586e388fbd).html	http://www.kcl.ac.uk/law/people/academic/npalmer.aspx		3	\N	84
250	Andrew		Stewart	79	andrew.stewart@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/andrew-stewart(d0704175-834d-4a30-81fa-04d6ab4dc378).html	http://www.kcl.ac.uk/sspp/departments/dsd/people/dsd-a-to-z/stewart.aspx		5	\N	86
251	Louise		Archer	80	louise.archer@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/louise.archer.html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/archerl.aspx		2	\N	87
252	Rachel		Cook	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/rachel-cook(7f691a8a-7eea-4135-bb77-024a87aa8fd5).html	N/A		4	\N	87
253	Jennifer		De Witt	\N	jennifer.dewitt@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jennifer.dewitt.html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/dewittj.aspx		9	\N	87
254	Simon		Gibbons	81	simon.gibbons@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/simon.gibbons.html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/Gibbons,-Dr-Simon.aspx		3	\N	87
255	Melissa		Glackin	82	melissa.2.glackin@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/melissa-glackin(8a4a637b-9ecc-455f-8a46-d9414d60fd7b).html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/glackinm.aspx		1	\N	87
256	Constant		Leung	83	constant.leung@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/constant-leung(cecc4a05-3b7a-49a6-b326-306b5cd3e18b).html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/leungc.aspx		2	\N	87
257	Ben		Rampton	84	ben.rampton@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ben.rampton.html	http://www.kcl.ac.uk/sspp/departments/education/people/academic/ramptonb.aspx		2	\N	87
258	Leila	Simona	Talani	85	leila.talani@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/leila.talani.html	http://www.kcl.ac.uk/sspp/departments/european-studies/people/staff/academic/talani/index.aspx		2	\N	88
259	Johan		Andersson	\N	johan.andersson@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/johan-andersson(d32f0b44-de40-4e8b-908c-808e4cae796d).html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/andersson/index.aspx		1	\N	89
260	Andrew		Brooks	86	andrew.brooks@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/andrew.brooks.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/brooks/index.aspx		1	\N	89
261	Tim		Butler	87	tim.butler@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/tim.butler.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/butler/index.aspx		2	\N	89
262	Michael		Chadwick	88	michael.chadwick@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/michael.chadwick.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/chadwick/index.aspx		1	\N	89
263	Ruth		Craggs	89	ruth.craggs@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ruth.craggs.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/craggs/index.aspx		1	\N	89
264	Mark		De Jong	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/mark-de-jong(63f8a1a5-5db3-4d99-80cd-db635ff4d020).html	N/A		4	\N	89
265	Becca		Farnum	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/becca-farnum(ba990498-e3fe-4022-88a9-f722b0907984).html	N/A		4	\N	89
266	Robert		Francis	\N	robert.francis@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/robert.francis.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/francis/index.aspx		3	\N	89
267	Sol		Gamsu	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/sol-gamsu(7582bbe4-46c5-4ef3-b8ff-2328d33ddb36).html	N/A		4	\N	89
268	Clare		Herrick	\N	clare.herrick@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/clare.herrick.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/herrick/index.aspx		5	\N	89
269	Alex		Loftus	90	alex.loftus@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/alex-loftus(25bdb883-45ac-4c1d-ab63-39e323438b7e).html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/loftus/index.aspx		3	\N	89
270	Bruce		Malamud	91	bruce.malamud@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/bruce.malamud.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/malamud/index.aspx		2	\N	89
271	James		Millington	92	james.millington@kcl.ac.uk		t	t	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/millington/index.aspx	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/millington/index.aspx		1	\N	89
272	Mark		Pelling	\N	mark.pelling@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/mark-pelling(a6525172-76ac-4aa4-95a6-06dd43dfd9a6).html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/pelling/index.aspx		2	\N	89
273	Jonathan		Reades	93	jonathan.reades@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jonathan.reades.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/reades/index.aspx		1	\N	89
274	Sebastian		Schlueter	\N	sebastian.schlueter@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/sebastian-schlueter(948d5d00-a0dd-4836-b420-4473b013f844).html	http://www.kcl.ac.uk/sspp/departments/geography/people/phdstudents/urban%20futures/SchlueterSebastian.aspx		4	\N	89
275	Narushige		Shiode	94	naru.shiode@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/naru-shiode(c572403f-dc01-46d5-a2ff-3768d7d287a2).html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/NarushigeShiode/BiographyContactInformation.aspx		5	\N	89
276	Thomas		Smith	95	thomas.smith@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/thomas.smith.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/smith/index.aspx		1	\N	89
277	Martin		Wooster	96	martin.wooster@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/martin-wooster(c17ce06d-72ac-4fc4-a849-cc8c70d03a37).html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/wooster/index.aspx		2	\N	89
278	Chen		Zhong	97	chen.zhong@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/chen.zhong.html	http://www.kcl.ac.uk/sspp/departments/geography/people/academic/Chen%20Zhong/index.aspx		1	\N	89
279	David		Armstrong	98	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/david-armstrong(5f1e0744-1ae7-4332-a204-5b41739a2068).html	http://www.kcl.ac.uk/sspp/departments/sshm/people/Affiliates/davidarmstrong.aspx		2	\N	90
188	Heather		Milburn	40	Heather.Milburn@gstt.nhs.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/heather-milburn(5ba364ad-4bd9-4f91-9578-744e52d97c52).html	N/A		17	\N	62
189	Ross		Anderson	\N	N/A		t	t	N/A	https://kclpure.kcl.ac.uk/portal/en/persons/ross-anderson(72d6ae12-271b-44cd-b4bf-77fc4c861189).html		2	\N	63
190	Richard		Atkinson	\N	atkinson@sgul.ac.uk		t	t		https://kclpure.kcl.ac.uk/portal/en/persons/richard-atkinson(c8340e71-bce9-44ad-8f73-de21b2c87af5).html		18	\N	63
191	Benjamin		Barrett	41	benjamin.barratt@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/benjamin-barratt(13a70e53-bd9c-447f-b0d7-722005fc5bf1).html	N/A		1	\N	63
192	Sean		Beevers	42	sean.beevers@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/sean-beevers(69d4f8e7-56f5-4751-84e3-2d735371f03e).html	N/A		3	\N	63
193	Anna		Font Font	\N	anna.font_font@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/anna-font-font(3dd371be-c3bf-46a9-977a-27ac3261c2df)/biography.html	http://www.kcl.ac.uk/lsm/research/divisions/aes/research/ERG/people/Measurement/Dr-Anna-Font.aspx		19	\N	63
194	Gary		Fuller	43	gary.fuller@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/gary.fuller.html	N/A		3	\N	63
195	David	C.	Green	\N	david.c.green@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/david-c-green(64ae4d55-ca23-4d38-8e43-16cb54134fca).html	http://www.kcl.ac.uk/lsm/research/divisions/aes/research/ERG/people/Measurement/Dr-David-Green.aspx		20	\N	63
196	Klea		Katsouyianni	44	klea.katsouyianni@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/klea.katsouyanni.html	N/A		2	\N	63
197	Frank		Kelly	45	frank.kelly@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/frank-kelly(6811c2c0-ce6e-4d3b-914b-5adc28f9aee3).html	http://www.kcl.ac.uk/lsm/research/divisions/aes/about/people/Kelly/index.aspx		2	\N	63
198	Julia		Kelly	\N	julia.kelly@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/julia.kelly.html	N/A		12	\N	63
199	Ian		Mudway	46	ian.mudway@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/ian-mudway(3b1c16af-3c30-47fd-b210-cbc6ad24c0d8).html	http://www.kcl.ac.uk/lsm/research/divisions/aes/about/people/Mudway/index.aspx		1	\N	63
200	Charles		Reilly	\N	charles.reilly@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/charles-reilly(175eb878-f870-4022-a515-d4f7d085fdae).html	N/A		21	\N	64
201	Margreet		L�chtenborg	47	margreet.luchtenborg@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/margreet-luchtenborg(f764ad3f-5695-4c54-8a0e-e012eb1e3992).html	N/A		1	\N	65
202	Henrik		M�ller	47	henrik.moller@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/henrik-moeller(398392c6-b197-478f-8796-3ddef451c4e9).html	N/A		2	\N	65
203	Elizabeth		Davies	48	elizabeth.davies@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/elizabeth.davies.html	N/A		5	\N	66
204	Paula		Baraitser	\N	paula_baraitser@mac.com		t	t	https://kclpure.kcl.ac.uk/portal/paula.baraitser.html	http://www.kcl.ac.uk/lsm/research/divisions/global-health/people/Centre-staff/Baraitser.aspx		22	\N	67
205	Claudia		Bausewein	\N	claudia.bausewein@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/claudia-bausewein(5fa73ada-5c22-43a1-ac80-16b64b2b6af1).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/honorary/bauseweinc.aspx		21	\N	68
206	Katherine		Bristowe	\N	katherine.bristowe@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/katherine-bristowe(0b1c62ac-5e64-4151-86c9-56428ea547dc).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/researchers/bristowek.aspx		23	\N	68
207	Polly		Edmonds	49	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/polly-edmonds(69fff084-50a6-42b1-903b-e78cb1f1846a).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/honorary/edmondsp.aspx		24	\N	68
208	Wei		Gao	50	wei.gao@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/wei.gao.html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/academic/gaow.aspx		3	\N	68
209	Barbara		Gomes	\N	barbara.gomes@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/barbara-gomes(1462c71f-e706-4270-a917-1aea9de8e84b).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/academic/gomesb.aspx		9	\N	68
210	Sue		Hall	\N	sue.hall@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/sue-hall(0dee5557-5bb0-47aa-a7ab-c3ac12a6e45b).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/honorary/halls.aspx		25	\N	68
211	Richard		Harding	51	richard.harding@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/richard-harding(2522ba6f-263a-4327-9123-51f693d0e06c).html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/academic/hardingr.aspx		5	\N	68
212	Irene	J.	Higginson	52	irene.higginson@kcl.ac.uk		t	t		http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/academic/higginsoni.aspx		2	\N	68
213	Fliss		Murtagh	49	fliss.murtagh@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/fliss.murtagh.html	http://www.kcl.ac.uk/lsm/research/divisions/cicelysaunders/about/people/academic/murtaghf.aspx		5	\N	68
214	Mendwas		Zingha	\N	mendwas.dzingina@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/mendwas.dzingina.html	N/A		26	\N	68
215	Nicolas		Bury	53	nic.bury@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/nicolas-bury(9a7b178a-d479-4cd4-baca-e7b798b35940).html	http://www.kcl.ac.uk/lsm/research/divisions/dns/about/people/Profiles/nicbury.aspx		5	\N	69
216	Cynthia		Mohandas	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/cynthia-mohandas(2f7dd88c-9fbf-4756-a091-f384c338250a).html	N/A		4	\N	69
217	Mark		Chamley	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/mark-chamley(e06a43e8-8d78-4e3a-8acb-4fedb5228d1d).html	N/A		27	\N	70
218	Clare		Connor	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/clare-connor(0f248e0c-2d53-4053-95d9-acbea80dfd38).html	N/A		18	\N	70
219	Jeff	W.	Keep	54	jeff.keep@nhs.net		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/jeff-w-keep(8e37163d-ed3e-4021-b1c8-3934f4c8c561).html	N/A		28	\N	71
220	Mark		Ashworth	55			t	t				5	\N	72
221	Caroline		Burgess	\N	caroline.burgess@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/publications/influences-on-individuals-decisions-to-take-up-the-offer-of-a-health-check(5c861ce7-6fd0-4678-8443-6c915b6a4efb).html	N/A		9	\N	72
222	Siobhan		Crichton	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/siobhan-crichton(ae99380a-bde9-4adc-8a0b-546547d483b0).html	N/A		29	\N	72
223	Abdel		Douiri	\N	abdel.douiri@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/abdel-douiri(31b802e8-13b0-44f6-9310-afa44d930056).html	N/A		3	\N	72
118	Janet		Anderson	73	janet.anderson@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/janet-anderson(1e79e651-0243-48c1-a9ad-6674543580e9).html	N/A		5	\N	42
119	Tina		Day	\N	tina.day@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/tina.day.html	N/A		1	\N	42
120	Joanne		Fitzpatrick	\N	joanne.fitzpatrick@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/joanne.fitzpatrick.html	N/A		3	\N	42
121	Angus		Forbes	74	angus.forbes@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/angus-forbes(cb4405ea-b57d-4b40-9f59-53b89800f172).html	N/A		30	\N	42
122	Margaret		Lau-Walker	\N	margaret.lau-walker@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/margaret.lau-walker.html	N/A		1	\N	42
123	Gerry		Lee	75	gerry.lee@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/gerry-lee(508f5483-1ec2-49a6-8c20-3860d2892ca0).html	N/A		3	\N	42
124	Jill		Maben	76	jill.maben@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jill.maben.html	N/A		2	\N	42
125	Trevor		Murrells	\N	trevor.murrells@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/trevor-murrells(67ec5bce-2884-4aa7-a5de-e088386c77b7).html	N/A		27	\N	42
126	Caroline		Nicholson	75	caroline.nicholson@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/caroline-nicholson(a5914038-0d19-4eb0-9798-756034199afb).html	N/A		3	\N	42
127	Christine		Norton	\N	christine.norton@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/christine.norton.html	N/A		2	\N	42
128	Edward		Pursell	\N	ed.purssell@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ed.purssell.html	N/A		3	\N	43
129	Alison		While	\N	alison.while@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/alison.while.html	N/A		39	\N	43
130	Ian		Norman	77	ian.j.norman@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/ian-norman(72d3cce4-ac65-4c52-85cc-9abc061406ae).html	http://www.kcl.ac.uk/aboutkings/Governance/committees/acboard/Members/iannorman.aspx		40	\N	44
131	James		Harris	\N	james.1.harris@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/james-harris(47b246ce-b1d7-4e4d-a9ce-c2afddea47b6).html	N/A		1	\N	45
132	Sharin		Baldwin	\N	sharin.1.baldwin@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/sharin.1.baldwin.html	N/A		41	\N	46
133	Alison		Metcalfe	78	alison.metcalfe@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/alison.metcalfe.html	N/A		2	\N	46
134	Jacqueline		Sin	\N	jacqueline.sin@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jacqueline.sin.html	N/A		4	\N	46
135	Ellen		Adams	1	ellen.adams@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ellen.adams.html	http://www.kcl.ac.uk/artshums/depts/classics/people/academic/adams/index.aspx		1	\N	47
136	Hugh		Bowden	2	hugh.bowden@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/hugh-bowden(e5083fae-9442-48ad-b475-f9e5b67f4e55).html	http://www.kcl.ac.uk/artshums/depts/classics/people/academic/bowden/index.aspx		2	\N	47
137	John		Pearce	3	john.pearce@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/john-pearce(7b7c0ee9-c401-4b2c-ade6-5c0c65b1040d).html	http://www.kcl.ac.uk/artshums/depts/classics/people/academic/pearce/index.aspx		3	\N	47
138	Michael		Trapp	4	michael.trapp@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/michael.trapp.html	http://www.kcl.ac.uk/artshums/depts/classics/people/academic/trapp/index.aspx		2	\N	47
139	Justine		McConnell	5	justine.mcconnell@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/justine.mcconnell.html	http://www.kcl.ac.uk/artshums/depts/complit/people/academic/mcconnell.aspx		1	\N	48
140	Ruth		Adams	6	ruth.3.adams@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ruth.3.adams.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/adams/index.aspx		3	\N	49
141	Roberta		Communian	7	roberta.comunian@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/roberta.comunian.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/comunian/index.aspx		1	\N	49
142	Virginia		Crisp	7	virginia.crisp@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/virginia.crisp.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/crispg.aspx		1	\N	49
143	Rosa	Perez	Monclus	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/rosa-perez-monclus(9c86dc57-fab1-476f-8ffe-df80415d8c4a).html	N/A		4	\N	49
144	Christina		Scharff	8	christina.scharff@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/christina.scharff.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/scharff/index.aspx		3	\N	49
145	Nick		Wilson	9	nick.wilson@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/nick.wilson.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/wilson/index.aspx		5	\N	49
146	Anna		Woodham	10	anna.woodham@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/anna.woodham.html	http://www.kcl.ac.uk/artshums/depts/cmci/people/academic/Woodham/index.aspx		1	\N	49
147	Bubb		Alexander	\N	alexander.bubb@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/alexander.bubb.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/bubb.aspx		6	\N	50
148	Hannah		Crawforth	11	hannah.crawforth@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/hannah-crawforth(5e03ed1e-2a59-4dc1-974d-057795278bf6).html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/crawforth.aspx		3	\N	50
149	Lara		Feigel	12	lara.feigel@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/lara-feigel(e023b655-7cc0-4d29-ba81-69cc1c987790).html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/feigel.aspx		5	\N	50
150	Paul		Gilroy	13	paul.gilroy@kcl.ac.uk		t	t	N/A	http://www.kcl.ac.uk/artshums/depts/english/people/academic/gilroy.aspx		2	\N	50
151	James		Grande	14	james.grande@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/james.grande.html 	http://www.kcl.ac.uk/artshums/depts/english/people/academic/grande.aspx		1	\N	50
152	Richard		Kirkland	15	richard.kirkland@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/richard.kirkland.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/kirkland.aspx		2	\N	50
153	Anna		Maguire	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/anna-maguire(6383a172-fc37-4ed8-b53a-01fd1916121f).html	N/A		4	\N	50
154	Gemma		Miller	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/gemma-miller(d8e77e34-9b7d-4a6e-84a5-0860c90150eb).html	N/A		4	\N	50
155	Lucy		Munro	16	lucy.munro@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/lucy.munro.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/munro.aspx 		5	\N	50
156	Ruvani		Ranasinha	\N	ruvani.ranasinha@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/ruvani.ranasinha.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/ranasinha.aspx		3	\N	50
157	Alan		Read	17	alan.read@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/alan.read.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/read.aspx		2	\N	50
158	Anna		Snaith	18	anna.snaith@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/anna.snaith.html	http://www.kcl.ac.uk/artshums/depts/english/people/academic/snaith.aspx		2	\N	50
159	Rosalind		Galt	19	rosalind.galt@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/rosalind.galt.html	http://www.kcl.ac.uk/artshums/depts/filmstudies/people/acad/galt/index.aspx		2	\N	51
160	Lawrence		Napper	19	lawrence.1.napper@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/lawrence.1.napper.html 	http://www.kcl.ac.uk/artshums/depts/filmstudies/people/acad/napper/index.aspx		3	\N	51
161	Benedict		Schofield	20	benedict.schofield@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/benedict.schofield.html 	http://www.kcl.ac.uk/artshums/depts/german/people/staff/academic/schofieldb.aspx		3	\N	52
162	Richard		Drayton	21	richard.drayton@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/richard.drayton.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/draytonr/index.aspx		7	\N	53
163	Laura		Gowing	22	laura.gowing@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/laura.gowing.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/gowingl/index.aspx		2	\N	53
164	Alana 		Harris	23	alana.harris@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/alana.harris.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/harrisa/index.aspx		1	\N	53
165	Naomi		Lloyd-Jones	\N	N/A		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/naomi-lloydjones(b655c7c7-f812-41d6-a5f1-d903eb514420).html	N/A		4	\N	53
166	Anna		Maeker	24	anna.maerker@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/anna.maerker.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/maerkera/index.aspx		3	\N	53
167	Rory		Naismith	25	rory.naismith@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/rory-naismith(ec4ab46f-b22f-4529-9400-849a23e8312c).html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/naismithr/naismithr.aspx		1	\N	53
168	Simon		Sleight	26	simon.sleight@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/simon.sleight.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/sleights/index.aspx		3	\N	53
169	Adam		Sutcliffe	27	adam.sutcliffe@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/adam.sutcliffe.html	http://www.kcl.ac.uk/artshums/depts/history/people/staff/Academic/sutcliffea/index.aspx 		5	\N	53
170	George		Legg	28	george.legg@kcl.ac.uk		t	t	N/A	http://www.kcl.ac.uk/artshums/depts/liberal/people/acad/LeggG.aspx 		8	\N	54
171	Jonathan		Hicks	\N	jonathan.1.hicks@kcl.ac.uk		t	t	N/A	http://www.kcl.ac.uk/artshums/depts/music/people/pdr/hicks.aspx		9	\N	55
172	Roger		Parker	29	roger.parker@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/roger.parker.html	http://www.kcl.ac.uk/artshums/depts/music/people/acad/parker/index.aspx 		10	\N	55
173	Flora		Willson	\N	flora.willson@kcl.ac.uk		t	t	N/A	http://www.kcl.ac.uk/artshums/depts/music/people/pdr/willson.aspx		11	\N	55
174	Daniel		Mu�oz Sempere	30	daniel.munoz_sempere@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/daniel.munoz_sempere.html	http://www.kcl.ac.uk/artshums/depts/splas/people/staff/academic/munoz/index.aspx		1	\N	56
175	Daniel	Nilsson	DeHanas	31	daniel.dehanas@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/daniel.dehanas.html 	http://www.kcl.ac.uk/artshums/depts/trs/people/staff/academic/dehanas.aspx		1	\N	57
176	Andrea		Schatz	32	andrea.schatz@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/andrea.schatz.html	http://www.kcl.ac.uk/artshums/depts/trs/people/staff/academic/schatz/index.aspx		5	\N	57
177	Andrew		Skilton	33	andrew.skilton@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/andrew-skilton(c10dac9e-429b-4698-9d35-e2e27b14981a)/publications.html	http://www.kcl.ac.uk/artshums/depts/trs/people/staff/associates/research/skilton.aspx		12	\N	57
224	Alexander		Dregan	56	alexandru.dregan@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/alexandru-dregan(1f424f8e-2926-4e59-a426-3070af98d237).html	N/A		1	\N	72
225	Judith		Green	57	judith.green@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/judith.green.html	N/A		30	\N	72
226	Martin		Gulliford	58	martin.gulliford@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/martin-gulliford(dc7e3f6c-15d2-4e14-81c3-81cd9f7faed9).html	N/A		2	\N	72
227	Tim		Harries	\N	timothy.harries@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/timothy-harries(44132202-b2d9-4c04-ab95-816e0a4d9e76).html	N/A		31	\N	72
228	Christopher		McKevitt	59	christopher.mckevitt@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/christopher-mckevitt(b8ffc5df-a997-4fb1-b5b8-9e2e989cdde4).html	N/A		2	\N	72
229	Jonathan		Edgeworth	60	jonathan.3.edgeworth@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/jonathan.3.edgeworth.html	http://www.kcl.ac.uk/lsm/research/divisions/diiid/departments/infectious/research/edgeworth/index.aspx		2	\N	73
230	John		Cason	61	john.cason@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/john.cason.html	http://www.kcl.ac.uk/lsm/research/divisions/diiid/departments/infectious/research/cason/index.aspx		32	\N	74
231	Vivian		Auyeung	62	vivian.auyeung@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/vivian.auyeung.html	http://www.kcl.ac.uk/lsm/research/divisions/ips/about/people/Auyeung/Auyeung.aspx		1	\N	75
232	David		Erskine	\N	David.Erskine@gstt.nhs.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/david-erskine(e8a5d31d-b4aa-48a6-b307-18dcb2856b68).html			33	\N	75
233	Benjamin		Bray	\N	benjamin.bray@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/benjamin-bray(bd71bb83-f378-47a4-8dc6-ab41d8abc6ea).html	N/A		34	\N	76
234	Louise		Goff	63	louise.goff@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/louise-goff(89eb4f11-10f1-47e3-a2a5-d11319319818).html	http://www.kcl.ac.uk/lsm/research/divisions/dns/about/people/Profiles/louisegoff.aspx		3	\N	77
235	Seeromanie		Harding	64	seeromanie.harding@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/seeromanie-harding(848bf752-3c66-49c5-b38e-91d160181bd9).html	http://www.kcl.ac.uk/lsm/research/divisions/dns/about/people/Profiles/Seeromanie-Harding.aspx		2	\N	77
236	Christer		Hogstrand	65	christer.hogstrand@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/christer-hogstrand(a050c40c-e4eb-4886-8d5c-b245c1b71d64).html	http://www.kcl.ac.uk/lsm/research/divisions/dns/about/people/Profiles/christerhogstrand.aspx		2	\N	77
237	Ed		Glucksman	\N	ed.glucksman@nhs.net		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/ed-glucksman(bc9b4d1d-0601-46d8-b502-3557cb00c271).html	N/A		35	\N	78
294	Matthew		Moran	\N	matthew.moran@kcl.ac.uk		t	t	https://kclpure.kcl.ac.uk/portal/en/persons/matthew-moran(d354f8e9-22be-4e69-95a6-03f8bce8f393).html	http://www.kcl.ac.uk/sspp/departments/warstudies/people/lecturers/moran.aspx		3	\N	94
\.


--
-- Name: kaldb_researcher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_researcher_id_seq', 294, true);


--
-- Data for Name: kaldb_researcher_research_interests; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_researcher_research_interests (id, researcher_id, interest_id) FROM stdin;
616	178	307
617	178	308
618	179	309
619	179	310
620	180	311
621	180	312
622	180	313
623	181	314
624	181	315
625	182	316
626	182	317
627	182	318
628	183	319
629	184	320
630	184	321
631	184	322
784	245	498
785	245	499
786	245	500
787	245	501
819	250	569
820	251	571
821	252	572
822	253	573
823	253	574
824	254	575
825	254	576
826	254	577
827	255	573
828	255	578
829	255	579
830	256	581
831	256	582
832	256	583
833	256	584
834	257	587
835	257	588
836	258	599
837	258	600
838	258	601
839	258	602
840	258	603
841	259	604
842	259	605
843	259	606
844	259	607
845	260	608
846	260	609
847	260	610
848	260	611
849	260	612
850	260	613
851	261	614
852	261	615
853	261	616
854	261	617
855	261	618
856	262	619
857	262	620
858	262	621
859	262	622
860	262	623
861	262	624
862	262	625
863	262	626
864	263	627
865	263	628
866	263	629
867	263	630
868	263	631
869	263	632
870	263	633
871	263	634
872	264	635
873	265	636
874	265	637
875	265	638
876	265	639
877	265	640
878	265	641
879	265	642
880	266	643
881	266	644
882	266	645
883	266	646
884	266	647
885	267	648
886	268	649
887	268	650
888	268	651
889	268	652
890	268	653
891	268	654
892	268	655
893	269	653
894	269	656
895	269	657
896	269	658
897	270	659
898	270	660
899	270	661
900	270	662
901	270	663
902	270	664
903	270	665
904	271	666
905	271	667
906	271	668
907	271	669
908	272	670
909	272	671
910	272	653
911	272	672
912	273	673
913	273	674
914	273	675
915	273	676
916	273	677
917	274	678
918	275	679
919	275	680
920	275	681
921	275	682
922	276	683
923	276	684
924	276	685
925	276	686
926	276	687
927	277	688
928	277	689
929	277	690
930	277	691
931	277	692
932	277	693
933	278	694
934	278	695
935	278	696
936	278	697
937	279	698
938	279	368
939	279	699
940	279	700
941	280	701
942	280	702
943	280	703
944	280	704
945	281	706
946	281	707
947	281	708
948	281	709
949	281	710
950	281	711
951	282	714
952	282	715
953	282	716
954	282	717
955	283	718
956	283	719
957	283	720
958	283	721
959	283	722
960	283	723
961	283	724
962	283	725
963	284	726
964	285	727
965	286	728
966	286	729
967	286	730
968	286	731
969	287	732
970	287	733
971	287	734
972	288	735
973	288	736
974	289	737
975	289	738
976	289	739
977	289	740
978	291	741
979	291	742
980	291	743
981	291	744
982	291	745
983	292	746
632	185	323
633	185	324
634	185	325
635	185	326
636	186	333
637	187	334
638	187	335
639	187	336
788	246	503
789	246	504
790	246	505
791	246	506
792	246	507
793	247	508
794	247	509
795	247	510
796	247	511
797	247	512
798	247	513
799	247	514
800	247	515
801	247	516
802	248	517
803	248	518
804	248	519
805	248	520
806	248	521
807	248	522
808	248	523
809	248	524
810	248	525
811	249	526
812	249	527
813	249	528
814	249	529
815	249	530
984	292	747
985	292	748
986	292	749
987	292	750
988	293	753
989	293	754
990	293	755
991	294	759
992	294	760
993	294	761
994	294	762
640	188	337
641	189	338
642	189	339
643	190	340
644	190	341
645	190	342
646	191	343
647	191	344
648	191	345
649	191	346
650	191	347
651	192	348
652	192	349
653	192	350
654	192	351
655	193	352
656	194	353
657	194	354
658	195	355
659	196	356
660	197	357
661	197	358
393	119	531
394	119	532
395	120	533
396	120	534
397	120	535
398	121	536
399	121	537
400	121	538
401	124	539
402	124	540
403	124	541
404	124	542
405	124	543
406	124	544
407	125	545
408	125	546
409	126	547
410	126	548
411	126	549
412	126	550
413	126	551
414	128	552
415	128	553
416	129	554
417	129	555
418	129	556
419	129	557
420	129	558
421	129	559
422	130	560
423	130	561
424	130	562
425	133	563
426	133	564
427	133	565
428	135	8
429	135	9
430	135	10
431	135	11
432	136	15
433	136	16
434	136	17
435	136	18
436	137	21
437	137	22
438	137	23
439	137	24
440	137	25
441	137	26
442	138	30
443	138	31
444	138	32
445	138	33
446	138	34
447	139	38
448	139	39
449	139	40
450	139	41
451	139	42
452	140	47
453	140	48
454	140	49
455	140	50
456	140	51
457	140	52
458	140	53
459	141	57
460	141	58
461	141	59
462	141	60
463	141	61
464	141	62
465	141	63
466	141	64
467	142	66
468	142	67
469	142	68
470	142	69
471	142	70
472	143	73
473	144	74
474	144	75
475	144	76
476	144	77
477	144	78
478	144	79
479	145	81
480	145	82
481	145	83
482	145	84
483	146	86
484	146	87
485	146	88
486	146	89
487	147	91
488	147	92
489	147	93
490	148	97
491	148	98
492	148	99
493	149	106
494	149	107
495	149	108
496	150	109
497	150	110
498	150	111
499	150	112
500	150	113
501	150	114
502	150	115
503	150	116
504	151	117
505	151	118
506	151	119
507	151	120
508	152	125
509	152	126
510	152	127
511	153	135
512	154	136
513	155	137
514	155	138
515	155	139
516	155	140
517	155	141
518	156	142
519	156	143
520	156	144
521	156	145
522	157	150
523	157	151
524	157	152
525	157	153
526	157	154
527	158	157
528	158	158
529	158	159
530	158	160
531	159	166
532	159	167
533	159	168
534	159	169
535	159	170
536	160	178
537	160	179
538	160	180
539	160	181
540	160	182
541	160	183
542	161	189
543	161	190
544	161	191
545	161	192
546	162	198
547	162	199
548	162	200
549	162	201
550	162	202
551	163	208
552	163	209
553	163	210
554	163	211
555	163	212
556	164	213
557	164	214
558	164	215
559	164	216
560	164	217
561	164	218
562	165	222
563	166	223
564	166	224
565	166	225
566	166	226
567	167	227
568	167	228
569	167	229
570	167	230
571	168	231
572	168	232
573	168	233
574	168	234
575	168	235
576	168	236
577	168	237
578	169	246
579	169	247
580	170	248
581	170	249
582	170	250
583	171	251
584	171	252
585	171	253
586	171	254
587	172	255
588	172	256
589	172	257
590	173	264
591	173	265
592	173	266
593	173	267
594	174	271
595	174	272
596	174	273
597	174	274
598	174	275
599	175	279
600	175	280
601	175	281
602	175	282
603	175	283
604	176	287
605	176	288
606	176	289
607	176	290
608	176	291
609	177	297
610	177	298
611	177	299
612	177	300
613	177	301
614	177	302
615	177	303
662	198	359
663	199	360
664	199	361
665	199	362
666	199	363
667	199	345
668	200	364
669	200	365
670	201	366
671	202	367
672	202	368
673	202	369
674	203	370
675	203	371
676	203	372
677	204	373
678	204	374
679	204	375
680	205	376
681	205	377
682	206	378
683	206	379
684	207	384
685	207	385
686	208	386
687	208	387
688	208	388
689	208	389
690	209	392
691	209	393
692	209	394
693	209	395
694	209	396
695	209	397
696	209	398
697	209	399
698	209	400
699	209	401
700	209	402
701	210	405
702	211	406
703	211	407
704	211	408
705	211	409
706	211	410
707	211	411
708	211	412
709	211	413
710	212	416
711	212	417
712	212	418
713	212	419
714	212	420
715	212	421
716	212	422
717	212	423
718	213	376
719	213	426
720	213	427
721	213	428
722	213	429
723	213	430
724	213	431
725	215	438
726	215	439
727	216	440
728	223	441
729	223	442
730	223	443
731	225	444
732	225	445
733	225	446
734	226	447
735	226	448
736	226	449
737	226	450
738	228	451
739	228	368
740	228	452
741	228	453
742	229	454
743	229	455
744	229	456
745	229	457
746	230	458
747	230	459
748	230	460
749	230	461
750	231	462
751	233	463
752	233	464
753	234	465
754	234	466
755	234	467
756	235	468
757	235	469
758	235	470
759	235	471
760	235	472
761	236	473
762	236	474
763	239	475
764	239	476
765	239	477
766	239	478
767	240	482
768	240	483
769	240	484
770	240	485
771	241	486
772	242	487
773	242	488
774	242	489
775	242	490
776	243	491
777	243	492
778	243	493
779	243	494
780	243	481
781	243	495
782	243	496
783	244	497
816	250	566
817	250	567
818	250	568
\.


--
-- Name: kaldb_researcher_research_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_researcher_research_interests_id_seq', 994, true);


--
-- Name: kaldb_researcher_specialism_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_researcher_specialism_id_seq', 595, true);


--
-- Data for Name: kaldb_researcher_specialisms; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_researcher_specialisms (id, researcher_id, specialism_id) FROM stdin;
247	118	247
248	118	248
249	119	249
250	120	250
251	121	251
252	122	252
253	122	253
254	123	254
255	123	255
256	124	256
257	125	257
258	125	258
259	125	253
260	126	259
261	127	260
262	128	261
263	129	262
264	129	263
265	129	264
266	130	265
267	130	266
268	131	267
269	132	268
270	132	269
271	132	270
272	133	271
273	134	272
274	134	273
275	135	274
276	135	275
277	136	276
278	137	276
279	138	277
280	138	278
281	139	279
282	140	280
283	140	281
284	141	282
285	142	283
286	143	282
287	144	284
288	145	282
289	146	285
290	147	286
291	147	287
292	148	288
293	148	289
294	149	290
295	150	291
296	151	292
297	151	293
298	152	294
299	153	295
300	154	296
301	155	297
302	155	298
303	155	299
304	155	300
305	156	301
306	157	302
307	157	303
308	158	304
309	158	305
310	159	306
311	160	307
312	160	308
313	161	309
314	162	310
315	163	311
316	164	312
317	165	313
318	166	314
319	167	315
320	168	316
321	168	317
322	168	318
323	169	319
324	169	320
325	170	321
326	171	322
327	171	323
328	172	324
329	172	325
330	173	326
331	173	327
332	174	328
333	175	329
334	175	330
335	176	331
336	177	332
337	178	333
338	179	333
339	180	334
340	180	335
341	180	336
342	180	337
343	180	338
344	181	338
345	182	339
346	182	340
347	183	340
348	184	336
349	185	341
350	186	342
351	186	343
352	186	344
353	187	345
354	187	346
355	187	347
356	187	348
357	188	349
358	188	350
359	188	351
360	189	352
361	190	353
362	191	354
363	191	355
364	191	356
365	191	357
366	191	358
367	191	359
368	192	354
369	192	360
370	192	361
371	193	362
372	193	363
373	193	364
374	194	365
375	194	366
376	194	367
377	194	368
378	195	369
379	195	370
380	196	371
381	196	372
382	196	373
383	197	374
384	197	375
385	197	376
386	197	377
387	198	378
388	199	379
389	199	380
390	199	381
391	199	382
392	200	383
393	200	384
394	201	385
395	201	386
396	202	387
397	202	388
398	202	389
399	202	390
400	202	391
401	202	392
402	202	393
403	203	394
404	203	395
405	203	396
406	204	397
407	204	398
408	205	399
409	206	400
410	206	401
411	207	402
412	208	403
413	208	404
414	208	405
415	209	406
416	209	407
417	210	408
418	210	409
419	210	410
420	211	411
421	211	408
422	211	412
423	211	413
424	212	383
425	212	414
426	212	415
427	212	416
428	212	417
429	212	418
430	213	419
431	213	420
432	214	421
433	215	422
434	216	423
435	216	424
436	217	425
437	217	426
438	217	427
439	217	428
440	218	429
441	219	430
442	219	431
443	220	432
444	220	433
445	220	434
446	220	435
447	220	436
448	220	437
449	220	438
450	220	439
451	220	440
452	221	441
453	221	442
454	222	443
455	223	444
456	223	445
457	224	446
458	225	447
459	225	448
460	225	449
461	226	446
462	226	450
463	226	451
464	227	452
465	227	453
466	227	454
467	228	455
468	228	456
469	228	457
470	228	458
471	228	459
472	229	460
473	229	461
474	230	462
475	230	461
476	231	463
477	231	464
478	232	465
479	233	466
480	233	467
481	234	468
482	234	469
483	235	470
484	235	471
485	235	472
486	235	473
487	235	474
488	235	475
489	235	476
490	235	477
491	236	478
492	237	479
493	237	480
494	237	407
495	237	481
496	238	482
497	239	483
498	239	484
499	239	485
500	240	486
501	241	487
502	242	488
503	242	489
504	242	490
505	243	491
506	243	492
507	243	493
508	243	484
509	243	494
510	243	495
511	244	496
512	244	497
513	245	498
514	246	499
515	247	500
516	248	500
517	248	501
518	248	502
519	248	499
520	249	503
521	250	504
522	250	505
523	250	506
524	250	507
525	251	508
526	251	509
527	252	510
528	253	511
529	253	512
530	254	513
531	255	514
532	256	515
533	256	516
534	257	517
535	257	518
536	257	519
537	258	520
538	258	521
539	258	522
540	259	523
541	260	524
542	261	525
543	262	526
544	262	527
545	263	528
546	263	529
547	263	530
548	264	531
549	265	532
550	266	533
551	266	534
552	267	535
553	267	536
554	268	537
555	269	538
556	269	539
557	269	540
558	270	541
559	271	542
560	272	543
561	272	544
562	273	545
563	273	546
564	273	547
565	273	548
566	273	549
567	274	550
568	274	551
569	275	552
570	276	553
571	277	553
572	277	554
573	278	549
574	279	555
575	279	556
576	280	557
577	280	558
578	280	559
579	281	560
580	281	561
581	282	560
582	283	562
583	284	563
584	285	564
585	286	565
586	287	566
587	288	567
588	289	568
589	290	569
590	290	570
591	290	571
592	291	572
593	292	573
594	293	574
595	294	575
\.


--
-- Data for Name: kaldb_researcher_teaching_interests; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_researcher_teaching_interests (id, researcher_id, interest_id) FROM stdin;
265	185	327
266	185	328
267	185	329
268	185	330
269	185	331
270	185	332
271	206	380
272	206	381
273	206	382
274	206	383
275	208	390
276	208	391
277	209	403
278	209	404
279	211	390
280	211	414
281	211	415
282	212	390
283	212	424
284	212	403
285	212	404
286	212	425
287	213	432
288	213	433
289	213	434
290	213	428
291	213	435
292	213	436
293	213	437
294	239	479
295	239	480
296	239	481
297	245	502
298	250	570
299	255	573
300	255	580
301	256	585
302	256	586
303	257	589
304	257	590
305	257	591
306	257	592
307	257	593
308	257	594
309	257	595
310	257	596
311	257	597
312	257	598
313	280	705
314	281	712
315	281	713
316	292	751
317	292	752
318	293	756
319	293	757
320	293	758
321	294	763
322	294	764
323	294	765
324	294	766
325	294	767
151	135	12
152	135	13
153	135	14
154	136	19
155	136	20
156	136	13
157	137	27
158	137	28
159	137	29
160	138	35
161	138	36
162	138	37
163	139	43
164	139	44
165	139	45
166	139	46
167	140	54
168	140	49
169	140	55
170	140	56
171	141	65
172	142	71
173	142	72
174	144	80
175	145	85
176	146	90
177	147	94
178	147	95
179	147	96
180	148	100
181	148	101
182	148	102
183	148	103
184	148	104
185	148	105
186	151	121
187	151	122
188	151	123
189	151	124
190	152	128
191	152	129
192	152	130
193	152	131
194	152	132
195	152	133
196	152	134
197	156	146
198	156	147
199	156	148
200	156	149
201	157	155
202	157	156
203	158	161
204	158	162
205	158	163
206	158	164
207	158	165
208	159	171
209	159	172
210	159	173
211	159	174
212	159	175
213	159	176
214	159	177
215	160	184
216	160	185
217	160	186
218	160	187
219	160	188
220	161	193
221	161	194
222	161	195
223	161	196
224	161	197
225	162	203
226	162	204
227	162	205
228	162	206
229	162	207
230	164	219
231	164	220
232	164	221
233	168	238
234	168	239
235	168	240
236	168	241
237	168	204
238	168	242
239	168	243
240	168	244
241	168	245
242	172	258
243	172	259
244	172	260
245	172	261
246	172	262
247	172	263
248	173	268
249	173	269
250	173	270
251	174	276
252	174	277
253	174	278
254	175	284
255	175	285
256	175	286
257	176	292
258	176	293
259	176	294
260	176	295
261	176	296
262	177	304
263	177	305
264	177	306
\.


--
-- Name: kaldb_researcher_teaching_interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_researcher_teaching_interests_id_seq', 325, true);


--
-- Data for Name: kaldb_specialism; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_specialism (id, name, description, london_related, kcl_related) FROM stdin;
247	Has examined effectiveness of incident reporting in improving safety in mental health and acute hospital settings in London		t	t
248	Has examined how female osteoporosis patients in London perceived their illness and treatment		t	t
249	Examined effectiveness of Royal College of Physicians' National Early Warning Score as it was implemented across one larger inner London NHS trust		t	t
250	Undertook study of views and experiences of nurses and health-care assistants in London nursing care homes about the Gold Standards Framework		t	t
251	Undertook examination of structured education provision and attendance among diabetes sufferers in London		t	t
252	Studied illness perception, self-care behaviour and quality of life of heart failure patients in London hospitals		t	t
253	Studied beliefs about their illness and factors that influence their self-management among outpatients with alcohol-related liver disease at a London hospital		t	t
254	Undertook analysis of The Guy�s and St Thomas�s NHS Foundation Trust @home service in South London		t	t
255	Undertook analysis of how coronary heart disease sufferers felt disease had impacted upon their lives		t	t
256	Undertook qualitative study of barriers to early diagnosis of symptomatic breast cancer among Black African, Black Caribbean and White British women living in London		t	t
257	Examined contribution of clinical and psychosocial factors to fatigue in patients with inflammatory bowel disease attending London hospital outpatients' clinics		t	t
258	Analysed effectiveness of brief alcohol interventions delivered by community pharmacists in London		t	t
259	Undertook study of experience of living at home with frailty in old age within inner London		t	t
260	Examined contribution of clinical and psychosocial factors to fatigue in patients with inflammatory bowel disease attending London hospital outpatients' clinics\rExamined effectiveness of intentional rounding within a London trust		t	t
261	Studied effectiveness of routine screening of women having caesarean section for MRSA within a London hospital		t	t
262	Examined physical activity among older people in London and related factors		t	t
263	Evaluated transition services for young people with cystic fibrosis in Southeast London		t	t
264	Examined increasing research capacity and changing the culture of primary care towards reflective inquiring practice, in case of West London Research network		t	t
265	Analysed prevalence of dolescent substance use in London schools		t	t
266	Examined efficacy of alcohol brief intervention in London community pharmacies		t	t
267	Has examined impact and responses to antenatal screening test for pre-eclampsia in London		t	t
268	Undertook study of how the London North West Healthcare NHS (LNWH) Trust�s Health Visiting Clinical Academic Hub was set up, what it aimed to do and its effectiveness to date		t	t
269	Has written ons trengthening perinatal mental health services for families in London		t	t
270	Has examined whether specialist community public health nurses assess risk factors for depression, suicide, and self-harm among South Asian mothers living in London		t	t
271	Undertook study of London-based research teams' experiences in recruiting participants		t	t
272	Examined effectiveness of family intervention for psychosis provided to London clinicans		t	t
273	Analysed the establishment of a recovery-oriented early intervention for psychosis service in Hounslow, West London		t	t
274	Works on the ancient world in modern London (history of museums)		t	t
275	Teaches on 'Exhibiting Classical Antiquities', which focuses on exhibition of classical antiquities in London and influence of ancient world on London, and involves several visits to London museums and cultural institutions		t	t
276	Has written on religion in Roman London		t	t
277	Written on Strand Lane Bath in Georgian and Victorian London.		t	t
278	Written on history of Classics at King's College London.		t	t
279	Has written on restaging of Haitian revolution on London stage		t	t
280	Convenes modules on Tate and Tate Modern		t	t
281	Has written on gender, empire and heritage at the V&A		t	t
282	Has previously written on KCL's collaboration with Royal Opera House, Royal Shakespeare Company, Southbank Centre,V&A Museum and other London-based institutiona in running King's Challenge Competition for students		t	t
283	Has written on alternative cinema exhibition and audiences in London		t	t
284	Has written on female classically trained musicians in London and Berlin		t	t
285	Has written on legacy of London 2012 Olympics		t	t
286	Has written on Kipling and Yeats' social circles in London		t	t
287	Has written on Indian travellers to London		t	t
288	Co-wrote book entitled Shakespeare's London		t	t
289	Teaches module on Shakespeare in London		t	t
290	Has written on fictional representations of bombing and war in London		t	t
291	Worked extensively on postcolonial studies, including in relation to London.		t	t
292	Has written on subjects of Nineteenth-Century London in William Godwin�s diary.		t	t
293	Was previously a postdoctoral research fellow on the ERC project 'Music in London, 1800 -1851', between 2014 and 2016.		t	t
294	Has written on Irish community in Late Victorian London		t	t
295	Has written on New Zealand soldiers visiting London during WW1		t	t
296	Has reviewed London performances of Shakespeare plays		t	t
297	Currently working on project entitled 'Before Shakespeare: The Beginnings of London Commercial Theatre'.		t	t
298	Author of Children of the Queen�s Revels: A Jacobean Theatre Repertory (Cambridge University Press, 2005), focused on most prominent children�s playing company in early modern London - �little eyases		t	t
299	of Shakespeare�s Hamlet - examining company�s history and involvement in crucial developments in dramatic genre in early 17th century.		t	t
300	Has also worked on Dublin tragecomedy on London stage.		t	t
301	Has written on South Asian writers and broadcasters in London\rTeaches on 'The World Novel' which has an extensive focus on postcolonial London		t	t
302	Formerly director of Rotherhithe Theatre Workshop		t	t
303	Director of the Performance Foundation, which has worked with orgs inc Somerset House Trust and London International Festival of Theatre		t	t
304	Has written extensively on colonial women writers in London		t	t
305	Teaches on 'Text, Culture, Theory: London 1950-1950'		t	t
306	Has written on and participated in London LGBT film festivals		t	t
307	Has previously worked on London musicals		t	t
308	Teaches on representation of London on film		t	t
309	Has spoken on question of 'Is London the Other Capital of Germany?'		t	t
310	Has written on how imperialism impacted upon the study of the humanities in London		t	t
311	Currently undertaking project on 'Women, apprenticeship and companies in seventeenth-century London'.		t	t
312	Has previously written extensively on religion and diaspora in 19th and 20th century East London.		t	t
313	Has written on opposition to rule from London in Scotland		t	t
314	Has written on displays of anatomical models in 1830s London		t	t
315	Has previously written on early medieval history of London Mint		t	t
316	Has written a comparative study of walking in London, New York and Melbourne		t	t
317	Teaches on 'Electric Cities: The Experience of Modernity in London, Melbourne, New York and Paris, 1870-1929'		t	t
318	Teaches on ' London Calling: Colonial and Postcolonial Encounters with the Metropole'		t	t
319	Has previously written on diversity and difference in early modern London.		t	t
320	Has previously written on Sephardic bounding of community in early modern Amsterdam and London		t	t
321	Previously involved in public engagement project relating to London Docklands IRA bombing,		t	t
322	Research fellow on 'Music in London, 1800-1851'.		t	t
323	Participant in Oxford-Princeton exchange project, 'Staging History: Performing the Past in London and New York Theatres, 1770-1870'.		t	t
324	Director of ERC-funded project, 'Music in London, 1800-1851': https://musicinlondon.org/.		t	t
325	Involved in project on 'Operatic Networks: London, Paris and Beyond c.1893'		t	t
326	Previously written on musical objects at 1851 Great Exhibition		t	t
327	Has taught on music culture in London		t	t
328	Written extensively on Spanish exiles in nineteenth century London.		t	t
329	Wrote  book entitled London Youth, Religion, and Politics: Engagement and Activism from Brixton to Brick Lane (Oxford: Oxford University Press, 2016).		t	t
330	Wrote on London youth hip-hop as performance of faith.		t	t
331	Works on Jewish-Christian contacts between Venice and Amsterdam, Berlin and London.		t	t
332	Has written on history of Buddhism in London		t	t
333	Has written on oral health inequalities in East London		t	t
334	Has written on oral health inequalities in South East London		t	t
335	Has written on dental profession in London		t	t
336	Has written on oral cancer awareness among South East Asian community		t	t
337	Has written on dental care for elderly residents of London care homes		t	t
338	Has written on London general dental practitioners' views on promoting oral health in high caries risk children		t	t
339	Has written on predictors of dentists' behaviours in delivering prevention in primary dental care in North London		t	t
340	Has written on how patient and carer expectations of orthodontic treatment vary with ethnicity at Queen Mary Hospital in Sidcup		t	t
341	Previously researched findings of  the South London Diabetes Cohort (SOUL-D) study, examining ethnic differences in the clinical progression of early type 2 diabetes, the association between depressive symptoms and systemic inflammation in people with type 2 diabetes, and the clinical characteristics at diagnosis of type 2 diabetes in a multi-ethnic population.		t	t
342	Previously worked on acute mental health service use by patients with severe mental illness after discharge to primary care in South London.		t	t
343	Ethnic differences in self-poisoning across South London.		t	t
344	Khat use among Somali mental health service users in South London.		t	t
345	Previously worked as cconsultant psychiatrist and senior lecturer in adult general and community psychiatry for NHS Trust in Lewisham.		t	t
346	Previously chaired NHS England, healthy London partnership�s �Stolen Years		t	t
347	group, working with primary care, secondary care, public health and clinical commissioning groups to reduce early mortality in people with psychosis in London.		t	t
348	Recently conducted research into patients in south London with first-episode psychosis attributable to use of high potency cannabis, and on provision of health promotion programmes to people with serious mental illness in South London.		t	t
349	Has researched variation in Vitamin D deficiency among tuberculosis patients by ethnic group and geographical region of birth in South London		t	t
350	Has researched ethnic variation in inflammatory profile in tuberculosis among a London cohort		t	t
351	Has researched non-tuberculous slow-growing mycobacterial pulmonary infections in non-HIV-infected patients in south London		t	t
352	Identifies current main research interest  as investigating the health effects of traffic pollution in London; has published extensively on this subject		t	t
353	Has researched extensively differential health effects, hospital admisssions and mortality rates arising from exposure to airborne particles in London		t	t
354	Has researched impact of particulate matter on stroke incidence and survival rates in London		t	t
355	Has researched relationship between air pollution, ethnicity and telemere length in East London		t	t
356	Has researched air quality monitoring and mapping in London		t	t
357	Has researched effectiveness of Low Emission Zone in reducing air pollution in London		t	t
358	Has researched emissions from urban waste in London		t	t
359	Helped forumlate and develop London Air Quality Network		t	t
360	Has researched pollution exposure modelling for London		t	t
361	Has extensively researched transport-based pollution and its management in London		t	t
362	Has researched whether policies to abate atmospheric emissions from traffic had a positive effect in London		t	t
363	Has researched daytime CO2 urban surface fluxes from airborne measurements, eddy-covariance observations and emissions inventory in Greater London		t	t
364	Has researched degradation in urban air quality from construction activity and increased traffic arising from a London road widening scheme		t	t
415	Previously written on yoga classes at palliative care services in New Delhi and London.		t	t
365	Previously written on differential health effects of short-term exposure to source-specific particles in London.		t	t
366	Previously written on policies to abate atmospheric emissions from traffic in London.		t	t
367	Previously written on associations of short-term exposure to traffic-related air pollution with cardiovascular and respiratory hospital admissions and daily mortality in London.		t	t
368	Previously written on nitrodgen diioxide and particle concetrations in London air.		t	t
369	Has extensively researched modelling and analysing aerosol levels in London air\rHas researched health implications of high particle levels in London air		t	t
370	Has researched cocaine and cannabinoid presence in the atmosphere of London, Amsterdam and Stockholm\rHas researched impact of Congestion Charge on London air quality		t	t
371	Has researched searching for the best modeling specification for assessing the effects of temperature and humidity on health, using a time series analysis in London, Athens and Rome		t	t
372	Has researched spatial variations of PAH, hopanes/steranes and EC/OC concentrations within and between European study areas (inc London)		t	t
373	Has researched ambient air SO2 patterns in 6 European cities (inc London)		t	t
374	Has extensively researched impact of roadside pollution and traffic pollution on health and mortality rates		t	t
375	Has extensively researched means of modelling and analysing air quality in London		t	t
376	Has extensively researched impct of particulate matter in atmosphere on health in London		t	t
377	Has researched impact of traffic solutions such as Low Emissions Zone on London air quality		t	t
378	Has researched traffic management strategies for emissions reduction in London		t	t
379	Has researched differential health effects of short-term exposure to source-specific particles in London		t	t
380	Has researched air pollution, ethnicity and telomere length in east London schoolchildren		t	t
381	Has researched short-term associations between particle oxidative potential and daily mortality and hospital admissions in London		t	t
382	Has researched effects of air pollution and the introduction of the London Low Emission Zone on the prevalence of respiratory and allergic symptoms in schoolchildren in east London		t	t
383	Previously written on psychometric properties of London Chest Activity of Daily Living Scale in patients with advanced disease and refractory breathlessness.		t	t
384	Has previously written on development, effectiveness and cost-effectiveness of a new out-patient Breathlessness Support Service in South East London.		t	t
385	Has researched treatment and survival of patients with triple negative breast cancer in a London population		t	t
386	Has researched disparities in ethnicity-specific incidence among the London population in oral cavity, pharyngeal and salivary gland cancer incidence		t	t
387	Has researched whether cancer survival associated with cancer symptom awareness and barriers to seeking medical help in England, with worst scores observed in socioeconomically deprived parts of East London		t	t
388	Has researched mental disorders, stage of cancer at diagnosis and subsequent survival in South East London		t	t
389	Has researched breast screening uptake among women from different ethnic groups in London		t	t
390	Has researched socioeconomic and ethnic inequalities in screen-detected breast cancer in London		t	t
391	Has researched disparities in ethnicity-specific incidence among the London population in oral cavity, pharyngeal and salivary gland cancer		t	t
392	Has researched variation, precision and validity of 1-year survival estimates for lung, breast, colon and prostate cancer in London and South East England primary care trusts		t	t
393	Has researched using maps and funnel plots to explore variation in place of death from cancer within London, 2002-2007		t	t
394	Has done extensive research on breast cancer screening and incidence within London, inc in relations to ethnicity and socieconomic status		t	t
395	Has researched mental disorders, stage of cancer at diagnosis and subsequent survival with reference to a London cohort		t	t
396	Has researched survival estimates for lung, breast, colon and prostate cancer sufferers in London & SE		t	t
397	Has researched internet-based sexual health services in South East London		t	t
398	Has researched using educational outreach and a financial incentive to increase general practices contribution to chlamydia screening in South-East London		t	t
399	Has researched integrated palliative and respiratory care service for patients with advanced disease and refractory breathlessness in South London hospitals		t	t
400	Has researched patient experiences of group exercise within hospice palliative care in South London		t	t
401	Has researched patient and carer experiences of clinical uncertainty and deterioration, in the face of limited reversibility, in three large London hospitals		t	t
402	Has researched meanings of happiness among two ethnic groups living with advanced cancer in south London		t	t
403	Has researched end-of-life choices and experiences regarding emergency care, place of death and dignity-related distress among London-based paliative cancer patients		t	t
404	Has researched integrated palliative and respiratory care service for patients with advanced disease and refractory breathlessness in South London		t	t
405	Has researched care costs for Black Caribbean and White British patients with advanced Multiple Sclerosis in London		t	t
406	Has researched home and hospital-based end of life care for palliative cancer patiets in London		t	t
407	Has researched palliative care needs among older people who die in London emergency departments		t	t
408	Has researched home-based end of life care for palliative cancer patients in London		t	t
409	Has researched dignity-related distress at end of life for recipients of palliative care at end of life		t	t
410	Has researched spiritual well-being in residents of London nursing homes for older people		t	t
411	Has researched experiences of patients with advanced multimorbidity to improve care, with reference to London		t	t
412	Has researched experiences of experiences of support workers caring for people with learning disabilities towards the end of life in London		t	t
413	Has researched comprisons between web-based and clinic samples of gay men living with HIV in London, re self-reported physical and psychological symptoms		t	t
414	Previously written on meanings of happiness among two ethnic groups living with advanced cancer in south London.		t	t
416	Previously written on factors affecting place of cancer death in London and New York.		t	t
417	Previously written on communication of symptoms and history, and on physician perceptions and decision-making, related to patient chest pain in a London emergency department.		t	t
418	Previously written on end of life care for first generation black Caribbean and white patients with progressive disease in South London.		t	t
419	Has researched GPs' views on managing advanced chronic kidney disease in primary care in London, Birmingham, Bristol and Stevenage		t	t
420	Has researched palliative care needs among older people who die in two South London emergency department		t	t
421	Has researched integrated palliative and respiratory care service for patients with advanced disease and refractory breathlessness in London hospitals and GP surgeries		t	t
422	Has researched environmental monitoring of London's urban streams using a primary fish gill cell culture system		t	t
423	Undertaking PhD on  South London Diabetes Ethnicity Phenotyping Study		t	t
424	Has researched ethnic differences in the clinical progression of early type 2 diabetes, based on findings from the South London Diabetes Cohort (SOUL-D) study		t	t
425	Has researched ethnic differences in the clinical progression of early type 2 diabetes, based on findings from the South London Diabetes Cohort study		t	t
426	Has researched how diabetes services in Lambeth and Southwark have worked together to reduce hospital diabetes outpatient caseloads by ensuring patients are cared for in the most appropriate setting		t	t
427	Has researched the clinical characteristics at diagnosis of type 2 diabetes in a multi-ethnic population, based on the South London Diabetes cohort		t	t
428	Has researched socio-economic and ethnic inequalities in diabetes retinal screening, based on three South London boroughs		t	t
429	Has researched diabetic eye screening among patients with Type 2 diabetes in three London boroughs		t	t
430	Researched cross-sectional study of knife injuries at a London major trauma centre		t	t
431	Researched palliative care needs among older people who die in 2 London emergency departments		t	t
432	Has researched ethnic variation in relationship between diabetes and mental illness in London		t	t
433	Has researched relationship between uptake of breast cancer screening and mental health issues in a London borough		t	t
434	Has researched Cardiovascular risk assessment and treatment in chronic inflammatory disorders in primary care in one London borough		t	t
435	Has researched prostate-specific antigen testing in inner London general practices		t	t
436	Has researched cardiovascular disease treatment among patients with severe mental illness in Southeast London		t	t
437	Has researched relationship between COPD risk and ethnicity in London		t	t
438	Has researched ethnicity and cardiovascular health inequalities in people with severe mental illnesses in London		t	t
439	Has researched patterns of physical co-/multi-morbidity among patients with serious mental illness in a London borough		t	t
440	Has researched ethnic differences in blood pressure monitoring and control in south east London		t	t
441	Has researched influences on individuals' decisions to take up the offer of a health check at London eneral practices		t	t
442	Has researched variations in the organization and delivery of the NHS health check' in primary care in London		t	t
443	Has done extensive research based on South London Stroke register, including contribution of particulate matter, patient outcomes, coincidence of depression\rHas researched emergency admissions for COPD in London		t	t
444	Has researched desensitisation to cigarette package graphic health warnings in London and Singapore		t	t
445	Has researched trends in health-related quality of life after stroke, based on analysis from the South London Stroke Register 1995-2011		t	t
446	Has researched cardiovascular risk assessment and treatment in chronic inflammatory disorders in primary care in a London borough		t	t
447	Has researched whether ethnic density associated with risk of child pedestrian injury in London		t	t
448	Has extensively researched impact of free bus travel on health and mobility of both young people and older people in London		t	t
449	Has researched role of bicycle sharing systems in normalising the image of cycling in London		t	t
450	Has extensively researched effectiveness and factors influenceing attendance of London diabetic eye screenings		t	t
451	Has researched variations in organization and delivery of the oNHS health check across London GPs		t	t
452	Has researched whether COPD risk vary by ethnicity, using a retrospective London-based cross-selectional study		t	t
453	Has researched impact of population and primary care factors on emergency admissions for COPD in London		t	t
454	Has researched length of stay of COPD London hospital admissions between 2006 and 2010		t	t
455	Has undertaken extensive research using South London Stroke Register, relating to patient outcomes, socioeconomic deprivation, cost effective service provision, secondary prevention, risk factor prevalence and interventions		t	t
456	Has researched impact of reorganisation of stroke services in London and Manchester		t	t
457	Has researched collaboration between stroke researchers, with student artists and stroke survivors to create an exhibition of visual arts in London		t	t
458	Has researched implementation of structured caregiver training in stroke care in London		t	t
459	Has researched how stroke thrombolysis is portrayed in UK national and London local newspapers		t	t
460	Has researched clonal variation in high- and low-level phenotypic and genotypic mupirocin resistance of MRSA isolates in south-east London		t	t
461	Has researched question of how representative research tissue biobanks of local populations are, with reference to Infectious Diseases Biobank at KCL		t	t
462	Has researched serum albumin concentrations in a multi-ethnic cohort of patients with Human Immunodeficiency Virus infection from South East London		t	t
463	Has researched determination of the influence of home delivery of HIV therapy on virological outcomes and adherence with reference to London clinics		t	t
464	Has researched clinical pharmacy services in a London hospital over time		t	t
465	Has researched development and delivery of pharmacy services for the London 2012 Olympic and Paralympic Games		t	t
466	Has researched patient outcomes up to 15 years after stroke, based on South London Stroke Register		t	t
467	Has researched derivation and external validation of a case mix model for the standardized reporting of 30-day stroke mortality rates, based on South London stroke register		t	t
468	Has researched ethnic differences in the progression to type 2 diabetes in SE London		t	t
469	Has researched Influence of weaning timing advice and associated weaning behaviours among black and minority ethnic groups in London		t	t
470	Has researched cardiometabolic risk from early adolescence to early adulthood in an ethnically diverse London cohort		t	t
471	Has researched lung function in London children in relation to ethnicity, physique and socioeconomic factors		t	t
472	Has researched determinants of young adult social well-being and health in London		t	t
473	Has researched feasibility of retrospectively collecting birth data for schoolchildren from parental questionnaires and general practitioners in primary care clinics, in inner city London neighbourhoods with high density of ethnic minority and disadvantaged populations		t	t
474	Has researched whether cultural integration explains mental health advantage for London adolescents		t	t
475	Has researched racism, ethnic density, family activities and psychological well-being through adolescence in London		t	t
476	Has researched UK-born ethnic minority women and their experiences of feeding their newborn infant in London and Birmingham		t	t
477	Has researched potential barriers to prevention of cancers and to early cancer detection among Irish people living in London, Manchester and Glasgow		t	t
478	Has researched environmental monitoring of London urban streams using a primary fish gill cell culture system		t	t
479	Has researched knife injuries at a major London trauma centre		t	t
480	Has researched characteristics of people with epilepsy who attend London emergency departments		t	t
481	Has researched inner city gunshot wounds in London		t	t
482	Has researched alcohol brief intervention in South London community pharmacies		t	t
483	Has researched London patients		t	t
484	and carers		t	t
485	views and expectations about intensive management for moderate rheumatoid arthritis		t	t
486	Has researched prevalence, determinants and clinical correlates of vitamin D deficiency in adults with inhaled corticosteroid-treated asthma in London		t	t
487	Has researched palliative care or end-of-life care in advanced chronic obstructive pulmonary disease in South London		t	t
488	Has researched smoking and common mental disorders in patients with chronic conditions at two London NHS Trusts		t	t
489	Has researched patient involvement in rheumatology outpatient service design and delivery		t	t
490	Has researched changing clinical patterns in rheumatoid arthritis management in 2 London secondary care rheumatology depts over two decades		t	t
491	Has researched patient involvement in rheumatology outpatient service design and delivery at a London hospital		t	t
492	Has researched internalised stigma in people with rheumatoid arthritis in London		t	t
493	Has researched patients		t	t
494	views and expectations about intensive management for moderate rheumatoid arthritis in 3 London hospital NHS Trusts		t	t
495	Has researched non-attendance at structured diabetes education in London		t	t
496	Has researched domestic violence in a London abortion clinic		t	t
497	Has researched smoking cessation in pregnant women with mental disorders, with reference to London maternity services		t	t
498	Has written on a family justice centre established in Croydon		t	t
499	Has written on energy efficient operation of cellular access networks through dynamic spectrum and traffic load management techniques, with reference to London base stations		t	t
500	Has written on tactile internet solutions, with reference to achieving remote surgical operations across the London, UK area, with surgeon(s) physically located in only one or a small number of London hospitals		t	t
501	Has written on TV white space in London area		t	t
502	Has written on spectrum usage in London		t	t
503	Participated in project to link the South London Stroke Register (SLSR), the London Air Pollution toolkit (LAP) and the Clinical Practice Research Datalink (CPRD) while transforming data into the Web Ontology Language (OWL) format		t	t
504	Has researched Imperial Defence College in London		t	t
505	Has researched plans to protect and evacuate Royal Family from London during WWII		t	t
506	Has researched NZ High Commission in London during WWII		t	t
507	Has researched Dominions Office in London during WWII		t	t
508	Has written on race and minority ethnic groups in London schools		t	t
509	Has written on class and aspiration among working class pupils in London schools		t	t
510	Has written on generational continuties and discontinuities in cultural identity within London African diasporic communities		t	t
511	Has written on science, technology, engineering and mathematics careers intervention		t	t
512	Has written on perceptions, processes and practices around learning in Tate Gallery		t	t
513	Has written extensively on London Association for the Teaching of English		t	t
514	Has written on oak processionary moth (invasive species found in London parks) life cycle, related health risks and\rissues concerning methods of management		t	t
515	Has researched the �social		t	t
516	aspect in English Language Teaching, contrasting abstracted norms with situated enactments in London schools		t	t
517	Has researched linguistic styling in English among London's diasporic communities		t	t
518	Has researched attitudes to Standard English in an inner London classroom		t	t
519	Has researched ritual and instructed foreign language practices at an inner London school		t	t
520	Has researched Brexit and its impact on City of London		t	t
521	Has written book Globalisation, hegemony and the future of the City of London		t	t
522	Has researched impact of global financial crisis on the City of London		t	t
523	Has written on gay spaces in 20th and 21st C London		t	t
524	Has written on sustainable construction and socio-technical transitions in London's mega-projects		t	t
525	Has written extensively on gentrification and regeneration in London		t	t
526	Has researched litter decomposition in Greater London rivers		t	t
527	Has researched macroinvertebrate richness on flood defence walls of the tidal River Thames		t	t
528	Has written on Commonwealth Institute and the Commonwealth Arts Festival in late Imperial London		t	t
529	Has written on hosting of Commonwealth dignitaries in London		t	t
530	Has written on Twentieth Century Society and civic geography in London		t	t
531	Has undertaken study of nitrous oxide levels by London roadsides		t	t
532	Wrote critique of the London Water Research Group considering academic hegemony and traps in social justice research		t	t
533	Has written on urban green spaces in London and on its periphery		t	t
534	Has written on flora along Thames walls in central London		t	t
535	Undertaking PhD on 'A historical geography of educational power: Comparing fields and circuits of education in Sheffield and London'		t	t
536	Has written on relocation of elite and middle-class schools from London to suburbs		t	t
537	Has written on 'building the healthy city' in London		t	t
538	Has researched financialisation of desalination, with reference to Thames Water Desalination Plant		t	t
539	Has researched practices of insurgent artists and anarchitects as they perform �relational urban interventions		t	t
540	in the cities of London and New York		t	t
541	Has researched CO2 emission estimation in London		t	t
542	Has researched agent-based model of distance-based school allocation in London		t	t
543	Has researched differences in adaptive capacity to climate change between London and other major cities worldwide		t	t
544	Has researched institutional learning in London's heat wave risk management regime		t	t
545	Has researched modelling of urban futures arising from construction of new London airports in Thames Estuary		t	t
546	Has researched geography of global business telecommunications and employment specialization in the London mega-city-region		t	t
547	Has researched how open data and open-source software can be used to create maps detailing London's property boom and its impact		t	t
548	Has researched how London's transport network could be made more accessible to people with disabilities		t	t
549	Has researched utilising data generated by Oyster Card usage to map flow patterns on London Tube and Overground		t	t
550	Undertaking PhD on 'Multi-religious Publics: A Comparative Study of the Dialectics between the Secular and the Sacred in Hackney (London) and Neukoelln (Berlin)'		t	t
551	Has researched legacy of London 2012 Olympics		t	t
552	Has researched mortality rates and the space-time patterns of John Snow�s London cholera epidemic map		t	t
553	Has researched derivation of an urban materials spectral library through emittance and reflectance spectroscopy, with reference to London		t	t
554	Has researched delineation of Central Business Districts in mega city regions using remotely sensed data, with reference to Canary Wharf		t	t
555	Has written on ethnic and scioeconomic inequalities in colorectal cancer screening in South East London		t	t
556	Has written on London general practiontiners' behaviour and thought patterns in relation to working together, diagnosing and prescribing		t	t
557	Has written extensively about 1914 City of London financial crisis		t	t
558	Has written history of City of London		t	t
559	Has written on history of individual London banks		t	t
560	Has written on using complexity theory to analyse the organisational response to resurgent tuberculosis across London		t	t
561	Has written on increasing capacity for innovation in bureaucratic London primary care organizations		t	t
562	Has researched managing the floor in sales interaction at street-market stalls, with reference to London and Berlin		t	t
563	Undertaking PhD on redevelopment of London�s Docklands and the emergence of Canary Wharf in the 1980s		t	t
564	Has written extensively on homelessness in London		t	t
565	Has written on women at Whitehall		t	t
566	Undertook discrete choice analysis of patients' stated preferences in the London Patient Choice Project		t	t
567	Has written on social and cultural integration of older Turkish Alevi refugees in London		t	t
568	Has written on experience of symptoms of tuberculosis and health care seeking behaviours among at-risk groups (primarily homeless people) in London		t	t
569	Has researched safeguarding practices and policies in London		t	t
570	Has researched experiences and conduct of care workers in London		t	t
571	Has researched ccollaborative care for people with memory problems in primary care in London and other districts		t	t
572	Has researched interpresonal education in health and social care within the context of a university partnership working with service providers in Southwest London		t	t
573	Has researched care professionals' understood and implemented Mental Capacity Act 2005 in London and SE		t	t
574	Has written on London Controlling Section in early Cold War		t	t
575	Has researched 2011 London riots in comparison with rioting in other cities		t	t
\.


--
-- Name: kaldb_specialism_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_specialism_id_seq', 575, true);


--
-- Data for Name: kaldb_title; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY kaldb_title (id, name) FROM stdin;
\.


--
-- Name: kaldb_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('kaldb_title_id_seq', 1, false);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	1
2	1	2	1
3	1	1	2
4	1	2	2
5	1	1	5
6	1	2	5
7	1	1	6
8	1	2	6
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N
3	00010001	2	0	Kings@London	kingslondon	t	f	/kingslondon/		f		\N	\N	f	29	1	f	2017-04-03 20:28:39.553846+00	2017-04-03 20:28:39.565574+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 3, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2017-04-03 20:28:39.553846+00	{"body": "[{\\"type\\": \\"paragraph\\", \\"value\\": \\"<p>This is the homepage.</p><p>Login using vagrant/vagrant - <a href=\\\\\\"/admin\\\\\\">admin</a> / <a href=\\\\\\"/wagtail\\\\\\">wagtail</a></p>\\"}]", "locked": false, "title": "Kings@London", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "latest_revision_created_at": null, "has_unpublished_changes": false, "content_type": 29, "path": "00010001", "owner": 1, "pk": 3, "first_published_at": null, "url_path": "/kingslondon/", "expired": false, "slug": "kingslondon", "expire_at": null, "go_live_at": null}	\N	3	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 1, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
2	127.0.0.1	8000	t	3	Kings@London
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 2, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailimages_filter (id, spec) FROM stdin;
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id) FROM stdin;
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 1, false);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 1, false);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: kal
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kal
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_blogindexpage
    ADD CONSTRAINT cms_blogindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_blogpost
    ADD CONSTRAINT cms_blogpost_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_blogposttag_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_blogposttag
    ADD CONSTRAINT cms_blogposttag_pkey PRIMARY KEY (id);


--
-- Name: cms_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_homepage
    ADD CONSTRAINT cms_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_indexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_indexpage
    ADD CONSTRAINT cms_indexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY cms_richtextpage
    ADD CONSTRAINT cms_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: kaldb_department_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_department
    ADD CONSTRAINT kaldb_department_pkey PRIMARY KEY (id);


--
-- Name: kaldb_faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_faculty
    ADD CONSTRAINT kaldb_faculty_pkey PRIMARY KEY (id);


--
-- Name: kaldb_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_interest
    ADD CONSTRAINT kaldb_interest_pkey PRIMARY KEY (id);


--
-- Name: kaldb_interest_related_interests_from_interest_id_9e34b143_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_interest_related_interests
    ADD CONSTRAINT kaldb_interest_related_interests_from_interest_id_9e34b143_uniq UNIQUE (from_interest_id, to_interest_id);


--
-- Name: kaldb_interest_related_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_interest_related_interests
    ADD CONSTRAINT kaldb_interest_related_interests_pkey PRIMARY KEY (id);


--
-- Name: kaldb_jobposition_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_jobposition
    ADD CONSTRAINT kaldb_jobposition_pkey PRIMARY KEY (id);


--
-- Name: kaldb_jobrole_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_jobrole
    ADD CONSTRAINT kaldb_jobrole_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachcity_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachcity
    ADD CONSTRAINT kaldb_outreachcity_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachcountry_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachcountry
    ADD CONSTRAINT kaldb_outreachcountry_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachevent_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachevent
    ADD CONSTRAINT kaldb_outreachevent_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachfrequency_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachfrequency
    ADD CONSTRAINT kaldb_outreachfrequency_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachlocation
    ADD CONSTRAINT kaldb_outreachlocation_pkey PRIMARY KEY (id);


--
-- Name: kaldb_outreachmedium_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_outreachmedium
    ADD CONSTRAINT kaldb_outreachmedium_pkey PRIMARY KEY (id);


--
-- Name: kaldb_researcher_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher
    ADD CONSTRAINT kaldb_researcher_pkey PRIMARY KEY (id);


--
-- Name: kaldb_researcher_research_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_research_interests
    ADD CONSTRAINT kaldb_researcher_research_interests_pkey PRIMARY KEY (id);


--
-- Name: kaldb_researcher_research_interests_researcher_id_dfdce2f7_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_research_interests
    ADD CONSTRAINT kaldb_researcher_research_interests_researcher_id_dfdce2f7_uniq UNIQUE (researcher_id, interest_id);


--
-- Name: kaldb_researcher_specialism_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_specialisms
    ADD CONSTRAINT kaldb_researcher_specialism_pkey PRIMARY KEY (id);


--
-- Name: kaldb_researcher_specialism_researcher_id_127d5a66_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_specialisms
    ADD CONSTRAINT kaldb_researcher_specialism_researcher_id_127d5a66_uniq UNIQUE (researcher_id, specialism_id);


--
-- Name: kaldb_researcher_teaching_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_teaching_interests
    ADD CONSTRAINT kaldb_researcher_teaching_interests_pkey PRIMARY KEY (id);


--
-- Name: kaldb_researcher_teaching_interests_researcher_id_f8d00abe_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_researcher_teaching_interests
    ADD CONSTRAINT kaldb_researcher_teaching_interests_researcher_id_f8d00abe_uniq UNIQUE (researcher_id, interest_id);


--
-- Name: kaldb_specialism_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_specialism
    ADD CONSTRAINT kaldb_specialism_pkey PRIMARY KEY (id);


--
-- Name: kaldb_title_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY kaldb_title
    ADD CONSTRAINT kaldb_title_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_group_id_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestri_pageviewrestriction_id_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_42ad6e02_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_42ad6e02_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: kal; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_blogpost_92482941; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX cms_blogpost_92482941 ON cms_blogpost USING btree (feed_image_id);


--
-- Name: cms_blogposttag_09a80f33; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX cms_blogposttag_09a80f33 ON cms_blogposttag USING btree (content_object_id);


--
-- Name: cms_blogposttag_76f094bc; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX cms_blogposttag_76f094bc ON cms_blogposttag USING btree (tag_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: kaldb_department_5bb92a88; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_department_5bb92a88 ON kaldb_department USING btree (faculty_id);


--
-- Name: kaldb_interest_related_interests_8b18d397; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_interest_related_interests_8b18d397 ON kaldb_interest_related_interests USING btree (from_interest_id);


--
-- Name: kaldb_interest_related_interests_9634654e; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_interest_related_interests_9634654e ON kaldb_interest_related_interests USING btree (to_interest_id);


--
-- Name: kaldb_outreachcity_93bfec8a; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachcity_93bfec8a ON kaldb_outreachcity USING btree (country_id);


--
-- Name: kaldb_outreachevent_022da955; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachevent_022da955 ON kaldb_outreachevent USING btree (researcher_id);


--
-- Name: kaldb_outreachevent_9399d341; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachevent_9399d341 ON kaldb_outreachevent USING btree (frequency_id);


--
-- Name: kaldb_outreachevent_c20e5590; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachevent_c20e5590 ON kaldb_outreachevent USING btree (medium_id);


--
-- Name: kaldb_outreachevent_e274a5da; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachevent_e274a5da ON kaldb_outreachevent USING btree (location_id);


--
-- Name: kaldb_outreachlocation_93bfec8a; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachlocation_93bfec8a ON kaldb_outreachlocation USING btree (country_id);


--
-- Name: kaldb_outreachlocation_c7141997; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_outreachlocation_c7141997 ON kaldb_outreachlocation USING btree (city_id);


--
-- Name: kaldb_researcher_1f38f0e7; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_1f38f0e7 ON kaldb_researcher USING btree (title_id);


--
-- Name: kaldb_researcher_bce5bd07; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_bce5bd07 ON kaldb_researcher USING btree (position_id);


--
-- Name: kaldb_researcher_bf691be4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_bf691be4 ON kaldb_researcher USING btree (department_id);


--
-- Name: kaldb_researcher_research_interests_022da955; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_research_interests_022da955 ON kaldb_researcher_research_interests USING btree (researcher_id);


--
-- Name: kaldb_researcher_research_interests_774f0487; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_research_interests_774f0487 ON kaldb_researcher_research_interests USING btree (interest_id);


--
-- Name: kaldb_researcher_role_id_281dd5fb_uniq; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_role_id_281dd5fb_uniq ON kaldb_researcher USING btree (role_id);


--
-- Name: kaldb_researcher_specialism_022da955; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_specialism_022da955 ON kaldb_researcher_specialisms USING btree (researcher_id);


--
-- Name: kaldb_researcher_specialism_a8156c1e; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_specialism_a8156c1e ON kaldb_researcher_specialisms USING btree (specialism_id);


--
-- Name: kaldb_researcher_teaching_interests_022da955; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_teaching_interests_022da955 ON kaldb_researcher_teaching_interests USING btree (researcher_id);


--
-- Name: kaldb_researcher_teaching_interests_774f0487; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX kaldb_researcher_teaching_interests_774f0487 ON kaldb_researcher_teaching_interests USING btree (interest_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_content_type_id_196cc965_idx; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id_196cc965_idx ON taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_groupcollectionpermission_0a1a4dd8; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0a1a4dd8 ON wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_0e939a4f; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_0e939a4f ON wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_8373b171; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_groupcollectionpermission_8373b171 ON wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637_uniq; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637_uniq ON wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b_uniq; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b_uniq ON wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c_uniq ON wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_0e939a4f; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_0e939a4f ON wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_9bdbac54; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_9bdbac54 ON wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_0a1a4dd8; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtaildocs_document_0a1a4dd8 ON wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_0a1a4dd8; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_image_0a1a4dd8 ON wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4_uniq; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4_uniq ON wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_58c64917; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_58c64917 ON wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: kal; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: D6153c3498c9836c76562dfe1e22f279; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT "D6153c3498c9836c76562dfe1e22f279" FOREIGN KEY (pageviewrestriction_id) REFERENCES wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_blog_content_object_id_8f5044b7_fk_cms_blogpost_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogposttag
    ADD CONSTRAINT cms_blog_content_object_id_8f5044b7_fk_cms_blogpost_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES cms_blogpost(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_blogindexpage_page_ptr_id_1391b50a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogindexpage
    ADD CONSTRAINT cms_blogindexpage_page_ptr_id_1391b50a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_blogpost_feed_image_id_d43c26e4_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogpost
    ADD CONSTRAINT cms_blogpost_feed_image_id_d43c26e4_fk_wagtailimages_image_id FOREIGN KEY (feed_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_blogpost_page_ptr_id_119a50c7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogpost
    ADD CONSTRAINT cms_blogpost_page_ptr_id_119a50c7_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_blogposttag_tag_id_2d9f1e41_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_blogposttag
    ADD CONSTRAINT cms_blogposttag_tag_id_2d9f1e41_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_homepage
    ADD CONSTRAINT cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_indexpage_page_ptr_id_66d6c698_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_indexpage
    ADD CONSTRAINT cms_indexpage_page_ptr_id_66d6c698_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_richtextpage_page_ptr_id_eb2bfc13_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY cms_richtextpage
    ADD CONSTRAINT cms_richtextpage_page_ptr_id_eb2bfc13_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_department_faculty_id_65dfe6c4_fk_kaldb_faculty_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_department
    ADD CONSTRAINT kaldb_department_faculty_id_65dfe6c4_fk_kaldb_faculty_id FOREIGN KEY (faculty_id) REFERENCES kaldb_faculty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_interest_r_from_interest_id_651d1937_fk_kaldb_interest_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_interest_related_interests
    ADD CONSTRAINT kaldb_interest_r_from_interest_id_651d1937_fk_kaldb_interest_id FOREIGN KEY (from_interest_id) REFERENCES kaldb_interest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_interest_rel_to_interest_id_5f602592_fk_kaldb_interest_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_interest_related_interests
    ADD CONSTRAINT kaldb_interest_rel_to_interest_id_5f602592_fk_kaldb_interest_id FOREIGN KEY (to_interest_id) REFERENCES kaldb_interest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outre_frequency_id_17873a38_fk_kaldb_outreachfrequency_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachevent
    ADD CONSTRAINT kaldb_outre_frequency_id_17873a38_fk_kaldb_outreachfrequency_id FOREIGN KEY (frequency_id) REFERENCES kaldb_outreachfrequency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreac_location_id_fc5a3e5d_fk_kaldb_outreachlocation_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachevent
    ADD CONSTRAINT kaldb_outreac_location_id_fc5a3e5d_fk_kaldb_outreachlocation_id FOREIGN KEY (location_id) REFERENCES kaldb_outreachlocation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreachc_country_id_68e57ad9_fk_kaldb_outreachcountry_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachcity
    ADD CONSTRAINT kaldb_outreachc_country_id_68e57ad9_fk_kaldb_outreachcountry_id FOREIGN KEY (country_id) REFERENCES kaldb_outreachcountry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreacheve_medium_id_2386d230_fk_kaldb_outreachmedium_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachevent
    ADD CONSTRAINT kaldb_outreacheve_medium_id_2386d230_fk_kaldb_outreachmedium_id FOREIGN KEY (medium_id) REFERENCES kaldb_outreachmedium(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreacheve_researcher_id_078c75c0_fk_kaldb_researcher_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachevent
    ADD CONSTRAINT kaldb_outreacheve_researcher_id_078c75c0_fk_kaldb_researcher_id FOREIGN KEY (researcher_id) REFERENCES kaldb_researcher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreachl_country_id_08ec07be_fk_kaldb_outreachcountry_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachlocation
    ADD CONSTRAINT kaldb_outreachl_country_id_08ec07be_fk_kaldb_outreachcountry_id FOREIGN KEY (country_id) REFERENCES kaldb_outreachcountry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_outreachlocatio_city_id_da2a0f32_fk_kaldb_outreachcity_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_outreachlocation
    ADD CONSTRAINT kaldb_outreachlocatio_city_id_da2a0f32_fk_kaldb_outreachcity_id FOREIGN KEY (city_id) REFERENCES kaldb_outreachcity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher__researcher_id_0409ff69_fk_kaldb_researcher_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_specialisms
    ADD CONSTRAINT kaldb_researcher__researcher_id_0409ff69_fk_kaldb_researcher_id FOREIGN KEY (researcher_id) REFERENCES kaldb_researcher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher__researcher_id_6a6ac2c0_fk_kaldb_researcher_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_teaching_interests
    ADD CONSTRAINT kaldb_researcher__researcher_id_6a6ac2c0_fk_kaldb_researcher_id FOREIGN KEY (researcher_id) REFERENCES kaldb_researcher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher__researcher_id_d5818edf_fk_kaldb_researcher_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_research_interests
    ADD CONSTRAINT kaldb_researcher__researcher_id_d5818edf_fk_kaldb_researcher_id FOREIGN KEY (researcher_id) REFERENCES kaldb_researcher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher__specialism_id_4ac0e012_fk_kaldb_specialism_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_specialisms
    ADD CONSTRAINT kaldb_researcher__specialism_id_4ac0e012_fk_kaldb_specialism_id FOREIGN KEY (specialism_id) REFERENCES kaldb_specialism(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_department_id_aae0bdc8_fk_kaldb_department_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher
    ADD CONSTRAINT kaldb_researcher_department_id_aae0bdc8_fk_kaldb_department_id FOREIGN KEY (department_id) REFERENCES kaldb_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_position_id_f6137fd6_fk_kaldb_jobposition_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher
    ADD CONSTRAINT kaldb_researcher_position_id_f6137fd6_fk_kaldb_jobposition_id FOREIGN KEY (position_id) REFERENCES kaldb_jobposition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_rese_interest_id_1ccc250c_fk_kaldb_interest_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_research_interests
    ADD CONSTRAINT kaldb_researcher_rese_interest_id_1ccc250c_fk_kaldb_interest_id FOREIGN KEY (interest_id) REFERENCES kaldb_interest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_role_id_281dd5fb_fk_kaldb_jobrole_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher
    ADD CONSTRAINT kaldb_researcher_role_id_281dd5fb_fk_kaldb_jobrole_id FOREIGN KEY (role_id) REFERENCES kaldb_jobrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_teac_interest_id_cd6c71b2_fk_kaldb_interest_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher_teaching_interests
    ADD CONSTRAINT kaldb_researcher_teac_interest_id_cd6c71b2_fk_kaldb_interest_id FOREIGN KEY (interest_id) REFERENCES kaldb_interest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kaldb_researcher_title_id_e440e27c_fk_kaldb_title_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY kaldb_researcher
    ADD CONSTRAINT kaldb_researcher_title_id_e440e27c_fk_kaldb_title_id FOREIGN KEY (title_id) REFERENCES kaldb_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagge_content_type_id_9957a03c_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore__content_type_id_c28424df_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_c28424df_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_collection_id_5423575a_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupc_permission_id_1b626275_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionp_group_id_05d61460_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepe_page_id_710b114a_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_fc07e671_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_d421cc1d_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_15a8bea6_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestrict_group_id_6460f223_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_collection_id_23881625_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_17258b41_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_e48e93e7_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimag_collection_id_c2f8af7e_fk_wagtailcore_collection_id FOREIGN KEY (collection_id) REFERENCES wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_5d73dc75_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_3e1fd774_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_b5728a8f_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_780a0e1e_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_edito_query_id_c6eee4a0_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_28cbc274_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_2185994b_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: kal
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

