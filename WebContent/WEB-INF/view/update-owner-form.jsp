<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Modification d'un propri�taire</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
		  
	<style>
		.error {color:red}
	</style>
		  
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Modification d'un propri�taire</h2>
		</div>
	</div>

	
	<section class="wrapper style1">
		<form:form action="saveOwner" modelAttribute="owner" method="POST">
		<form:hidden path="id" />
			Prenom  : <form:input path="firstName" /><form:errors path="firstName" cssClass="error" /><br><br>
			Nom : <form:input path="lastName" /><form:errors path="lastName" cssClass="error" /><br><br>
			Adresse : <form:input path="address" /><form:errors path="address" cssClass="error" /><br><br>
			Email : <form:input path="email" /><form:errors path="email" cssClass="error" /><br><br>
			<input type="submit" value="Appliquer les modifications" />
		</form:form>
		<a href="http://localhost:8080/C353_P2_V0/owner/listOwners">Retour a la liste des propri�taires</a>		
	</section>
	

</body>

</html>










