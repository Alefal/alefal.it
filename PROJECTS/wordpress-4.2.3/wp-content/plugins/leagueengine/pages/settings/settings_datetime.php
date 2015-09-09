<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['save_settings'])) { leagueengine_save_settings('datetime'); }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('Settings','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>

		<form action="" method="POST">
		<table class="form">
			<tr>
				<td><?php _e('Date Format','leagueengine'); ?></td>
				<td><input type="text" name="date_format_php" value="<?php echo leagueengine_fetch_settings('date_format_php'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Time Format','leagueengine'); ?></td>
				<td><input type="text" name="time_format_php" value="<?php echo leagueengine_fetch_settings('time_format_php'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Date Picker Format','leagueengine'); ?></td>
				<td><input type="text" name="date_format" value="<?php echo leagueengine_fetch_settings('date_format'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Time Picker Format','leagueengine'); ?></td>
				<td><input type="text" name="time_format" value="<?php echo leagueengine_fetch_settings('time_format'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Default Match Time','leagueengine'); ?></td>
				<td>
					<input type="text" name="time_default" class="leagueengine_timepicker" value="<?php echo date(leagueengine_fetch_settings('time_format_php'),strtotime(leagueengine_fetch_settings('time_default'))); ?>">
					<input type="hidden" name="time_default_alt" class="leagueengine_timepicker_alt" value="">
				</td>
			</tr>
		</table>
		
		<input style="margin-top:20px;" type="submit" name="save_settings" class="button" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		
	
	</div>

</div>