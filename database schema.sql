-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "phone_number" string   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "updated_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID"
     ),
    CONSTRAINT "uc_Users_phone_number" UNIQUE (
        "phone_number"
    )
);

CREATE TABLE "Messages" (
    "ID" int   NOT NULL,
    "user_ID" int   NOT NULL,
    "body" string   NOT NULL,
    "from" string   NOT NULL,
    "to_recepient" string   NOT NULL,
    "direction" string   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "updated_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Messages" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Intents" (
    "ID" int   NOT NULL,
    "name" string   NOT NULL,
    "user_name" string   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "updated_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Intents" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Entities" (
    "EntityID" int   NOT NULL,
    "message_id" string   NOT NULL,
    -- type may store details like date, location, person
    "type" string   NOT NULL,
    "recipient_phone" string   NOT NULL,
    "value" string   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "updated_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Entities" PRIMARY KEY (
        "EntityID"
     )
);

CREATE TABLE "Responses" (
    "ID" int   NOT NULL,
    "intent_id" int   NOT NULL,
    "content" string   NOT NULL,
    "created_at" TIMESTAMP   NOT NULL,
    "updated_at" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_Responses" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Messages" ADD CONSTRAINT "fk_Messages_user_ID_to_recepient" FOREIGN KEY("user_ID", "to_recepient")
REFERENCES "Users" ("ID", "phone_number");

ALTER TABLE "Intents" ADD CONSTRAINT "fk_Intents_user_name" FOREIGN KEY("user_name")
REFERENCES "Users" ("name");

ALTER TABLE "Entities" ADD CONSTRAINT "fk_Entities_message_id" FOREIGN KEY("message_id")
REFERENCES "Messages" ("ID");

ALTER TABLE "Entities" ADD CONSTRAINT "fk_Entities_recipient_phone" FOREIGN KEY("recipient_phone")
REFERENCES "Users" ("phone_number");

ALTER TABLE "Responses" ADD CONSTRAINT "fk_Responses_intent_id" FOREIGN KEY("intent_id")
REFERENCES "Intents" ("ID");

