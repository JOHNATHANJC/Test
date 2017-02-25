<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:setDataSource 
driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/pet_shelter" 
user="root" 
password="hscc" 
/>

<sql:update>
	delete from pet
	where pet_id = ${param.pet_id}
</sql:update>

<c:set var="sd" value="You have deleted a contact, It will no longer appear in your address book." scope="session"/>
<c:redirect url="home.jsp"/>