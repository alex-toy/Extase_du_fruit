<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	
	<head>
		<title>eMIAGE - C353 - P2</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		
		
	</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="student/listStudents">Liste des �tudiants</a></li>
					<li><a href="owner/listOwners">Liste des propri�taires</a></li>
					<li><a href="property/listProperties">Liste des biens</a></li>
					<li><a href="nature/listNatures">Param�trage des pourcentages</a></li>
				</ul>
			</nav>

	

		<!-- Main -->
			<div id="main">

					<section class="wrapper style1">
						<div class="inner">
							<div>
								<h2>C353 P2 - Liste des biens</h2>
							</div>
							
							<table>
								<tr>
									<th>Num�ro</th>
									<th>Adresse</th>
									<th>Code postal</th>
									<th>Nature</th>
									<th>Surface</th>
									<th>prix</th>
									<th>Options</th>
									<th>Propri�taire</th>
									<th>Action</th>
								</tr>
				
								<c:forEach var="property" items="${properties}" varStatus="loop">
								
									<c:url var="deleteLink" value="/property/deleteProperty">
										<c:param name="propertyId" value="${property.id}" />
									</c:url>
									
									<c:url var="detailLink" value="/property/detailProperty">
										<c:param name="propertyId" value="${property.id}" />
									</c:url>
									
									<c:url var="detailOwnerLink" value="/owner/detailOwner">
										<c:param name="ownerId" value="${property.owner.id}" />
									</c:url>					
									
									<tr>
										<td> ${loop.count} </td>
										<td><a href="${detailLink}">${property.propertyAddress}</a></td>
										<td> ${property.postalCode} </td>
										<td> ${property.nature} </td>
										<td> ${property.surface} </td>
										<td> ${property.price} </td>
										<td> ${property.propertyOptions} </td>
										<td><a href="${detailOwnerLink}">${property.owner.firstName} ${property.owner.lastName}</a></td>
										<td>
											<c:if test="${deletables[property.id] == false}">
													<c:out value="ne peut etre effac�"/>
											</c:if>
											
											<c:if test="${deletables[property.id] == true}">
													<a href="${deleteLink}" onclick="if (!(confirm('Etes-vous s�r de vouloir effacer ce bien?'))) return false">Delete</a>
											</c:if>
										</td>
								</c:forEach>
							</table>
							
						</div>
					</section>


					<section class="wrapper style1">
						<div class="inner">
							<input type="button" value="Ajouter un bien"
							   onclick="window.location.href='addPropertyForm'; return false;"
							   class="add-button"/><br><br>
							<a href="http://localhost:8080/C353_P2_V0/student/listStudents">Liste des �tudiants</a><br><br>
							<a href="http://localhost:8080/C353_P2_V0/owner/listOwners">Liste des propri�taires</a><br><br>
							<a href="http://localhost:8080/C353_P2_V0/property/listProperties">Liste des biens</a><br><br>
							<a href="http://localhost:8080/C353_P2_V0/home">Home</a>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
					</ul>
					<p>&copy; Untitled. All rights reserved. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.</p>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>