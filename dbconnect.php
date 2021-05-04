<?php
try{
	$pdo=new PDO('mysql:host=Localhost;dbname=internet_provider', $login, $password);
	$pdo->SetAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$pdo->exec('SET NAMES "utf8"');
} catch(PDOException $e){
	echo "Ошибка подключения к базе данных".$e->GetMessage();
	exit();
}
?>