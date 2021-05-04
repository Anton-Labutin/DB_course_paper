<?php
switch($num){
	case 0: 
		$sql="Select id, year, month, e_id, e_name, count, total
			  From Equipment_total;";
		$message="Выручка по каждому типу оборудования";
		break;
	case 1:
		$cur_year=$_GET['year_1'];
		$sql="Select c_id, c_name, c_passport, start_date
			  From Client
			  Where YEAR(start_date)=:cur_y1;";
		$message="Список клиентов, заключивших договор в ".$cur_year." году";
		break;
	case 2:
		$sql="Select e_id, e_name, e_price
			  From Equipment
			  Where e_price=(Select MAX(e_price)
							 From Equipment);";
		$message="Список самого дорогого оборудования";
		break;
	case 3:
		$sql="Select m_id, m_name, m_passport, COUNT(h_id) num, SUM(h_price) total
			  From Mounter left join Hold using(m_id)
			  Group by m_id
			  Order by num desc, total desc;";
		$message="Количество заказов, выполненных каждым монтажником";
		break;
	case 4:
		$cur_day=$_GET['d_4'];
		$cur_month=$_GET['m_4'];
		$cur_year=$_GET['y_4'];
		$sql="Select m_id,m_name,m_passport,m_work_date
			  From Mounter
			  Where YEAR(m_work_date)>:cur_y4 or (YEAR(m_work_date)=:cur_y4 and MONTH(m_work_date)>:cur_m4) or (YEAR(m_work_date)=:cur_y4 and MONTH(m_work_date)=:cur_m4 and DAY(m_work_date)>:cur_d4) 
			  Order by m_work_date;";
		$message="Список монтажников, принятых на работу после ".$cur_day.".".$cur_month.".".$cur_year;
		break;
	case 5:
		$sql="Select c_id, c_name, c_passport, start_date
			  From Client left join Hold using(c_id)
			  Where h_id is NULL
			  Order by start_date;";
		$message="Список клиентов, не сделавших ни одного заказа";
		break;
	case 6:
		$sql="Select  e_id, e_name, SUM(e_count) num, SUM(e_price) total
			  From Equipment join Equipment_list using(e_id)
			  Group by e_id
			  Order by num desc, total desc;";
		$message="Выручка за всё время по каждому типу оборудования";
		break;
	case 7:
		$sql="Select c_id, c_name, c_passport, start_date
			  From Client
			  Where end_date is NULL
			  Order by start_date;";
		$message="Список клиентов, не расторгнувших договор";
		break;
	case 8:
		$cur_month=$_GET['month_8'];
		$cur_year=$_GET['year_8'];
		$sql="Select SUM(h_price) summa
			  From Hold
			  Where MONTH(h_date)=:cur_m8 and YEAR(h_date)=:cur_y8;";
		$message="Выручка интернет-провайдера";
		break;
	case 9:
		$sql="Select c_id,c_name,c_passport,start_date, SUM(H_price) total
			  From Client left join Hold using(c_id)
			  Where end_date is NULL
			  Group by c_id
			  Order by total desc;";
		$message="Выручка от каждого клиента, не расторгнувшего договор";
		break;
	case 10:
		$cur_month=$_GET['month_10'];
		$cur_year=$_GET['year_10'];
		$sql="Select id, year, month, e_id, e_name, count, total
			  From Equipment_total
			  Where year=:cur_y10 and month=:cur_m10;";
		$message="Выручка по каждому типу оборудования за ".$cur_month.".".$cur_year;
		break;
}
?>