<h2>query <?PHP print_r($results); ?><br /></h2>

<?php
foreach($results as $row) {
	echo $row->id;
	echo $row->testo;
}
?>