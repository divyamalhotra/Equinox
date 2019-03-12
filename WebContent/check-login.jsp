<%@include file="DBConnection.jsp"%>
<%@include file="index.html" %>

<html>
    <body>

        <%      
                String str1=request.getParameter("luser");
                session =request.getSession();
                session.setAttribute("username",str1);
               // String str2=request.getParameter("email");
                String str3=request.getParameter("password");
        
        //        session.setAttribute("loginusername", str1);
              //  session.setAttribute("loginuserid", str2);
               
               // session.setAttribute("loginuserpasssword", str3);
                
                try
                {
                    String query="select * from login";
                    Statement smt=con.createStatement();
                    ResultSet rs=smt.executeQuery(query);
                  /*  if(str1.equals("admin")&&str3.equals("admin")){
                    	RequestDispatcher rd =request.getRequestDispatcher("gphs.jsp");
                        rd.forward(request,response);
                    }*/
                    int count=0;
                    while(rs.next())
                    {
                    
                        if(str1.equalsIgnoreCase(rs.getString(1))  && str3.equals(rs.getString(3)))
                        {
                                count++;
                                break;
                        }
                        
                    }
                    if(count>0)
                    {
                        //out.println("<br>Login success");
                        //response.sendRedirect("main.jsp");
                        RequestDispatcher rd =request.getRequestDispatcher("main.jsp");
                        rd.forward(request,response);
                       //out.println("<a href=changepassword.jsp>change password </a>");
                            
                    }
                    else
                    {
                       // RequestDispatcher dis = request.getRequestDispatcher("signin.jsp");
                        //dis.include(request, response);
                        //out.println("<br>login failed..");
                       %> 
                       <script>
						document.getElementById("msg").innerHTML="Wrong Combination of username and password!!!";
						
                       </script>
                       <%
                    }
                }
                catch(Exception e)
                {
                        out.println("DBMS problem .. login failed.. "+e);
                }
                
                
        
        %>
        
        
        
        
    </body>
</html>
