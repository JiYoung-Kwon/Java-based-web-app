/**
 * worker를 사용한 구구단
 */

var str = '';
var dan = 5;

for(var i = 1; i<10; i++){
	str += dan + ' * ' + i + ' = ' + (dan*i) + '<br/>';
	for(var j=0; j<99999999; j++){}
	postMessage(str);
}