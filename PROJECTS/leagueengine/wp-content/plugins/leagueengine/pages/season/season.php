<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$league_id = $_GET['lid'];
	$season_id = $_GET['sid'];
	
	if(isset($_POST['save_season'])) { leagueengine_save_season($league_id,$season_id); }
	if(isset($_POST['add_team_to_season'])) { leagueengine_add_team_to_season($league_id,$season_id,$_POST['team_id'],$_POST['team_name']); }
	
	$table = $wpdb->prefix . 'leagueengine_league_seasons';
	$season = $wpdb->get_row("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id'");
	$season_row = leagueengine_fetch_data_row('season',$season_id);
	
	$league_row = leagueengine_fetch_data_row('league',$league_id);
	$allvall = '';
	if($league_row->league_type == 'all-teams' or $league_row->league_type == 'all-players') { $allvall = ' style="display:none;"'; }
	
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">

		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_league&id=<?php echo $league_id; ?>"><?php echo leagueengine_fetch_data_from_id($league_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><?php echo leagueengine_fetch_data_from_id($season_id,'data_value'); ?></li>
		</ul>

		<h2 class="form_title"><?php echo $season_row->data_value; ?></h2>
	
		<?php echo leagueengine_admin_menu('season_settings'); ?>
			
		<form action="" method="POST" >

		<table class="form">
			<tr>
				<td><?php _e('Name','leagueengine');?></td>
				<td><input type="text" name="season_name" value="<?php echo $season_row->data_value; ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Start Date','leagueengine');?></td>
				<td>
					<input type="text" name="season_start_date" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime($season->start_date)); ?>">
					<input type="hidden" name="date_alt" class="leagueengine_datepicker_alt" value="<?php echo $season->start_date; ?>">
				</td>
			</tr>
			<tr <?php echo $allvall;?>>
				<td><?php _e('Win Points','leagueengine');?></td>
				<td><input type="text" name="season_pts_win" value="<?php echo $season->pts_win; ?>"></td>
			</tr>
			<tr <?php echo $allvall;?>>
				<td><?php _e('Lose Points','leagueengine');?></td>
				<td><input type="text" name="season_pts_lose" value="<?php echo $season->pts_lose; ?>"></td>
			</tr>
			<tr <?php echo $allvall;?>>
				<td><?php _e('Draw Points','leagueengine');?></td>
				<td><input type="text" name="season_pts_draw" value="<?php echo $season->pts_draw; ?>"></td>
			</tr>
			<tr <?php echo $allvall;?>>
				<td><?php _e('Score Difference','leagueengine');?></td>
				<td>
					<select class="select2-nosearch" name="season_difference">
						<option value="on"<?php if($season->difference == 'on') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
						<option value="off"<?php if($season->difference == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
					</select>
				</td>
			</tr>
			</tr>
			<tr <?php echo $allvall;?>>
				<td><?php _e('Bonus Points','leagueengine');?></td>
				<td>
					<select class="select2-nosearch" name="season_pts_bonus">
						<option value="on"<?php if($season->pts_bonus == 'on') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
						<option value="off"<?php if($season->pts_bonus == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
					</select>
				</td>
			</tr>
		</table>
		
		<input style="margin-top:20px;" type="submit" name="save_season" class="button-primary" value="<?php _e('Save','leagueengine');?>" />
		
		</form>

	</div>

</div>