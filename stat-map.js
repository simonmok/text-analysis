#!/usr/bin/nodejs

var readline = require('readline');
var count = parseInt(process.env.FILE_COUNT);

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

rl.on('line', function (line) {
	var values = line.split('\t'), term = values[0], file = values[1], tf = parseFloat(values[2]), length = parseFloat(values[3]), df = parseFloat(values[4]);
	console.log([term, file, tf / length * Math.log(count / df)].join('\t'));
});
