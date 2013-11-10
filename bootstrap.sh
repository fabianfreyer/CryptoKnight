#!/bin/bash
git submodule update --recursive

cd lib/openssl
./Configure linux-generic32 -static 
make depend
cd ../..
