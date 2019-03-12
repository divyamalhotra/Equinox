<%@include file="DBConnection.jsp"%>
<html>
    <body>

        <%
            String un=request.getParameter("suser");
            session =request.getSession();
            session.setAttribute("username",un);            
            String id=request.getParameter("email");
            String pass=request.getParameter("spassword");
            String cnpass=request.getParameter("spassword1");
            String loc1=request.getParameter("loc1");            
            String loc2=request.getParameter("loc2");
           // int node3=Integer.parseInt(request.getParameter("loc3"));

             
            
            String insertquery="insert into login values(?,?,?,?,?);";
            
           // String insertquery1="insert into data values(?,?,?,?);";

        
            try
            {
                if(pass.equalsIgnoreCase(cnpass))
                {
                    PreparedStatement pst=con.prepareStatement(insertquery);
                    pst.setString(1,un);
                    pst.setString(2,id);
                    pst.setString(3,pass);
                    pst.setString(4,loc1);
                    pst.setString(5,loc2); 
                    //pst.setString(6,node3);
                    int i=0;

                    pst.executeUpdate();
                  /*  String tbl = un + "_loc1";
                    Statement stat = con.createStatement();
                    String sql=		"create table "+tbl+" (\n"
                    		+ "	Temperature float,\n"
                            + "	Humidity float,\n"
                            + "	D_T datetime,\n"
                            + "	primary key(D_T)\n"
                            + ");";
                     stat.execute(sql);
                    	 tbl = un + "_loc2";
                         stat = con.createStatement();
                         sql=		"create table "+tbl+" (\n"
                                 + "	Temperature float,\n"
                                 + "	Humidity float,\n"
                                 + "	D_T datetime,\n"
                                 + "	primary key(D_T)\n"
                                 + ");";
                          stat.execute(sql);*/
                          RequestDispatcher rd =request.getRequestDispatcher("main.jsp");
                          rd.forward(request,response);
                   // out.println("Registration Successful");
                    //out.println("<br> To Login <a href=\"signin.jsp\">click here</a>");
                }
                else
                {
                    %>
                    <script>
                    window.alert("Passwords not match!!!");
                    </script>
                    <%
                    
                }
            }
            catch(Exception e)
            {
                    out.println("Unable to register <br> Exception-"+e);
            }
        
        %>
        
        
        
    </body>
</html>
