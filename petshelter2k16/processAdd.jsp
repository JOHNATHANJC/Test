<%@include file="database.jsp"%>

<sql:query var="select">
select * from pet where pet_name = "${param.pName}"
and size = "${param.pSize}"
and owner_first_name = "${param.ownerFName}"
	and owner_last_name = "${param.ownerLName}"
</sql:query>

<c:set var ="check" value="${select.rows[0]}" scope="session"/>


<c:choose>
	<c:when test="${empty param.pName}">
		<c:set var="pName" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pName" value="${param.pName}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.aPic}">
		<c:set var="aPic" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="aPic" value="${param.aPic}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.pBreed}">
		<c:set var="pBreed" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pBreed" value="${param.pBreed}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.pAge}">
		<c:set var="pAge" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pAge" value="${param.pAge}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.pSize}">
		<c:set var="pSize" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="pSize" value="${param.pSize}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.gender}">
		<c:set var="gender" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="gender" value="${param.gender}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.foundDate}">
		<c:set var="foundDate" value="${null}"/>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.foundODate}">
		<c:set var="foundODate" value="${null}"/>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oFName}">
		<c:set var="oFName" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oFName" value="${param.oFName}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oLName}">
		<c:set var="oLName" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oLName" value="${param.oLName}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oAddress}">
		<c:set var="oAddress" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oAddress" value="${param.oAddress}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oCity}">
		<c:set var="oCity" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oCity" value="${param.oCity}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oState}">
		<c:set var="ownerState" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oState" value="${param.oState}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oZip}">
		<c:set var="oZip" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oZip" value="${param.oZip}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${empty param.oComments}">
		<c:set var="oComments" value="${null}"/>
	</c:when>
	<c:otherwise>
		<c:set var="oComments" value="${param.oComments}"/>
	</c:otherwise>
</c:choose>

	
		<sql:update>
		INSERT into pet(shelter_id,pet_name,picture_file, breed_id, age, size,found_by_shelter_date, gender,owner_first_name,owner_last_name,owner_address,owner_city,owner_state_code,owner_zip,comments)
		values( "${shelter}", "${pName}", "${aPic}", "${pBreed}", "${pAge}",  "${pSize}","2010-1-10", "${gender}", "${oFName}", "${oLName}", "${oAddress}", "${oCity}", "${oState}", "${oZip}", "${oComments}")
		
		</sql:update>
		
	
		<c:set var="success" value="Pet recorded added." scope="session"/>
		<c:redirect url="home.jsp"/>
