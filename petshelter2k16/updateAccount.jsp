<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="database.jsp"%>

<sql:query var="account">
	select * from shelter_admin 
	where shelter_admin_id = '${accountId}'
</sql:query>
<c:set var="accountInfo" value="${account.rows[0]}"/>
<c:set var="shelterId" value="${account.rows[0].shelter_id}"/>

<sql:query var="shelterSelect">
	select * from shelter
	where shelter_id = '${shelter}'
</sql:query>

<c:set var="shelterInfo" value="${shelterSelect.rows[0]}"/>

<sql:query var="states">
	select * from us_states
</sql:query>

<sql:query var="selectShelters">
	select * from shelter
</sql:query>

<!DOCTYPE html>
<html>
	<head>
		<title>Update Account</title>
			
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link rel="stylesheet" type="text/css" href="css/general.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/general.css"/>
		<link rel="stylesheet" type="text/css" href="css/general.css"/>
	</head>
	<body>
		<center>
			
				<h1>Update Account</h1>
				<c:import url="menu.jsp"/>
					<p style="color:red;"> 
						<c:if test="${not empty updateAccountErr}">
							<c:out value="${updateAccountErr}"/>
							<c:remove var="updateAccountErr"/>
						</c:if> 
					</p>
				<form method="post" action="processUpdateAccount.jsp?shelter_admin_id=${accountInfo.shelter_admin_id}&&shelter_id=${shelterInfo.shelter_id}">
				<div class="container">
					<table class="table table-responsive">
						<tr>
							<th>User Id: </th>
							<td>
								<c:out value="${username}"/>
							</td>
						</tr>
						<tr>
							<th>First Name: </th>
							<td>
								<input type="text" maxlength="45"  size="20" value="${accountInfo.first_name}" name="newFirst" required/>
							</td>
						</tr>
						<tr>
							<th>Last Name: </th>
							<td>
								<input type="text" maxlength="45" size="20" value="${accountInfo.last_name}" name="newLast" required/>
							</td>
						</tr>
						<tr>
							<th> Shelter: </th> 
							<td><select name="shelterLocation" requried>
										<option value="${shelter}"><c:out value="${shelterInfo.name}"/></option>
										<c:forEach items="${selectShelters.rows}" var="list">
											<option value="${list.shelter_id}"><c:out value="${list.name}"/></option>
										</c:forEach>
									</select>
							</td>
						</tr>	
						<tr>
							<th>New Password: </th>
							<td>
								<input type="password" maxlength="45" size="20" name="newPass"/>
							</td>
						</tr>
						<tr>
							<th>Confirm Password: </th>
							<td>
								<input type="password" maxlength="45" size="20" name="confirm"/>
							</td>
						</tr>
						<tr> 
							<th>Current Password: </th>
							<td>
								<input type="password" maxlength="45" size="20" name="current" required/>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" value="Update"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" value="Clear"/>
							</th>
						</tr>
					</table>
				</form>
			</div>
		</center>
	</body>
</html>