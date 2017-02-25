<%@ include file="database.jsp"%>
<sql:query var="exist">
	select * from shelter_admin
	where user_id="${param.uName}"
	and password="${param.pWord}"
</sql:query>
<c:set var="log" value="${exist.rows[0]}"/>
<c:choose>
	<c:when test="${empty log}">
		<c:set var="ue" value="Invalid login information. Please try again" scope="session"/>
		<c:redirect url="login.jsp"/>
	</c:when>
	<c:otherwise>
		<c:set var="accountId" value="${log.shelter_admin_id}" scope="session"/>
		<c:set var="username" value="${log.user_id}" scope="session"/>
		<c:set var="shelter" value="${log.shelter_id}" scope="session"/>
		<c:set var="fullName" value="${log.first_name} ${log.last_name}" scope="session"/>
		<c:redirect url="home.jsp"/>
	</c:otherwise>
</c:choose>