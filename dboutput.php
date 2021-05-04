<!DOCTYPE html>
<html>
<head> <!-- Техническая информация о документе -->
<meta charset="utf-8">
<title>Результат</title>
</head>
<body bgcolor=white text=black>
<h2 align=center> <!-- Крупный заголовок -->
База данных "Интернет-провайдер"
</h2>
<h4 align=center>
<?php echo $state; ?>
</h4>
<?php if($empty == 0){ ?>
<table border=1 width=80% align=center>
<caption align=center><h3><?php echo $message; ?></h3></caption> 
<tbody align=center>
<tr>
<?php
switch($num){
	case 0: ?>
		<th> <?php echo "№ п/п" ?> </th>
		<th> <?php echo "Год" ?> </th>
		<th> <?php echo "Месяц" ?> </th>
		<th> <?php echo "Шифр" ?> </th>
		<th> <?php echo "Название" ?> </th>
		<th> <?php echo "Количество проданных единиц" ?> </th>
		<th> <?php echo "Выручка" ?> </th>
		<?php break;
	case 1:
	case 5:
	case 7: ?>
		<th> <?php echo "Номер договора" ?> </th>
		<th> <?php echo "ФИО" ?> </th>
		<th> <?php echo "Паспортные данные" ?> </th>
		<th> <?php echo "Дата заключения договора" ?> </th>
		<?php break;
	case 2: ?>
		<th> <?php echo "Шифр" ?> </th>
		<th> <?php echo "Название" ?> </th>
		<th> <?php echo "Стоимость" ?> </th>
		<?php break;
	case 3: ?>
		<th> <?php echo "Табельный номер" ?> </th>
		<th> <?php echo "ФИО" ?> </th>
		<th> <?php echo "Паспортные данные" ?> </th>
		<th> <?php echo "Количество выполненных заказов" ?> </th>
		<th> <?php echo "Выручка от заказов" ?> </th>
		<?php break;
	case 4: ?>
		<th> <?php echo "Табельный номер" ?> </th>
		<th> <?php echo "ФИО" ?> </th>
		<th> <?php echo "Паспортные данные" ?> </th>
		<th> <?php echo "Дата принятия на работу" ?> </th>
		<?php break;
	case 6: ?>
		<th> <?php echo "Шифр " ?> </th>
		<th> <?php echo "Название" ?> </th>
		<th> <?php echo "Количество проданных единиц" ?> </th>
		<th> <?php echo "Выручка" ?> </th>
		<?php break;
	case 8: ?>
		<th> <?php echo "Год" ?> </th>
		<th> <?php echo "Месяц" ?> </th>
		<th> <?php echo "Выручка" ?> </th>
		<?php break;
	case 9: ?>
		<th> <?php echo "Номер договора" ?> </th>
		<th> <?php echo "ФИО" ?> </th>
		<th> <?php echo "Паспортные данные" ?> </th>
		<th> <?php echo "Дата заключения договора" ?> </th>
		<th> <?php echo "Выручка от клиента" ?> </th>
		<?php break;
	case 10: ?>
		<th> <?php echo "№ п/п" ?> </th>
		<th> <?php echo "Шифр" ?> </th>
		<th> <?php echo "Название" ?> </th>
		<th> <?php echo "Количество проданных единиц" ?> </th>
		<th> <?php echo "Выручка" ?> </th>
		<?php break;
} ?>
</tr>

<font style="font-family:'Times New Roman'; font-size:12pt; color:black">
<tr>
<?php
foreach($strings as $string):
switch($num){
	case 0: ?>
		<td> <?php echo $string['id']; ?> </td>
		<td> <?php echo $string['year'] ?> </td>
		<td> <?php echo $string['month'] ?> </td>
		<td> <?php echo $string['e_id']; ?> </td>
		<td> <?php echo $string['e_name']; ?> </td>
		<td> <?php echo $string['count']; ?> </td>
		<td> <?php echo $string['total']; ?> </td>
		<?php break;
	case 1: 
	case 5: 
	case 7: ?>
		<td> <?php echo $string['c_id']; ?> </td>
		<td> <?php echo $string['c_name']; ?> </td>
		<td> <?php echo $string['c_passport']; ?> </td>
		<td> <?php echo $string['start_date']; ?> </td>
		<?php break;
	case 2: ?>
		<td> <?php echo $string['e_id']; ?> </td>
		<td> <?php echo $string['e_name']; ?> </td>
		<td> <?php echo $string['e_price']; ?> </td>
		<?php break;
	case 3: ?>
		<td> <?php echo $string['m_id']; ?> </td>
		<td> <?php echo $string['m_name']; ?> </td>
		<td> <?php echo $string['m_passport']; ?> </td>
		<td> <?php echo $string['num']; ?> </td>
		<td> <?php echo $string['total']; ?> </td>
		<?php break;
	case 4: ?>
		<td> <?php echo $string['m_id']; ?> </td>
		<td> <?php echo $string['m_name']; ?> </td>
		<td> <?php echo $string['m_passport']; ?> </td>
		<td> <?php echo $string['m_work_date']; ?> </td>
		<?php break;
	case 6: ?>
		<td> <?php echo $string['e_id']; ?> </td>
		<td> <?php echo $string['e_name']; ?> </td>
		<td> <?php echo $string['num']; ?> </td>
		<td> <?php echo $string['total']; ?> </td>
		<?php break;
	case 8 ?>
		<td> <?php echo $cur_year; ?> </td>
		<td> <?php echo $cur_month; ?> </td>
		<td> <?php echo $string['summa']; ?> </td>
		<?php break;
	case 9: ?>
		<td> <?php echo $string['c_id']; ?> </td>
		<td> <?php echo $string['c_name']; ?> </td>
		<td> <?php echo $string['c_passport']; ?> </td>
		<td> <?php echo $string['start_date']; ?> </td>
		<td> <?php echo $string['total']; ?> </td>
		<?php break;
	case 10: ?>
		<td> <?php echo $string['id']; ?> </td>
		<td> <?php echo $string['e_id']; ?> </td>
		<td> <?php echo $string['e_name']; ?> </td>
		<td> <?php echo $string['count']; ?> </td>
		<td> <?php echo $string['total']; ?> </td>
		<?php break;
} ?>
</tr>
<?php endforeach; ?>
</tbody>
</table>
</font>
<?php } ?>
</body>
</html>