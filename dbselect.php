<?php
try{
	$result=$pdo->prepare($sql);
	switch($num){
		case 1: $result->BindValue(':cur_y1', $cur_year);
				break;
		case 4: $result->BindValue(':cur_y4', $cur_year);
				$result->BindValue(':cur_m4', $cur_month);
				$result->BindValue(':cur_d4', $cur_day);
				break;
		case 8: $result->BindValue(':cur_y8', $cur_year);
				$result->BindValue(':cur_m8', $cur_month);
				break;
		case 10: $result->BindValue(':cur_y10',$cur_year);
				 $result->BindValue(':cur_m10', $cur_month);
				 break;
	}
	$result->execute();
} catch(pdoException $e){
	echo "Ошибка при извлечении данных".$e->GetMessage();
	exit();
}
?>	