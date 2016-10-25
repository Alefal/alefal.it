<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_GET["pagenumber"])) { $pagenumber = $_GET["pagenumber"]; } else { $pagenumber = 1; }; 
	$pagination = ($pagenumber - 1) * leagueengine_fetch_settings('pagination');
	$league_id = $_GET['lid'];
	$season_id = $_GET['sid'];
	$season = leagueengine_fetch_data_row('season',$season_id);
	if(isset($_POST['add_match_to_season'])) { leagueengine_add_match_to_season($league_id,$season_id,$_POST['date_alt'],$_POST['time_alt'],$_POST['home_team'],$_POST['away_team']); }
	if(isset($_POST['generate_season'])) { leagueengine_generate_season($league_id,$season_id,$_POST['start_date_alt'],$_POST['generate_time'],$_POST['interval'],$_POST['interval_type'],$_POST['repeat'],$_POST['shuffle']); }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_league&id=<?php echo $league_id; ?>"><?php echo leagueengine_fetch_data_from_id($league_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_season&lid=<?php echo $league_id; ?>&sid=<?php echo $season_id; ?>"><?php echo leagueengine_fetch_data_from_id($season_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><?php _e('New Match','leagueengine');?></li>
		</ul>

		<h2 class="form_title" style="width:100%;"><?php echo $season->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('season_new_match'); ?>
		
		<table class="form">
			<tr>	
				<td style="border-bottom:none;"><?php _e('What do you want to create?','leagueengine');?></td>	
				<td style="border-bottom:none;">
					<select id="new_matches" class="select2-nosearch">
						<option value="single"><?php _e('Single Match','leagueengine');?></option>
						<option value="generate"><?php _e('Fixture List','leagueengine');?></option>
					</select>
				</td>
			</tr>
		</table>
		
		<form action="" class="single_match" method="POST" style="display:none;">
		<table class="form">
			<tr>
				<td><?php _e('Round','leagueengine');?></td>
				<td>
					<input type="text" name="round">
				</td>
			</tr>
			<tr>
				<td><?php _e('Date','leagueengine');?></td>
				<td>
					<input type="text" name="date" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
					<input type="hidden" name="date_alt" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
				</td>
			</tr>
			<tr>
				<td><?php _e('Time','leagueengine');?></td>
				<td>
					<input type="text" name="time" class="leagueengine_timepicker" value="">
					<input type="hidden" name="time_alt" class="leagueengine_timepicker_alt" value="">
				</td>
			</tr>
			<tr>
				<td><?php _e('Home','leagueengine');?></td>
				<td>
					<select name="home_team" class="select2">
						<?php echo leagueengine_season_teams_select($league_id,$season_id);?>
					</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Away','leagueengine');?></td>
				<td>
					<select name="away_team" class="select2">
						<?php echo leagueengine_season_teams_select($league_id,$season_id);?>
					</select>
				</td>
			</tr>
		</table>
				
		<input style="margin-top:20px;" type="submit" name="add_match_to_season" class="button-primary" value="<?php _e('Create','leagueengine');?>" />
		</form>			
			
		<form action="" class="generate_match" method="POST" style="display:none;">
			<table class="form">
				<tr>
					<td><?php _e('Start Date','leagueengine');?></td>
					<td>
						<input type="text" name="start_date" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
						<input type="hidden" name="start_date_alt" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
						<input type="hidden" name="generate_time" value="<?php echo leagueengine_fetch_settings('time_default'); ?>">
					</td>
				</tr>
				<tr>
					<td><?php _e('Gap Between Matches','leagueengine');?></td>
					<td>
						<select style="width:48% !important; margin-right:4%;" class="select2-nosearch" name="interval">
							<?php for ($i = 1; $i <= 12; $i++) { echo '<option value="'.$i.'">'.$i.'</option>'; } ?>
						</select>
						<select style="width:48% !important;" class="select2-nosearch" name="interval_type">
							<option value="days"><?php _e('Days','leagueengine');?></option>
							<option value="months"><?php _e('Months','leagueengine');?></option>
						</select>
					</td>
				</tr>
				<tr>
					<td><?php _e('Home and Away Matches','leagueengine');?></td>
					<td>
						<select class="select2-nosearch" name="repeat">
							<option value="on"><?php _e('On','leagueengine');?></option>
							<option value="off"><?php _e('Off','leagueengine');?></option>
						</select>
					</td>
				</tr>
				<tr>
					<td><?php _e('Shuffle','leagueengine');?></td>
					<td>
						<select class="select2-nosearch" name="shuffle">
							<option value="on"><?php _e('On','leagueengine');?></option>
							<option value="off"><?php _e('Off','leagueengine');?></option>
						</select>
					</td>
				</tr>
			</table>
					
			<input style="margin-top:20px;"  type="submit" name="generate_season" class="button-primary" value="<?php _e('Generate','leagueengine');?>" />
			</form>			

	</div>

</div>