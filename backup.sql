-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: myapp_development
-- Generation Time: 2021-11-29 09:22:28.7490
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."ar_internal_metadata";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."ar_internal_metadata" (
    "key" varchar NOT NULL,
    "value" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "public"."articles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS articles_id_seq;

-- Table Definition
CREATE TABLE "public"."articles" (
    "id" int8 NOT NULL DEFAULT nextval('articles_id_seq'::regclass),
    "title" varchar,
    "body" text,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "status" varchar,
    "user_id" int8,
    "image" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."comments";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS comments_id_seq;

-- Table Definition
CREATE TABLE "public"."comments" (
    "id" int8 NOT NULL DEFAULT nextval('comments_id_seq'::regclass),
    "commenter" varchar,
    "body" text,
    "article_id" int8 NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "status" varchar,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."friends";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS friends_id_seq;

-- Table Definition
CREATE TABLE "public"."friends" (
    "id" int8 NOT NULL DEFAULT nextval('friends_id_seq'::regclass),
    "first_name" varchar,
    "last_name" varchar,
    "email" varchar,
    "phone" varchar,
    "twitter" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."schema_migrations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."schema_migrations" (
    "version" varchar NOT NULL,
    PRIMARY KEY ("version")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" varchar NOT NULL,
    "password_digest" varchar,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "role" int4,
    "image" varchar,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."ar_internal_metadata" ("key", "value", "created_at", "updated_at") VALUES
('environment', 'development', '2021-11-29 02:13:29.56464', '2021-11-29 02:13:29.56464');

INSERT INTO "public"."articles" ("id", "title", "body", "created_at", "updated_at", "status", "user_id", "image") VALUES
(1, 'HAPPY TEACHER''S DAY', 'Thanks for all your giving during the last time at WATA and your effort for Tech Hub', '2021-11-25 05:58:11.412142', '2021-11-26 10:28:34.842146', 'archived', 23, '259619859_1969124803261921_2324613940825805483_n.jpeg'),
(2, 'Chuyên mục: CHUYỆN NGƯỜI TRONG NGHỀ - IT LIFE WITH WATA', 'Series hỏi đáp và chia sẻ của các IT-ers về ngành nghề cũng như cảm nhận của các nhân viên khi làm việc tại công ty. ', '2021-11-25 06:00:40.866962', '2021-11-26 10:27:50.195446', 'public', 23, '242279374_1924308737743528_8540122113123231539_n.png'),
(5, 'HAPPY VIETNAMESE WOMEN''S DAY', ' Thank you for motivating us through your work and personality. Happy Women’s Day', '2021-11-26 01:45:57.739396', '2021-11-26 10:22:25.571542', 'public', 22, '245934414_1943694552471613_4165471691454490017_n.jpeg'),
(6, 'HOT JOB - HOT REFERRAL BONUS', 'WATA hiện đang cần chiêu mộ thêm thật nhiều Chiến binh gia nhập vào đội quân tinh nhuệ', '2021-11-26 01:46:01.87985', '2021-11-26 10:23:03.032096', 'public', 22, '241533683_1944665429041192_4673978387091101080_n.png'),
(7, 'title 7 hoangvanhoa2', 'text text text text text ', '2021-11-26 01:46:07.812855', '2021-11-26 10:38:11.729537', 'public', 22, '1BE1C71E-D8E1-46A9-AE91-490FDFF2AD93.jpg'),
(8, 'Title hoangvanhoa2@gmail.com ', 'Body hoangvanhoa2@gmail.com ', '2021-11-26 06:41:29.337628', '2021-11-26 06:41:29.337628', 'public', 22, ''),
(9, 'title 1', 'content content content content content content ', '2021-11-26 08:16:58.746309', '2021-11-26 08:16:58.746309', 'public', 22, ''),
(10, 'title 1', 'Body Body Body Body Body', '2021-11-26 08:19:49.172759', '2021-11-26 08:19:49.172759', 'public', 22, ''),
(11, 'title 1', 'BodyBodyBodyBodyBodyBody', '2021-11-26 08:28:13.125663', '2021-11-26 08:28:13.125663', 'public', 22, ''),
(12, '123', '12312312312', '2021-11-26 08:35:51.710231', '2021-11-26 08:35:51.710231', 'public', 22, ''),
(13, 'title 1', 'Body Body Body Body Body Body', '2021-11-26 09:27:40.262145', '2021-11-26 09:27:40.262145', 'public', 22, '721D2AAD-CC66-467B-8A4F-6E8B99D2984D.jpg'),
(14, 'title 1', 'Body Body Body Body Body Body', '2021-11-26 09:28:48.509946', '2021-11-26 09:28:48.509946', 'public', 22, '721D2AAD-CC66-467B-8A4F-6E8B99D2984D.jpg'),
(15, 'title 2', 'Body Body Body Body Body Body Body Body Body', '2021-11-26 10:06:53.822566', '2021-11-26 10:06:53.822566', 'public', 22, '1BE1C71E-D8E1-46A9-AE91-490FDFF2AD93.jpg');

INSERT INTO "public"."comments" ("id", "commenter", "body", "article_id", "created_at", "updated_at", "status") VALUES
(2, 'liu liu', 'liu liuliu liuliu liuliu liuliu liuliu liu', 2, '2021-11-25 06:46:19.089544', '2021-11-25 06:46:19.089544', ''),
(3, 'liu liu 2', 'liu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liuliu liu', 2, '2021-11-25 07:01:58.690107', '2021-11-25 07:01:58.690107', 'private'),
(4, 'hid', 'hidhidhidhidhidhidhidhidhid', 2, '2021-11-25 07:13:59.392545', '2021-11-25 07:13:59.392545', 'archived'),
(5, 'prv', 'prvprvprvprvprvprv', 2, '2021-11-25 07:14:31.247402', '2021-11-25 07:14:31.247402', 'private'),
(6, 'private1', '12312312311323132', 2, '2021-11-25 07:16:19.962795', '2021-11-25 07:16:19.962795', 'private'),
(7, 'Dev', 'Great!', 1, '2021-11-26 10:33:00.016296', '2021-11-26 10:33:00.016296', 'public');

INSERT INTO "public"."friends" ("id", "first_name", "last_name", "email", "phone", "twitter", "created_at", "updated_at") VALUES
(1, 'Hoàng', 'Hòa', 'hoangvanhoa1@gmail.com', '012312312', '@hoangvanhoa1', '2021-11-24 09:21:43.677458', '2021-11-24 09:21:43.677458'),
(3, 'Hoàng', 'Hòa 2', 'hoangvanhoa2@gmail.com', '12312312', '@hoangvanhoa2', '2021-11-24 11:39:11.556213', '2021-11-24 11:39:11.556213');

INSERT INTO "public"."schema_migrations" ("version") VALUES
('20211123080150'),
('20211124090534'),
('20211125034151'),
('20211125064131'),
('20211125065820'),
('20211125065828'),
('20211126045518'),
('20211126050735'),
('20211126074651'),
('20211126091247');

INSERT INTO "public"."users" ("id", "email", "password_digest", "created_at", "updated_at", "role", "image") VALUES
(22, 'hoangvanhoa2@gmail.com', '$2a$12$/cZB.hnV/fnxiRunuONlNOAIGQGPiUuQIeWt5Sza3jVDXU4Um6mKW', '2021-11-24 07:20:23.439007', '2021-11-24 08:08:16.372942', 1, ''),
(23, 'hoangvanhoa1701@gmail.com', '$2a$12$fh2rk5cp40Yz7RH0.GfMYe1Hqvp5cIfQlXkOZA9O6gNBbnuloQ35S', '2021-11-25 01:39:11.363536', '2021-11-25 01:39:11.363536', 1, ''),
(26, 'hoangvanhoa3@gmail.com', '$2a$12$STwH97yySESAfHOhgXEzMOnNBUlZEPVRmxbEqpllhIUdMtqp4z/vO', '2021-11-26 06:33:56.368102', '2021-11-26 06:33:56.368102', 1, ''),
(27, 'admin@gmail.com', '$2a$12$AFSXNriR9S/Kqyr6IOrmp.xNvCZGw71YTxZHcn43vS.gCss5UUxUW', '2021-11-26 06:35:02.130231', '2021-11-26 06:35:02.130231', 0, '');

ALTER TABLE "public"."comments" ADD FOREIGN KEY ("article_id") REFERENCES "public"."articles"("id");
