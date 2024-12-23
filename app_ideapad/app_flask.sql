PGDMP      -                |         	   app_flask    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public               postgres    false    220   "       �          0    16404    tarea 
   TABLE DATA           @   COPY public.tarea (id_tarea, id_curso, descripcion) FROM stdin;
    public               postgres    false    222   ["       �          0    16410 
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
       public               postgres    false    222    4663    219            �      x�+-.M,���44261����� =�      �   i  x��Y�R�H}��?��,���[j�f�E�l�)/�QK2�Q���j�a,gl��}#����O��3�3r5S�r+Q���oY\Ϸ>��l~�_U���f��_��Q(�s�'3��S�M"�%MH{E'I97f0QבX���6�H8-Gr&�	ek��>�4dM�-�t%R�)m$g� b��;�8�]��ix��J,%��t����Ӧ�.!����/��.���wA64Vf%!0��ү9pm
	�r�<�6��A�%Q�\��`�zB�3&�5}-�fJ�Ӕ�Cr�LhXr���9ݓ��L�J��e-��oօ�U����D�Ǖ`N 0!� 7'z��u0�C!|&$T�|�Ug��P�z	���t��(֖�$����8��ܙ�@gS�ޯ�
�x���r��$dҹu4䀘+Y]X>��em1��B>h3���.> �����d]�|�u�Vrg8M�`��]Q��Yy��#^{'ꭔ�����( J~� �j�\��S��p�(�Wt����A/�vr��,� U2k�������5��:�=*�U������*u%�4��9�>�U=z�.q��]��u�NFa��~ݑ�ƦUx�_���t��6H�TG]J<���n���G}���~�حq(�7^UE���"�cuqIGu�5G����Q�U��19�=��g�%�/��a��X���7H��o��qh�<U�|vT��L��Լ��r��g�ΐ�����T~���ِ���g��̫��&vp;�k��tO<���V��h[��;���#���9��xC�����ڥj�e��`j��H�2�	�@��V��/t���i��͠:~~���3|����|0�Q����A��2���{��?������0t^]rm��v��g���:�_������O��f�;W��g6|^<�Gx��Va��9I��Zz��.��D���P��P��dl��1D���^b^a� ��A*+q��Gy�r
��74�;_�}�b}�b!X��3u��Pq U:2�N��h�����[U�pCX�r�=�X�M���9�f$�ف9܁�T��d�[��D�%���-�gJ���@ÉG�C�mV�m����e�y�����cج      �   C   x�34�4��02�LL.�,��24���2�s2�S�9���Y�����(?�(��
Cc� Tf      �   f   x�M�1�0��>EO����t��EBI��8?	�e(r���-c_�\\w�fX:���ȋod_-�95�m��ب�~U̘��V�E���:��A%C      �   K   x�367��4�,HL���,�O����22 SΜ��bΜ���*NC#cS.CK##��Բ�<����b�x� �-     