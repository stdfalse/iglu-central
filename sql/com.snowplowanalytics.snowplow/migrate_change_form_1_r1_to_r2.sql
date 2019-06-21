-- Copyright (c) 2013 Snowplow Analytics Ltd. All rights reserved.
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
-- Version:     Ports release 1 to release 2
-- URL:         -
--
-- Authors:     Alex Dean
-- Copyright:   Copyright (c) 2014 Snowplow Analytics Ltd
-- License:     Apache License Version 2.0

-- First rename the existing table (don't delete it)
ALTER TABLE atomic.com_snowplowanalytics_snowplow_change_form_1 RENAME TO com_snowplowanalytics_snowplow_change_form_1_r1;

CREATE TABLE atomic.com_snowplowanalytics_snowplow_change_form_1 (
	-- Schema of this type
	schema_vendor   VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_name     VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_format   VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_version  VARCHAR(128)  ENCODE ZSTD NOT NULL,
	-- Parentage of this type
	root_id         CHAR(36)      ENCODE RAW  NOT NULL,
	root_tstamp     TIMESTAMP     ENCODE ZSTD NOT NULL,
	ref_root        VARCHAR(255)  ENCODE ZSTD NOT NULL,
	ref_tree        VARCHAR(1500) ENCODE ZSTD NOT NULL,
	ref_parent      VARCHAR(255)  ENCODE ZSTD NOT NULL,
	-- Properties of this type
	form_id         VARCHAR(255)  ENCODE ZSTD NOT NULL,
	element_id      VARCHAR(255)  ENCODE ZSTD NOT NULL,
	node_name       VARCHAR(8)    ENCODE ZSTD NOT NULL,
	type            VARCHAR(15)   ENCODE ZSTD,
	element_classes VARCHAR(2048) ENCODE ZSTD, -- holds a json array. todo: will replace with a ref_ following https://github.com/snowplow/snowplow/issues/647
	value           VARCHAR(2048) ENCODE ZSTD, -- cannot enforce not null due to https://github.com/snowplow/snowplow/issues/1134
	FOREIGN KEY(root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp);

-- Finally copy all the old data into the new format
INSERT INTO atomic.com_snowplowanalytics_snowplow_change_form_1
	SELECT
	*
	FROM atomic.com_snowplowanalytics_snowplow_change_form_1_r1;
