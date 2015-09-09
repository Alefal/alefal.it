<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['save_settings'])) { leagueengine_save_settings('general'); }
	if(isset($_POST['save_table_settings'])) { leagueengine_save_table_settings(); }
	if(isset($_POST['reset_table_settings'])) { leagueengine_reset_table_settings(); }
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
				<td><?php _e('Admin Rows Per Page','leagueengine'); ?></td>
				<td><input type="text" name="pagination" value="<?php echo leagueengine_fetch_settings('pagination'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Matches Per Page','leagueengine'); ?></td>
				<td><input type="text" name="pagination_matches" value="<?php echo leagueengine_fetch_settings('pagination_matches'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Search Results Per Page','leagueengine'); ?></td>
				<td><input type="text" name="pagination_search" value="<?php echo leagueengine_fetch_settings('pagination_search'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Default Sort Order','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="data_table_sort">
					<option value="id"<?php if(leagueengine_fetch_settings('data_table_sort') == 'id') { echo ' selected="selected"'; } ?>><?php _e('Date','leagueengine');?></option>
					<option value="data_value"<?php if(leagueengine_fetch_settings('data_table_sort') == 'data_value') { echo ' selected="selected"'; } ?>><?php _e('Name','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Dashboard Upcoming Matches','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="dashboard_matches">
					<option value="off"<?php if(leagueengine_fetch_settings('dashboard_matches') == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
					<option value="5"<?php if(leagueengine_fetch_settings('dashboard_matches') == '5') { echo ' selected="selected"'; } ?>><?php _e('5','leagueengine');?></option>
					<option value="10"<?php if(leagueengine_fetch_settings('dashboard_matches') == '10') { echo ' selected="selected"'; } ?>><?php _e('10','leagueengine');?></option>
					<option value="20"<?php if(leagueengine_fetch_settings('dashboard_matches') == '20') { echo ' selected="selected"'; } ?>><?php _e('20','leagueengine');?></option>
					<option value="50"<?php if(leagueengine_fetch_settings('dashboard_matches') == '50') { echo ' selected="selected"'; } ?>><?php _e('50','leagueengine');?></option>
				</select>
				</td>
			</tr>		
		</table>
		
		<input style="margin-top:20px;" type="submit" name="save_settings" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>

	</div>

</div>