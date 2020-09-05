<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<title>mise à jour d'un bien</title>

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
			<h2>C353 P2 - Mise à jour d'un bien</h2>
		</div>
	</div>

	
	<section class="wrapper style1">
		<form:form action="updateProperty" modelAttribute="property" method="POST">
			Adresse  : <form:input path="propertyAddress" />
						<form:errors path="propertyAddress" cssClass="error" /><br><br>
			Code Postal : <form:input path="postalCode" />
							<form:errors path="postalCode" cssClass="error" /><br><br>
			Nature : 
						<c:forEach items="${natures}" var="nature" >
							${nature.codeNature}<form:radiobutton path="nature" value="${nature.codeNature}"/>
						</c:forEach>			
						<form:errors path="nature" cssClass="error" /><br><br>
						
			Surface : <form:input path="surface" />
						<form:errors path="surface" cssClass="error" /><br><br>
			Prix : <form:input path="price" />
					<form:errors path="price" cssClass="error" /><br><br>
			Options : <form:input path="propertyOptions" />
					<form:errors path="propertyOptions" cssClass="error" /><br><br>
					
			<input type="submit" value="Appliquer les modifications" />
		</form:form>
		<a href="http://localhost:8080/C353_P2_V0/property/listProperties">Retour à la liste des biens</a>		
	</section>
	


</body>

</html>










