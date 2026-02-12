<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    // ✅ Updated: Modern MySQL Connector/J driver class
    Class.forName("com.mysql.cj.jdbc.Driver");

    // ✅ Updated: Added useSSL & serverTimezone params for Connector/J 8+
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://10.160.15.192:3306/userdb?useSSL=false&serverTimezone=UTC",
        "admin", "admin@1"
    );

    // ✅ Fixed: Use PreparedStatement to prevent SQL Injection
    String sql = "SELECT * FROM test_user WHERE userName = ? AND password = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, userName);
    pstmt.setString(2, password);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid credentials. <a href='index.jsp'>Try again</a>");
    }

    rs.close();
    pstmt.close();
    con.close();
%>

