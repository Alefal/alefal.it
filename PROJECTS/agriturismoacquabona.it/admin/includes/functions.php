<?
/* Calcola i giorni non lavorativi */
function calculateWorkingDays($fromDate,$tillDate) {
	tokDate($fromDate);
	$from = $GLOBALS['day']."-".$GLOBALS['month']."-".$GLOBALS['year'];
	tokDate($tillDate);
	$till = $GLOBALS['day']."-".$GLOBALS['month']."-".$GLOBALS['year'];
	
	$arrDatumRange = array();
	//$arrDatumRange = range(strtotime($fromDate),strtotime($tillDate),(3600*24));
	$cont = 0;
	for($i = strtotime($from);$i<=strtotime($till);$i+=(3600*24)) {
		$arrDatumRange[$cont]=$i;
		$cont++;
	}
	
	foreach ($arrDatumRange as $key=>$iTime) {
		/*PHP 5
		if (date("N",$iTime) != 6 && date("N",$iTime) != 7) {
			//$arrDatumRange[$key] = date("j-n-Y",$iTime);
			$arrDatumRange[$key] = date("j",$iTime);
		} else {
			unset ($arrDatumRange[$key]);
		}
		*/
		if (date("w",$iTime) != 6 && date("w",$iTime) != 0) {
			$arrDatumRange[$key] = date("j",$iTime);
		} else {
			unset ($arrDatumRange[$key]);
		}
	}
	return $arrDatumRange;
}

/* Mi ritorna i giorni del mese */
function getDays($fromDate,$toDate) {
	tokDate($fromDate);
	$from = $GLOBALS['day']."-".$GLOBALS['month']."-".$GLOBALS['year'];
	tokDate($toDate);
	$to = $GLOBALS['day']."-".$GLOBALS['month']."-".$GLOBALS['year'];
	
	//$arrDatumRange = range(strtotime($fromDate),strtotime($toDate),(3600*24));
	$cont = 0;
	for($i = strtotime($from);$i<=strtotime($to);$i+=(3600*24)) {
		$arrDatumRange[$cont]=$i;
		$cont++;
	}
	
	//$arrDatumRange = range(strtotime($fromDate),strtotime($toDate));
	return $arrDatumRange;
}

/* Mi ritorna l'ultimo giorno del mese */
function getLastDayOfMonth($month, $year) {
	/*PHP 5
	 * return idate('d', mktime(0, 0, 0, ($month + 1), 0, $year));
	 */
	for ($i=1;$i<=31;$i++) {
   		$t=mktime(0,0,0,$month,$i,$year);
   		$m=date("m",$t);
   		if ($m==$month) { 
			$lastday=date("d",$t);
		}
   	}   
	return $lastday;
}

/* Mi ritorna l'elenco, in un array, dei giorni prenotati */

/* Nel DB ci sono i campi DA - A
function returnPrenotation($casa,$month,$year) {
	$prenotation = array();
	
	$conn = mysql_connect("localhost", "root", "") or die;
	mysql_select_db("acquabona") or die;

	$sql="SELECT day(da), day(a)
			FROM aa_prenotazioni
			WHERE 	fk_ap='$casa' AND
					month(da)='$month' AND
					month(a)='$month' AND
					year(da)='$year' AND
					year(a)='$year'
			ORDER BY day(da)";
	$rs = mysql_query($sql, $conn) or die(mysql_error());
	
	if(mysql_num_rows($rs) > 0) {
		$cont = 0;
		
		while ($row = mysql_fetch_row($rs)) {		
			$da_tmp = $row[0];
			$a_tmp = $row[1];
			
			for($x=$da_tmp;$x<=$a_tmp;$x++) {
				$prenotation[$cont] = $x;
				//echo $x."<br>";
				$cont++;
			}
		}
	}
	
	mysql_free_result($rs);
	mysql_close($conn);
	
	return $prenotation;
}
*/

/* Nel DB c'è solo un campo DATA */
function returnPrenotation($casa,$month,$year) {
	$prenotation = array();
	
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die("Errore nell'autenticazione al db!");
	mysql_select_db(DB_DATABASE) or die("Errore nella selezione del db!");


	$sql="SELECT day(data)
			FROM aa_prenotazioni
			WHERE 	fk_ap='$casa' AND
					month(data)='$month' AND
					year(data)='$year'
			ORDER BY day(data)";
	$rs = 
	mysql_query($sql, $conn) or die(mysql_error());
	
	if(mysql_num_rows($rs) > 0) {
		$cont = 0;
		
		while ($row = mysql_fetch_row($rs)) {		
			$data = $row[0];
			$prenotation[$cont] = $data;
			$cont++;
		}
	}
	
	mysql_free_result($rs);
	mysql_close($conn);
	
	return $prenotation;
}


/* Funzioni per le date */
$day;
$month;
$year;
$hour;
$minute;
$second;
function tokDate($data) {
	$tok = strtok($data, "- ");
	$i=1;

	while ($tok !== false) {
		if($i==1)
			$GLOBALS['year']=$tok;
		if($i==2)
			$GLOBALS['month']=$tok;
		if($i==3)
			$GLOBALS['day']=$tok;
	
    	//echo "Word=$tok<br />";
    	$tok = strtok("- ");
		$i++;
	}
}
function tokTime($data) {
	$tok = strtok($data, ": ");
	$i=1;

	while ($tok !== false) {
		if($i==2)
			$GLOBALS['hour']=$tok;
		if($i==3)
			$GLOBALS['minute']=$tok;
		if($i==4)
			$GLOBALS['second']=$tok;
	
    	//echo "Word=$tok<br />";
    	$tok = strtok(": ");
		$i++;
	}
}
function getDay() {
	return $GLOBALS['day'];
}
function getMonth($size) {
	if($size == "big") {
		if($GLOBALS['month'] == 1)
			return "GEN";
		if($GLOBALS['month'] == 2)
			return "FEB";
		if($GLOBALS['month'] == 3)
			return "MAR";
		if($GLOBALS['month'] == 4)
			return "APR";
		if($GLOBALS['month'] == 5)
			return "MAG";
		if($GLOBALS['month'] == 6)
			return "GIU";
		if($GLOBALS['month'] == 7)
			return "LUG";
		if($GLOBALS['month'] == 8)
			return "AGO";
		if($GLOBALS['month'] == 9)
			return "SET";
		if($GLOBALS['month'] == 10)
			return "OTT";
		if($GLOBALS['month'] == 11)
			return "NOV";
		if($GLOBALS['month'] == 12)
			return "DIC";
	}
	if($size == "small") {
		if($GLOBALS['month'] == 1)
			return "Gennaio";
		if($GLOBALS['month'] == 2)
			return "Febbraio";
		if($GLOBALS['month'] == 3)
			return "Marzo";
		if($GLOBALS['month'] == 4)
			return "Aprile";
		if($GLOBALS['month'] == 5)
			return "Maggio";
		if($GLOBALS['month'] == 6)
			return "Giugno";
		if($GLOBALS['month'] == 7)
			return "Luglio";
		if($GLOBALS['month'] == 8)
			return "Agosto";
		if($GLOBALS['month'] == 9)
			return "Settembre";
		if($GLOBALS['month'] == 10)
			return "Ottobre";
		if($GLOBALS['month'] == 11)
			return "Novembre";
		if($GLOBALS['month'] == 12)
			return "Dicembre";
	}
	if($size == "num") {
		return $GLOBALS['month'];
	}
	
}
function getYear() {
	return $GLOBALS['year'];
}
function getHour() {
	return $GLOBALS['hour'];
}
function getMinute() {
	return $GLOBALS['minute'];
}
function getSecond() {
	return $GLOBALS['second'];
}

function getMonthAndYear($data) {
	tokDate($data);
	$meseLbl = getMonth("small")." ".getYear();

	return $meseLbl;
}

//Ritorna una nuova stringa dopo aver rimpiazzato il contenuto
//di string da $from a $to 
function replaceString($from,$to,$string) {
	return str_replace($from,$to,$string);
}

/* To use the date("N") function in PHP < 5.1.0 use: */
function dayofweek() {
	$days = array("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
	return array_search(date("D"), $days) + 1;
}
?>