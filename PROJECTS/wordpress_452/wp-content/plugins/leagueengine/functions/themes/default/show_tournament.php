<?php

// SHORTCODE: LEAGUEENGINE_SHOW_TOURNAMENT
// DESCRIPTION: DISPLAYS COMPLETE TOURNAMENT WITH OPTIONAL DISPLAY SETTINGS

add_shortcode('leagueengine_show_tournament', 'leagueengine_show_tournament');

function leagueengine_show_tournament($atts, $content = null) {
	
	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'tid' => '',
		'display' => 'table',
		'show_groups' => 'show',
		'show_knockout' => 'show',
		'specific_group' => NULL,
		'text_datetime' => __('Date/Time','leagueengine'),
		'text_home' => __('Home Team','leagueengine'),
		'text_away' => __('Away Team','leagueengine'),
		'text_score' => __('Score','leagueengine'),
		'text_round' => __('Round','leagueengine'),
		'text_qfinal' => __('Quarter Final','leagueengine'),
		'text_sfinal' => __('Semi Final','leagueengine'),
		'text_final' => __('Final','leagueengine'),
		'text_last16' => __('Last 16','leagueengine'),
		'text_playoff' => __('Third Place Play-Off','leagueengine'),
	), $atts));

	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_tournament '.$class.'">';

	$tbl = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament_settings = $wpdb->get_row("SELECT * FROM $tbl WHERE data_id = '$tid'");
	
	if($tournament_settings->tournament_type == 'leagueknockout') {
		if(leagueengine_tournament_matches_exist($tid)) {
		if(leagueengine_tournament_teams_exist($tid)) {
			
			if($show_groups == 'show') { ?>
				<div id="show_tournament_groups">
				<?php if(leagueengine_tournament_leagueknockout_count_teams($tid) == $tournament_settings->teams) { ?>	
					<form action="" method="post">
					<?php for ($i = 1; $i <= $tournament_settings->groups; $i++) {
					
							if($specific_group != NULL) {
								$i = $specific_group;
							}
					
							if(leagueengine_tournament_leagueknockout_matches_exist($tid,$i)) {
								$output .= '<div class="label"><h3 class="tm-article-subtitle">'.__('Group','leagueengine').' '.$i.'</h3></div>';
								$output .=  leagueengine_site_group_league_table($tid,$i);
								$matches = leagueengine_tournament_leagueknockout_matches_exist($tid,$i);
								$output .= '<table>';
								$output .= '<tr>';
									$output .= '<th style="width:20%;">'.$text_datetime.'</th>';				
									$output .= '<th style="width:30%;text-align:center;">'.$text_home.'</th>';
									$output .= '<th style="width:20%;text-align:center;">'.$text_score.'</th>';			
									$output .= '<th style="width:30%;text-align:center;">'.$text_away.'</th>';
								$output .= '</tr>';
								$thedate = NULL;
								
								foreach($matches as $match) {
									
								    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
								    if (is_null($thedate) || $thedate !== $match_date) {
								        $output .= '<tr class="date"><td colspan="100%">' . $match_date . '</td></tr>';
								    }
								    
									$match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
								    $output .= '<tr>';
								    	$output .= '<td>'. leagueengine_link('tournament_match&tid='.$tid.'&mid='.$match->id,$match_time) .'</td>';
									    $output .= '<td style="text-align:center;">' . leagueengine_link('team&tid='.$match->home_team_id,leagueengine_fetch_data_from_id($match->home_team_id,'data_value')) . '</td>';
									    $output .= '<td style="text-align:center;">' . leagueengine_link('tournament_match&tid='.$tid.'&mid='.$match->id,$match->home_team_score . ' - ' . $match->away_team_score) . '</td>';    
									    $output .= '<td style="text-align:center;">' . leagueengine_link('team&tid='.$tid.'&tid='.$match->away_team_id,leagueengine_fetch_data_from_id($match->away_team_id,'data_value')) . '</td>';
								    $output .= '</tr>';
								    $thedate = $match_date;
									
								}
								
								$output .=  '</table>';
								$output .=  '<br/>';
								
							}
							
							if($specific_group != NULL) { break; }
							
						} ?>
						</form>
						</div>
					<?php }
				}
			}
		}
	}
	
	if($show_knockout == 'show') {
		if($display == 'bracket') {
			if($tournament_settings->tournament_type == 'knockout') {
			if(leagueengine_tournament_matches_exist($tid)) {
				$num_teams = $tournament_settings->teams;
				$total_rounds = floor(log($num_teams, 2));
				
				if(tournament_max_rounds($tid) == 5) {
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

				$max_rows = $num_teams;
				$team_array = array();
				$unpaired_array = array();
				$score_array = array();
									
				for ($round = 1; $round <= $total_rounds; $round++) {
				    $team_array[$round] = 1;
				    $unpaired_array[$round] = False;
				    $score_array[$round] = False;
				}
				
				$output .= "<table class='leagueengine_tournament_bracket' style='width:100%;table-layout:fixed;'>";
				$output .= "<tr>";
				
				for ($round = 1; $round <= $total_rounds; $round++) {
					if(tournament_max_rounds($tid) == 5) {
						if($round == '5') {
							$getround = $text_final;
						} elseif($round == '4') {
							$getround = $text_playoff;
						} elseif($round == '3') {
							$getround = $text_sfinal;
						} elseif($round == '2') {
							$getround = $text_qfinal;
						} elseif($round == '1') {
							$getround = $text_last16;
						} else { 
							$getround = $text_round.' '.$round;
						}
					} else {
						if($round == $final_round) {
							$getround = $text_final;
						} elseif($round == $sf_round) {
							$getround = $text_sfinal;
						} elseif($round == $qf_round) {
							$getround = $text_qfinal;
						} else { 
							$getround = $text_round.' '.$round;
						}
					}
				    $output .= "<th colspan='2'><strong>".$getround."</strong></th>";
				}
				
				$output .= "</tr>";
								
				for ($match = 1; $match <= $max_rows; $match++) {
								
				    $matchnumber = $match - 1;
				    $output .= "<tr>";
				
				    for ($round = 1; $round <= $total_rounds; $round++) {
				        $score_size = pow(2, $round)-1;
				        if (is_player($round, $match, $team_array[$round])) {
				            $unpaired_array[$round] = !$unpaired_array[$round];
				            $output .= "<td class='match'>".leagueengine_get_tournament_position($tid,$matchnumber)."</td>";
				            $output .= "<td width='20'>&nbsp;</td>";
				            $team_array[$round]++;
				            $score_array[$round] = false;
				        } else {
				            if ($unpaired_array[$round] && $round != $total_rounds) {
				                if (!$score_array[$round]) {
				                    $output .= "<td rowspan='".$score_size."'></td>";
				                    $output .= "<td rowspan='".$score_size."' width='20'></td>";
				                    $score_array[$round] = !$score_array[$round];
				                }
				            } else {
				                $output .= "<td colspan='2'>&nbsp;</td>";
				            }
				        }
								
				    }
				
				    $output .= "</tr>";
				
				}
				
				$output .= "</table>";
				
				}
		} elseif($tournament_settings->tournament_type == 'leagueknockout') {
			if(leagueengine_tournament_matches_exist($tid)) {
				$num_teams = $tournament_settings->koteams;
				$total_rounds = floor(log($num_teams, 2));

				if(tournament_max_rounds($tid) == 5) {
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

				$max_rows = $num_teams;
				$team_array = array();
				$unpaired_array = array();
				$score_array = array();
									
				for ($round = 1; $round <= $total_rounds; $round++) {
				    $team_array[$round] = 1;
				    $unpaired_array[$round] = False;
				    $score_array[$round] = False;
				}
				
				$output .= "<table class='uk-table leagueengine leagueengine_tournament_bracket' style='width:100%;table-layout:fixed;'>";
				$output .= "<tr>";
				
				for ($round = 1; $round <= $total_rounds; $round++) {
					if($round == $final_round) {
						$getround = $text_final;
					} elseif($round == $sf_round) {
						$getround = $text_sfinal;
					} elseif($round == $qf_round) {
						$getround = $text_qfinal;
					} else { 
						$getround = $text_round.' '.$round;
					}
				    $output .= "<th colspan='2'><strong>".$getround."</strong></th>";
				}
				
				$output .= "</tr>";
								
				for ($match = 1; $match <= $max_rows; $match++) {
								
				    $matchnumber = $match - 1;
				    $output .= "<tr>";
				
				    for ($round = 1; $round <= $total_rounds; $round++) {
				        $score_size = pow(2, $round)-1;
				        if (is_player($round, $match, $team_array[$round])) {
				            $unpaired_array[$round] = !$unpaired_array[$round];
				            $output .= "<td class='match'>".leagueengine_get_tournament_position($tid,$matchnumber)."</td>";
				            $output .= "<td width='20'>&nbsp;</td>";
				            $team_array[$round]++;
				            $score_array[$round] = false;
				        } else {
				            if ($unpaired_array[$round] && $round != $total_rounds) {
				                if (!$score_array[$round]) {
				                    $output .= "<td rowspan='".$score_size."'></td>";
				                    $output .= "<td rowspan='".$score_size."' width='20'></td>";
				                    $score_array[$round] = !$score_array[$round];
				                }
				            } else {
				                $output .= "<td colspan='2'>&nbsp;</td>";
				            }
				        }
								
				    }
				
				    $output .= "</tr>";
				
				}
				
				$output .= "</table>";
				
				}			
		}
		
	
		
		} elseif($display == 'table') {
					
			if(leagueengine_tournament_matches_exist($tid)) {
			$matches = leagueengine_tournament_matches_exist($tid);
			$output .= '<table>';
			$output .= '<thead><tr>';
			$output .= '<th style="text-align:center;" width="12%" data-placeholder="">'.$text_round.'</th>';
			$output .= '<th style="text-align:center;" width="38%" data-placeholder="">'.$text_home.'</th>';
			$output .= '<th style="text-align:center;" width="12%" data-placeholder="" class="filter-false">'.$text_score.'</th>';
			$output .= '<th style="text-align:center;" width="38%" data-placeholder="">'.$text_away.'</th>';
			$output .= '</thead></tr>';
			$output .= '<tbody>';
			
			if($tournament_settings->tournament_type == 'knockout') {
				$num_teams = $tournament_settings->teams;
			} elseif($tournament_settings->tournament_type == 'leagueknockout') {
				$num_teams = $tournament_settings->koteams;	
			}
			
			if(tournament_max_rounds($tid) == 5) {
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
			    

						if(tournament_max_rounds($tid) == 5) {
							if($match->round == $final_round) {
								$match_round = $text_final;
							} elseif($match->round == $playoff_round) {
								$match_round = $text_playoff;
							} elseif($match->round == $sf_round) {
								$match_round = $text_sfinal;
							} elseif($match->round == $qf_round) {
								$match_round = $text_qfinal;
							} elseif($match->round == $l16_round) {
								$match_round = $text_last16;
							} else { 
								$match_round = $text_round . ' ' . $match->round;
							}
						} else {
							if($match->round == $final_round) {
								$match_round = $text_final;
							} elseif($match->round == $sf_round) {
								$match_round = $text_sfinal;
							} elseif($match->round == $qf_round) {
								$match_round = $tqfinal;
							} else { 
								$match_round = $text_round . ' ' . $match->round;
							}
						}
				    
				    if (is_null($theround) || $theround !== $match_round) {
				    
				        $output .= '<tr class="date"><td colspan="4">' . $match_round . '</td></tr>';
				    }
						
					$output .= '<tr>';
					$output .= '<td style="text-align:center;vertical-align:middle;">'.leagueengine_link('tournament_match&tid='.$tid.'&mid='.$match->id,date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date)).'<br/>'.date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time))).'</td>';
					$output .= '<td style="text-align:center;vertical-align:middle;">'.leagueengine_link('team&tid='.$match->home_team_id,leagueengine_fetch_data_from_id($match->home_team_id,'data_value')).'</td>';
					
					$output .= '<td style="text-align:center;vertical-align:middle;">' . leagueengine_link('tournament_match&tid='.$tid.'&mid='.$match->id,$match->home_team_score . ' - ' . $match->away_team_score) . '</td>';    
					
					$output .= '<td style="text-align:center;vertical-align:middle;">'.leagueengine_link('team&tid='.$match->away_team_id,leagueengine_fetch_data_from_id($match->away_team_id,'data_value')).'</td>';
					$output .= '</tr>';
					$theround = $match_round;
				}
				$output .= '</tbody>';
				$output .= '</table>';
	
			}
			
		}
	
	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	return $output;
	
}

?>