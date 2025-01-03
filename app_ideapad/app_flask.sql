PGDMP                       }         	   app_flask    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap r       postgres    false            �            1259    16461    sec_h_curso    SEQUENCE     t   CREATE SEQUENCE public.sec_h_curso
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sec_h_curso;
       public               postgres    false            �            1259    16453    h_curso    TABLE     �   CREATE TABLE public.h_curso (
    id_curso integer DEFAULT nextval('public.sec_h_curso'::regclass),
    cant_horas integer,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone
);
    DROP TABLE public.h_curso;
       public         heap r       postgres    false    225            �            1259    16403    sec_idtarea    SEQUENCE     t   CREATE SEQUENCE public.sec_idtarea
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
    clave character varying(15),
    cedula integer,
    departamento character varying(50)
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �          0    16388    administrador 
   TABLE DATA           :   COPY public.administrador (id_user, password) FROM stdin;
    public               postgres    false    217   i#       �          0    16392    curso 
   TABLE DATA           �   COPY public.curso (id_curso, nombre, ponente, fecha_inicio, fecha_fin, minimo, maximo, descripcion, localidad, salon, status, hora, canthoras) FROM stdin;
    public               postgres    false    219   �#       �          0    16399    curso_trabajador 
   TABLE DATA           K   COPY public.curso_trabajador (id_curso, id_trabajador, status) FROM stdin;
    public               postgres    false    220   Z(       �          0    16453    h_curso 
   TABLE DATA           P   COPY public.h_curso (id_curso, cant_horas, fecha_inicio, fecha_fin) FROM stdin;
    public               postgres    false    224   �(       �          0    16404    tarea 
   TABLE DATA           @   COPY public.tarea (id_tarea, id_curso, descripcion) FROM stdin;
    public               postgres    false    222   �(       �          0    16410 
   trabajador 
   TABLE DATA           b   COPY public.trabajador (id_trabajador, nombre, apellido, clave, cedula, departamento) FROM stdin;
    public               postgres    false    223   h)       �           0    0    curso_id_curso_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.curso_id_curso_seq', 32, true);
          public               postgres    false    218            �           0    0    sec_h_curso    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sec_h_curso', 32, true);
          public               postgres    false    225            �           0    0    sec_idtarea    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sec_idtarea', 8, true);
          public               postgres    false    221            =           2606    16414    curso curso_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public                 postgres    false    219            ?           2606    16416 &   curso_trabajador curso_trabajador_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT curso_trabajador_pkey PRIMARY KEY (id_curso, id_trabajador);
 P   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT curso_trabajador_pkey;
       public                 postgres    false    220    220            A           2606    16418    tarea tarea_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id_tarea, id_curso);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public                 postgres    false    222    222            C           2606    16420    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    223            D           2606    16421    curso_trabajador id_curso    FK CONSTRAINT        ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_curso;
       public               postgres    false    4669    219    220            G           2606    16456    h_curso id_curso    FK CONSTRAINT     v   ALTER TABLE ONLY public.h_curso
    ADD CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 :   ALTER TABLE ONLY public.h_curso DROP CONSTRAINT id_curso;
       public               postgres    false    219    224    4669            E           2606    16426    curso_trabajador id_trabajador    FK CONSTRAINT     �   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_trabajador FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 H   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_trabajador;
       public               postgres    false    220    4675    223            F           2606    16431    tarea tarea_id_curso_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_id_curso_fkey;
       public               postgres    false    219    222    4669            �      x�+-.M,���44261����� =�      �   �  x��Y�n7}��b>@������q�Nm4E��2���p�/B��7��z(ɲ��m
p�li�{Μ�CrHWSu%�%�_}�9����j6�-N��d������u�6�G5WDW>HG�����[(�D�I��.�N�r nLo�6�%�&M�E6�p[��L�c��r�}�%�iȚ6[&iR�)m$g�@b�^9�� �6��4��a#��t}��L�;J�i�d�U��Ɨ{�˭a��N��l$&��)�M �#^��Ǵ
�ao	*7l-԰��|�B�@�4�߲Ӕ�Cpٌ�_s����DFi���3CCoYK`��uQ�&�^\c"��
���-��͉>zz�s��τ�
�[A\u�(	)��`��jB7k�bmI�K�����Π�ȭI	rv���V���7xN�P,�oLbA$��FA}������+���3��̈́^sF��� �R�&��}�ɗ\� ZIn���V֣*�u2������\���O_�[�"��Vӯ=�����C?��c���0�R�f'�=]���fk�_PV���fꥪNg�~Rgo����U��H��������@/Q%�?;{v�N��`���O;e�b�Rx�_�}��^X��n�	�^zw��:�؃�p���+㐎[n���Ŭˋb�3uqKGu�5G�������U�Hcr6�{��ח,�%n�a���0����v��5���Ѓ����Mlъ��ic���0�lT-���je�`�ޕH��o��o����w�Z�U�^}���h��@��Gcz��#.d! K�qL�ٻYj�/�G��wiaY����9�n�����/�p3���9S�a]�u���Uw�N~vR}����A�v�`�������F�}���� �@t�BC�K$�[jn� ������<��U6��{�+��4��i�\�>��W�}�>c X��3y�`ȸ�*��HZu��l�j1��V�2|"�L�tO={��L�M���90�Q�� ��,�h*Us� �Y��G��x,��-O����s@�����m�}���x��4����3:F���}�7�`~9�W�f���.�edy�u� ���@ ��^E���d�#�w��t4�����T-���ǐ�rt�rT��Wx���L�C2?�������4����aeV��<�1����,mm��¬�n2���I0�      �   2   x�34�4��02�L��K�ɬJL��2�42 ST1e��X��0�b���� �p�      �   F   x�3��4202�54�56P00�#�����)\��М��F��� S]C�����1L5X���:F��� �a�      �   f   x�M�1�0��>EO����t��EBI��8?	�e(r���-c_�\\w�fX:���ȋod_-�95�m��ب�~U̘��V�E���:��A%C      �   r   x�-�A
�0��c�-�T�D_���bp�P%=��u�{�ev�Β	6}��n�ĔB ������(RIP����H<�aʵ'x���Tǘe����k?�o
�I�a�E�u9����"(     