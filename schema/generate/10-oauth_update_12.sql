CREATE SEQUENCE "augur_operations"."worker_oauth_oauth_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1000
CACHE 1;

ALTER TABLE "augur_operations"."worker_oauth" ALTER COLUMN "oauth_id" TYPE int8 USING "oauth_id"::int8;

ALTER TABLE "augur_operations"."worker_oauth" ALTER COLUMN "oauth_id" SET DEFAULT nextval('"augur_operations".worker_oauth_oauth_id_seq'::regclass);

ALTER TABLE "augur_operations"."worker_oauth" ADD CONSTRAINT "worker_oauth_pkey" PRIMARY KEY ("oauth_id");

SELECT setval('"augur_operations"."worker_oauth_oauth_id_seq"', 1000, false);

ALTER SEQUENCE "augur_operations"."worker_oauth_oauth_id_seq" OWNER TO "augur";

CREATE INDEX "repos_id,statusops" ON "augur_operations"."repos_fetch_log" USING btree (
  "repos_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);



update "augur_operations"."augur_settings" set value = 12 where setting = 'augur_data_version'; 
