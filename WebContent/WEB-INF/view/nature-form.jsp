<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Ajout d'une nature</title>

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
			<h2>C353 P2 - Ajout d'une nature</h2>
		</div>
	</div>

	
	<section class="wrapper style1">
		<form:form action="saveNature" modelAttribute="nature" method="POST">
		<form:hidden path="id" />
			Code nature  : <form:input path="codeNature" /><form:errors path="codeNature" cssClass="error" /><br><br>
			Pourcentage : <form:input path="pourcentage" /><form:errors path="pourcentage" cssClass="error" /><br><br>
			<input type="submit" value="Ajouter" />
		</form:form>
		<a href="http://localhost:8080/C353_P2_V0/nature/listNatures">Retour ра la liste des natures</a>		
	</section>
	

</body>

</html>










