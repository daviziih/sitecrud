
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
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
		String sql = "UPDATE jogos SET nome=?, desenvolvedora=?, preco=? WHERE codigo = ?";
		PreparedStatement st = conexao.prepareStatement(sql);
		st.setString(1, n);
		st.setString(2, d);
		st.setString(3, p);
		st.setString(4, c);
		st.executeUpdate();
		out.print("O jogo de código " + c + " foi alterado com sucesso");
	} catch (SQLException erro) {
		out.print("Entre em contato com o suporte e informe o erro " + erro.getErrorCode());
	}
	%>
</body>
</html>
