
<!DOCTYPE html>
<html>
<head>
	<title>RPHPG - Le RPG version PHP</title>
	<meta charset="utf-8" type="text/html"/>
	<meta name="decription" content="RPHPG est un rpg créé par des fans pour des fans. Venez vous aussi vivre cette expérience et évoluer avec d'autres fans pour faire un rpg satisfaisant tous les joueurs."/>
	<link rel="stylesheet" type="text/css" href="design.css"/>
</head>
<body>
	<div class="largeur">
		<div class="page">

			<!-- DEBUT HEADER -->
			<header>
				<menu>
					<img src="asset/images/logo.png" alt="RPHPG" id="logo"/>
					<ul>
						<a href="index.php"><li>Personnage</li></a>
						<a href="bestiaire.php"><li>Bestiaire</li></a>
						<a href="#"><li>Arène</li></a>
					</ul>
		            <div class="clear"></div>
				</menu>
			</header>
			<!-- FIN HEADER -->

			<!-- DEBUT CONTENT -->
			<div id="content">
				<div class="wrap_left">
					<h2></h2>
					<img src="asset/images/avatar.jpg" id="avatar"/>
				</div>
				<div class="wrap_right">
					<div  id="info_perso">
						<h2>Caractéristiques</h2>
						<ul>
							<li><span class="span_left">Point de vie</span><span class="span_right"></span></li>
							<li><span class="span_left">Mana</span><span class="span_right"></span></li>
							<li><span class="span_left">Défense</span><span class="span_right"></span></li>
							<li><span class="span_left">Vitesse</span><span class="span_right"></span></li>
						</ul>
					</div>

					<div id="skills">
						<h2>Compétences</h2>
						<ul>
							<li><span class="span_left">Attaque rapide</span><span class="span_right"></span></li>
							<li><span class="span_left">Attaque lente</span><span class="span_right"></span></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>

				<div id="inventaire">
					<h2> Bestiaire</h2>
					
				<?php
					$reponse = $bdd->query('SELECT * FROM ennemy');
					while($donnees = $reponse->fetch()){
				?>
					<div class="box_item">
						<img src="asset/images/<?php echo $donnees['e_name'];?>.jpg">
							<div class="box_mob_display">
							<div class="wrap_display">
								<img src="asset/images/<?php echo $donnees['e_name'];?>.jpg"/>
								<ul>
									<?php 
										echo "<li><b>".$donnees['e_name']."</b></li>";
										echo "<li>Vie : ".$donnees['e_life']."</li>";
										echo "<li>Mana : ".$donnees['e_mana']."</li>";
										echo "<li>Dégât : ".$donnees['e_hit']."</li>";
										echo "<li>Défense : ".$donnees['e_defense']."</li>";
										echo "<li>Vitesse : ".$donnees['e_speed']."</li>";
									?>
								</ul>
							<div class="clear"></div>
							</div>
						</div>
					</div>
				<?php
					}
				?>

				</div>
			</div>
			<!-- FIN CONTENT -->

			<!-- DEBUT FOOTER -->
			<footer>
				<p>© Copyright RPHPG, Y-nov 2014</p>
			</footer>
			<!-- FIN FOOTER -->
		</div>
	</div>
<body>
</html>