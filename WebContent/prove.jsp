<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Lecturer</title>
<link type="text/css" href="b.css" rel="stylesheet" />
<script>
function validateForm()
{
var a=document.forms["f"]["p"].value;


if (a=='577004')
  {
  alert("successful");
  return true;
  }
else
	{alert("incorrect secret code");}
}
</script>

</head>
<body>
<h2>Enter the secret code provided</h2>
<form name="f" action="signup.jsp" method="get" onsubmit="return validateForm()">
<input type="password" id="p" name="upass" class="resized" size="20" maxlength="18" placeholder="Your password" />
 <input type="submit" value="  Submit  " onsubmit=style="background-color:#000; font-family:Times new roman; color:#fff; font-size:19px" />
 </form>

</body>
</html>