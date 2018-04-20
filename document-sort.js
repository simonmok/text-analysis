#!/usr/bin/nodejs

var readline = require('readline');
var data = [];

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

rl.on('line', function (line) {
	var values = line.split('\t');
	data.push([values[0], line]);
}).on('close', function () {
	data.sort(order);
	data.forEach(function (item) {
		console.log(item[1]);
	});
});

function order(a, b) {
	return a[0] === b[0] ? 0 : a[0] < b[0] ? -1 : 1;
}