<?php
$pagename = basename($_SERVER['PHP_SELF']);

$orders = '';
$category = '';
$items = '';
$guests = '';
$state = '';

if($pagename == 'orders') {
    $orders = 'active';
} else if($pagename == 'category') {
    $category = 'active';
} else if($pagename == 'items') {
    $items = 'active';
} else if($pagename == 'guests') {
    $guests = 'active';
} else if($pagename == 'state') {
    $state = 'active';
}
?>

<div class="navbar-collapse navbar-ex1-collapse collapse" style="height: 1px;border-top: 2px solid black;">
    <ul class="nav navbar-nav side-nav">
        <li class="<?=$orders?>"><a href="<?php echo base_url(); ?>index.php/orders">Ordini</a></li>
        <li class="<?=$category?>"><a href="<?php echo base_url(); ?>index.php/category">Categorie</a></li>
        <li class="<?=$items?>"><a href="<?php echo base_url(); ?>index.php/items">Prodotti</a></li>
        <li class="<?=$guests?>"><a href="<?php echo base_url(); ?>index.php/guests">Clienti</a></li>
        <li class="<?=$state?>"><a href="<?php echo base_url(); ?>index.php/state">Stati ordine</a></li>
    </ul>
</div>