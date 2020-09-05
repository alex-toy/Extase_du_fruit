<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>D�tail d'une personne</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - D�tail d'une personne</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<table>
				<tr>
					<th>Pr�nom</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>Nationalit�</th>
					<th>Num�ro �tudiant</th>
					<th>email</th>
					<th>Bien lou�</th>
					<th>Action</th>
				</tr>
				
				<c:url var="stopLocationLink" value="/person/stopRent">
					<c:param name="renterId" value="${person.id}" />
					<c:param name="propertyId" value="${person.rented_property.id}" />
				</c:url>
				
				<c:url var="detailPropertyLink" value="/property/detailProperty">
					<c:param name="propertyId" value="${person.rented_property.id}" />
				</c:url>
				
				<tr>
					<td> ${person.firstName} </td>
					<td> ${person.lastName} </td>
					<td> ${person.address} </td>
					<td> ${person.country} </td>
					<td> ${person.studentCode} </td>
					<td> ${person.email} </td>
					<td><a href="${detailPropertyLink}">${person.rented_property.propertyAddress}</a></td>
					<td><a href="${stopLocationLink}">Retirer location</a></td>
				</tr>
						
			</table>
			
	<div id="wrapper">
		<div id="header">
			<h2>Assigner une location � ${person.firstName} ${person.lastName}</h2>
		</div>
	</div>
			
			<c:forEach var="property" items="${properties}">
				
				<c:url var="addPersonToRentLink" value="/person/addPersonToRent">
					<c:param name="renterId" value="${person.id}" />
					<c:param name="propertyId" value="${property.id}" />
				</c:url>					
					
						
				<p><a href="${addPersonToRentLink}">${property.propertyAddress}</a></p>
					
			</c:forEach>
			
			<br><br>
			<a href="/C353_P2_V0/student/listStudents">Liste des �tudiants</a><br><br>
			<a href="/C353_P2_V0/owner/listOwners">Liste des propri�taires</a><br><br>
			<a href="http://localhost:8080/C353_P2_V0/location/listLocations">Liste des locations</a><br><br>
			<a href="/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
			<a href="/C353_P2_V0/home">Home</a>
			
				
		</div>
		
	</div>
	

</body>

</html>









