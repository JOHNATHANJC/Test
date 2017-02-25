<%@ include file="database.jsp"%> 

<sql:query var="breedSelect">
	select * from breed
</sql:query>

<sql:query var="stateSelect">
	select * from us_states
</sql:query>

<sql:query var="records">
	SELECT * FROM pet where pet_id = '${param.pet_id}'
</sql:query>
<c:set var="pet" value="${records.rows[0]}"/>

<sql:query var="shelters">
	SELECT * FROM shelter where shelter_id = '${shelter}'
</sql:query>
<c:set var="shelter" value="${shelters.rows[0]}"/>

<sql:query var="type">
	SELECT * FROM breed where breed_id = '${param.breed_id}'
</sql:query>
<c:set var="breed" value="${type.rows[0]}"/>
<html>
	<head>
		<title>Update Record</title>
		<c:import url="menu.jsp"/>
		<script src="js/jquery-2.1.3.min.js" type="text/javascript"></script>
		<script src="js/jquery-1.10.2.js" type="text/javascript"></script> 
		<script src="js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script> 
		<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.10.4.custom.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/general.css"/>
		 <script> 
			$(function(){ 
				$.datepicker.setDefaults(
					$.extend({changeYear: true}, {changeMonth: true}, $.datepicker.regional[' '])
				); 
				$('#datepicker').datepicker(); 
			});
			
			$(function(){ 
				$.datepicker.setDefaults(
					$.extend({changeYear: true}, {changeMonth: true}, $.datepicker.regional[' '])
				); 
				$('#datepicker1').datepicker(); 
			});
		 </script>
	</head>
	<body>
		<center>
			<div>
			<c:set var="num" scope="session" value="mm/dd/yyyy" />
			<fmt:formatDate pattern="MM/dd/YYYY" value="${pet.found_by_owner_date}" var="ownerDate"/>
			<fmt:formatDate pattern="MM/dd/YYYY" value="${pet.found_by_shelter_date}" var="shelterDate"/>

				<h1>Update Pet Record</h1>
			<h4><i> (*) Required Fields </i></h4>
			<form method="post" action="processUpdate.jsp?petId=${pet.pet_id}">
				<table cellpadding="7px" class="info"> 
					<tr>
						<th>Shelter Name: </th>
							<td><c:out value="${shelterName.name}"/></td>
					</tr>
					<tr>
						<th>Pet Name (*): </th>
							<td><input type="text" name="pName" value="${pet.pet_name}" maxlength="45" size="20" required/></td>
					</tr>
					<tr>
						<th>Picture (*): </th>
							<td><input type="file" name="pPic" value="${pet.picture_file}" required/></td>
					</tr>
					<tr>
						<th>Breed (*): </th>
							<td>
								<select name="pBreed" required>
									<option value="${pet.breed_id}"><c:out value="${breed.breed_name}"/></option> 
									<c:forEach items="${breedSelect.rows}" var="data">
										<option value="${data.breed_id}"><c:out value="${data.breed_name}"/></option>
									</c:forEach>
								</select>
							</td>
					</tr>
					<tr>
						<th>Age (*): </th>
							<td>
								<select name="pAge" required>
									<option value="${pet.age}">
										<c:choose> 
											<c:when test="${pet.age == 'B'}">
												<c:out value="Baby"/>
											</c:when>
											<c:when test="${pet.age == 'Y'}">
												<c:out value="Young"/>
											</c:when>
											<c:otherwise> 
												<c:out value="Adult"/>
											</c:otherwise>	
										</c:choose>
									</option>
									<option value="b">Baby</option>
									<option value="y">Young</option>
									<option value="a">Adult</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Size (*): </th>
							<td>
								<select name="pSize" required>
									<option value="${pet.size}">
										<c:choose> 
											<c:when test="${pet.size == 'S'}">
												<c:out value="Small"/>
											</c:when>
											<c:when test="${pet.size == 'M'}">
												<c:out value="Medium"/>
											</c:when>
											<c:otherwise> 
												<c:out value="Large"/>
											</c:otherwise>	
										</c:choose>
									</option>
									<option value="s">Small</option>
									<option value="m">Medium</option>
									<option value="l">Large</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Gender (*): </th>
							<td>
								<select name="gender" required>
									<option value="${pet.gender}">
										<c:choose> 
											<c:when test="${pet.gender == 'M'}">
												<c:out value="Male"/>
											</c:when>
											<c:otherwise> 
												<c:out value="Female"/>
											</c:otherwise>	
										</c:choose>
									</option>
									<option value="m">Male</option>
									<option value="f">Female</option>
								</select>
							</td>
					</tr>
					<tr>
						<th>Found by Shelter Date (*): </th>
							<td><input type="text" id="datepicker" name="foundByShelterDate" value="${shelterDate}" required/></td>
					</tr>
					<tr>
						<th>Found by Owner Date: </th>
							<td><input type="text" id="datepicker1" name="foundByOwnerDate" value="${pet.ownerDate}"/></td>
					</tr>
					<tr>
						<th>Owner First Name: </th>
							<td><input type="text" name="ownerFName" value="${pet.owner_first_name}" maxlength="45" size="20"/></td>
					</tr>
					<tr>
						<th>Owner Last Name: </th>
							<td><input type="text" name="ownerLName" value="${pet.owner_last_name}" maxlength="45" size="20"/></td>
					</tr>
					<tr>
						<th>Owner Street: </th>
							<td><input type="text" name="ownerAddress" value="${pet.owner_address}" maxlength="45" size="20"/></td>
					</tr>
					<tr>
						<th>Owner City: </th>
							<td><input type="text" name="ownerCity" maxlength="45" value="${pet.owner_city}" size="20"/></td>
					</tr>
					<tr>
						<th>Owner State: </th>
							<td>
								<select name="state">
									<option value="${pet.owner_state_code}"><c:out value="${pet.owner_state_code}"/></option>
									<c:forEach items="${stateSelect.rows}" var="list">
										<option value="${list.state_code}"><c:out value="${list.state_name}"/></option>
									</c:forEach>
							</td>
					</tr>
					<tr>
						<th>Owner ZipCode: </th>
							<td><input type="text" name="ownerZipCode" value="${pet.owner_zip}" maxlength="5" size="20"/></td>
					</tr>
					<tr>
						<th>Comments: </th>
							<td><textarea name="comments" maxlength="255" value="${pet.comments}"></textarea></td>
					</tr>
					<tr align="center">
						<th colspan="100"><input type="submit" value="Update Pet"/>&nbsp; &nbsp; <input type="reset" value="Clear"/></th>
					</tr>
				</table>
			</form>
			</div>
		</center>
	</body>
</html>