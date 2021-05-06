<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>class_test</title>
</head>
<body>
	<script>
	//1) 클래스 생성
	class Data{
		constructor(mid,mname){
			this.mid = mid;
			this.mname = mname;
		}
		
		set setMid(mid){
			this.mid = mid;
		}
		
		set setMname(mname){
			this.mname= mname;
		}
		
		get getMid(){
			return this.mid;
		}
		
		get getMname(){
			return this.mname;
		}
		
		get toString(){
			return this.mid + '----' + this.mname;
		}
	}
	
	var d = new Data();
	d.setMid = 'hong';
	d.setMname = '홍씨';
	console.log(d.toString);
	
	var d2 = new Data('kim','김씨');
	console.log(d2.getMid);
	console.log(d2.getMname);
	
	//javascript 상속
	class Parent{
		get toString(){
			return "parent";
		}
	}
	
	class Child extends Parent{
		constructor(){
			super();
			console.log('Child.constructor()');
		}
		set setName(name){
			this.name= name;
		}
		get getName(){
			return this.name;
		}
	}
	
	var c1 = new Child();
	c1.setName = "park";
	console.log(c1.toString);
	console.log(c1.getName);
	
	
	
	
	</script>
</body>
</html>