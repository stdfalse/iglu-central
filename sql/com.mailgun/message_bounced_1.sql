-- AUTO-GENERATED BY igluctl DO NOT EDIT
-- Generator: igluctl 0.2.0
-- Generated: 2017-12-13 10:21

CREATE SCHEMA IF NOT EXISTS atomic;

CREATE TABLE IF NOT EXISTS atomic.com_mailgun_message_bounced_1 (
    "schema_vendor"    VARCHAR(128)  ENCODE ZSTD NOT NULL,
    "schema_name"      VARCHAR(128)  ENCODE ZSTD NOT NULL,
    "schema_format"    VARCHAR(128)  ENCODE ZSTD NOT NULL,
    "schema_version"   VARCHAR(128)  ENCODE ZSTD NOT NULL,
    "root_id"          CHAR(36)      ENCODE RAW  NOT NULL,
    "root_tstamp"      TIMESTAMP     ENCODE ZSTD NOT NULL,
    "ref_root"         VARCHAR(255)  ENCODE ZSTD NOT NULL,
    "ref_tree"         VARCHAR(1500) ENCODE ZSTD NOT NULL,
    "ref_parent"       VARCHAR(255)  ENCODE ZSTD NOT NULL,
    "attachment_count" INT           ENCODE ZSTD,
    "campaign_id"      VARCHAR(4096) ENCODE ZSTD,
    "campaign_name"    VARCHAR(4096) ENCODE ZSTD,
    "code"             VARCHAR(8)    ENCODE ZSTD,
    "domain"           VARCHAR(256)  ENCODE ZSTD,
    "error"            VARCHAR(4096) ENCODE ZSTD,
    "mailing_list"     VARCHAR(4096) ENCODE ZSTD,
    "message_headers"  VARCHAR(4096) ENCODE ZSTD,
    "message_id"       VARCHAR(1024) ENCODE ZSTD,
    "notification"     VARCHAR(4096) ENCODE ZSTD,
    "recipient"        VARCHAR(256)  ENCODE ZSTD,
    "signature"        VARCHAR(128)  ENCODE ZSTD,
    "tag"              VARCHAR(4096) ENCODE ZSTD,
    "timestamp"        TIMESTAMP     ENCODE ZSTD,
    "token"            CHAR(50)      ENCODE ZSTD,
    "x_mailgun_sid"    VARCHAR(4096) ENCODE ZSTD,
    FOREIGN KEY (root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
DISTKEY (root_id)
SORTKEY (root_tstamp);

COMMENT ON TABLE atomic.com_mailgun_message_bounced_1 IS 'iglu:com.mailgun/message_bounced/jsonschema/1-0-0';
