#!/usr/bin/nodejs

var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

rl.on('line', function (line) {
	console.log([line, 1].join('\t'));
});