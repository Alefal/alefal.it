<?php
$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die(ERROR_AUTH);
mysql_select_db(DB_DATABASE) or die(ERROR_DB);

$sql = "SELECT * FROM aa_news ORDER BY data DESC";

$rs = mysql_query($sql, $conn) or die(mysql_error());
$totalRows_rs = mysql_num_rows($rs);

if(($rs) && ($totalRows_rs > 0)) {
	while($row=mysql_fetch_array($rs)){
		tokDate($row['data']);

		$day=getDay();
		$month=getMonth("num");
		$year=getYear();
		
		if($_SESSION["language"] == "it") {
			printf("
				<b>".$row['data']."</b>
				<br />
				".$row['testoIt']."
				<br />
				<div id=\"linea\">&nbsp;</div>
				<br />
			");
		} else if($_SESSION["language"] == "en") {
			printf("
				<b>".$row['data']."</b>
				<br />
				".$row['testoEn']."
				<br />
				<div id=\"linea\">&nbsp;</div>
				<br />
			");
		} else {
			printf("
				<b>".$row['data']."</b>
				<br />
				".$row['testoIt']."
				<br />
				<div id=\"linea\">&nbsp;</div>
				<br />
			");
		}
	}									
} else {
	echo NO_NEWS;
}
mysql_close($conn);
?>