<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['save_match_page_settings'])) { leagueengine_save_match_page_settings(); }
	if(isset($_POST['reset_match_page_settings'])) { leagueengine_reset_match_page_settings(); }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('Settings','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>

		<div id="leaguetables">
			<?php echo leagueengine_match_page_settings(); ?>
		</div>
	
	</div>

</div>