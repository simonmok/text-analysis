#!/bin/bash

echo Text analysis job started on `date`

./term.sh
./document.sh
./stat.sh