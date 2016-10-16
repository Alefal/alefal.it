<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$league_id = $_GET['lid'];
	$season_id = $_GET['sid'];
	$season = leagueengine_fetch_data_row('season',$season_id);
	$league_type = leagueengine_fetch_data_from_id($league_id,'league_type');
	if(isset($_POST['save_league'])) { leagueengine_save_league($season_id); }
	if(isset($_POST['add_team_to_season'])) {
		if($league_type == 'players' or $league_type == 'all-players') {
			leagueengine_add_team_to_season($league_id,$season_id,$_POST['team_id'],'player');
		} elseif($league_type == 'teams' or $league_type == 'all-teams') {
			leagueengine_add_team_to_season($league_id,$season_id,$_POST['team_id']);		
		}
	}
	if(isset($_POST['delete'])) { leagueengine_delete_team_from_season($league_id,$season_id,$_POST['delete_id']); }
	if(isset($_POST['update_allvsall'])) {
		$all_vs_all_ids = $_POST['team_id'];
		$all_vs_all_pts = $_POST['team_pts'];
		leagueengine_update_allvsall_points($league_id,$season_id,$all_vs_all_ids,$all_vs_all_pts); }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_league&id=<?php echo $league_id; ?>"><?php echo leagueengine_fetch_data_from_id($league_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_season&lid=<?php echo $league_id; ?>&sid=<?php echo $season_id; ?>"><?php echo leagueengine_fetch_data_from_id($season_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><?php _e('Table','leagueengine');?></li>
		</ul>

		<h2 class="form_title"><?php echo $season->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('season_table'); ?>
		
			<?php
				if(leagueengine_season_count_teams($_GET['lid'],$_GET['sid']) > 0) {
					
					// FETCH CLASS
					echo '<form id="leagueengine_rankings" method="POST">';
					if($league_type == 'players' or $league_type == 'teams') {
						$leagueengine_data_table = new leagueengine_data_table_rankings();
					} elseif($league_type == 'all-players' or $league_type == 'all-teams') {
						$leagueengine_data_table = new leagueengine_data_table_all_rankings();
					}
					echo $leagueengine_data_table->prepare_items($_GET['lid'],$_GET['sid']);
					echo $leagueengine_data_table->display();
					echo '<input type="hidden" name="lid" value="'.$league_id.'" />';
					echo '<input type="hidden" name="sid" value="'.$season_id.'" />';
					echo '<input type="hidden" name="page" value="' . $_REQUEST['page'] . '" />';
					echo '<p><input class="button-secondary" type="submit" name="update_allvsall" value="'.__('Update','leagueengine').'" /></p>';
					echo '</form>';
						
				} else {
					// NO RESULTS	
				}
			?>

		<?php
			$table = $wpdb->prefix . 'leagueengine_data';
			$not_yet_added = array();
			$teams = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'team' ORDER BY data_value ASC");
			foreach($teams as $team) {
				$table = $wpdb->prefix . 'leagueengine_season_teams';
				$team_id = $team->id;
			    $check = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team_id'");
			    if(!$check) {
			        $not_yet_added[] = $team->id;
			    }
			}
			if($not_yet_added) {
		?>
		
		<?php
			$league_type = leagueengine_fetch_data_from_id($league_id,'league_type');
			if($league_type == 'players' or $league_type == 'all-players') {
				echo '<h2 class="form_title" style="margin-top:20px;">'. __('Add Player To Season','leagueengine'). '</h2>';			
			} elseif($league_type == 'teams' or $league_type == 'all-teams') {
				echo '<h2 class="form_title" style="margin-top:20px;">'. __('Add Team To Season','leagueengine'). '</h2>';
			}
		?>
		
		<form action="" method="POST">
		<table class="form">
		<?php
			if($league_type == 'players' or $league_type == 'all-players') { ?>
			<tr>
				<td><?php _e('Player','leagueengine');?></td>
				<td>
				<select name="team_id" class="select2">
					<?php
						$table = $wpdb->prefix . 'leagueengine_data';
						$not_yet_added = array();
						$teams = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'player' ORDER BY data_value ASC");
						foreach($teams as $team) {
							$table = $wpdb->prefix . 'leagueengine_season_teams';
							$team_id = $team->id;
						    $check = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team_id'");
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
			<?php } elseif($league_type == 'teams' or $league_type == 'all-teams') { ?>
			<tr>
				<td><?php _e('Team','leagueengine');?></td>
				<td>
				<select name="team_id" class="select2">
					<?php
						$table = $wpdb->prefix . 'leagueengine_data';
						$not_yet_added = array();
						$teams = $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'team' ORDER BY data_value ASC");
						foreach($teams as $team) {
							$table = $wpdb->prefix . 'leagueengine_season_teams';
							$team_id = $team->id;
						    $check = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$league_id' AND season_id = '$season_id' AND team_id = '$team_id'");
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
		</table>
		
		<?php
			if($league_type == 'players' or $league_type == 'all-players') { ?>
				<input style="margin-top:20px;" type="submit" name="add_team_to_season" class="button-primary" value="<?php _e('Add Player To Season','leagueengine');?>" />
			<?php } elseif($league_type == 'teams' or $league_type == 'all-teams') { ?>
				<input style="margin-top:20px;" type="submit" name="add_team_to_season" class="button-primary" value="<?php _e('Add Team To Season','leagueengine');?>" />
		<?php } ?>
		</form>
		
		<?php } ?>

	</div>

</div>