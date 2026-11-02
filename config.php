<?php
session_start();
define('BASE_URL','/Beauty_and_Blooms');
$pdo = new PDO('mysql:host=localhost;dbname=beauty_blooms;charset=utf8mb4','root','',[
 PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC
]);
function h($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function go($p){header('Location: '.BASE_URL.'/'.$p);exit;}
function user(){return $_SESSION['user']??null;}
function admin(){return user() && user()['role']==='admin';}
function money($v){return '₹'.number_format((float)$v,2);}
