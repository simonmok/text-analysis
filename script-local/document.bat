@ECHO OFF

mkdir temp
node ../document-map.js < ../output/term-out.txt > temp/temp-1.txt
node ../document-sort.js < temp/temp-1.txt > temp/temp-2.txt
node ../document-reduce.js < temp/temp-2.txt > ../output/document-out.txt

rmdir /S /Q temp