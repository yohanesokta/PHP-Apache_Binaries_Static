#!/bin/sh
BASE_DIR=$(cd "$(dirname "$0")" && pwd)
export LD_LIBRARY_PATH="$BASE_DIR/lib"
"$BASE_DIR/apache/bin/httpd"
