#!/bin/bash

set -e

git clone --depth=1 https://github.com/sockjs/sockjs-protocol.git
cd sockjs-protocol
make test_deps pycco_deps
cd ..
node tests/test_server/server.js &
SRVPID=$!

set +e

cd sockjs-protocol
./venv/bin/python sockjs-protocol.py
PASSED=$?
kill $SRVPID
exit $PASSED
