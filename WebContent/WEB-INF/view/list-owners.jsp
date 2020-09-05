<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>Liste des propriétaires</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Liste des propriétaires</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
		
			<input type="button" value="Ajouter propriétaire"
				   onclick="window.location.href='addOwnerForm'; return false;"
				   class="add-button"
			/>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>Prénom</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="owner" items="${owners}">
					
					<c:url var="detailOwnerLink" value="/owner/detailOwner">
						<c:param name="ownerId" value="${owner.id}" />
					</c:url>	
				
					<c:url var="updateLink" value="/owner/updateOwner">
						<c:param name="ownerId" value="${owner.id}" />
					</c:url>					

					<c:url var="deleteLink" value="/owner/deleteOwner">
						<c:param name="ownerId" value="${owner.id}" />
					</c:url>	
					
								
					
					<tr>
						<td><a href="${detailOwnerLink}">${owner.firstName}</a></td>
						<td> ${owner.lastName} </td>
						<td> ${owner.address} </td>
						<td> ${owner.email} </td>
						
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Etes-vous sûr de vouloir effacer ce propriétaire?'))) return false">Delete
							</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
			
			<br><br>
			<a href="/C353_P2_V0/home">Home</a><br><br>
			<a href="/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
			<a href="/C353_P2_V0/student/listStudents">Liste des étudiants</a><br><br>
			
				
		</div>
	
	</div>
	

</body>

</html>









