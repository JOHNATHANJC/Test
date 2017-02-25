<%@include file="database.jsp"%>
<sql:query var="r">
	Select * from shelter_admin 
	where user_id ="${param.uname}"
</sql:query>
<c:set var="e" value="${r.rows[0]}"/>
<c:choose>
	<c:when test="${not empty e}">
		<c:set var="uerr" value="This username is already taken" scope="session"/>
		<c:redirect url="register.jsp"/>
	</c:when>
	<c:when test="${param.pword != param.cpword}">
		<c:set var="perr" value="your passwords do not match" scope="session"/>
		<c:redirect url="register.jsp"/>
	</c:when>
	<c:otherwise>
		<sql:update var="up">
			insert into shelter_admin
			values(null,?,?,?,?,?)
			<sql:param value="${param.uname}"/>
			<sql:param value="${param.pword}"/>
			<sql:param value="${param.fname}"/>
			<sql:param value="${param.lname}"/>
			<sql:param value="${param.shel}"/>
		</sql:update>
	</c:otherwise>
</c:choose>
<c:set var="sr" value="You Have successfully signed up!" scope="session"/>
<c:redirect url="login.jsp"/>
