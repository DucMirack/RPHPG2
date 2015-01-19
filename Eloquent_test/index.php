<?php
  // require composer autoload (load all my libraries)
require 'vendor/autoload.php';

  //require my models
require 'app/models/User.php';
require 'app/models/Ennemy.php';
require 'app/config.php';

  // Slim initialisation
$app = new \Slim\Slim(array(
    'view' => '\Slim\LayoutView', // I activate slim layout component
    'layout' => 'layouts/main.php' // I define my main layout
    ));

  // hook before.router, now $app is accessible in my views
$app->hook('slim.before.router', function () use ($app) {
  $app->view()->setData('app', $app);
});

  // views initiatilisation
$view = $app->view();
$view->setTemplatesDirectory('views');

  // GET /
$app->get('/', function() use ($app)
{
  $character1=User::find(1);
  $ennemy1=Ennemy::find(16);
  $character1->p_hp=$character1->p_hpmax;
  $ennemy1->e_life=$ennemy1->e_lifemax;
  $character1->save();
  $ennemy1->save();
  $app->render('eloquent/arene.php',array("character" => $character1, "ennemy" => $ennemy1));
  });


$app->post('/', function() use ($app)
{
  $character1=User::find(1);
  $ennemy1=Ennemy::find(16);
  $rand_hit_character=mt_rand() / mt_getrandmax();
  $rand_hit_Ennemy=mt_rand() / mt_getrandmax();
  $pvCharacterLost=0;
  $pvEnnemyLost=0;

  if (isset($_POST['attaque_lente']) AND !isset($_POST['attaque_rapide'])){

    if ($rand_hit_character < 0.40) {

      $ennemy1->e_life-=$character1->p_slowhit;
      $ennemy1->save();
      $pvEnnemyLost=$character1->p_slowhit;
    }
  }

  if (isset($_POST['attaque_rapide']) AND !isset($_POST['attaque_lente'])){

    if ($rand_hit_character < 0.80) {

      $ennemy1->e_life-=$character1->p_fasthit;
      $ennemy1->save();
      $pvEnnemyLost=$character1->p_fasthit;
    }
  }

  if ($rand_hit_Ennemy <0.50){

    $character1->p_hp-=$ennemy1->e_hit;
    $character1->save();
    $pvCharacterLost=$ennemy1->e_hit;
  }
  $app->render('eloquent/arene.php',array("character" => $character1,"ennemy" => $ennemy1,
    "pvCharacterLost" => $pvCharacterLost, "pvEnnemyLost" => $pvEnnemyLost));
});

  // always need to be at the bottom of this file !
$app->run();