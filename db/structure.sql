CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "authorizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar, "uid" varchar, "user_id" integer, "token" varchar, "secret" varchar, "created_at" datetime, "updated_at" datetime, "username" varchar);
CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "index_admin_users_on_email" ON "admin_users" ("email");
CREATE UNIQUE INDEX "index_admin_users_on_reset_password_token" ON "admin_users" ("reset_password_token");
CREATE TABLE "active_admin_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "resource_id" varchar NOT NULL, "resource_type" varchar NOT NULL, "author_id" integer, "author_type" varchar, "body" text, "created_at" datetime, "updated_at" datetime, "namespace" varchar);
CREATE INDEX "index_active_admin_comments_on_resource_type_and_resource_id" ON "active_admin_comments" ("resource_type", "resource_id");
CREATE INDEX "index_active_admin_comments_on_namespace" ON "active_admin_comments" ("namespace");
CREATE INDEX "index_active_admin_comments_on_author_type_and_author_id" ON "active_admin_comments" ("author_type", "author_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "about" text, "created_at" datetime, "updated_at" datetime, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "authentication_token" varchar, "image_url" varchar, "location" varchar, "username" varchar);
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
CREATE UNIQUE INDEX "index_users_on_authentication_token" ON "users" ("authentication_token");
INSERT INTO schema_migrations (version) VALUES ('20130714124350');

INSERT INTO schema_migrations (version) VALUES ('20130714124402');

INSERT INTO schema_migrations (version) VALUES ('20130714145508');

INSERT INTO schema_migrations (version) VALUES ('20130714201233');

INSERT INTO schema_migrations (version) VALUES ('20130714204601');

INSERT INTO schema_migrations (version) VALUES ('20130714210222');

INSERT INTO schema_migrations (version) VALUES ('20130714212638');

INSERT INTO schema_migrations (version) VALUES ('20131108204716');

INSERT INTO schema_migrations (version) VALUES ('20131108204722');

INSERT INTO schema_migrations (version) VALUES ('20131108204723');

INSERT INTO schema_migrations (version) VALUES ('20151219055919');

INSERT INTO schema_migrations (version) VALUES ('20151219060306');

