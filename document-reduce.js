#!/usr/bin/nodejs

var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var curdf = 0, curterm, buffer = [];
rl.on('line', function (line) {
	var values = line.split('\t'), term = values[0], file = values[1], tf = parseInt(values[2]), length = parseInt(values[3]), df = parseInt(values[4]);
	if (term == curterm) {
		curdf += df;
	} else {
		outputLine(buffer, curdf);
		buffer.length = 0;
		curterm = term;
		curdf = df;
	}
	buffer.push([term, file, tf, length].join('\t'));
}).on('close', function () {
	outputLine(buffer, curdf);
});

function outputLine(buffer, df) {
	buffer.forEach(function (item) {
		console.log([item, df].join('\t'));
	});
}