<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>D�tail d'un �tudiant</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - D�tail d'un �tudiant</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<table>
				<tr>
					<th>Pr�nom</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>Num�ro �tudiant</th>
					<th>email</th>
					<th>Bien lou�</th>
					<th>Action</th>
				</tr>
				
				<c:url var="stopLocationLink" value="/student/stopRent">
					<c:param name="studentId" value="${student.id}" />
					<c:param name="propertyId" value="${student.rented_property.id}" />
				</c:url>
				
				<c:url var="detailPropertyLink" value="/property/detailProperty">
					<c:param name="propertyId" value="${student.rented_property.id}" />
				</c:url>
				
				<tr>
					<td> ${student.firstName} </td>
					<td> ${student.lastName} </td>
					<td> ${student.address} </td>
					<td> ${student.studentCode} </td>
					<td> ${student.email} </td>
					<td><a href="${detailPropertyLink}">${student.rented_property.propertyAddress}</a></td>
					<td><a href="${stopLocationLink}">Retirer location</a></td>
				</tr>
						
			</table>
			
			
			<br><br><br><br>
			<div id="wrapper">
				<div id="header">
					<h2>Assigner une location � cet �tudiant</h2>
					<select onchange="addRentToStudent(this.value)">
						<option value="" selected disabled hidden>Choix du bien</option>
						<c:forEach var="property" items="${properties}">
							<option value="${property.id}" >
								${property.propertyAddress}
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<script>
				function addRentToStudent(propertyId){
				    var conf = confirm("Voulez-vous louer ce bien � cet �tudiant?");
				    if (conf) {
				        window.location = "http://localhost:8080/C353_P2_V0/student/addStudentToRent?propertyId=" + propertyId + "&studentId=" + ${student.id};
				    }
				}
			</script>
			
			
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









