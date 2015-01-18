<!DOCTYPE html>
<html>
<head>
	<title>RPHPG - Le RPG version PHP</title>
	<meta charset="utf-8" type="text/html"/>
	<meta name="decription" content="RPHPG est un rpg créé par des fans pour des fans. Venez vous aussi vivre cette expérience et évoluer avec d'autres fans pour faire un rpg satisfaisant tous les joueurs."/>
	<link rel="stylesheet" type="text/css" href="asset/style/design.css"/>
</head>
<body>
	<div class="largeur">
		<div class="page">

			<!-- DEBUT HEADER -->
			<header>
				<menu>
					<img src="asset/images/logo.png" alt="RPHPG" id="logo"/>
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
			<div id="content_arena">
				<div id="annonce_combat">
					<img src="asset/images/avatar.jpg" id="img_arena_perso">
					<img src="asset/images/vs.png" id="img_arena_vs"/>
					<img src="asset/images/<?php echo $this->data['ennemy']['image']?>" id="img_arena_ennemy">
					<div class="clear"></div>
				</div>
				<div id="stats">
					<div id="info_perso">
						<h2><?php echo $this->data['character']['p_name']?></h2>
						<ul>
							<li>Vie : <?php echo $this->data['character']['p_hp']?></li>
							<li>Vitesse : <?php echo $this->data['character']['p_speed']?></li>
							<li>Mana : <?php echo $this->data['character']['p_mana']?></li>
							<li>
								<form name="insertion" action="" method="POST">
									<input type="submit" value="Attaque rapide">
									<input type="hidden" name="attaque_rapide">
								</form>
							</li>
								<li><form name="insertion" action="" method="POST">
									<input type="submit" value="Attaque lente">
									<input type="hidden" name="attaque_lente">
								</form></li>
							</ul>
						</div>
						<div id="info_combat">
							<h2>Combat</h2>

							<?php if ($this->data['ennemy']['e_life'] < 0){
								echo "Victoire";
							}
							else if ($this->data['character']['p_hp'] < 0) {
								echo "Défaite";
							} 
							else {
							echo "Vous infligez ". $this->data['pvEnnemyLost'] ." points de vie à ".$this->data['ennemy']['e_name']."<br/>";
						    echo $this->data['ennemy']['e_name'] ." vous inflige ".$this->data['pvCharacterLost']. " points de dégâts";
							}?>
						</div>
						<div id="info_ennemy">
							<h2><?php echo $this->data['ennemy']['e_name']?></h2>
							<ul>
								<li>Vie : <?php echo $this->data['ennemy']['e_life']?></li>
								<li>Vitesse : <?php echo $this->data['ennemy']['e_lifemax']?></li>
								<li>Mana : <?php echo $this->data['ennemy']['e_lifemax']?></li>
							</ul>
						</div>
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
		</body>