var readline = require('readline');
var data = [];

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	terminal: false
});

rl.on('line', function (line) {
	var values = line.split('\t');
	data.push([values[0], values[1], line]);
}).on('close', function () {
	data.sort(order);
	data.forEach(function (item) {
		console.log(item[2]);
	});
});

function order(a, b) {
	if (a[0] === b[0]) {
		return a[1] === b[1] ? 0 : (a[1] < b[1]) ? -1 : 1;
	} else {
		return (a[0] < b[0]) ? -1 : 1;
	}
}