<%@ page import="java.sql.*" %>
<%
    String userName  = request.getParameter("userName");
    String password  = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName  = request.getParameter("lastName");
    String email     = request.getParameter("email");

    // ✅ Updated driver class
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://10.160.15.192:3306/userdb?useSSL=false&serverTimezone=UTC",
        "admin", "admin@1"
    );

    String SQL = "INSERT INTO test_user(first_name, last_name, email, username, password) VALUES(?,?,?,?,?)";
    PreparedStatement pstmt = con.prepareStatement(SQL);
    pstmt.setString(1, firstName);
    pstmt.setString(2, lastName);
    pstmt.setString(3, email);
    pstmt.setString(4, userName);
    pstmt.setString(5, password);

    int i = pstmt.executeUpdate();

    pstmt.close();
    con.close();

    if (i > 0) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>

