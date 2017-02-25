<%@ include file="database.jsp"%>

<%@ include file="database.jsp"%>

<sql:query var="shelterPet">
	select * from pet p
	join shelter s
	on p.shelter_id = s.shelter_id
	join breed b
	on p.breed_id = b.breed_id
	where p.shelter_id = '${shelter}'
	and found_by_owner_date is null
</sql:query>

<sql:query var="pFound">
	select * from pet p
	join shelter s
	on p.shelter_id = s.shelter_id
	join breed b
	on p.breed_id = b.breed_id
	where found_by_owner_date is not null
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
</head>	
	<body>
	<center>
	<h1> Lost Pets </h1>
	<c:import url="menu.jsp"/>
		<div class="container">
		<table cellpadding="7px" class="table table-responsive">
			<tr>
				<th></th>
				<th>Pet Name</th>
				<th>Age/Breed</th>
				<th>Shelter</th>
				<th> Found By Shelter </th>
				<th> Found By Owner </th>
			</tr>
			<c:forEach var="woe" items="${pFound.rows}">
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
					<td><img src="pets/<c:out value='${woe.picture_file}'/>" alt="${woe.pet_name}" height="100px" width="100px"/></td>
					<td>${woe.pet_name}</td>
					<td>${age} ${woe.breed_name}</td>
					<td>${woe.name}<br/>${woe.address} ${woe.city} ${woe.state_code} ${woe.zip}</td>
					<td><fmt:formatDate value="${woe.found_by_shelter_date}" dateStyle="long"/></td>
					<td><fmt:formatDate value="${woe.found_by_owner_date}" dateStyle="long"/></td>
				</tr>
			</c:forEach>
		</table>	
</div>		

			</center>
		</body>
	</html>