<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
	width: 90%;
	padding: 50px;
	align-items: center;
}
</style>
</head>
<body>
	<%
	String c, sql;
	Connection conexao;
	PreparedStatement st;
	ResultSet resultado;
	c = request.getParameter("codigo");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade", "root", "admin");
		sql = "SELECT * FROM jogos WHERE codigo = ?";
		st = conexao.prepareStatement(sql);
		st.setString(1, c);
		resultado = st.executeQuery();
		if (resultado.next()) {
	%>
	<form method="post" action="alterar.jsp">
		<p>
			<label for="cod">Código:*</label> <input id="cod" type="number"
				name="codigo" size="5" maxlength="5" required
				value="<%=resultado.getString("codigo")%>" readonly>
		</p>
		<p>
			<label for="nom">Nome:*</label> <input id="nom" type="text"
				name="nome" size="50" maxlength="50" required
				value="<%=resultado.getString("nome")%>">
		</p>
		<p>
			<label for="den">Desenvolvedora:*</label> <input id="den" type="text"
				name="desenvolvedora" size="50" maxlength="50" required
				value="<%=resultado.getString("desenvolvedora")%>">
		</p>
		<p>
			<label for="pre">Preço:*</label> <input id="pre" type="number"
				name="preco" size="50" maxlength="50" required
				value="<%=resultado.getString("preco")%>">
		</p>
		<p>
			<input type="submit" value="Salvar Alterações">
		</p>
	</form>
	<%
	} else {
	out.print("Este jogos de código " + c + " nã está cadastrado");
	}
	} catch (SQLException erro) {
	out.print("Entre em contato com o suporte e informe o código de erro:" + erro.getErrorCode());
	}
	%>
</body>
</html>

