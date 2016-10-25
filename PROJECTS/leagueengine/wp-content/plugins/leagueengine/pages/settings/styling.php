<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_GET['settings-updated'])) { 
		$msg = '<div class="success">'.__('Success!','leagueengine').'</div>';
	}
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<link type="text/css" rel="stylesheet" href="<?php echo LEAGUEENGINE_DIRURL . '/styles/codemirror.css';?>">
	<link type="text/css" rel="stylesheet" href="<?php echo LEAGUEENGINE_DIRURL . '/styles/default.css';?>">
	<script language="javascript" src="<?php echo LEAGUEENGINE_DIRURL . '/scripts/codemirror.js';?>"></script>
	<script language="javascript" src="<?php echo LEAGUEENGINE_DIRURL . '/scripts/css.js';?>"></script>

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('Styling','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>
		
		<form method="post" action="options.php">
			<?php settings_fields('leagueengine_mccss_settings' ); ?>
			<div class="setting">
				<textarea rows="50" name="leagueengine_custom_css" id="leagueengine_custom_css" dir="ltr" style="width:100%;" class="css"><?php echo get_option('leagueengine_custom_css');?></textarea>
				<script language="javascript">var editor = CodeMirror.fromTextArea(document.getElementById("leagueengine_custom_css"), { lineNumbers: true });</script>
			</div>
			<input style="margin-top:20px;" name="save_styling" type="submit" class="button" value="<?php _e('Save','leagueengine'); ?>">
		</div>						
		</form>
		
	</div>

</div>