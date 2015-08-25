<?
require_once("configure.php");

if($_SESSION["language"] == "it") {
	require_once("i18n/it.php");
} else if($_SESSION["language"] == "en") {
	require_once("i18n/en.php");
} else {
	require_once("i18n/it.php");
}

$da 	= $_POST['da'];
$a 		= $_POST['a'];
$nome 	= $_POST['nome'];
$email 	= $_POST['email'];
$note 	= $_POST['note'];

$to = EMAIL;
$subject = "RICHIESTA DISPONIBILITA: Ricevuta email da ".$email;

$message = "
<p>Richiesta disponibilita dal sito dalla email $email!</p>
<p>
	<br />
	Salve mi chiamo $nome e volevo richiedere disponibilita':
	<br /><br />
	dal -> <b>$da</b>
	<br />
	al --> <b>$a</b>
	<br /><br />
	Le mie note sono:
	<br />
	$note
	<br /><br />
	Grazie!
</p>";

// Always set content-type when sending HTML email
$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";

// More headers
$headers .= "From: SITO --- Richiesta da ". $nome . " <" . $email . ">\r\n";

if (mail($to, $subject, $message, $headers)) {
	echo DISP_MSG_SEND_OK;
} else {
	echo DISP_MSG_SEND_KO;
}
?>