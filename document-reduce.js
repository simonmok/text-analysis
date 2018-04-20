#!/usr/bin/nodejs

var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var curtf = 0, curdf = 0, curterm, curfile, buffer = [];
rl.on('line', function (line) {
	var values = line.split('\t'), term = values[0], file = values[1], tf = parseInt(values[2]), df = parseInt(values[3]);
	if (term == curterm) {
		curdf += df;
		buffer.push([term, file, tf].join('\t'));
	} else {
		outputLine(buffer, curterm, curfile, curtf, curdf);
		buffer.length = 0;
		curterm = term;
		curfile = file;
		curtf = tf;
		curdf = df;
	}
}).on('close', function () {
	outputLine(buffer, curterm, curfile, curtf, curdf);
});

function outputLine(buffer, curterm, curfile, curtf, curdf) {
	buffer.forEach(function (item) {
		console.log([item, curdf].join('\t'))
	});
	curtf > 0 && console.log([curterm, curfile, curtf, curdf].join('\t'));
}