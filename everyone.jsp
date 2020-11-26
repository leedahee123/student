<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<table border="1">
    <tr>
        <td>학생 ID</td>
        <td>성별</td>
        <td>좋아하는 과목</td>
    </tr>
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "smc_user_13", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT ID, " +
            "CASE GENDER  " +
            "WHEN 'F' then '여성' " + 
            "else '남성'  " +
        "end as GENDER,  " +
        "CASE FAVORIT  " +
         "   WHEN 'CO' then '컴퓨터'  " +
          "  WHEN 'KO' then '국어' " +
          "  ELSE '수학' " + 
        "END AS FAVORIT FROM STUDENT");

    while (rs.next()) {
        %>
            <tr>
                <td><%=rs.getInt(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
            </tr>
        <%
    }

    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
%>

</table>