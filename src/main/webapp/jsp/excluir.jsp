<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	String c;
	Connection conexao;
	PreparedStatement st;
	int resultado;
	String driver, caminhoBd, usuario, senha, sql;
	c = request.getParameter("codigo");
	try {
		driver = "com.mysql.cj.jdbc.Driver";
		Class.forName(driver);
		caminhoBd = "jdbc:mysql://localhost:3306/atividade";
		usuario = "root";
		senha = "admin";
		conexao = DriverManager.getConnection(caminhoBd, usuario, senha);
		sql = "DELETE FROM jogos WHERE codigo = ?";
		st = conexao.prepareStatement(sql);
		st.setString(1, c);
		resultado = st.executeUpdate();
		if (resultado == 1) {
			out.print("O jogo " + c + " foi apagado com sucesso");
		} else {
			out.print("O jogo de código " + c + " não está cadastrado");
		}
	} catch (SQLException x) {
		out.print("Entre em contato com o suporte e informe o erro: " + x.getErrorCode());
	}
	%>
</body>
</html>
