<%-- 
    Document   : test
    Created on : 25-Jan-2019, 08:06:04
    Author     : Sanjay_Yadav
--%>
<%@page import="util.SqlUtil" %>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
          <link rel="stylesheet" type="text/css" href="custom/style.css">
    </head>
    <body>
        <form action="test.jsp" method="post">
          <div class="shadow-lg p-4 mb-4 bg-white w-75 bg-warning center mt-5">
            <div class="center text-center" style="background-color: #44bd32;"><font color="white"><h3>Sign In</h3></font></div>
            <div class="row container center">
                <ul class="ul">
                  <li class="li">
                   <label><input type="radio" name="user" value="1">Admin</label>
                  </li>
                <li class="li">
                  <label><input type="radio" name="user" value="2">Manager</label>
                </li>
                <li class="li">
                  <label><input type="radio" name="user" value="3" >Customer</label>
                </li>
                </ul>
            </div>
        
            <div class="form-group center">
              <label for="email">Email address:</label>
              <input type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group center">
              <label for="pwd">Password:</label>
              <input type="password" class="form-control" id="pwd" name="pwd">
            </div>
            <div class="checkbox center">
              <label><input type="checkbox"> Remember me</label>
            </div>
            <div class="center text-center">
              <input type="submit" class="btn-block btn-info" name="login" value="Submit">
            </div>
            </div>
        </form>
        
    </body>
</html>
<%!String userRoll,email,password,usr,pass;%>
<% 
    if(request.getParameter("login")!=null)
    {
        userRoll=request.getParameter("user");
        email=request.getParameter("email");
        password=request.getParameter("pwd");
        System.out.println(userRoll);
        System.out.println(email);
        System.out.println(password);
        try
        {
            SqlUtil.connect();
            ResultSet rs=SqlUtil.retreive("select * from user_credential where user_id='"+userRoll+"';");
            boolean isLogin=false;
            while(rs.next())
            {
                usr=rs.getString("usr_name");
                pass=rs.getString("usr_pass");
                if(email.equalsIgnoreCase(usr)&&password.equals(pass))
                    {
                      isLogin=true;
                      break;
                    }     
            }
            if(isLogin)
            {
                session=request.getSession();
                session.setAttribute("Username", email);
                session.setAttribute("Password", password);
                response.sendRedirect("admin_dashboard.jsp");
            }
            else
            {
                out.println("<script>alert('Invalid Username/password');document.location.href='test.jsp';</script>");
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
%>
