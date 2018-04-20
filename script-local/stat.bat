@ECHO OFF

SET FILE_COUNT=2

mkdir temp
node ../stat-map.js < ../output/document-out.txt > temp/temp-1.txt
node ../stat-reduce.js < temp/temp-1.txt > ../output/stat-out.txt

rmdir /S /Q temp