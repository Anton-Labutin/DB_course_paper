<?php
	$empty=0;
	$rownum=$result->rowCount();
	if($rownum > 0){
		switch($num){
			case 0:  $state="";
					 break;
			case 10: $state="<br>(такой отчёт уже существует)<br>";
					 break;
			default: $state="<br>(запрос успешно выполнен)<br>";
					 break;
		}
	} else{
		if($num != 10){
			$state="<br>(запрос успешно выполнен)<br><br>ДАННЫЕ ОТСУТСТВУЮТ В БАЗЕ<br>";
			$empty=1;
		} else{
			$call_procedure="Call Equipment_total($cur_month, $cur_year);";
			$q=$pdo->exec($call_procedure);
			include 'dbselect.php';
			$rownum=$result->rowCount();
			if($rownum > 0){
				$state="<br>(отчёт успешно создан)<br>";
			} else {
				$state=$message."<br><br>ДАННЫЕ ОТСУТСТВУЮТ В БАЗЕ<br>";
				$empty=1;
			}
		}
	}
?>