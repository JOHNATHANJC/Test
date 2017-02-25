<%@ include file="database.jsp"%>
<sql:query var="ok">
	select * from shelter
</sql:query>
<c:set var="sh" value="${ok.rows}"/>
<html>
	<head>
		<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
	</head>
	<body><center>
		
			<h1>Shelter Sign up <br/></h1>
			<p style="color:red;">
		<c:if test="${not empty uerr}">
			${uerr}
			<c:remove var="uerr"/>
		</c:if>	
		<c:if test="${not empty perr}">
			${perr}
			<c:remove var="perr"/>
		</c:if>
		</p>
			<form method="post" action="processRegister.jsp">
			<div class="container">
				<table cellpadding="7px" class="table table-responsive">
					<tr>
						<th>First Name:</th>
						<td><input type="text" name="fname" required class="form-control"/></td>
					</tr>
					<tr>
						<th>Last Name:</th>
						<td><input type="text" name="lname" required class="form-control"/></td>
					</tr>				<tr>
						<th>User Id:</th>
						<td><input type="text" name="uname" maxlength="20" size="20" required class="form-control"/></td>
					</tr>				<tr>
						<th>Password:</th>
						<td><input type="password" name="pword" id="pWord" maxlength="20" size="20" required class="form-control"/></td>
					</tr>
					<tr>
						<th>Password Confirmation:</th>
						<td><input type="password" name="cpword" id="cWord" maxlength="20" size="20" required class="form-control"/></td>
					</tr>
					<tr>
						<th>Your Shelter</th>
						<td>
							<select name="shel">
							<option></option>
							<c:forEach var="s" items="${sh}">
								<option value="${s.shelter_id}">${s.name}</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr align="center">
						<td colspan="100">
							<input type="submit" value="Sign Up"/>&nbsp; &nbsp; 
							<input type="reset" value="Clear"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center></body>
</html>