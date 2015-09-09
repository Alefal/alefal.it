<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$tournament_id = $_GET['id'];

	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");

	$tournament_type = leagueengine_fetch_data_from_id($tournament_id,'league_type');
	
	if(isset($_POST['save_tournament'])) { leagueengine_save_tournament($tournament_id); }

	if(isset($_POST['add_team_to_tournament'])) {
		if($tournament_type == 'players') {
			leagueengine_add_team_to_tournament($tournament_id,$_POST['team_id'],$tournament->teams,'player');
		} else {
			leagueengine_add_team_to_tournament($tournament_id,$_POST['team_id'],$tournament->teams);		
		}
	}

	if(isset($_POST['save_tournament_matches'])) { leagueengine_save_tournament_matches($tournament_id,$_POST['tournament_match_id'],$_POST['home_team_id'],$_POST['home_team_score'],$_POST['away_team_id'],$_POST['away_team_score']); }

	if(isset($_POST['delete']) && isset($_POST['delete_id'])) { leagueengine_delete_team_from_tournament($tournament_id,$_POST['delete_id']); }

	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
			
	$tournament_row = leagueengine_fetch_data_row('tournament',$tournament_id);

?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_tournament&id=<?php echo $tournament_id; ?>"><?php echo $tournament_row->data_value; ?></a> <span class="divider">/</span></li>
			<li><?php _e('Groups','leagueengine');?></li>
		</ul>

		<h2 class="form_title"><?php echo $tournament_row->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('tournament_teams'); ?>
		
		<?php echo leagueengine_tournament_teams($tournament_id); ?>
		
		<?php if($tournament->teams != leagueengine_tournament_leagueknockout_count_teams($tournament_id)) { ?>

		<?php
			$league_type = leagueengine_fetch_data_from_id($tournament_id,'league_type');
			if($league_type == 'players') {
				echo '<h2 class="form_title" style="margin-top:20px;">'. __('Add Player To Tournament','leagueengine'). '</h2>';			
			} else {
				echo '<h2 class="form_title" style="margin-top:20px;">'. __('Add Team To Tournament','leagueengine'). '</h2>';
			}
		?>

		<form action="" method="POST">
		<table class="form">

			<?php
				if($tournament_type == 'players') { ?>
				<tr>
					<td><?php _e('Player','leagueengine');?></td>
					<td>
					<select name="team_id" class="select2">
						<?php
							$table = $wpdb->prefix . 'leagueengine_data';
							$not_yet_added = array();
							$teams = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'player' ORDER BY data_value ASC");
							foreach($teams as $team) {
								$table = $wpdb->prefix . 'leagueengine_tournament_teams';
								$team_id = $team->id;
							    $check = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$team_id'");
							    if(!$check) {
							        $not_yet_added[] = $team->id;
							    }
							}
							foreach($not_yet_added as $add_team) {
								echo '<option value="'.$add_team.'">'.leagueengine_fetch_data_from_id($add_team,'data_value').'</option>';
							}
						?>
					</select>
					</td>
					</td>
				</tr>			
				<?php } else { ?>
				<tr>
					<td><?php _e('Team','leagueengine');?></td>
					<td>
					<select name="team_id" class="select2">
						<?php
							$table = $wpdb->prefix . 'leagueengine_data';
							$not_yet_added = array();
							$teams = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'team' ORDER BY data_value ASC");
							foreach($teams as $team) {
								$table = $wpdb->prefix . 'leagueengine_tournament_teams';
								$team_id = $team->id;
							    $check = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$team_id'");
							    if(!$check) {
							        $not_yet_added[] = $team->id;
							    }
							}
							foreach($not_yet_added as $add_team) {
								echo '<option value="'.$add_team.'">'.leagueengine_fetch_data_from_id($add_team,'data_value').'</option>';
							}
						?>
					</select>
					</td>
					</td>
				</tr>
				<?php } ?>

			<?php if($tournament->tournament_type == 'leagueknockout') { ?>
			<tr>
				<td>Group</td>
				<td>
					<?php
						$table = $wpdb->prefix . 'leagueengine_tournament_teams';
						$count_teams = $wpdb->get_var("SELECT COUNT(*) FROM $table WHERE tournament_id = '$tournament_id'");
						if($tournament->tournament_type == 'leagueknockout' && $tournament->groups != '') { 
						$max_per_group = explode('x', $tournament->groups);
						$max_per_group = $max_per_group[1];
					?>
						<select class="select2-nosearch" name="team_group">
						<?php for ($i = 1; $i <= $tournament->groups; $i++) {
							if(leagueengine_tournament_count_teams_in_group($tournament_id,$i,$max_per_group) == 'FULL') { $dis = 'disabled '; } else { $dis = ''; }
							echo '<option '.$dis.'value="'.$i.'">'.__('Group','leagueengine').' '.$i.' ('.leagueengine_tournament_count_teams_in_group($tournament_id,$i,$max_per_group).')</option>';
						} ?>
						</select>
					<?php } ?>
				</td>
			</tr>
			<?php } ?>
		</table>
		
		<?php if($tournament_type == 'players') { ?>
			<input style="margin-top:20px;" type="submit" name="add_team_to_tournament" class="button-primary" value="<?php _e('Add Player To Tournament','leagueengine');?>" />
		<?php } elseif($tournament_type == 'teams') { ?>
			<input style="margin-top:20px;" type="submit" name="add_team_to_tournament" class="button-primary" value="<?php _e('Add Team To Tournament','leagueengine');?>" />
		<?php } ?>
					
		</form>
		<?php } ?>

	</div>

</div>