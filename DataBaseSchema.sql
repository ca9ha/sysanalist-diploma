CREATE TYPE "BookingStatus" AS ENUM (
  'New',
  'PendingConfirmation',
  'Confirmed',
  'PendingPayment',
  'Canceled',
  'Expired',
  'Completed'
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "phoneNumber" varchar,
  "role" type,
  "created_at" timestamp
);

CREATE TABLE "pets" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "name" varchar,
  "type" varchar,
  "age" float,
  "med_info" varchar,
  "additional_info" varchar,
  "photo_url" url,
  "created_at" timestamp
);

CREATE TABLE "rooms" (
  "id" integer PRIMARY KEY,
  "type" varchar,
  "description" varchar2,
  "images" urls[]
);

CREATE TABLE "bookings" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "checkin_date" timestamp,
  "checkout_date" timestamp,
  "user_id" integer,
  "pet_id" integer,
  "status" BookingStatus,
  "room_id" integer,
  "created_at" timestamp
);

COMMENT ON COLUMN "bookings"."status" IS 'Статус бронирования';

ALTER TABLE "bookings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "pets" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("room_id") REFERENCES "rooms" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("pet_id") REFERENCES "pets" ("id");
