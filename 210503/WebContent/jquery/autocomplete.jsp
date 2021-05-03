<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<link rel = 'stylesheet' 
	  href = 'https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'>
<script src = '../lib/jquery-3.6.0.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>  
<title>autocomplete</title>
</head>
<body>
	<div id = 'autocomplete'>
		<label for ="tags">Tags: </label>
		<input id = 'tags'/>
	</div>
	<script>
		$(function(){
			var availableTags = ["ActionScript", ' AppleScript', 'C', 'C++', 'COBOL', 'FORTRAN', 'Python'];
			
			$('#tags').autocomplete({
				source: availableTags
			});
		
		})
	
	</script>
</body>
</html>