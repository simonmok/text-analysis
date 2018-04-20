var readline = require('readline');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

var curnum = 0, curterm, curfile;
rl.on('line', function (line) {
	var values = line.split('\t'), term = values[0], file = values[1], num = parseInt(values[2]);
	if (term == curterm && file == curfile) {
		curnum += num;
	} else {
		outputLine(curterm, curfile, curnum);
		curterm = term;
		curfile = file;
		curnum = num;
	}
}).on('close', function () {
	outputLine(curterm, curfile, curnum);
});

function outputLine(curterm, curfile, curnum) {
	curnum > 0 && console.log([curterm, curfile, curnum].join('\t'));
}