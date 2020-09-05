<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Liste des natures</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
		
			<input type="button" value="Ajouter une nature"
				   onclick="window.location.href='addNatureForm'; return false;"
				   class="add-button"
			/>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>Code nature</th>
					<th>Pourcentage</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="nature" items="${natures}">
				
					<c:url var="updateLink" value="/nature/updateNature">
						<c:param name="natureId" value="${nature.id}" />
					</c:url>					

					<c:url var="deleteLink" value="/nature/deleteNature">
						<c:param name="natureId" value="${nature.id}" />
					</c:url>	
									
					
					<tr>
						<td> ${nature.codeNature} </td>
						<td> ${nature.pourcentage} </td>
						
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Etes-vous sûr de vouloir effacer cette nature?'))) return false">Delete
							</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
			
			<br><br>
			<a href="http://localhost:8080/C353_P2_V0/home">Home</a><br><br>
			<a href="http://localhost:8080/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
			<a href="http://localhost:8080/C353_P2_V0/owner/listOwners">Liste des propriétaires</a>
				
		</div>
	
	</div>
	

</body>

</html>









