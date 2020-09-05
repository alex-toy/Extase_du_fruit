<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>Liste des locations</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Liste des locations</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<table>
				<tr>
					<th>date de début</th>
					<th>date de fin</th>
					<th>Locataire</th>
					<th>propriétaire</th>
					<th>bien</th>
					<th>Prix</th>
					<th>Pourcentage</th>
					<th>Tarif CROUS</th>
				</tr>
				
				<c:forEach var="location" items="${locations}">
					
					<c:url var="detailOwnerLink" value="/owner/detailOwner">
						<c:param name="ownerId" value="${location.property.owner.id}" />
					</c:url>	
				
					<c:url var="detailStudentLink" value="/student/detailStudent">
						<c:param name="studentId" value="${location.renter.id}" />
					</c:url>					

					<c:url var="detailPropertyLink" value="/property/detailProperty">
						<c:param name="propertyId" value="${location.property.id}" />
					</c:url>	
						
					
					<tr>
						<td> ${location.beginDate} </td>
						<td> ${location.endDate} </td>
						<td><a href="${detailStudentLink}">${location.renter.firstName} ${location.renter.lastName}</a></td>
						<td><a href="${detailOwnerLink}">${location.property.owner.firstName} ${location.property.owner.lastName}</a></td>
						<td><a href="${detailPropertyLink}">${location.property.propertyAddress}</a></td>
						<td> ${location.property.price} </td>
						<td> ${indexed_natures[location.property.id].pourcentage} </td>
						<td> ${location.property.price * indexed_natures[location.property.id].pourcentage /100} </td>
					</tr>
				
				</c:forEach>
						
			</table>
			
			<br><br>
			<a href="/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
			<a href="/C353_P2_V0/student/listStudents">Liste des étudiants</a><br><br>
			<a href="/C353_P2_V0/owner/listOwners">Liste des propriétaires</a><br><br>
			<a href="/C353_P2_V0/home">Home</a>
			
				
		</div>
	
	</div>
	

</body>

</html>









