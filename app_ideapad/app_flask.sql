PGDMP      7                |         	   app_flask    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387 	   app_flask    DATABASE     �   CREATE DATABASE app_flask WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE app_flask;
                     postgres    false            �            1259    16388    administrador    TABLE     m   CREATE TABLE public.administrador (
    id_user character varying(20),
    password character varying(20)
);
 !   DROP TABLE public.administrador;
       public         heap r       postgres    false            �            1259    16391    curso_id_curso_seq    SEQUENCE     ~   CREATE SEQUENCE public.curso_id_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;
 )   DROP SEQUENCE public.curso_id_curso_seq;
       public               postgres    false            �            1259    16392    curso    TABLE     �  CREATE TABLE public.curso (
    id_curso integer DEFAULT nextval('public.curso_id_curso_seq'::regclass) NOT NULL,
    nombre character varying(100),
    ponente character varying(100),
    fecha_inicio timestamp without time zone,
    fecha_fin date,
    minimo integer,
    maximo integer,
    descripcion text,
    localidad character varying(100),
    salon character varying(100),
    status text DEFAULT 'progreso'::text,
    hora time without time zone,
    canthoras integer
);
    DROP TABLE public.curso;
       public         heap r       postgres    false    218            �            1259    16399    curso_trabajador    TABLE     �   CREATE TABLE public.curso_trabajador (
    id_curso integer NOT NULL,
    id_trabajador integer NOT NULL,
    status character varying(10) DEFAULT 'activo'::character varying
);
 $   DROP TABLE public.curso_trabajador;
       public         heap r       postgres    false            �            1259    16403    sec_idtarea    SEQUENCE     t   CREATE SEQUENCE public.sec_idtarea
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sec_idtarea;
       public               postgres    false            �            1259    16404    tarea    TABLE     �   CREATE TABLE public.tarea (
    id_tarea integer DEFAULT nextval('public.sec_idtarea'::regclass) NOT NULL,
    id_curso integer NOT NULL,
    descripcion text
);
    DROP TABLE public.tarea;
       public         heap r       postgres    false    221            �            1259    16410 
   trabajador    TABLE     �   CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    nombre character varying(100),
    apellido character varying(100),
    clave character varying(15)
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �          0    16388    administrador 
   TABLE DATA           :   COPY public.administrador (id_user, password) FROM stdin;
    public               postgres    false    217   d       �          0    16392    curso 
   TABLE DATA           �   COPY public.curso (id_curso, nombre, ponente, fecha_inicio, fecha_fin, minimo, maximo, descripcion, localidad, salon, status, hora, canthoras) FROM stdin;
    public               postgres    false    219   �       �          0    16399    curso_trabajador 
   TABLE DATA           K   COPY public.curso_trabajador (id_curso, id_trabajador, status) FROM stdin;
    public               postgres    false    220   "       �          0    16404    tarea 
   TABLE DATA           @   COPY public.tarea (id_tarea, id_curso, descripcion) FROM stdin;
    public               postgres    false    222   X"       �          0    16410 
   trabajador 
   TABLE DATA           L   COPY public.trabajador (id_trabajador, nombre, apellido, clave) FROM stdin;
    public               postgres    false    223   �"       �           0    0    curso_id_curso_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.curso_id_curso_seq', 21, true);
          public               postgres    false    218            �           0    0    sec_idtarea    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sec_idtarea', 8, true);
          public               postgres    false    221            7           2606    16414    curso curso_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public                 postgres    false    219            9           2606    16416 &   curso_trabajador curso_trabajador_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT curso_trabajador_pkey PRIMARY KEY (id_curso, id_trabajador);
 P   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT curso_trabajador_pkey;
       public                 postgres    false    220    220            ;           2606    16418    tarea tarea_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id_tarea, id_curso);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public                 postgres    false    222    222            =           2606    16420    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    223            >           2606    16421    curso_trabajador id_curso    FK CONSTRAINT        ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_curso;
       public               postgres    false    4663    219    220            ?           2606    16426    curso_trabajador id_trabajador    FK CONSTRAINT     �   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_trabajador FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 H   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_trabajador;
       public               postgres    false    4669    223    220            @           2606    16431    tarea tarea_id_curso_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_id_curso_fkey;
       public               postgres    false    222    4663    219            �      x�+-.M,���44261����� =�      �   g  x��Kr�F�ףS�(A�zd��)�RE)��i�ȃx,I��r1�C�A�d'-PEJt���M��f�T�%�?|�-����5���w�jw��������>�=Et��d��{j����IĽ�	i��$)��&j�:kҔ�g	��H�D;�l-�ڇA����e��X�6��D����vJY��.��4|�J,%��t����Ӧ�.!����/��.���wF62Vf%!0��ү9pm� 	�r�<�6@�A�%P�\��P�zB�3&�=}/�jJ��Ӕ�Cp�LhXr��9݉��L`�J��e-��o�E�E����D��cN�`Bl�ڜ譫��t��P1�EW�-JB��%��P5��%G��$�%	M�7���pC�;��l����\A�q��XN_�ĂH:����`s%K��ʇ��,��,�6S�����ܕ:�R<G�9&_r��Q+�3��j�ZY��(�ɬ�����#�^�0}�n<�����[͞=?��#�#Я
t����#��;��tS �_���QV���:�BU#�#ٯJ�䟩�*u!�4��)�>�Ug=��*q������:PG#�#د۲�ش
���'��7s5����si���ݬ�g��7��Ì��t�p�U�W`]��Yh�1���4k�t����U��`r8�=����=�J���T���w��H�C�>zL�|wvP�홢!d��ٱg�N��c������o��}i����e\/��^��a�Q]�Ŧ{���6�:k[��;����gg�9f��f0���pw�R�ݲ��g�[��G��2�ɀp�-+��7����4��FP>�9��>b���&�8*��p��5�C�]�x���S:��8�F���k����5>wYs�}u���9�o�a�\&p�kE2���C�uo��*ly='�QK�{��%T�P�_��-5�[�<���WX;��t���J���Q�x9���74�[_
�`�V��:��B��3y�Ɛq�Td�����1���T-&�ުR�+�ʔ���\*��{�05֌�9 �-7�[n*Us�&�8�R��K0�E�ǅc������+=�p�Q��a����T�Dl��:���� 2�      �   B   x�34�4��02�LL.�,��24���2�s2�S�9���UU��_P��^�Z������ ��      �   f   x�M�1�0��>EO����t��EBI��8?	�e(r���-c_�\\w�fX:���ȋod_-�95�m��ب�~U̘��V�E���:��A%C      �   K   x�367��4�,HL���,�O����22 SΜ��bΜ���*NC#cS.CK##��Բ�<����b�x� �-     