#!/bin/bash

# Create 'dist' folder for output, 'txt' to move other files for safekeeping
mkdir -p dist txt

# Find and use all JAR files from 'cores' folder
find src -name "*.java" >sources.txt
javac -cp "cores/*" -d dist @sources.txt

echo "Main-Class: net.sf.odinms.server.Start" >manifest.txt
echo -n "Class-Path: " >>manifest.txt
for jar in cores/*.jar; do echo -n "${jar} " >>manifest.txt; done

# Output new JAR file and move to 'dist' folder
jar cfm v111.jar manifest.txt -C dist .
mv v111.jar ./dist

mv manifest.txt ./txt && mv sources.txt ./txt
