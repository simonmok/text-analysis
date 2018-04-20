var readline = require('readline');
var file = process.env.INPUT_FILE;

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

rl.on('line', function (line) {
	var tokens = line.toLowerCase().replace(/[.,\/#!$%\^&\*;:{}=\-_`~()"']/g, '').split(' ');
	tokens.forEach(token => token.length && console.log([token, file, 1].join('\t')));
});