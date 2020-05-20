#!/bin/bash

# the default, LZO, requires additional isntallation
# The following is normal when re-running:
# ERROR: Table already exists
COMPRESSION=none /usr/share/opentsdb/tools/create_table.sh

exec /usr/share/opentsdb/bin/tsdb tsd --zkquorum hbase