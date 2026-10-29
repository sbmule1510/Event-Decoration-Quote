<%@ page import="java.sql.*" %>
<%@ page language="java"
 contentType="text/html; charset=UTF-8" %>
<html>
    <body>
        <h2>Saved! All Records</h2>
        <table border="1">
            <tr>
                <th>Client</th>
                <th>Theme</th>
                <th>Budget</th>
                <th>Event Date</th>
            </tr>
        <%
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventdb","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM decor_quote");
        while(rs.next()){
        %>
        <tr>
            <td><%=rs.getString("client")%></td>
            <td><%=rs.getString("theme")%></td>
            <td><%=rs.getInt("budget")%></td>
            <td><%=rs.getDate("event_date")%></td>
        </tr>
        <%
        }
        rs.close();
        st.close();
        con.close();
    }catch(Exception e){
        System.out.println("Error"+e.getMessage());
    }
    %>
</table>
</body>
</html>