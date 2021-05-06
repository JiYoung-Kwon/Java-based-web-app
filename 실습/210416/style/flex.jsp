<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale=1.0'>
<title>Flex</title>
<style>
	#flex #container>div, .header, .footer{
		border:1px solid #aaa;
		width:400px;
		
	}
	
	#container{
		display:flex;
		/* flex-direction: row;
		flex-wrap:wrap;
		flex-flow :row wrap;
		align-items:flex-start;
		align-items:stretch; */
		height:200px;
		
		
	}
	
	#container .a {
		flex:2 1 0;
	}
	
	#flex .header, #flex .footer{
		width :100%;
		background-color:#ddd;
	}
</style>
</head>
<body>
	<div id = 'flex'>
		<div class ='header'>HEADER</div>
		<div id = 'container'>
			<div class = 'a'>A</div>
			<div class = 'a'>B</div>
			<div class = 'a'>C</div>
			<div class = 'a'>D</div>
			<div class = 'a'>E</div>			
		</div>		
		<div class ='footer'>FOOTER</div>
	</div>
</body>
</html>