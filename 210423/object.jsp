<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>object</title>
</head>
<body>
	<script>
	//객체 리터널을 사용하여 객체 생성(정의/선언)
	var obj = {};
	obj.setName = function(n){
		this.name = n;
	}
	obj.setAge = function(age){
		this.age = age;
	}
	obj.setData = function(name,age){
		this.name = name;
		this.age= age;
	}
	
	obj.setName('hong');
	obj.setAge(18);
	console.log('name : '+obj.name);
	console.log('age : '+obj.age);
	
	obj.setData('kim',20);
	console.log('name : '+obj.name);
	console.log('age : '+obj.age);
	
	//function을 사용하여 객체 선언(정의)
	function Member(name, age, address){
		this.name = name;
		this.age = age;
		this.address = address;
		this.setAddress = function(addre){
			this.address = addre;
		}
	}
	
	Member.prototype.setName = function(n){this.name = n;}
	Member.prototype.setAge = function(age){this.age = age;}
	
	var m1 = new Member();
	m1.name = 'hong';
	m1.age = 20;
	m1.address = '종로';
	
	console.log('============');
	console.log('m1.name : '+m1.name);
	console.log('m1.age : '+m1.age);
	console.log('m1.address : '+m1.address);
	
	var m2 = new Member();
	m2.setName('kim');
	m2.setAge(40);
	m2.setAddress('부산');
	console.log('m2.name : '+m2.name);
	console.log('m2.age : '+m2.age);
	console.log('m2.address : '+m2.address);
	
	//Class형 메서드 선언
	function OBJ(){}
	
	OBJ.output = function(){
		console.log("OBJ.output()");
	}
		
	var o = new OBJ();
	//o.output();
	OBJ.output();
	
	</script>

</body>
</html>