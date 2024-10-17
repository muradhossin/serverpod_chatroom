BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat_message" (
    "id" bigserial PRIMARY KEY,
    "senderId" bigint NOT NULL,
    "receiverId" bigint NOT NULL,
    "message" text NOT NULL,
    "messageType" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isDelivered" boolean NOT NULL,
    "isSeen" boolean NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_status" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "isOnline" boolean NOT NULL,
    "lastSeen" timestamp without time zone NOT NULL,
    "isTyping" boolean
);


--
-- MIGRATION VERSION FOR chatroom
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chatroom', '20240927085928879', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927085928879', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
