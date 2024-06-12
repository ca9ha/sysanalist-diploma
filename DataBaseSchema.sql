CREATE TYPE "roomType" AS ENUM (
  'Standart',
  'StandartPlus',
  'Lux'
);

CREATE TYPE "bookingStatus" AS ENUM (
  'New',
  'PendingConfirmation',
  'Confirmed',
  'PendingPayment',
  'Canceled',
  'Expired',
  'Completed'
);

CREATE TYPE "userRole" AS ENUM (
  'Customer',
  'Administrator'
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "phoneNumber" varchar,
  "role" userRole,
  "created_at" timestamp
);

CREATE TABLE "pets" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "name" varchar,
  "age" float,
  "additional_info" varchar,
  "photo_url" url,
  "created_at" timestamp
);

CREATE TABLE "rooms" (
  "id" integer PRIMARY KEY,
  "type" roomType,
  "description" varchar2,
  "dimension" varchar,
  "images" urls[],
  "cost" decimal
);

CREATE TABLE "bookings" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "checkin_date" timestamp,
  "checkout_date" timestamp,
  "user_id" integer,
  "pet_id" integer,
  "status" bookingStatus,
  "room_id" integer,
  "created_at" timestamp,
  "cost" decimal
);

COMMENT ON COLUMN "bookings"."status" IS 'Статус бронирования';

ALTER TABLE "bookings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "pets" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("room_id") REFERENCES "rooms" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("id");
