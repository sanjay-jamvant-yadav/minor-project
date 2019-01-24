<%-- 
    Document   : login
    Created on : 24-Jan-2019, 08:22:30
    Author     : Sanjay_Yadav
--%>
<%@page import="util.SqlUtil" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Login Page</title>
		<link rel="stylesheet" type="text/css" href="Style.css">
		<script type="text/javascript">
			function user()
			{
				var x=document.getElementById("user").value;
				if(x==="")
				{
					alert("Username can not be empty");
					return 0;
				}
				return 0;
			}
			function pass()
			{
				var x=document.getElementById("pass").value;
				if(x==="")
				{
					alert("Password can not be empty");
                                        return 0;
				}
                                return 1;
			}
			function validate()
			{	
				var val1=pass();
                                var val2=user();
                                if(val1==true||val2==true)
                                {
                                    return 1;
                                }
                                return 0;
				
			}
		</script>
	</head>
	<body>
		<div id=Login>
			Login
		</div>
		<div id="div2">
                    <form class="form" onsubmit="return validate();" action="Login.jsp" method="post">
				<center>
				<input id="user" name="user" type="text" placeholder="Enter User Name">
				<br><br>
				<input id="pass" name="pass" type="password" placeholder="Enter Password" maxlength="10">
				<br><br>
				<input class="butn" name="login" type="submit" value="Login" >
				<br><br>
				<a href="signup.jsp">New user click here to signup?</a>
			</center>		
			</form>
		</div>		
        </body>
        <%!
            String username,password;
            String un,pass;
        %>
        <%
            if(request.getParameter("login")!=null)
            {
               username=request.getParameter("user");
                password=request.getParameter("pass");
    try
   {
                SqlUtil.connect();
                ResultSet rs=SqlUtil.retreive("select * from login;");
                boolean isLogin=false;
                while(rs.next())
                {
                    un=rs.getString("user_name");
                    pass=rs.getString("password");
                    if(username.equalsIgnoreCase(un)&&password.equals(pass))
                    {
                      isLogin=true;
                      break;
                    }
                    
                }
                
   
                if(isLogin)
                {
                    session=request.getSession();
                    
                    session.setAttribute("username",username);
                    session.setAttribute("password",password);
                    response.sendRedirect("Home.jsp");
                       
                }

               else
                 {
       
                       out.println("<script>alert('Invalid Username/password');document.location.href='Login.jsp';</script>");
        
                    }
    }
    
    catch(Exception ex)
   {
       System.out.println("Problem in Login"+ex);
   } 
            }
        %>
           
</html>

