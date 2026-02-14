#!/bin/bash

<<comment
creates a folder
comment

set -e #handle errors and stop the next execution

mkdir testing1 &>/dev/null

echo "do production work..."
