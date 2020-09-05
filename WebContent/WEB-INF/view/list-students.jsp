<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>Liste des étudiants</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Liste des étudiants</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Customer -->
		
			<input type="button" value="Ajouter un étudiant"
				   onclick="window.location.href='addStudentForm'; return false;"
				   class="add-button"
			/>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>Prénom</th>
					<th>Nom</th>
					<th>Numéro étudiant</th>
					<th>Adresse</th>
					<th>Email</th>
					<th>Bien loué</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="student" items="${students}">
				
					<c:url var="updateLink" value="/student/updateStudent">
						<c:param name="studentId" value="${student.id}" />
					</c:url>					

					<c:url var="deleteLink" value="/student/deleteStudent">
						<c:param name="studentId" value="${student.id}" />
					</c:url>	
					
					<c:url var="detailLink" value="/student/detailStudent">
						<c:param name="studentId" value="${student.id}" />
					</c:url>
					
					<c:url var="detailPropertyLink" value="/property/detailProperty">
						<c:param name="propertyId" value="${student.rented_property.id}" />
					</c:url>					
					
					<tr>
						<td><a href="${detailLink}">${student.firstName}</a></td>
						<td> ${student.lastName} </td>
						<td> ${student.studentCode} </td>
						<td> ${student.address} </td>
						<td> ${student.email} </td>
						<td><a href="${detailPropertyLink}">${student.rented_property.propertyAddress}</a></td>
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Etes-vous sûr de vouloir effacer cet étudiant?'))) return false">Delete
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









