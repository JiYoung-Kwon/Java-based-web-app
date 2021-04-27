<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content= 'width=device-width, initial-scale = 1.0'>
<title>load_xml</title>
<style>
	* {
		padding : 0;
		margin : 0;
	}
	
	#load_xml {
		margin : 60px 30px;
	}
	
	.items{
		width: 600px;
		border : 2px solid #aaa;
		padding : 30px;
		border-radius : 10px;
	}
	
	.item {
		border-bottom : 2px dotted #aaa;
		font-size : 20px;
	}
	
	.item>span{
		display : inline-block;
	}
	
	.id {width:100px;}
	.name {width: 120px;}
	.address {width: 100px;}
	
	
</style>
</head>
<body>
	<div id = 'load_xml'>
		<input type = 'button' value = 'text.xml' id ='btnXML'/>
		<input type = 'button' value = 'xml_data' id ='btnXMLData'/>
		<div id = 'result'>
			<div id = 'here'></div>
		</div>
	</div>
	
	<script>
		var xhr = new XMLHttpRequest();
		var rs = document.getElementById('result');
		var btn = document.getElementById('btnXML');
		var btnXML = document.getElementById('btnXMLData');
		
		btn.onclick=function(){
			xhr.open('get','text.xml');
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.status == 200 && xhr.readyState == 4){
					var xml = xhr.responseXML;
					console.log(xml);
					var ids = xml.getElementsByTagName('id');
					var names = xml.getElementsByTagName('name');
					var address = xml.getElementsByTagName('address');
					
					var str = "<div class='items'>" ;
					for(var i = 0; i<ids.length; i++){
						str += " <div class='item'>"
								+ "  <span class='id'>" + ids.item(i).firstChild.nodeValue + "</span>"
								+ "  <span class='name'>" + names.item(i).firstChild.nodeValue + "</span>"
								+ "  <span class='addre'>" + address.item(i).firstChild.nodeValue + "</span>"
								+ " </div>"
					}	
					str += "</div>";
					
							
				 	rs.innerHTML = str;
				}
			}
		}
		
		btnXML.onclick = function(){
			xhr.open('get','xml_data.jsp');
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.status == 200 && xhr.readyState == 4){
					var xml = xhr.responseXML;
					
					var ids = xml.getElementsByTagName('id');
					var names = xml.getElementsByTagName('name');
					var phones = xml.getElementsByTagName('phone');
					
					var str = "<div class='items'>" ;
					for(var i = 0; i<ids.length; i++){
						str += " <div class='item'>"
								+ "  <span class='id'>" + ids.item(i).firstChild.nodeValue + "</span>"
								+ "  <span class='name'>" + names.item(i).firstChild.nodeValue + "</span>"
								+ "  <span class='phone'>" + phones.item(i).firstChild.nodeValue + "</span>"
								+ " </div>"
					}	
					str += "</div>";
					
							
				 	rs.innerHTML = str;
				}
			}
		}
	</script>
</body>
</html>