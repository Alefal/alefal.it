<?php
require_once("includes/header.php");

$action = $_GET['action'];

$id = $_POST['id'];
$id = $_GET['id'];

$data = $_POST['data'];
$testoIt = $_POST['testoIt'];
$testoEn = $_POST['testoEn'];

//INSERT
if($action == "insert") {
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die;
	mysql_select_db(DB_DATABASE) or die;
	
	$sql="INSERT INTO aa_news(data,testoIt,testoEn)
							VALUES('".$data."','".$testoIt."','".$testoEn."')";
	
	if($result = mysql_query($sql, $conn)) {
		$message = "(<span class=\"messaggioDiSuccesso\">Inserimento effettuato correttamente!</span>)";
	} else {
		$message = "(<span class=\"messaggioDiErrore\">Errore nell'inserimento della news!</span>)";
	}
	
	mysql_close($conn);
} 
//EDIT
else if($action == "edit") {
	$message = "(<span class=\"messaggioDiErrore\">Passare le var a js e riempire il form...</span>)";
} 
//EDIT OK
else if($action == "editOK") {
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die;
	mysql_select_db(DB_DATABASE) or die;

	$sql="UPDATE aa_news 
			SET data='".$data."',testoIt='".$testoIt."',testoEn='".$testoEn."',
			WHERE id=".$id."";
		
	if($rs = mysql_query($sql, $conn) or die(mysql_error())) {
		$message = "(<span class=\"messageInfo\">Modifica effettuata correttamente</span>)";
	} else {
		$message = "(<span class=\"messageError\">Errore con la modifica della news</span>)";
	}
	
	mysql_close($conn);
	
	$message = "(<span class=\"messaggioDiSuccesso\">Modifica effettuata correttamente!</span>)";
} 
//DELETE
else if($action == "delete") {
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD) or die;
	mysql_select_db(DB_DATABASE) or die;
	
	$sql="DELETE FROM aa_news WHERE id='".$id."'";
	
	if($result = mysql_query($sql, $conn)) {
		$message = "(<span class=\"messaggioDiSuccesso\">Eliminazione effettuata correttamente!</span>)";
	} else {
		$message = "(<span class=\"messaggioDiErrore\">Errore nell'eliminazione della news!</span>)";
	}
}

?>
       
<DIV id="wpbody">
	<DIV class="wrap">
    	<br />
 		<H2>Gestione news <?php=$message?></H2> 
            <!-- rightnow -->
			<BR class="clear" />
        
			<DIV id="dashboard-widgets-wrap">
				<DIV id="dashboard-widgets">
					<DIV class="dashboard-widget-holder full wp_dashboard_empty" id="dashboard_secondary">
                    	<img src="images/add.png" />
                        Inserisci una nuova news:
                        <div id="insertNews">
                            <p>
                            	<?php include "includes/newsInsert.php"; ?>
                            </p>     
                        </div>
                    	<!-- FORM INSERIMENTO NEWS -->
                        <br /><br />
                    
						<DIV class="dashboard-widget">
                            <H3 class="dashboard-widget-title">
                            <SPAN>News inserite nel sito</SPAN>
                            <BR class="clear" />
                            </H3>
							<DIV class="dashboard-widget-content">
                                <p>
									<?php include "includes/newsView.php"; ?>
                                </p>
                            </DIV>
						</DIV>
                        <br /><br />
					</DIV>
					<BR class="clear" />
				</DIV>
			</DIV>
			<!-- dashboard-widgets-wrap -->
	</DIV>
	<!-- wrap -->
</DIV>
<!-- wpbody -->

<?php
require_once("includes/footer.php");
?>