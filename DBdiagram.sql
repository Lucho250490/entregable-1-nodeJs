CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "firts__name" varchar NOT NULL,
  "last__name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "birthday" date NOT NULL,
  "phone" varchar DEFAULT '+12 123456'
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "courses" varchar NOT NULL,
  "id__user" int NOT NULL,
  "description" text NOT NULL,
  "level" int NOT NULL,
  "teacher" varchar NOT NULL
);

CREATE TABLE "courses__videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar,
  "id__courses" int
);

CREATE TABLE "courses_videos_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id__categories" int,
  "id__courses__videos" int
);

ALTER TABLE "courses_videos_categories" ADD FOREIGN KEY ("id__categories") REFERENCES "categories" ("id");

ALTER TABLE "courses_videos_categories" ADD FOREIGN KEY ("id__courses__videos") REFERENCES "courses__videos" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id__courses") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id__user") REFERENCES "users" ("id");
