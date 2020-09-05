<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	
	<head>
		<title>L'extase du fruit</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
		
		
	</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo">
					<a href="index.html">Professeur : <span>Didier Lefebvre</span></a>
					<a href="index.html">Etudiant : <span>Alessio Rea</span></a>
					
				</div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="student/listStudents">Accueil</a></li>
					<li><a href="owner/listOwners">contact</a></li>
					<li><a href="property/listProperties">nos produits</a></li>
					<li><a href="nature/listNatures">bienvenue chez nous</a></li>
					<li><a href="location/listLocations">l'extase de la semaine</a></li>
					<li><a href="location/listLocations">commande</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>L'extase du fruit</h1>
						<p>La référence du goût de l'exotisme.<br />
						Chaque semaine une explosion gustative à découvrir.</p>
					</header>
					<a href="#main" class="button big scrolly">Description du projet</a>
				</div>
			</section>

		<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<!-- 2 Columns -->
								<div class="flex flex-2">
									<div class="col col1">
										<div class="image round fit">
											<a href="generic.html" class="link"><img src="${pageContext.request.contextPath}/resources/images/pic01.jpg" alt="" /></a>
										</div>
										
										
									</div>
									<div class="col col2">
										<h3>Nos produits de saison</h3>
										<p>L'objectif est de partir d'une modélisation UML puis par transformation de modèles de raffiner vers des modèles d'implantation.</p> 
										<p>Réaliser l'intégration de code issu de transformations de modèles,</p>
										<p>Prendre en main l'environnement de développement Java Spring.</p>
										<a href="#" class="button">Learn More</a>
									</div>
								</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style2">
						<div class="inner">
							<div class="flex flex-2">
								<div class="col col2">
									<h3>Contexte</h3>
									<p>Le CROUS gère des logements pour les étudiants. Deux types de logements sont gérés par des services différents : les logements en cité universitaire et les logements en ville. Nous nous intéressons ici au second. Le service des logements en ville dispose de renseignements concernant des propriétaires de villas, appartements, garages...</p>
									<ul>
									  <li>nom, prénom et adresse des propriétaires ;</li>
									  <li>nature et adresse du bien possédé par un propriétaire.</li>
									</ul>
									<p>Nous voulons aussi pouvoir représenter le fait qu'un propriétaire peut vouloir louer ses biens. Nous ne souhaitons toutefois pas d'auto-location (de location dans lesquelles propriétaire et locataire sont une seule et même personne). La location se fait à partir d'une date donnée, pour une période donnée et moyennant un loyer mensuel précis.</p>
									<a href="#" class="button">Learn More</a>
								</div>
								<div class="col col1 first">
									<div class="image round fit">
										<a href="generic.html" class="link"><img src="${pageContext.request.contextPath}/resources/images/pic02.jpg" alt="" /></a>
									</div>
								</div>
							</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<header class="align-center">
								<h2>Implémentation du projet</h2>
								<p>Ce projet a été implémenté en Java Spring. La base de données utilisée est mySQL. l'ORM est Hibernate.</p>
							</header>
							<div class="flex flex-3">
								
								<div class="col align-center">
									<div class="image round fit">
										<img src="${pageContext.request.contextPath}/resources/images/pic03.jpg" alt="" />
									</div>
									<p>Dans cette section, vous êtes en mesure de visualiser la liste des étudiants, d'en inscrire de nouveaux, d'en supprimer ou modifier des existants.</p>
									<a href="student/listStudents" class="button">Liste des étudiants</a>
								</div>
								
								<div class="col align-center">
									<div class="image round fit">
										<img src="${pageContext.request.contextPath}/resources/images/pic05.jpg" alt="" />
									</div>
									<p>Dans cette section, vous êtes en mesure de visualiser la liste des biens disponibles et d'affecter des étudiants à la location. 
									
									</p>
									<a href="property/listProperties" class="button">Liste des bien</a>
								</div>
								
								<div class="col align-center">
									<div class="image round fit">
										<img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" />
									</div>
									<p>Dans cette section, vous êtes en mesure de visualiser la liste des propriétaires.
									
									</p>
									<a href="owner/listOwners" class="button">Liste des propriétaires</a>
								</div>
								
							</div>
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