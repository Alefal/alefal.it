<?
$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die("Errore nell'autenticazione al db!");
mysql_select_db(DB_DATABASE) or die("Errore nella selezione del db!");

$sql = "SELECT * FROM aa_news ORDER BY data DESC";

$rs = mysql_query($sql, $conn) or die(mysql_error());
$totalRows_rs = mysql_num_rows($rs);

if(($rs) && ($totalRows_rs > 0)) {
	echo "Trovate ".$totalRows_rs." news";
	printf("
		<table class=\"widefat\">
			<thead>
				<tr class=\"thead\">
					<th>Data</th>
					<th>News IT</th>
					<th>News EN</th>
					<th>Azioni</th>
				</tr>
			</thead>
			<tbody class=\"list:user user-list\" id=\"users\">
	");
	
	$cont = 0;
	while($row=mysql_fetch_array($rs)){
		tokDate($row['data']);

		$day=getDay();
		$month=getMonth("num");
		$year=getYear();

		printf("
			<tr class=\"alternate\">
				<td>".$row['data']."</td>
				<td>".$row['testoIt']."</td>
				<td>".$row['testoEn']."</td>
				<td>	
											
					&nbsp;&nbsp;&nbsp;
					
					<a 	href=\"?action=delete&id=".$row['id']."\" 
						onclick=\"javascript:return conferma('Sei sicuro di voler eliminare la news?')\">
					<img src=\"images/delete.gif\" border=\"0\" alt=\"Elimina articolo\" /></a>
				</td>
			</tr>
		");
		$cont++;
	}
	
	/* DA INSERIRE NEL FORM
	<form action=\"javascript:editNews();\" method=\"post\" id=\"editForm\" name=\"editForm\">
		<input type=\"hidden\" name=\"idEdit\" id=\"idEdit\" value=\"".$row['id']."\" />
		<input type=\"hidden\" name=\"dataEdit\" id=\"dataEdit\" value=\"".$row['data']."\" />
		<input type=\"hidden\" name=\"testoItEdit\" id=\"testoItEdit\" value=\"".$row['testoIt']."\" />
		<input type=\"hidden\" name=\"testoEnEdit\" id=\"testoEnEdit\" value=\"".$row['testoEn']."\" />
		<input type=\"image\" src=\"images/edit.png\" />
	</form>
	*/
	
	printf("
			</tbody>
		</table>
	");										
} else {
	echo "ATTENZIONE: Nessuna news trovata!";
}
mysql_close($conn);
?>