<?
require_once("configure.php");

$id = $_GET['id'];
$day = $_GET['day'];
$month = $_GET['month'];
$year = $_GET['year'];
$prenotato = $_GET['prenotato'];

$date_tmp = date($year."-".$month."-".$day);
$date = date("Y-m-d", strtotime($date_tmp));

$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die("Errore nell'autenticazione al db!");
mysql_select_db(DB_DATABASE) or die("Errore nella selezione del db!");

if($prenotato == "si") {
	$sql="DELETE FROM aa_prenotazioni WHERE fk_ap='$id' AND data='$date'";
	mysql_query($sql, $conn) or die(mysql_error());
	echo "<br /><br /><b>NOTA:</b> <u>Eliminazione effettuata correttamente! </u>";
} else if($prenotato == "no") {
	$sql="INSERT INTO aa_prenotazioni(fk_ap,data) VALUES($id,'$date')";
	mysql_query($sql, $conn) or die(mysql_error());
	echo "<br /><br /><b>NOTA:</b> <u>Inserimento effettuato correttamente! </u>";
} else {
	echo "Operazione non definita!";
}

mysql_close($conn);

printf("<u>Fra 3 secondi la pagina verra' aggiornata!</u>");
?>
