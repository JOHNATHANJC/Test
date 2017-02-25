<%@ include file="database.jsp"%>

<c:remove var="accountId"/>
<c:remove var="shelter"/>
<c:remove var="fullName"/>

<c:set var="ryes" value="You have successfully logged out." scope="session"/>
<c:redirect url="login.jsp"/>