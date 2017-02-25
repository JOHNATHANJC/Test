<%@include file="database.jsp"%>

<sql:query var="shelters">
	select * from shelter, shelter_admin
	where shelter.shelter_id = shelter_admin.shelter_id 
	and shelter_admin.shelter_admin_id  = '${shelter}' 
</sql:query>
<c:set var="shelterName" value="${shelters.rows[0]}" scope="session"/>

<sql:query var="breedSelect">
	select * from breed
</sql:query>

<sql:query var="stateSelect">
	select * from us_states
</sql:query>


<html>
	<head>
		<title>Add Pet Record</title>
		
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link rel="stylesheet" type="text/css" href="css/general.css"/>
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/general.css"/>

		 </script>
	</head>
	<body>
		<center>
			<h1>Add Pet Record</h1>
			<c:import url="menu.jsp"/>
			<form method="post" action="processAdd.jsp">
			<div class="container">
				<table cellpadding="7px" class="table table-responsive">
					<tr>
						<th>Shelter Name: </th>
							<td><c:out value="${shelterName.name}"/></td>
					</tr>
					<tr>
						<th>Pet Name : </th>
							<td><input type="text" name="aName" maxlength="45" size="20" required class="form-control"/></td>
					</tr>
					<tr>
						<th>Picture : </th>
							<td><input type="file" name="aPic" required/></td>
					</tr>
					<tr>
						<th>Breed : </th>
							<td>
								<select name="pBreed" required>
									<option> </option> 
									<c:forEach items="${breedSelect.rows}" var="results">
										<option value="${results.breed_id}"><c:out value="${results.breed_name}"/></option>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th>Age : </th>
							<td>
								<select name="pAge" required>
									<option></option>
									<option value="b">Baby</option>
									<option value="y">Young</option>
									<option value="a">Adult</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Size : </th>
							<td>
								<select name="pSize" required>
									<option></option>
									<option value="s">Small</option>
									<option value="m">Medium</option>
									<option value="l">Large</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Gender : </th>
							<td>
								<select name="gender" required>
									<option></option>
									<option value="m">Male</option>
									<option value="f">Female</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Found by Shelter Date : </th>
							<td><input type="date" id="datepicker" name="foundDate" class="form-control" required/></td>
					</tr>
					<tr>
						<th>Found by Owner Date: </th>
							<td><input type="date" id="datepicker1" name="foundODate" class="form-control"/></td>
					</tr>
					<tr>
						<th>Owner First Name: </th>
							<td><input type="text" name="oFName" class="form-control"/></td>
					</tr>
					<tr>
						<th>Owner Last Name: </th>
							<td><input type="text" name="oLName" class="form-control"/></td>
					</tr>
					<tr>
						<th>Owner Street: </th>
							<td><input type="text" name="oAddress" class="form-control"/></td>
					</tr>
					<tr>
						<th>Owner City: </th>
							<td><input type="text" name="oCity" class="form-control"/></td>
					</tr>
					<tr>
						<th>Owner State: </th>
							<td>
								<select name="oState">
									<option></option>
									<c:forEach items="${stateSelect.rows}" var="list">
										<option value="${list.state_code}"><c:out value="${list.state_name}"/></option>
									</c:forEach>
							</td>
					</tr>
					<tr>
						<th>Owner ZipCode: </th>
							<td><input type="text" name="oZip" class="form-control"/></td>
					</tr>
					<tr>
						<th>Comments: </th>
							<td><textarea name="oComments"></textarea></td>
					</tr>
					<tr align="center">
						<th colspan="100"><input type="submit" value="Add Pet"/>&nbsp; &nbsp; <input type="reset" value="Clear"/></th>
					</tr>
				</table>
				</div>
			</form>
		</center>
	</body>
</html>