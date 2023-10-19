<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	String c = request.getParameter("codigo");
	String n = request.getParameter("nome");
	String d = request.getParameter("desenvolvedora");
	String p = request.getParameter("preco");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade", "root", "admin");
		String sql = "INSERT INTO jogos VALUES(?,?,?,?)";
		PreparedStatement st = conexao.prepareStatement(sql);
		st.setString(1, c);
		st.setString(2, n);
		st.setString(3, d);
		st.setString(4, p);
		st.executeUpdate();
		out.print("Jogo cadastrado com sucesso");
	} catch (Exception erro) {
		String mensagemErro = erro.getMessage();
		if (mensagemErro.contains("Duplicate entry")) {
			out.print("<p style='color:blue'>Este Jogo já está cadastrado<p>");
		} else {
			out.print("Entre em contato com o suporte e informe o erro:" + mensagemErro);
		}
	}
	%>
</body>
</html>

