<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
	
	<head>
		<title>eMIAGE - C353 - P2</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
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


		<!-- Main -->
			<div id="main">
			
				<div id="wrapper">
					<div id="header">
						<h2>C353 P2 - Ajout d'un bien</h2>
					</div>
				</div>

					
				<section class="wrapper style1">
					<form:form action="saveProperty" modelAttribute="property" method="POST">
					<form:hidden path="id" />
						Adresse  : <form:input path="propertyAddress" /><form:errors path="propertyAddress" cssClass="error" /><br><br>
						Code Postal : <form:input path="postalCode" /><form:errors path="postalCode" cssClass="error" /><br><br>
						Nature : 
						<c:forEach items="${natures}" var="nature" >
							${nature.codeNature}<form:radiobutton path="nature" value="${nature.codeNature}"/>
						</c:forEach>
						<form:errors path="nature" cssClass="error" /><br><br>
						Surface : <form:input path="surface" /><form:errors path="surface" cssClass="error" /><br><br>
						Prix : <form:input path="price" /><form:errors path="price" cssClass="error" /><br><br>
						Options : <form:input path="propertyOptions" /><form:errors path="propertyOptions" cssClass="error" /><br><br>
						
						
						
						
						<input type="submit" value="Ajouter" />
					</form:form>		
				</section>


				<section class="wrapper style1">
					<div class="inner">
						<br><br>
						<a href="http://localhost:8080/C353_P2_V0/student/listStudents">Liste des étudiants</a><br><br>
						<a href="http://localhost:8080/C353_P2_V0/owner/listOwners">Liste des propriétaires</a><br><br>
						<a href="http://localhost:8080/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
						<a href="http://localhost:8080/C353_P2_V0/home">Home</a>
					</div>
				</section>

			</div>


	</body>
</html>