<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../style/tabela.css">
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade", "root", "admin");
	String sql = "SELECT * FROM jogos";
	PreparedStatement st = conexao.prepareStatement(sql);
	ResultSet resultado = st.executeQuery();
	%>
	<table>
		<tr>
			<th>Código</th>
			<th>Nome</th>
			<th>Desenvolvedora</th>
			<th>Preço</th>
			<th>Alteração</th>
		</tr>
		<%
		while (resultado.next()) {
		%>
		<tr>
			<td><%=resultado.getString("codigo")%></td>
			<td><%=resultado.getString("nome")%></td>
			<td><%=resultado.getString("desenvolvedora")%></td>
			<td><%=resultado.getString("preco")%></td>
			<td><a
				href="carregar.jsp?codigo=<%=resultado.getString("codigo")%>">
					Alterar </a></td>

		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
