<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content= 'width=device-width, initial-scale = 1.0'>
<title>image_preview</title>
<style>
	#image_preview #attzone{
		width: 100%;
		min-height : 130px;
		padding:0;
		border:2px dotted #aaa;
	}
	
	#image_preview #attzone >div{
		width: 130px;
		height : 150px;
		margin:5px;
		position:relative;
		display:inline-block;
	}
	
	#attzone .del_btn{
		position:absolute;
		font-size:24pt;
		color:#ff0000;
		right:3px;
		bottom:3px;
		background-color : rgba(255,255,255,0.2);
		border-width:0;
		padding:0;
	}
	#attzone img{
		width:100%;
		height:100%;
	}
	
	#attzone{
		border:2px solid #ffffff;
	}
</style>
</head>
<body>
	<div id = 'image_preview'>
		<label>이미지첨부</label>
		<input type = 'file' id = 'attfile' multiple/>
		<div id = 'attzone'></div>
	</div>
	<script src = 'image_preview.js'></script>
	<script>
		imageView('attfile', 'attzone');
	</script>
</body>
</html>