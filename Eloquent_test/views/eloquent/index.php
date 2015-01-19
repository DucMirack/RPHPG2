<!DOCTYPE html>
<html>
<head>
	<title>RPHPG - Le RPG version PHP</title>
	<meta charset="utf-8" type="text/html"/>
	<meta name="decription" content="RPHPG est un rpg créé par des fans pour des fans. Venez vous aussi vivre cette expérience et évoluer avec d'autres fans pour faire un rpg satisfaisant tous les joueurs."/>

<link rel="stylesheet" type="text/css" href=""/>
</head>
<body>
	<div class="largeur">
		<div class="page">

			<!-- DEBUT HEADER -->
			<header>
				<menu>
					<img src="http://localhost/Eloquent_test/asset/images/logo.png" alt="RPHPG" id="logo"/>
					<ul>
						<a href="#"><li>Personnage</li></a>
						<a href="#"><li>Bestiaire</li></a>
						<a href="#"><li>Arène</li></a>
					</ul>
		            <div class="clear"></div>
				</menu>
			</header>
			<!-- FIN HEADER -->

			<!-- DEBUT CONTENT -->
			<div id="content">
				<div class="wrap_left">
					<h2><?php echo $this->data['character']['p_name'];	?></h2>
					<img src="http://localhost/Eloquent_test/asset/images/avatar.jpg" id="avatar"/>
				</div>
				<div class="wrap_right">
					<div  id="info_perso">
						<h2>Caractéristiques</h2>
						<ul>
							<li><span class="span_left">Point de vie</span><span class="span_right"><?php echo $this->data['character']['p_hpmax']?></span></li>
							<li><span class="span_left">Mana</span><span class="span_right"><?php echo $this->data['character']['p_mana']?></span></li>
							<li><span class="span_left">Défense</span><span class="span_right"><?php echo $this->data['character']['p_defense']?></span></li>
							<li><span class="span_left">Vitesse</span><span class="span_right"><?php echo $this->data['character']['p_speed']?></span></li>
						</ul>
					</div>

					<div id="skills">
						<h2>Compétences</h2>
						<ul>
							<li><span class="span_left">Attaque rapide</span><span class="span_right"><?php echo $this->data['character']['p_fasthit']?></span></li>
							<li><span class="span_left">Attaque lente</span><span class="span_right"><?php echo $this->data['character']['p_slowhit']?></span></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>

				<div id="inventaire">
					<h2>Inventaire (20/20)</h2>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
					<div class="box_item"></div>
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

?>