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
-- Compatibility: iglu:com.snowplowanalytics.snowplow/screen_view/jsonschema/1-0-0

CREATE TABLE atomic.com_snowplowanalytics_snowplow_screen_view_1 (
	-- Schema of this type
	schema_vendor  VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_name    VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_format  VARCHAR(128)  ENCODE ZSTD NOT NULL,
	schema_version VARCHAR(128)  ENCODE ZSTD NOT NULL,
	-- Parentage of this type
	root_id        CHAR(36)      ENCODE RAW  NOT NULL,
	root_tstamp    TIMESTAMP     ENCODE ZSTD NOT NULL,
	ref_root       VARCHAR(255)  ENCODE ZSTD NOT NULL,
	ref_tree       VARCHAR(1500) ENCODE ZSTD NOT NULL,
	ref_parent     VARCHAR(255)  ENCODE ZSTD NOT NULL,
	-- Properties of this type
	name           VARCHAR(255)  ENCODE ZSTD,
	id             VARCHAR(255)  ENCODE ZSTD,
	FOREIGN KEY(root_id) REFERENCES atomic.events(event_id)
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp);
