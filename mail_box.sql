PGDMP                         z           mail_box    14.4    14.4     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    mail_box    DATABASE     l   CREATE DATABASE mail_box WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE mail_box;
                postgres    false            ?            1259    16407    login    TABLE     z   CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);
    DROP TABLE public.login;
       public         heap    postgres    false            ?            1259    16406    login_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.login_id_seq;
       public          postgres    false    212                       0    0    login_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;
          public          postgres    false    211            ?            1259    16418    messages    TABLE       CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    content text NOT NULL,
    date_sent timestamp without time zone NOT NULL,
    "isRead" boolean DEFAULT false NOT NULL,
    subject text NOT NULL
);
    DROP TABLE public.messages;
       public         heap    postgres    false            ?            1259    16417    messages_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    214                       0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    213            ?            1259    16396    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    joined timestamp without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16395    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209            g           2604    16410    login id    DEFAULT     d   ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);
 7   ALTER TABLE public.login ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            h           2604    16421    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            f           2604    16399    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210                      0    16407    login 
   TABLE DATA           0   COPY public.login (id, hash, email) FROM stdin;
    public          postgres    false    212   ?                 0    16418    messages 
   TABLE DATA           e   COPY public.messages (id, sender_id, receiver_id, content, date_sent, "isRead", subject) FROM stdin;
    public          postgres    false    214   ?                 0    16396    users 
   TABLE DATA           8   COPY public.users (id, name, email, joined) FROM stdin;
    public          postgres    false    210   &%                  0    0    login_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.login_id_seq', 3, true);
          public          postgres    false    211                       0    0    messages_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.messages_id_seq', 8, true);
          public          postgres    false    213                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public          postgres    false    209            o           2606    16416    login login_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.login DROP CONSTRAINT login_email_key;
       public            postgres    false    212            q           2606    16414    login login_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.login DROP CONSTRAINT login_pkey;
       public            postgres    false    212            s           2606    16425    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    214            k           2606    16405    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    210            m           2606    16403    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            u           2606    16431 "   messages messages_receiver_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_receiver_id_fkey;
       public          postgres    false    210    214    3181            t           2606    16426     messages messages_sender_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_sender_id_fkey;
       public          postgres    false    3181    210    214               ?   x?M??n?0  ?3|gh?5?6ѭ?u???!^Z?????5u~?N&?x?b@?6g???tCG????~??T?))?4?[4#N?_????roR\???Z?????l???????#f?/?X}ù?,???3?e??ѭt?U7חz?ʛB?
????E?e?#????xI???CSF??O?f??l]btT??`??\?_?9H?K???????!pN?         ?  x??V?r?6>KO?=?f??ۉ/??i??ĝLݴ??s?ȥ???Hѭ???????%?N?????e??b????|r29??`(???ݵ{E???c???ɺ|?+??????Ϧ???n?-RL&$???R??H?.rL??@Wy|H??#?d?]???Z???:Z0??l??j??LGq?g\?????p?ρr??77?+??/-o????6&?O˲qmS?[-%řT????&?^?7mk???7z?T?-?I?3??EYN?q???;?F?=?C/M???????????p~J?'????ώOM?????ٙ(????9?3??????N~?c*J?K?u~-?恐T?A!??>Gb?f>'M??Z<!_????F*_?"??_???_=h??-???Q?:Xe??2K-?ǟ}d??8?T?V???jS?C???r???6PT$??? H??/l'O5D6??Z?b??$[??v٦(????U?ɵS?ިF?m=Ӎ?k???C????v?]??t?M???<G?8J?B?p??O???ɏ" @G?}?j?????ě1?Q?
rƩ?????	do?T/pA???????E?Pi??]w?l??i
eo???F???DUtوO0ͧ?
F?gE?Wq@<g??RvP~?$fIUX!U?Ԃ1;???C?++?+???oP?Pf1ܨ???-Z?k?????????W???a?nYl&Wy???tN/???Z{ ????k7=?g?L,<?<?P??U??L=?*?php6]B8????;??z?????3zx??@s#i???&?c??D????~FZeӠ5y?߁??T|??8??ݤ?+??.?>??W[????"?!ݒ\????A??շ?G@8JNǞ?g??/ ?R
l?t>????aU?#a?:?~P')????l?Y????M)?`[??T7䅮??,(??)?/o69????]???辨.<??A?c??)?9{اg??I????ؓ}?!?R?N??qw&YѰ"??X?*?)?~O?Bl?tYu?l?iGK?????0???8??aT.~?H??e?????q???p?0???;?'?t?3??)?K????D?-b?o??*?n???B??a?1W?#??`?|?s?"?1J???@6?qz?%%u??? ?.????"?ӻκ???ǎ?*?F4???????X?;???f?uI89?K???9=?*?g&{Ҧ????????.1?߽68???uo?????ʔ?[z??=]?0? ???s?2/???i?(?#?j?[J?%=NBX'~?r?'?,?)C)??l??Wz?[p?˝n???.7:????d{O?0???$?T-???4?Pg??dq7@?0e?=c?h:]t6ї?`ﷄ'???o[$???vh@?????????????K???M?? 9??P         j   x?}?I
?@ ??+???N??N???K\??8??Q?#???]3|???????ז?͟\1?US??pm???|谆!h???????%?z?闎???????)     