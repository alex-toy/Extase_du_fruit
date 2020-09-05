<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>

<head>
	<title>Détail d'un bien</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>C353 P2 - Détail d'un bien</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<table>
				<tr>
					<th>Adresse</th>
					<th>Code postal</th>
					<th>Nature</th>
					<th>Surface</th>
					<th>prix</th>
					<th>Options</th>
					<th>Propriétaire</th>
					<th>Action</th>
				</tr>
				
				<c:url var="updateLink" value="/property/updatePropertyForm">
					<c:param name="propertyId" value="${property.id}" />
				</c:url>
				
				
				<c:if test = "${owner != null}">
					<c:url var="detailOwnerLink" value="/owner/detailOwner">
						<c:param name="ownerId" value="${owner.id}" />
					</c:url>
				</c:if>
				
				
				
				
				<tr>
					<td> ${property.propertyAddress} </td>
					<td> ${property.postalCode} </td>
					<td> ${property.nature} </td>
					<td> ${property.surface} </td>
					<td> ${property.price} </td>
					<td> ${property.propertyOptions} </td>
					
					
					
					<td>
						<c:if test = "${owner != null}">
				        	<a href="${detailOwnerLink}">${property.owner.firstName} ${property.owner.lastName}</a>
				     	</c:if>
					</td>
					
					
					<td><a href="${updateLink}">Update</a></td>
				</tr>
						
			</table>
			
		</div>
		
		
		
		<br><br><br><br>
		<div id="header">
			<h2>Liste des étudiants louant ce bien :</h2>
		</div>
		
		
		
		<div id="content">
			
			<table>
				<tr>
					<th>Prénom</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>Numéro étudiant</th>
					<th>email</th>
					<th>Action</th>
				</tr>
		
			<c:forEach var="renter" items="${property.renters}">
				
					<c:url var="stopRentLink" value="/student/stopRent">
						<c:param name="studentId" value="${renter.id}" />
						<c:param name="propertyId" value="${property.id}" />
					</c:url>
					
					<c:url var="detailLink" value="/student/detailStudent">
						<c:param name="studentId" value="${renter.id}" />
					</c:url>					
					
					<tr>
						<td><a href="${detailLink}">${renter.firstName}</a></td>
						<td> ${renter.lastName} </td>
						<td> ${renter.address} </td>
						<td> ${renter.studentCode} </td>
						<td> ${renter.email} </td>
						
						<td>
							<a href="${stopRentLink}"
							   onclick="if (!(confirm('Etes-vous sûr de vouloir stopper cette location ?'))) return false">Retirer de la location</a>
						</td>
						
					</tr>
				
				</c:forEach>
			</table>
				
		</div>
		
		
		
		
		
		
		<br><br><br><br>
		<div id="header">
			<h2>Rajouter un locataire louant ce bien : </h2>
			<select onchange="addRenter(this.value)">
				<option value="" selected disabled hidden>Choix du locataire</option>
				<c:forEach var="possibleRenter" items="${possibleRenters}">
					<option value="${possibleRenter.id}" >
						${possibleRenter.firstName} ${possibleRenter.lastName}
					</option>
				</c:forEach>
			</select>
			<script>
				function addRenter(studentId){
				    var conf = confirm("Voulez-vous rajouter ce locataire?");
				    if (conf) {
				        window.location = "http://localhost:8080/C353_P2_V0/property/addRenter?propertyId=" + ${property.id} + "&renterId=" + studentId;
				    }
				}
			</script>
		</div>
		
		
		<br><br><br><br>
		<div id="header">
			<h2>Changer le propriétaire de ce bien : </h2>
			<select onchange="changeOwner(this.value)">
				<option value="" selected disabled hidden>Choix du propriétaire</option>
				<c:forEach var="otherOwner" items="${otherOwners}">
					<option value="${otherOwner.id}" >
						${otherOwner.firstName} ${otherOwner.lastName}
					</option>
				</c:forEach>
			</select>
		</div>
		
		<script>
			function changeOwner(otherOwnerId){
			    var conf = confirm("Voulez-vous changer de propriétaire?");
			    if (conf) {
			        window.location = "http://localhost:8080/C353_P2_V0/property/setOwner?propertyId=" + ${property.id} + "&ownerId=" + otherOwnerId;
			    }
			}
		</script>
		
		
		<br><br>
		<br><br>
		<a href="http://localhost:8080/C353_P2_V0/student/listStudents">Liste des étudiants</a><br><br>
		<a href="http://localhost:8080/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
		<a href="http://localhost:8080/C353_P2_V0/owner/listOwners">Liste des propriétaires</a><br><br>
		<a href="http://localhost:8080/C353_P2_V0/location/listLocations">Liste des locations</a><br><br>
		<a href="http://localhost:8080/C353_P2_V0/home">Home</a>
		
	
	</div>
	

</body>

</html>









