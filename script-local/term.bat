@ECHO OFF

SET INPUT_FILE=data/file-1.txt

mkdir temp
node ../term-map.js < ../data/file-1.txt > temp/temp-1.txt

SET INPUT_FILE=data/file-2.txt
node ../term-map.js < ../data/file-2.txt > temp/temp-2.txt

(type temp\temp-1.txt && type temp\temp-2.txt) > temp/temp-3.txt

node ../term-sort.js < temp/temp-3.txt > temp/temp-4.txt
node ../term-reduce.js < temp/temp-4.txt > ../output/term-out.txt

rmdir /S /Q temp