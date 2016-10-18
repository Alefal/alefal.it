<?php
	global $wpdb;
	$page = $_GET['page'];
?>

<?php if(leagueengine_tables_check() == FALSE) { ?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">
	
	<div id="leagueengine_admin_content">
		<h3><?php _e('LeagueEngine','leagueengine'); ?></h3>
		<p><?php _e('Database tables do not exist. Please re-install the plugin.','leagueengine');?></p>
	
<?php } else { ?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		
			<div class="leagueengine_panel welcome">
			<h3><?php _e('Welcome to','leagueengine'); ?> LeagueEngine</h3>
			<p class="sub"><?php _e('Here are some links to help you get started','leagueengine'); ?></p>
			<div class="panel-column">
			<h4><div class="dashicons dashicons-edit"></div> <?php _e('Create','leagueengine'); ?></h4>
			<ul>
			<li><a href="admin.php?page=leagueengine_create&default=competition"><?php _e('New Competition','leagueengine'); ?></a></li>
			<li><a href="admin.php?page=leagueengine_create&default=team"><?php _e('New Team','leagueengine'); ?></a></li>
			<li><a href="admin.php?page=leagueengine_create&default=player"><?php _e('New Player','leagueengine'); ?></a></li>
			</ul>
			</div>
			<div class="panel-column">
			<h4><div class="dashicons dashicons-admin-tools"></div> <?php _e('Settings','leagueengine'); ?></h4>
			<ul>
			<li><a href="admin.php?page=leagueengine_settings"><?php _e('Dashboard','leagueengine'); ?></a></li>
			<li><a href="admin.php?page=leagueengine_settings_datetime"><?php _e('Date/Time','leagueengine'); ?></a></li>
			<li><a href="admin.php?page=leagueengine_import"><?php _e('Import Data','leagueengine'); ?></a></li>
			</ul>
			</div>
			<div class="panel-column welcome-panel-last">	
			<h4><div class="dashicons dashicons-sos"></div> <?php _e('Support','leagueengine'); ?></h4>
			<ul>
			<li><a target="_blank" target="_blank" href="http://2dmonkey.com/docs/leagueengine/quick_start/"><?php _e('Getting Started','leagueengine'); ?></a></li>
			<li><a target="_blank" href="http://2dmonkey.com/docs/leagueengine/"><?php _e('Documentation','leagueengine'); ?></a></li>
			<li><a target="_blank" href="http://2dmonkey.com/forum"><?php _e('Support Forum','leagueengine'); ?></a></li>
			</ul>
			</div>
			<div class="panel-column welcome-panel-last">	
			<h4><div class="dashicons dashicons-wordpress-alt"></div> <?php _e('System','leagueengine'); ?></h4>
			<ul>
			<li>WordPress v<?php echo get_bloginfo('version'); ?></li>
			<li>LeagueEngine v<?php echo leagueengine_version(); ?></li>
			<li>PHP <?php echo PHP_VERSION; ?> / MYSQL <?php //echo mysql_get_server_info(); ?></li>
			</ul>
			</div>
			</div>
		
		<?php if(leagueengine_fetch_settings('dashboard_matches') != 'off') {
				
			$limit = leagueengine_fetch_settings('dashboard_matches');
			$table = $wpdb->prefix . 'leagueengine_season_matches';
			$table2 = $wpdb->prefix . 'leagueengine_tournament_matches';
			
			$today = date("Y-m-d");
			$today_time = date("g:i:s");
			
			$matches = $wpdb->get_results("SELECT * FROM $table WHERE match_date > '$today' AND match_time > '$today_time' ORDER BY match_date ASC, match_time ASC LIMIT $limit");
			$matches2 = $wpdb->get_results("SELECT * FROM $table2 WHERE match_date > '$today' AND match_time > '$today_time' ORDER BY match_date ASC, match_time ASC, round ASC LIMIT $limit");
					
			$output = '';
			
			$output .= '<div style="float:left;clear:both;margin-top:20px;"></div>';
			
			if($matches) {
				
				$output .= '<h2 class="form_title">'.__('Upcoming League Matches','leagueengine').'</h2>';
				
				$output .= '<table class="form">';
				$output .= '<tr>';
				$output .= '<th style="width:15%;">'.__('Date/Time','leagueengine').'</th>';
				$output .= '<th style="width:25%;">'.__('Competition','leagueengine').'</th>';
				$output .= '<th style="width:25%;text-align:center;">'.__('Home','leagueengine').'</th>';
				$output .= '<th style="width:10%;text-align:center;">'.__('Score','leagueengine').'</th>';
				$output .= '<th style="width:25%;text-align:center;">'.__('Away','leagueengine').'</th>';
				$output .= '</tr>';
				$date = NULL;			
				foreach ($matches as $match) {	
				
					$league_id = $match->league_id;
					$season_id = $match->season_id;
					$league_type = leagueengine_fetch_data_from_id($league_id,'league_type');
				
				    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
				    $match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
				    if (is_null($date) || $date !== $match_date) {
				        $output .= '<tr class="date"><td colspan="5">' . $match_date . '</td></tr>';
				    }
				    
				    $output .= '<tr>';
				    $output .= '<td><a href="admin.php?page=leagueengine_season_match&lid='.$league_id.'&sid='.$season_id.'&mid='.$match->id.'">' . $match_time . '</a></td>';
				    $output .= '<td><a href="admin.php?page=leagueengine_league&id='.$league_id.'">' . leagueengine_fetch_data_from_id($league_id,'data_value') . '</a> &dash; <a href="admin.php?page=leagueengine_season_table&lid='.$league_id.'&sid='.$season_id.'">' . leagueengine_fetch_data_from_id($season_id,'data_value') . '</a></td>';
				    
				    if($league_type == 'players') {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_player&id='.$match->home_team_id.'">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</a></td>';   
				    } else {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_team&id='.$match->home_team_id.'">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</a></td>';
				    }
				    
				    $output .= '<td style="text-align:center;">' . $match->home_team_score . ' - ' . $match->away_team_score . '</td>';    
				    		    
				    if($league_type == 'players') {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_player&id='.$match->away_team_id.'">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</a></td>';   
				    } else {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_team&id='.$match->away_team_id.'">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</a></td>';
				    }				   
				    $output .= '</tr>';
				
				    $date = $match_date;
				}
				$output .= '</table>';
				
			}

			if($matches && $matches2) {
				$output .= '<div style="clear:both;margin-bottom:20px;"></div>';
			}

			if($matches2) {
				
				$output .= '<h2 class="form_title">'.__('Upcoming Tournament Matches','leagueengine').'</h2>';
				
				$output .= '<table class="form">';
				$output .= '<tr>';
				$output .= '<th style="width:15%;">'.__('Date/Time','leagueengine').'</th>';
				$output .= '<th style="width:25%;">'.__('Competition','leagueengine').'</th>';
				$output .= '<th style="width:25%;text-align:center;">'.__('Home','leagueengine').'</th>';
				$output .= '<th style="width:10%;text-align:center;">'.__('Score','leagueengine').'</th>';
				$output .= '<th style="width:25%;text-align:center;">'.__('Away','leagueengine').'</th>';
				$output .= '</tr>';
				$date = NULL;			
				foreach ($matches2 as $match) {
				
					$tournament_id = $match->tournament_id;
					$league_type = leagueengine_fetch_data_from_id($tournament_id,'league_type');
					
				    $match_date = date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));
				    $match_time = date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));
				    if (is_null($date) || $date !== $match_date) {
				        $output .= '<tr class="date"><td colspan="5">' . $match_date . '</td></tr>';
				    }
				    
				    $output .= '<tr>';
				    $output .= '<td><a href="admin.php?page=leagueengine_season_match&lid='.$league_id.'&sid='.$season_id.'&mid='.$match->id.'">' . $match_time . '</a></td>';
				    $output .= '<td><a href="admin.php?page=leagueengine_tournament&id='.$tournament_id.'">' . leagueengine_fetch_data_from_id($tournament_id,'data_value') . '</a></td>';

				    if($league_type == 'players') {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_player&id='.$match->home_team_id.'">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</a></td>';   
				    } else {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_team&id='.$match->home_team_id.'">' . leagueengine_fetch_data_from_id($match->home_team_id,'data_value') . '</a></td>';
				    }
				    				    
				    $output .= '<td style="text-align:center;">' . $match->home_team_score . ' - ' . $match->away_team_score . '</td>';    
				    		    
				    if($league_type == 'players') {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_player&id='.$match->away_team_id.'">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</a></td>';   
				    } else {
					 	$output .= '<td style="text-align:center;"><a href="admin.php?page=leagueengine_team&id='.$match->away_team_i.'">' . leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . '</a></td>';
				    }
				    
				    $output .= '</tr>';
				
				    $date = $match_date;
				}
				$output .= '</table>';
				
			}
			
			echo $output;
			
		}
		?>
	
<?php } ?>
	
	</div>
</div>