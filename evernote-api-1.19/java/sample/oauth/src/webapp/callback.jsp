<%
	String verifier = request.getParameter("oauth_verifier");
	if (verifier != null) {
		session.setAttribute("verifier", verifier);
	}
%>
<html>
  <head>
    <title>EDAM Web Test OAuth Callback</title>
  </head>
  <body>
    <h4>Authorization successful</h4>
    Callback page on sample site invoked.<br/>
    <a href='javascript: top.location.search="?action=getAccessToken"'>
      Get access token
    </a>
  </body>
</html>
