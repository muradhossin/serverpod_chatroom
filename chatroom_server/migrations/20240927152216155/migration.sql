BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "chat_message" CASCADE;

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
    "isActive" boolean NOT NULL,
    "isTyping" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR chatroom
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chatroom', '20240927152216155', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927152216155', "timestamp" = now();

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
