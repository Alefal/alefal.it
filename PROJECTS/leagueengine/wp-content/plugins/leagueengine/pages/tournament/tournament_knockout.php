<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$tournament_id = $_GET['id'];

	$table = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$tournament_id'");
	
	if(isset($_POST['save_tournament'])) { leagueengine_save_tournament($tournament_id); }
	if(isset($_POST['add_team_to_tournament'])) { leagueengine_add_team_to_tournament($tournament_id,$_POST['team_id'],$_POST['team_name'],$tournament->teams); }
	if(isset($_POST['save_tournament_matches'])) { leagueengine_save_tournament_matches($tournament_id,$_POST['match_id'],$_POST['home_team'],$_POST['home_score'],$_POST['away_team'],$_POST['away_score']); }
	if(isset($_POST['delete'])) { leagueengine_delete_team_from_tournament($tournament_id,$_POST['delete_id']); }

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
			<li><?php _e('Knockout','leagueengine');?></li>
		</ul>

		<h2 class="form_title"><?php echo $tournament_row->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('tournament_knockout'); ?>
		
		<?php if($tournament->tournament_type == 'knockout') { ?>
			<form action="" method="post">
				<?php if(leagueengine_tournament_matches_exist($tournament_id)) {
				$matches = leagueengine_tournament_matches_exist($tournament_id);
				echo '<table class="form">';
				echo '<thead><tr>';

				echo '<th style="width:20%;">Round</th>';
				echo '<th style="width:30%;text-align:center;">'.__('Home','leagueengine').'</th>';
				echo '<th style="width:20%;text-align:center;">'.__('Score','leagueengine').'</th>';
				echo '<th style="width:30%;text-align:center;">'.__('Away','leagueengine').'</th>';

				echo '</thead></tr>';
				echo '<tbody>';
				$num_teams = $tournament->teams;
				$final_round = floor(log($num_teams, 2));
				$sf_round = $final_round - 1;
				$qf_round = $final_round - 2;
				$theround = NULL;			
				foreach($matches as $match) {		
					
					$match_round = $match->round;
		    
					if($match->round == $final_round) {
						$match_round = __('Final','leagueengine');
					} elseif($match->round == $sf_round) {
						$match_round = __('Semi Finals','leagueengine');
					} elseif($match->round == $qf_round) {
						$match_round = __('Quarter Finals','leagueengine');
					} else { 
						$match_round = __('Round','leagueengine') . ' ' . $match->round;
					}
		    
		    if (is_null($theround) || $theround !== $match_round) {
		    
		        echo '<tr class="date"><td colspan="4">' . $match_round . '</td></tr>';
		    }
					
					echo '<tr>';
					echo '<td style="text-align:left;"><a href="admin.php?page=leagueengine_tournament_match&tid='.$tournament_id.'&mid='.$match->id.'">'.date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date)).' &dash; '.date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time)).'</a><input type="hidden" name="match_id[]" value="'.$match->id.'"></td>';
					echo '<td style="text-align:center;"><select class="select2-nosearch" style="width:228px;margin:0;" name="home_team[]">'.leagueengine_tournament_teams_select($tournament_id,$match->round,$match->home_team_id).'</select></td>';
					
			    	echo '<td style="text-align:center;">';
			    	echo '<input style="width:48%;text-align:center;" type="text" name="home_score[]" value="'.$match->home_team_score.'">'; 
			    	echo '<input style="width:48%;text-align:center;" type="text" name="away_score[]" value="'.$match->away_team_score.'">'; 
			    	echo '</td>';
					
					echo '<td style="text-align:center;"><select class="select2-nosearch" style="width:228px;margin:0;" name="away_team[]">'.leagueengine_tournament_teams_select($tournament_id,$match->round,$match->away_team_id).'</select></td>';
					echo '</tr>';
					$theround = $match_round;
				}
				echo '</tbody>';
				echo '</table>';
				} ?>
			<input style="margin-top:20px;" name="save_tournament_matches" type="submit" class="button" value="<?php _e('Save','leagueengine');?>">
			</form>
		<?php } elseif($tournament->tournament_type == 'leagueknockout') { ?>
			<?php if(leagueengine_tournament_leagueknockout_count_teams($tournament_id) == $tournament->teams && leagueengine_tournament_group_matches_awaiting_results($tournament_id) == 0 ) { ?>

			<form action="" method="post">
				<?php 
				if(leagueengine_tournament_matches_exist($tournament_id)) {
					$matches = leagueengine_tournament_matches_exist($tournament_id);
					echo '<table class="form">';
					echo '<thead><tr>';

					echo '<th style="width:20%;">'.__('Round','leagueengine').'</th>';
					echo '<th style="width:30%;text-align:center;">'.__('Home','leagueengine').'</th>';
					echo '<th style="width:20%;text-align:center;">'.__('Score','leagueengine').'</th>';
					echo '<th style="width:30%;text-align:center;">'.__('Away','leagueengine').'</th>';

					echo '</thead></tr>';
					echo '<tbody>';
					
					$num_teams = $tournament->koteams;
					
					if(tournament_max_rounds($tournament_id) == 5) {
						$final_round = '5';
						$playoff_round = '4';
						$sf_round = '3';
						$qf_round = '2';				
						$l16_round = '1';				
					} else {
						$final_round = floor(log($num_teams, 2));
						$sf_round = $final_round - 1;
						$qf_round = $final_round - 2;
					}
					
					$theround = NULL;		

					foreach($matches as $match) {		
						
						$match_round = $match->round;
						$match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
						$match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
			    
						if(tournament_max_rounds($tournament_id) == 5) {
							if($match->round == $final_round) {
								$match_round = __('Final','leagueengine');
							} elseif($match->round == $playoff_round) {
								$match_round = __('Third Place Play-Off','leagueengine');
							} elseif($match->round == $sf_round) {
								$match_round = __('Semi Finals','leagueengine');
							} elseif($match->round == $qf_round) {
								$match_round = __('Quarter Finals','leagueengine');
							} elseif($match->round == $l16_round) {
								$match_round = __('Last 16','leagueengine');
							} else { 
								$match_round = __('Round','leagueengine') . ' ' . $match->round;
							}					
						} else {
							if($match->round == $final_round) {
								$match_round = __('Final','leagueengine');
							} elseif($match->round == $sf_round) {
								$match_round = __('Semi Finals','leagueengine');
							} elseif($match->round == $qf_round) {
								$match_round = __('Quarter Finals','leagueengine');
							} else { 
								$match_round = __('Round','leagueengine') . ' ' . $match->round;
							}
						}
			    
			    		if (is_null($theround) || $theround !== $match_round) {
			    			echo '<tr class="date"><td colspan="4">' . $match_round . '</td></tr>';
			    		}
						
						echo '<tr>';
						echo '<td><a href="admin.php?page=leagueengine_tournament_match&tid='.$tournament_id.'&mid='.$match->id.'">'.$match_date.' '.$match_time.'</a><input type="hidden" name="match_id[]" value="'.$match->id.'"></td>';
						echo '<td style="text-align:center;"><select class="select2-nosearch" style="width:228px;margin:0;" name="home_team[]">'.leagueengine_tournament_leagueknockout_teams_select($tournament_id,$match->round,$match->home_team_id).'</select></td>';
						
				    	echo '<td style="text-align:center;">';
				    	echo '<input style="width:48%;text-align:center;" type="text" name="home_score[]" value="'.$match->home_team_score.'">'; 
				    	echo '<input style="width:48%;text-align:center;" type="text" name="away_score[]" value="'.$match->away_team_score.'">'; 
				    	echo '</td>';
						
						echo '<td style="text-align:center;"><select class="select2-nosearch" style="width:228px;margin:0;" name="away_team[]">'.leagueengine_tournament_leagueknockout_teams_select($tournament_id,$match->round,$match->away_team_id).'</select></td>';
						echo '</tr>';
						$theround = $match_round;
					}
					echo '</tbody>';
					echo '</table>';
				} ?>
				<input style="margin-top:20px;" name="save_tournament_matches" type="submit" class="button-primary" value="<?php _e('Update','leagueengine');?>">
			</form>
					
			<?php } else {
			
				$missing = $tournament->teams - leagueengine_tournament_leagueknockout_count_teams($tournament_id);
				if($missing == 1) {
					$missingtext = __('more team in the tournament, and for all matches to have been completed.','leagueengine');
				} else {
					$missingtext = __('more teams in the tournament, and for all matches to have been completed.','leagueengine');
				}
				echo '<div class="label"><h3 class="label">'.__('Knockout','leagueengine').'</h3></div>';
				echo '<p>'.__('Before you can view the tournament bracket you need','leagueengine').' <strong>'.$missing.'</strong> '.$missingtext.'</p>';
			
			 } ?>
				
				<?php } ?>
		

	</div>
</div>