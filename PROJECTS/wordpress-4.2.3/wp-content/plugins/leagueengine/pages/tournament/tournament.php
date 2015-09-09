<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$tournament_id = $_GET['id'];
	
	if(isset($_POST['save_tournament'])) { leagueengine_save_tournament($tournament_id); }
	
	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
		
	$tournament_row = leagueengine_fetch_data_row('tournament',$tournament_id);

	if(isset($_POST['delete_tournament_match'])) { leagueengine_delete_match_from_tournament($tournament_id,$_POST['match_id']); $msg = '<div class="success">'.__('Success!','leagueengine').'</div>'; }

?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $tournament_row->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo $tournament_row->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('tournament_settings'); ?>
		
		<form action="" method="POST">

		<table class="form">
			<tr>
				<th colspan="2"><?php _e('Settings','leagueengine');?></th>
			</tr>
			<tr>
				<td><?php _e('Name','leagueengine');?></td>
				<td><input type="text" name="tournament_name" value="<?php echo $tournament_row->data_value; ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Start Date','leagueengine');?></td>
				<td>
					
					<input type="text" name="date" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime($tournament->start_date)); ?>">
					<input type="hidden" name="tournament_start_date" class="leagueengine_datepicker_alt" value="<?php echo $tournament->start_date; ?>">
					
				</td>
			</tr>
			
			<?php if(leagueengine_tournament_info($tournament_id,'tournament_type') == 'leagueknockout') { ?>
				<tr>
					<td><?php _e('Home And Away','leagueengine');?></td>
					<td>
						<select class="select2-nosearch" name="tournament_repeat">
							<option value="on"<?php if($tournament->tournament_repeat == 'on') { echo ' selected="selected"'; } ?>>On</option>
							<option value="off"<?php if($tournament->tournament_repeat == 'off') { echo ' selected="selected"'; } ?>>Off</option>
						</select>						
					</td>
				</tr>
				<tr>
					<td><?php _e('Shuffle','leagueengine');?></td>
					<td>
						<select class="select2-nosearch" name="tournament_shuffle">
							<option value="on"<?php if($tournament->tournament_shuffle == 'on') { echo ' selected="selected"'; } ?>>On</option>
							<option value="off"<?php if($tournament->tournament_shuffle == 'off') { echo ' selected="selected"'; } ?>>Off</option>
						</select>						
					</td>
				</tr>
				<tr>
					<td><?php _e('Win Points','leagueengine');?></td>
					<td><input type="text" name="tournament_pts_win" value="<?php echo $tournament->pts_win; ?>"></td>
				</tr>
				<tr>
					<td><?php _e('Lose Points','leagueengine');?></td>
					<td><input type="text" name="tournament_pts_lose" value="<?php echo $tournament->pts_lose; ?>"></td>
				</tr>
				<tr>
					<td><?php _e('Draw Points','leagueengine');?></td>
					<td><input type="text" name="tournament_pts_draw" value="<?php echo $tournament->pts_draw; ?>"></td>
				</tr>
	
				<tr>
					<td><?php _e('Bonus Points','leagueengine');?></td>
					<td>
						<select class="select2-nosearch" name="tournament_pts_bonus">
							<option value="on"<?php if($tournament->pts_bonus == 'on') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
							<option value="off"<?php if($tournament->pts_bonus == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
						</select>
					</td>
				</tr>
			
			<?php } ?>
			
		</table>
		
		<input style="margin-top:20px;" type="submit" name="save_tournament" class="button-primary" value="<?php _e('Save','leagueengine');?>" />
		
		</form>

	</div>

</div>