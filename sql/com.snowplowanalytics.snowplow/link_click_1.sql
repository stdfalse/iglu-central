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
-- Authors:       Alex Dean
-- Copyright:     Copyright (c) 2014 Snowplow Analytics Ltd
-- License:       Apache License Version 2.0
--
-- Compatibility: iglu:com.snowplowanalytics.snowplow/link_click/jsonschema/1-0-0

CREATE TABLE atomic.com_snowplowanalytics_snowplow_link_click_1 (
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
	element_id      VARCHAR(255)  ENCODE ZSTD,
	element_classes VARCHAR(2048) ENCODE ZSTD, -- holds a json array. todo: will replace with a ref_ following https://github.com/snowplow/snowplow/issues/647
	element_target  VARCHAR(255)  ENCODE ZSTD,
	target_url      VARCHAR(4096) ENCODE ZSTD NOT NULL,
	FOREIGN KEY(root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp);
