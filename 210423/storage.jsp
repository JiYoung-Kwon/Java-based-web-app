<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>storage</title>
</head>
<body>
<script>
	localStorage.setItem("mid","hong");
	sessionStorage.setItem("name","김씨");
	
	var obj = new Object();
	obj.phone = '010-1111-2222';
	obj.address = '종로구';
	
	var obj2 = new Object();
	obj2.phone = '010-4444-4444';
	obj2.address = '부산';
	
	var arr = [];
	arr.push(obj);
	arr.push(obj2);
	
	var str = JSON.stringify(arr);
	console.log(str);
	localStorage.setItem("obj",str);
	sessionStorage.setItem("obj",str);

</script>
</body>
</html>