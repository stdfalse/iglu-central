-- Copyright (c) 2014 Snowplow Analytics Ltd. All rights reserved.
--
-- This program is licensed to you under the Apache License Version 2.0,
-- and you may not use this file except in compliance with the Apache License Version 2.0.
-- You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the Apache License Version 2.0 is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
--
-- Authors:       Fred Blundun
-- Copyright:     Copyright (c) 2015 Snowplow Analytics Ltd
-- License:       Apache License Version 2.0
--
-- Compatibility: iglu:com.snowplowanalytics.snowplow/ua_parser_context/jsonschema/1-0-0

CREATE TABLE atomic.com_snowplowanalytics_snowplow_ua_parser_context_1 (
	-- Schema of this type
	schema_vendor     VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_name       VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_format     VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_version    VARCHAR(128)  ENCODE ZSTD NOT NULL,
	-- Parentage of this type
	root_id           CHAR(36)      ENCODE RAW  NOT NULL,
	root_tstamp       TIMESTAMP     ENCODE ZSTD NOT NULL,
	ref_root          VARCHAR(255)  ENCODE ZSTD NOT NULL,
	ref_tree          VARCHAR(1500) ENCODE ZSTD NOT NULL,
	ref_parent        VARCHAR(255)  ENCODE ZSTD NOT NULL,
	-- Properties of this type
	useragent_family  VARCHAR(255)  ENCODE ZSTD NOT NULL,
	useragent_major   VARCHAR(64)   ENCODE ZSTD,
	useragent_minor   VARCHAR(64)   ENCODE ZSTD,
	useragent_patch   VARCHAR(64)   ENCODE ZSTD,
	useragent_version VARCHAR(255)  ENCODE ZSTD NOT NULL,
	os_family         VARCHAR(255)  ENCODE ZSTD NOT NULL,
	os_major          VARCHAR(64)   ENCODE ZSTD,
	os_minor          VARCHAR(64)   ENCODE ZSTD,
	os_patch          VARCHAR(64)   ENCODE ZSTD,
	os_patch_minor    VARCHAR(64)   ENCODE ZSTD,
	os_version        VARCHAR(255)  ENCODE ZSTD NOT NULL,
	device_family     VARCHAR(255)  ENCODE ZSTD NOT NULL,
	FOREIGN KEY(root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp);
