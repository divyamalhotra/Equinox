<%@page import="java.sql.*"%>
<html>
    <body>
        <%Connection con=null;%>
        <%
                try
                {                
                  String connectionURL = "jdbc:mysql://localhost:3306/db"; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    con= DriverManager.getConnection(connectionURL, "tech_nymphs", "Root@123");
                 /*String connectionURL1 = "jdbc:mysql://localhost:3306/dht11data"; 
                    Class.forName("com.mysql.jdbc.Driver"); 
                    con= DriverManager.getConnection(connectionURL1, "pi", "1");
                  /*  out.println("Connection success<br> ");*/
                }
                catch(Exception e)
                {
                    
                    out.println("connection failed..."+e);
                }
        %>
    </body>
</html>
