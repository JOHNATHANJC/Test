<%@ include file="database.jsp"%>

<%@ include file="database.jsp"%>

<sql:query var="shelterPet">
	select * from pet p
	join shelter s
	on p.shelter_id = s.shelter_id
	join breed b
	on p.breed_id = b.breed_id
	where found_by_owner_date is null
</sql:query>



<sql:query var="totalPetCount">
	select  * from pet
</sql:query>

<sql:query var="pets">
	select * from pet p
	join shelter s
	on p.shelter_id = s.shelter_id
	join breed b
	on p.breed_id = b.breed_id
	where found_by_owner_date is NULL
</sql:query>

<sql:query var="totalLostPetCount">
	select * from pet
	where found_by_owner_date is null
</sql:query>

<sql:query var="totalPets">
	select * from pet
	where found_by_owner_date is not null
</sql:query>

<sql:query var="shelterSelect"> 
	select * from shelter
</sql:query>	

<!DOCTYPE html>
	<html> 
		<head>
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link rel="stylesheet" type="text/css" href="css/general.css"/>
		</head>
		<body> 
		<center>
			
			<h1> Paws and Found: Home </h1>
<c:import url="menu.jsp"/>			
		
				<c:if test="${not empty success}"> 
					<p style="color:green;">
					<c:out value="${success}"/>
					<c:remove var="success"/>
					</p>
				</c:if>
			
			<c:choose> 
				<c:when test="${not empty accountId}">
				<h1> Lost Pets </h1>
					<p >In Your Shelter (<fmt:formatNumber value="${shelterPet.rowCount}" type="number"/>) </p >
				
					
		<div class="container">
		<table cellpadding="7px" class="table table-responsive">
			<tr>
				<th></th>
				<th>Pet Name</th>
				<th>Age/Breed</th>
				<th>Shelter</th>
				<th> Found By Shelter </th>
			</tr>
			<c:forEach var="pets" items="${shelterPet.rows}">
				<c:if test="${pets.age == 'b'}">
					<c:set var="age" value="Baby" />
				</c:if>
				<c:if test="${pets.age == 'y'}">
					<c:set var="age" value="Young" />
				</c:if>
				<c:if test="${pets.age == 'a'}">
					<c:set var="age" value="Adult" />
				</c:if>
				<tr align="center">
					<td><img src="pets/<c:out value='${pets.picture_file}'/>" alt="${pets.pet_name}" height="100px" width="100px"/></td>
					<td>${pets.pet_name}</td>
					<td>${age} ${pets.breed_name}</td>
					<td>${pets.name}<br/>${pets.address} ${pets.city} ${pets.state_code} ${pets.zip}</td>
					<td><fmt:formatDate value="${pets.found_by_shelter_date}" dateStyle="long"/></td>
				</tr>
			</c:forEach>
		</table>	
</div>		
				</c:when> 
				<c:otherwise> 
		<h1> Lost Pets </h1>
		<div class="container">
		<table cellpadding="7px" class="table table-responsive">
			<tr>
				<th></th>
				<th>Pet Name</th>
				<th>Age/Breed</th>
				<th>Shelter</th>
				<th> Found By Shelter </th>
			</tr>
			<c:forEach var="animals" items="${shelterPet.rows}">
						<c:if test="${animals.age == 'b'}">
					<c:set var="age" value="Baby" />
				</c:if>
				<c:if test="${animals.age == 'y'}">
					<c:set var="age" value="Young" />
				</c:if>
				<c:if test="${animals.age == 'a'}">
					<c:set var="age" value="Adult" />
				</c:if>
				<tr align="center">
					<td><img src="pets/<c:out value='${animals.picture_file}'/>" alt="${animals.pet_name}" height="100px" width="100px"/></td>
					<td>${animals.pet_name}</td>
					<td>${age} ${animals.breed_name}</td>
					<td>${animals.name}<br/>${animals.address} ${animals.city} ${animals.state_code} ${animals.zip}</td>
					<td><fmt:formatDate value="${animals.found_by_shelter_date}" dateStyle="long"/></td>
				</tr>
			</c:forEach>
		</table>	
</div>		
				</c:otherwise>
			</c:choose>
			</center>
		</body>
	</html>