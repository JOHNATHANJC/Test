
<%@ include file="database.jsp"%>

<!DOCTYPE html> 
	<html>
		<head> 
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			<link rel="stylesheet" href="menu.css" type="text/css"/>
		</head> 
		<body> 
		<center>
			<div id="header"> 
				<c:choose>
					<c:when test="${empty accountId}">
						<span id="greeting"> Welcome, to Paws and Found! </span> 
					</c:when> 
					<c:otherwise>
						<span id="greeting">Welcome, <c:out value="${fullName}"/>! </span>
					</c:otherwise>
				</c:choose>
				<c:choose> 
					<c:when test="${empty accountId}">
						<span id="logout"><a href="login.jsp"> Login </a></span> 
					</c:when> 
					<c:otherwise> 
						<span id="logout"><a href="logout.jsp"> Logout </a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<nav> 
				<c:choose> 
					<c:when test="${empty accountId}">
							<header>
			<a href="home.jsp">
				<div class="content" id="one">
					<p class="pic"><span class="glyphicon glyphicon-home"></span></p>
					<p class="text">Home</p>
				</div>
			</a>
			<a href="lost.jsp">
				<div class="content" id="two">
				<p class="pic"><span class="glyphicon glyphicon-search"></span></p>
				<p class="text">Lost Pets</p>
				</div>
			</a>
			<a href="found.jsp">
				<div class="content" id="three">
				<p class="pic"><span class="glyphicon glyphicon-star"></span></p>
				<p class="text">Found Pets</p>
				</div>
			</a>
			<a href="login.jsp">
				<div class="content" id="three">
				<p class="pic"><span class="glyphicon glyphicon-user"></span></p>
				<p class="text">Login</p>
				</div>
			</a>
			</header>
					</c:when> 
					<c:otherwise> 
							<header>
			<a href="home.jsp">
				<div class="content" id="one">
					<p class="pic"><span class="glyphicon glyphicon-home"></span></p>
					<p class="text">Home</p>
				</div>
			</a>
			<a href="add.jsp">
				<div class="content" id="two">
				<p class="pic"><span class="glyphicon glyphicon-plus"></span></p>
				<p class="text">Add Record</p>
				</div>
			</a>
			<a href="found.jsp">
				<div class="content" id="three">
					<p class="pic"><span class="glyphicon glyphicon-star"></span></p>
				<p class="text">Found Pets</p>
				</div>
			</a>
			<a href="updateAccount.jsp?accountId=${aaccountId}">
				<div class="content" id="four">
				<p class="pic"><span class="glyphicon glyphicon-user"></span></p>
				<p class="text">Update Account</p>
				</div>
			</a>
			</header>
					</c:otherwise>
				</c:choose>
		</center>
		</body>
		</html>
	