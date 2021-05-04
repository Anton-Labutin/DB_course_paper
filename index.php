<?php
$login='Anton_Labutin';
$password='7394826150';
include 'dbconnect.php';
$num=$_GET['number'];
include 'dbchoose.php';
include 'dbselect.php';
include 'dbcheck.php';
$strings=$result->fetchALL();
include 'dboutput.php';
?>		