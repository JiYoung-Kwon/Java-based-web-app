/**
 * index(main)
 */

let main = {};
main.init = function(){
	
}

main.menu = function(menu){
	switch(menu){
		case 'member':
			$('#border').load('./member/member.do');
			break;
					
		case 'board':
			$('#border').load('./board');
			break;
	}
}