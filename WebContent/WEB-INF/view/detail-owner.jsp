<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>D�tail d'un propri�taire</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - D�tail d'un propri�taire</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<table>
				<tr>
					<th>Pr�nom</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>email</th>
					<th>Action</th>
				</tr>
				
				<c:url var="updateLink" value="/owner/updateOwner">
					<c:param name="ownerId" value="${owner.id}" />
				</c:url>
				
				<tr>
					<td> ${owner.firstName} </td>
					<td> ${owner.lastName} </td>
					<td> ${owner.address} </td>
					<td> ${owner.email} </td>
					<td><a href="${updateLink}">Update</a></td>
				</tr>
						
			</table>
			
			
			
			
			
			
	<br><br><br><br><br><br>
	<div id="wrapper">
		<div id="header">
			<h2>Liste des biens appartenant � ${owner.firstName} ${owner.lastName}</h2>
		</div>
	</div>
	
	<div id="content">
	
	
		<table>
					<tr>
						<th>Num�ro</th>
						<th>Adresse</th>
						<th>Code postal</th>
						<th>Nature</th>
						<th>Surface</th>
						<th>prix</th>
						<th>Options</th>
						<th>Action</th>
					</tr>
					
					<c:forEach var="property" items="${properties}" varStatus="loop">
					
						<c:url var="deleteLink" value="/property/deleteProperty">
							<c:param name="propertyId" value="${property.id}" />
						</c:url>
						
						<c:url var="detailLink" value="/property/detailProperty">
							<c:param name="propertyId" value="${property.id}" />
						</c:url>					
						
						<tr>
							<td> ${loop.count} </td>
							<td><a href="${detailLink}">${property.propertyAddress}</a></td>
							<td> ${property.postalCode} </td>
							<td> ${property.nature} </td>
							<td> ${property.surface} </td>
							<td> ${property.price} </td>
							<td> ${property.propertyOptions} </td>
							<td>
							
								<c:if test="${deletables[property.id] == false}">
										<c:out value="ne peut etre effac�"/>
								</c:if>
								
								<c:if test="${deletables[property.id] == true}">
										<a href="${deleteLink}" onclick="if (!(confirm('Etes-vous s�r de vouloir effacer ce bien?'))) return false">Delete</a>
								</c:if>
							
							
							</td>
							
							
						</tr>
					
					</c:forEach>
							
				</table>
		
	</div>	
			
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









