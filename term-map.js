#!/usr/bin/nodejs

var readline = require('readline');
var file = process.env.map_input_file;

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var output = [];

rl.on('line', function (line) {
	var tokens = line.toLowerCase().replace(/[.,?\/#!$%\^&\*;:{}=\-_`~()"'+|0123456789]/g, '').split(' ');
	tokens.forEach(function (token) {
		token.length && output.push(token);
	});
}).on('close', function () {
	var length = output.length;
	output.forEach(function (token) {
		console.log([token, file, 1, length].join('\t'));
	});
});