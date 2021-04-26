/**
 * worker를 사용하여 1~1000까지의 합계를 구함.
 */

var sum =0;
for(var i =1; i<=1000; i++){
	sum +=i;
	for(var j=0; j<9999999; j++){}
}

postMessage(sum);