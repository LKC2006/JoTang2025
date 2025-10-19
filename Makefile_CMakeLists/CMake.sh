#!/bin/bash

set -eo pipefail

docker pull lkc2006/cmake-app:v1.0

docker run --rm lkc2006/cmake-app:v1.0
