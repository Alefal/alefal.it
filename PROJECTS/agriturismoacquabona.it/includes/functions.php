<?php
/* Funzioni per le date */
$day;
$month;
$year;
$hour;
$minute;
$second;
function tokDate($data) {
	$tok = strtok($data, "/ ");
	$i=1;

	while ($tok !== false) {
		if($i==1)
			$GLOBALS['day']=$tok;
		if($i==2)
			$GLOBALS['month']=$tok;
		if($i==3)
			$GLOBALS['year']=$tok;
	
    	//echo "Word=$tok<br />";
    	$tok = strtok("/ ");
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

function checkData($dataDa,$dataA) {
	tokDate($dataDa);

	$dayDa=getDay();
	$monthDa=getMonth("num");
	$yearDa=getYear();
	
	tokDate($dataA);
	
	$dayA=getDay();
	$monthA=getMonth("num");
	$yearA=getYear();

	if ($yearDa < $yearA) {
		//echo "ok";	
		$risultato = 1;
	} else {
		if ($yearDa == $yearA) {
			if ($monthDa < $monthA) {
				//echo "ok";
				$risultato = 1;
			} else {
				if ($monthDa == $monthA) {
					if ($dayDa < $dayA) {
						//echo "ok";
						$risultato = 1;
					} else {
						if ($dayDa == $dayA) {
							//echo "uguale";
							$risultato = 0;
						} else {
							//echo "ko";
							$risultato = -1;
						}
					}
				} else {
					//echo "ko";
					$risultato = -1;
				}
			}
		} else {
			//echo "ko";
			$risultato = -1;
		}
	}
	return $risultato;
}
?>
