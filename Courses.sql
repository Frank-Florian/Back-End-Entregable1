
CREATE TABLE "Users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(60) NOT NULL,
  "email" varchar(40) UNIQUE,
  "password" varchar(30) NOT NULL,
  "age" int NOT NULL,
  "role_id" int
);

CREATE TABLE "Courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(60) NOT NULL,
  "description" varchar(255) NOT NULL,
  "level" varchar(60) NOT NULL,
  "teacher" varchar(60) NOT NULL,
  "category_id" int,
  "user_id" int
);

CREATE TABLE "CourseVideos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(60) NOT NULL,
  "url" varchar(60) NOT NULL,
  "course_id" int
);

CREATE TABLE "Categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(60) NOT NULL
);

CREATE TABLE "Roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(60) NOT NULL
);

CREATE TABLE "pivot_courses_categories" (
  "course_id" int,
  "category_id" int
);

ALTER TABLE "Roles" ADD FOREIGN KEY ("id") REFERENCES "Users" ("role_id");

ALTER TABLE "Categories" ADD FOREIGN KEY ("id") REFERENCES "Courses" ("category_id");

ALTER TABLE "Users" ADD FOREIGN KEY ("id") REFERENCES "Courses" ("user_id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("id") REFERENCES "CourseVideos" ("course_id");

ALTER TABLE "Courses" ADD FOREIGN KEY ("id") REFERENCES "pivot_courses_categories" ("course_id");

ALTER TABLE "Categories" ADD FOREIGN KEY ("id") REFERENCES "pivot_courses_categories" ("category_id");


/* COMANDOS

INSERT INTO "Roles" ("name") VALUES ('student'), ('teacher'), ('admin');


INSERT INTO "Users" ("name", "email", "password", "age", "role_id")
VALUES ('Frank', 'frank@academlo.com', 'password1', 18, 1),
       ('Florian', 'florian@academlo.com', 'password2', 28, 2);


INSERT INTO "Courses" ("title", "description", "level", "teacher", "category_id", "user_id")
VALUES ('Curso de Programación en Python', 'Aprende a programar en Python desde cero', 'Básico', 'Frank', 1, 1),
       ('Curso Back-End', 'Aprende a utilizar herramientas desde cero', 'Intermedio', 'Florian', 2, 2);


INSERT INTO "CourseVideos" ("title", "url", "course_id")
VALUES ('Video 1', 'https://academlo.com/video1', 1),
       ('Video 2', 'https://academlo.com/video2', 1);


INSERT INTO "Categories" ("name") VALUES ('Back-End', 'Front-End');