<%@ include file="database.jsp"%>


<c:catch var="accountErr">
<c:choose>
	<c:when test="${not empty param.newPass && param.confirm}">
	<sql:update>
		update shelter_admin 
		set
		first_name = '${param.newFirst}',
		last_name = '${param.newLast}',
		shelter_id = '${param.shelterLocation}',
		password = '${param.confirm}'
		where shelter_admin_id = '${accountId}'
		and password = '${param.current}'
	</sql:update>
	<c:set var="success" value="You have successfully updated your account!" scope="request"/>
	<jsp:forward page="home.jsp"/>
	</c:when>
	<c:when test="${empty param.newPass && empty param.confirm}"> 
	<sql:update>
		update shelter_admin 
		set
		first_name = '${param.newFirst}',
		last_name = '${param.newLast}',
		shelter_id = '${param.shelterLocation}'
		where shelter_admin_id = '${accountId}'
		and password = '${param.current}'
	</sql:update>
	<c:set var="success" value="You have successfully updated your account!" scope="request"/>
	<jsp:forward page="home.jsp"/>
	
	</c:when>
	<c:otherwise>
		<c:set var="updateAccountErr" value="Your passwords do not match, please try again." scope="request"/>
		<jsp:forward page="updateAccount.jsp"/>
	</c:otherwise>
</c:choose>
</c:catch>
<c:out value="${accountErr}"/>