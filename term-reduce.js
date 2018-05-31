#!/usr/bin/nodejs

var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var prevnum = 0, prevterm, prevfile, prevlength;
rl.on('line', function (line) {
	var values = line.split('\t'), term = values[0], file = values[1], num = parseInt(values[2]), length = parseInt(values[3]);
	if (term == prevterm && file == prevfile) {
		prevnum += num;
	} else {
		outputLine(prevterm, prevfile, prevnum, prevlength);
		prevterm = term;
		prevfile = file;
		prevnum = num;
		prevlength = length;
	}
}).on('close', function () {
	outputLine(prevterm, prevfile, prevnum, prevlength);
});

function outputLine(term, file, num, length) {
	num > 0 && console.log([term, file, num, length].join('\t'));
}