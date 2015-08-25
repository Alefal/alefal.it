<br />
Per prenotare una stanza devi cliccare direttamente sul quadratino (di coloro chiaro) corrispondente al giorno. Se la prenotazione viene disdetta e si vuole liberare la stanza per quel determinato giorno, basta cliccare sul quandratino rosso.
<br /><br />
Per visualizzare la situazione di qualche altro mese, selezionare il mese opportuno dal menu a tendina sulla destra.
<br /><br />

<? 
//Primo form con scelta da menu a tendina
if ((!isset($_GET["Month"])) && (!isset($_GET["Year"]))) {
	$Month = date("m");
	$Year = date("Y");
	$Day = date("d");
	
	echo("<img src=\"images/freccia.jpg\" /> <strong><u>Le informazioni sotto riguardano il mese corrente!</u></strong>");
} else {
	$Month = $_GET["Month"];
	$Year = $_GET["Year"];
	$Day = date("d");
	
	$Timestamp = mktime(0,0,0,$Month,1,$Year);
	$MonthName = date("F", $Timestamp);

	echo("<img src=\"images/freccia.jpg\" /> <strong><u>Stai visualizzazione informazioni per $MonthName, $Year</u></strong>");
}
//Secondo form con scelta da selezione personale
if ((!isset($_GET["dataDa"])) && (!isset($_GET["dataA"]))) {
	$dateFrom = "1-$Month-$Year";
	$dateTo = getLastDayOfMonth($Month, $Year)."-$Month-$Year";
} else {
	$dateFrom = $_GET['dataDa'];
	$dateTo = $_GET['dataA'];
	echo "Periodo di interesse selezionato: ".$dateFrom." | ".$dateTo;
}


/* AGGIUNTO IN DISPONIBILITA.PHP
echo("<form action=\"disponibilita.php\" accept-charset=\"UNKNOWN\" enctype=\"application/x-www-form-urlencoded\" method=\"GET\">");
echo("");   
echo("<select name=\"Month\">");
for($m=1;$m<=12;$m++){ 	 
	echo("<option value=\"$m\">" .date("F", mktime(0,0,0,$m,1,$Year)). "</option>");  
}  
echo("</select>"); 
echo("<br />"); 
	
echo(""); 
echo("<br />");  
echo("<select name=\"Year\">");
for($y=2009;$y<2020;$y++){  
	echo("<option value=\"$y\">$y</option>");
} 
echo("</select>"); 
echo(""); 
echo("");
echo("<input type=\"submit\" value=\"Vai\" />");
echo("</form>");

echo "<br /><br />";
*/


// Visualizzo prenotazioni
//Giorno del mese selezionato
$arrDayDates = array();
$arrDayDates = getDays($dateFrom,$dateTo);

//Giorni lavorativi 
$arrWorkingDayDatesTmp = array();
$arrWorkingDayDatesTmp = calculateWorkingDays($dateFrom,$dateTo); 

//Array per confronto $arrDayDates e $arrWorkingDayDatesTmp
$arrWorkingDayDates = array();
$tmp = 0;
//Valori recuperati dal db: rappresentano date di prenotazione di una stanza
$stanza1 = returnPrenotation(1,$Month,$Year);
$stanza2 = returnPrenotation(2,$Month,$Year);
$stanza3 = returnPrenotation(3,$Month,$Year);
$stanza4 = returnPrenotation(4,$Month,$Year);

//Riempio $arrWorkingDayDate con i valori codificati, data in numero, di $arrWorkingDayDatesTmp
foreach ($arrWorkingDayDatesTmp as $key=>$iTime) {
	$day=$key+1;
	$arrWorkingDayDates[$tmp] = $day;
	$tmp++;
}
	
/*			
echo "<br>--------------------<br>";
echo "1 -->".count($arrDayDates)."<br>";
echo "2 -->".count($arrWorkingDayDatesTmp)."<br>";
echo "3 -->".count($arrWorkingDayDates)."<br>";
echo "1 -->".count($stanza1)."<br>";
echo "2 -->".count($stanza2)."<br>";
echo "3 -->".count($stanza3)."<br>";
echo "4 -->".count($stanza4)."<br>";
echo "--------------------<br>";
*/

printf("
<table>
	<tr>
");
	echo "<td>&nbsp;</td>";
		$z = 0;
		//Elenco giorni del mese con evidenza dei giorni festivi
		foreach ($arrDayDates as $key=>$iTime) {
			$day=$key+1;
			while($z<count($arrDayDates)) {
				//Giorno lavorativo
				if($day == $arrWorkingDayDates[$z]) {
					echo "<td>$day</td>";
					$z++;
					break;
				}
				//Giorno festivo
				echo "<td class=\"festivo\">$day</td>";	
				break;	
			}
			
			
		}
printf("
	</tr>
");
	//Stampo elenco stanze
	for($i=1;$i<=4;$i++){
		echo "<tr>";
		echo "<td><strong>Camera $i</strong></td>";
		
		//Appartamento 1
		if($i == 1) {
			$j=0;
			//Elenco dei giorni del mese
			foreach ($arrDayDates as $key=>$iTime) {
				//Controllo con giorni lavorativi o prenotati
				$day=$key+1;
				//Controllo se ci sono date prenotate per quella stanza
				
				while($j<count($arrDayDates)) {
					if($day == $stanza1[$j]) {
						printf("
							<td>
								<a href=\"javascript:changeStatus(1,$day,$Month,$Year,'si');\">
									<img src=\"images/q_occupato.jpg\" border=\"0\" />
								</a>
							</td>
						");
						$j++;
						break;
					}
					printf("
						<td>
							<a href=\"javascript:changeStatus(1,$day,$Month,$Year,'no');\">
								<img src=\"images/q_scelta.jpg\" border=\"0\" />
							</a>
						</td>
					");
					break;	
				}
			}
			echo "</tr>";
		}
		//Appartamento 2
		if($i == 2) {
			$j=0;
			//Elenco dei giorni del mese
			foreach ($arrDayDates as $key=>$iTime) {
				//Controllo con giorni lavorativi o prenotati
				$day=$key+1;
				//Controllo se ci sono date prenotate per quella stanza
				while($j<count($arrDayDates)) {
					if($day == $stanza2[$j]) {
						printf("
							<td>
								<a href=\"javascript:changeStatus(2,$day,$Month,$Year,'si');\">
									<img src=\"images/q_occupato.jpg\" border=\"0\" />
								</a>
							</td>
						");
						$j++;
						break;
					}
					printf("
						<td>
							<a href=\"javascript:changeStatus(2,$day,$Month,$Year,'no');\">
								<img src=\"images/q_scelta.jpg\" border=\"0\" />
							</a>
						</td>
					");	
					break;	
				}
			}
			echo "</tr>";
		}
		//Appartamento 3
		if($i == 3) {
			$j=0;
			//Elenco dei giorni del mese
			foreach ($arrDayDates as $key=>$iTime) {
				//Controllo con giorni lavorativi o prenotati
				$day=$key+1;
				//Controllo se ci sono date prenotate per quella stanza
				while($j<count($arrDayDates)) {
					if($day == $stanza3[$j]) {
						printf("
							<td>
								<a href=\"javascript:changeStatus(3,$day,$Month,$Year,'si');\">
									<img src=\"images/q_occupato.jpg\" border=\"0\" />
								</a>
							</td>
						");
						$j++;
						break;
					}
					printf("
						<td>
							<a href=\"javascript:changeStatus(3,$day,$Month,$Year,'no');\">
								<img src=\"images/q_scelta.jpg\" border=\"0\" />
							</a>
						</td>
					");
					break;	
				}
			}
			echo "</tr>";
		}
		//Appartamento 4
		if($i == 4) {
			$j=0;
			//Elenco dei giorni del mese
			foreach ($arrDayDates as $key=>$iTime) {
				//Controllo con giorni lavorativi o prenotati
				$day=$key+1;
				//Controllo se ci sono date prenotate per quella stanza
				while($j<count($arrDayDates)) {
					if($day == $stanza4[$j]) {
						printf("
							<td>
								<a href=\"javascript:changeStatus(4,$day,$Month,$Year,'si');\">
									<img src=\"images/q_occupato.jpg\" border=\"0\" />
								</a>
							</td>
						");
						$j++;
						break;
					}
					printf("
						<td>
							<a href=\"javascript:changeStatus(4,$day,$Month,$Year,'no');\">
								<img src=\"images/q_scelta.jpg\" border=\"0\" />
							</a>
						</td>
					");
					break;	
				}
			}
			echo "</tr>";
		}
	}
printf("
</table>
");

?>

<div id="result"></div>

<br /><br />
<strong>Legenda:</strong> 
<br />
<br />
<img src="images/q_scelta.jpg" /> Stanza libera
<br />
<img src="images/q_occupato.jpg" /> Stanza prenotata