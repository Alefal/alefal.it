<?php
$pagename = basename($_SERVER['PHP_SELF']);

$categories = '';
$tags = '';

if($pagename == 'categories') {
	$categories = 'active';
} else if($pagename == 'tags') {
	$tags = 'active';
}
?>

<div class="navbar-collapse navbar-ex1-collapse collapse" style="height: 1px;border-top: 2px solid black;">
    <ul class="nav navbar-nav side-nav">
        <li class="<?=$categories?>"><a href="<?php echo base_url(); ?>index.php/categories">Categorie</a></li>
        <li class="<?=$tags?>"><a href="<?php echo base_url(); ?>index.php/tags">Tags</a></li>
    </ul>
</div>