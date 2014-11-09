<?php
$pagename = basename($_SERVER['PHP_SELF']);

$category = '';
$items = '';
$documents = '';

if($pagename == 'category') {
    $category = 'active';
} else if($pagename == 'items') {
    $items = 'active';
} else if($pagename == 'documents') {
    $documents = 'active';
}
?>

<div class="navbar-collapse navbar-ex1-collapse collapse" style="height: 1px;border-top: 2px solid black;">
    <ul class="nav navbar-nav side-nav">
        <li class="<?=$documents?>"><a href="<?php echo base_url(); ?>index.php/documents">Documenti</a></li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Magazzino <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>index.php/stock">Carico</a></li>
                <li><a href="<?php echo base_url(); ?>index.php/orders">Scarico</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">Anagrafica <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>index.php/guests">Clienti</a></li>
                <li><a href="<?php echo base_url(); ?>index.php/vendor">Fornitori</a></li>
            </ul>
        </li>
        <li class="<?=$category?>"><a href="<?php echo base_url(); ?>index.php/category">Categorie</a></li>
        <li class="<?=$items?>"><a href="<?php echo base_url(); ?>index.php/items">Prodotti</a></li>
    </ul>
</div>