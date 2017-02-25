<%@ include file="database.jsp"%>
<html>
	<head>
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<title>Admin Login</title>
		<link rel="stylesheet" type="text/css" href=""/>
	</head>
	<body>
		<div class="col-lg-8">
			<h1>Paws and Found</h1>
			<h3> Administrator Login </h3> 
			<p style="color:red;">
				<c:if test="${not empty ue}">
					 <c:out value="${ue}"/>
					 <c:remove var="ue"/>
				</c:if>
			</p>
			<p style="color:green;">
				<c:if test="${not empty sr}">
					<c:out value="${sr}"/>
					<c:remove var="sr"/>
				</c:if>
				<c:if test="${not empty ryes}">
					<c:out value="${ryes}"/>
					<c:remove var="ryes"/>
				</c:if>
			</p>
			<br/>
			<br/>
		</div>
			<form method="post" action="loginProcess.jsp">
			<div class="container col-lg-8">
				<table class="table table-responsive">
					<tr>
						<th>
							Username: 
						</th>
						<td>
							<input type="text" name="uName" maxlength="20" size="20" required class="form-control"/>
						</td>
					</tr>
					<tr>
						<th>
							Password:
						</th>
						<td>
							<input type="password" name="pWord" maxlength="20" size="20" required class="form-control"/>
						</td>
					</tr>
					<tr align="center">
						<th colspan="2">
						<input type="submit" value="Login"/>&nbsp; &nbsp; 
						<input type="reset" value="Clear"/>
						</th>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr align="center">
						<td colspan="100">Don't have an account? <a href="register.jsp">Register</a> your shelter today!</td>
					</tr>
				</table>
			</div>
			</form>
	</body>
</html>