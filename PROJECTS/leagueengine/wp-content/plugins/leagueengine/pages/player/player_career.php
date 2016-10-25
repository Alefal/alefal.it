<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$player_id = $_GET['id'];
	if(isset($_POST['save_player_career'])) { leagueengine_save_player_career($player_id); }
	$table = $wpdb->prefix . 'leagueengine_data';
	$player = $wpdb->get_row("SELECT * FROM $table WHERE id = '$player_id'");
	$player_row = leagueengine_fetch_data_row('team',$player_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">

		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=players"><?php _e('Players','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_player&id=<?php echo $player_id; ?>"><?php echo $player->data_value; ?></a> <span class="divider">/</span></li>
			<li><?php _e('Career','leagueengine');?></li>
		</ul>
	
		<h2 class="form_title"><?php echo leagueengine_fetch_player_emblem($player_id,30) . leagueengine_fetch_data_from_id($player_id,'data_value'); ?></h2>			
		<?php echo leagueengine_admin_menu('player_career'); ?>

			<?php
				$count = leagueengine_fetch_career($player_id);
				if($count) {
					
					// FETCH CLASS
					$leagueengine_data_table = new leagueengine_data_table_careers();
					
					// START FORM
					echo '<form id="leagueengine_careers" method="get">';
									
					//echo '<a class="add_new" href="admin.php?page=leagueengine_create&default=competition&new_season=true&lid='.$league_id.'">'. __('Add new','leagueengine') .'</a></h2>';
								
					// CHECK FOR SEARCH
					if(isset($_GET['s'])) { echo $leagueengine_data_table->prepare_items($player_id,$_GET['s']); } 
					else { echo $leagueengine_data_table->prepare_items($player_id); }
					
					echo '<input type="hidden" name="data_type" value="player" />';
					echo '<input type="hidden" name="id" value="'.$player_id.'" />';
					echo '<input type="hidden" name="page" value="' . $_REQUEST['page'] . '" />';
					//echo $leagueengine_data_table->search_box('search', 'name');
					echo $leagueengine_data_table->display();
					echo '</form>';
						
				} else {
					// NO RESULTS	
				}
			?>
			
			<h2 class="form_title" style="margin-top:20px;"><?php _e('Update career','leagueengine'); ?></h2>
			
			<form action="" method="post" class="career">
				<table class="form">

				<tr class="career_competition">
					<td><?php _e('Competition Type','leagueengine'); ?></td>
					<td>
						<select name="career_competition" id="career_competition" class="select2-nosearch">
							<option value="league"><?php _e('League','leagueengine'); ?></option>
							<option value="tournament"><?php _e('Tournament','leagueengine'); ?></option>
						</select>
					</td>
				</tr>
				
				<tr class="career_league" style="display:none;">
					<td><?php _e('League','leagueengine'); ?></td>
					<td>
						<select name="league" class="pick-league select2">
							<?php
								$leagues = leagueengine_data_exists('league');
								echo '<option value=""></option>';
								foreach($leagues as $league) {
									echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
								} ?>
						</select>	
					</td>
				</tr>
				
				<tr class="career_league" style="display:none;">
					<td><?php _e('Season','leagueengine'); ?></td>
					<td>
						<select name="season" class="pick-season select2"></select>
					</td>
				</tr>
				
				<tr class="career_league" style="display:none;">
					<td><?php _e('Team','leagueengine'); ?></td>
					<td>
						<select name="league_team" class="pick-team select2"></select>
					</td>
				</tr>

				<tr class="career_tournament" style="display:none;">
					<td><?php _e('Tournament','leagueengine'); ?></td>
					<td>
						<select name="tournament" class="pick-tournament select2">
							<?php
								$tournaments = leagueengine_data_exists('tournament');
								echo '<option value=""></option>';
								foreach($tournaments as $tournament) {
									echo '<option value="'.$tournament->id.'">'.leagueengine_fetch_data_from_id($tournament->id,'data_value').'</option>';
								} ?>
						</select>	
					</td>
				</tr>
				
				<tr class="career_tournament" style="display:none;">
					<td><?php _e('Team','leagueengine'); ?></td>
					<td>
						<select name="tournament_team" class="pick-tournament-team select2"></select>
					</td>
				</tr>

			</table>
				<input style="margin-top:20px;" type="submit" name="save_player_career" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
			</form>

	</div>

</div>