#!/usr/bin/nodejs

var readline = require('readline');
var file = process.env.INPUT_FILE;

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var output = [];

rl.on('line', function (line) {
	var tokens = line.toLowerCase().replace(/[.,\/#!$%\^&\*;:{}=\-_`~()"']/g, '').split(' ');
	tokens.forEach(function (token) {
		token.length && output.push(token);
	});
}).on('close', function () {
	var length = output.length;
	output.forEach(function (token) {
		console.log([token, file, 1, length].join('\t'));
	});
});