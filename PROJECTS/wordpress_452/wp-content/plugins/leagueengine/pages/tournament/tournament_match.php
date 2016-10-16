<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$tournament_id = $_GET['tid'];
	$match_id = $_GET['mid'];
	$league_type = leagueengine_fetch_data_from_id($tournament_id,'league_type');

	if(isset($_POST['home_team_bonus']) or isset($_POST['away_team_bonus'])) {
		if(isset($_POST['save_tournament_match'])) { leagueengine_save_tournament_match($tournament_id,$match_id,$_POST['date_alt'],$_POST['time_alt'],$_POST['home_team_id'],$_POST['away_team_id'],$_POST['home_team_score'],$_POST['away_team_score'],$_POST['home_team_bonus'],$_POST['away_team_bonus']); }	
	} else {
		if(isset($_POST['save_tournament_match'])) { leagueengine_save_tournament_match($tournament_id,$match_id,$_POST['date_alt'],$_POST['time_alt'],$_POST['home_team_id'],$_POST['away_team_id'],$_POST['home_team_score'],$_POST['away_team_score']); }
	}
	
	if(isset($_POST['save_attributes'])) { leagueengine_save_attribute_values('tournament_match',NULL,NULL,$match_id,NULL,NULL,$tournament_id); }

	if(isset($_POST['add_event_to_match'])) { error_reporting(0); leagueengine_add_event_to_tournament_match($tournament_id,$match_id,$_POST['new_event_id'],$_POST['new_event_time'],$_POST['timeline_text'],$_POST['new_event_count'],$_POST['new_event_player_id']); error_reporting(1); }
	if(isset($_POST['save_events'])) { leagueengine_save_event_times('tournament_match',$_POST['event_time_id'],$_POST['event_time'],$_POST['event_text']); }
	
	if(isset($_POST['save_tournament_match_lineups'])) {
		if(isset($_POST['homeplayers'])) { $homeplayers = $_POST['homeplayers']; } else { $homeplayers = ''; }
		if(isset($_POST['awayplayers'])) { $awayplayers = $_POST['awayplayers']; } else { $awayplayers = ''; }
		if(isset($_POST['homesubs'])) { $homesubs = $_POST['homesubs']; } else { $homesubs = ''; }
		if(isset($_POST['awaysubs'])) { $awaysubs = $_POST['awaysubs']; } else { $awaysubs = ''; }
		leagueengine_save_tournament_match_lineups($tournament_id,$match_id,$homeplayers,$awayplayers,$homesubs,$awaysubs);
	}
	if(isset($_POST['delete_events'])) { leagueengine_delete_data('tournament_match_event',$_POST['delete_id'],'tournament',NULL,NULL,$tournament_id,$match_id); }
	
	if(isset($_POST['save_match_statistics'])) { leagueengine_save_tournament_match_statistics($tournament_id,$match_id,$_POST['tournament_match_statistic'],$_POST['home_value'],$_POST['away_value'],$_POST['att_type']); }

	if(isset($_POST['save_tournament_match_preview'])) { leagueengine_save_tournament_match_preview($tournament_id,$match_id,stripslashes_deep($_POST['preview'])); }
	if(isset($_POST['save_tournament_match_report'])) { leagueengine_save_tournament_match_report($tournament_id,$match_id,stripslashes_deep($_POST['report'])); }

	$table = $wpdb->prefix . 'leagueengine_tournament_matches';
	$match = $wpdb->get_row("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND id = '$match_id'");
	$home_team_id = $match->home_team_id;
	$away_team_id = $match->away_team_id;
	$tournament = leagueengine_fetch_data_row('tournament',$tournament_id);
	$table2 = $wpdb->prefix . 'leagueengine_tournaments';
	$tournament_row = $wpdb->get_row("SELECT * FROM $table2 WHERE data_id = '$tournament_id'");

?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>

	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_tournament&id=<?php echo $tournament_id; ?>"><?php echo leagueengine_fetch_data_from_id($tournament_id,'data_value') ?></a> <span class="divider">/</span></li>
			<?php if($match->round == 'GROUP') { ?>
				<li><a href="admin.php?page=leagueengine_tournament_teams&id=<?php echo $tournament_id; ?>"><?php _e('Groups','leagueengine');?></a> <span class="divider">/</span></li>
			<?php } else { ?>
				<li><a href="admin.php?page=leagueengine_tournament_knockout&id=<?php echo $tournament_id; ?>"><?php _e('Knockout','leagueengine');?></a> <span class="divider">/</span></li>
			<?php } ?>
			<li><?php _e('Match','leagueengine');?></li>
		</ul>
		
		<?php
			if($league_type == 'players') {
				$home_emblem = leagueengine_fetch_player_emblem($match->home_team_id,20);
				$away_emblem = leagueengine_fetch_player_emblem($match->away_team_id,20,'right');
			} else {
				$home_emblem = leagueengine_fetch_team_emblem($match->home_team_id,20);
				$away_emblem = leagueengine_fetch_team_emblem($match->away_team_id,20,'right');
			}
		?>
		
		<div class="match_masthead">
		<table>
			<tr>
				<td class="home_team" style="border-top: 5px solid <?php echo leagueengine_fetch_team_colour($match->home_team_id,'primary');?>; text-align:left;width:40%;"><?php echo $home_emblem . leagueengine_fetch_data_from_id($match->home_team_id,'data_value');?></td>
				<td class="score" style="text-align:center;width:20%;"><span><?php echo $match->home_team_score;?> &dash; <?php echo $match->away_team_score;?></span></td>
				<td class="away_team" style="border-top: 5px solid <?php echo leagueengine_fetch_team_colour($match->away_team_id,'primary');?>; text-align:right;width:40%;"><?php echo leagueengine_fetch_data_from_id($match->away_team_id,'data_value') . $away_emblem;?></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;"><?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date)) . ' ' . date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time)); ?></td>
			</tr>
			<tr>
				<td class="competition" colspan="3" style="text-align:center;"><?php echo '<a href="admin.php?page=leagueengine_tournament&id='.$tournament_id.'">' . leagueengine_fetch_data_from_id($tournament_id,'data_value') . '</a>'; ?></td>
			</tr>
			
			<tr><td colspan="100%" style="text-align:center;padding-bottom:20px;"><?php echo leagueengine_link('tournament_match&tid='.$tournament_id.'&mid='.$match->id,__('Go To Match','leagueengine'),'','','button-primary'); ?></td></tr>
			
		</table>
		</div>

		<div id="leagueengine_tabs">
		<ul>
		<li><a href="#score"><?php _e('Score','leagueengine');?></a></li>
		<li><a href="#preview"><?php _e('Preview','leagueengine');?></a></li>
		<?php if(leagueengine_attributes_exists('tournament_match')) { echo '<li><a href="#attributes">' . __('Attributes','leagueengine') . '</a></li>'; } ?>
		<?php
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$away_team_id'");
			if($homeplayers or $awayplayers && $league_type != 'players') {
		?>
		<li><a href="#lineups"><?php _e('Lineups','leagueengine');?></a></li>
		<?php } ?>
		<?php if(leagueengine_data_exists('event')) { echo '<li><a href="#events">' . __('Events','leagueengine') . '</a></li>'; } ?>
		<?php if(leagueengine_statistics_exists('tournament_match')) { echo '<li><a href="#statistics">' . __('Statistics','leagueengine') . '</a></li>'; } ?>
		<?php if(leagueengine_h2h_history($match->match_date,$home_team_id,$away_team_id)) { echo '<li><a href="#history">' . __('History','leagueengine') . '</a></li>'; } ?>
		<li><a href="#report"><?php _e('Report','leagueengine');?></a></li>
		</ul>
		
		<div id="score">

			<form action="" method="POST">
	
			<table class="form">
				<tr>
					<th style="width:20%;"><?php _e('Date/Time','leagueengine');?></th>
					<th style="width:30%;text-align:center;"><?php _e('Home','leagueengine');?></th>
					<th style="width:20%;text-align:center;"><?php _e('Score','leagueengine');?></th>
					<th style="width:30%;text-align:center;"><?php _e('Away','leagueengine');?></th>
				</tr>
				<tr class="date">
					<td><input type="text" class="leagueengine_datepicker" name="match_date" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime($match->match_date));?>"></td>
					<td colspan="3"></td>
				</tr>
			    
			    <input type="hidden" name="tournament_match_id" value="<?php echo $match->id;?>">
			    <input type="hidden" name="home_team_id" value="<?php echo $match->home_team_id;?>">
			    <input type="hidden" name="away_team_id" value="<?php echo $match->away_team_id;?>">
			    <input type="hidden" name="date_alt" class="leagueengine_datepicker_alt" value="<?php echo $match->match_date;?>">
			    <input type="hidden" name="time_alt" class="leagueengine_timepicker_alt" value="<?php echo $match->match_time;?>">
			    
			    <tr>
			    <td><input type="text" class="leagueengine_timepicker" name="match_time" value="<?php echo date(leagueengine_fetch_settings('time_format_php'),strtotime($match->match_time));?>"></td>
			    <td style="text-align:center;"><?php echo leagueengine_fetch_data_from_id($match->home_team_id,'data_value') ;?></td>
		    	<td style="text-align:center;">
			    	<input style="width:48%;text-align:center;" type="text" name="home_team_score" value="<?php echo $match->home_team_score;?>">
			    	<input style="width:48%;text-align:center;" type="text" name="away_team_score" value="<?php echo $match->away_team_score;?>"> 
		    	</td>		    
			    <td style="text-align:center;"><?php echo leagueengine_fetch_data_from_id($match->away_team_id,'data_value') ;?></td>
			    </tr>
			    
			    <?php if($tournament_row->pts_bonus == 'on') { ?>
			    
			    <tr>
			    <td></td>
			    <td style="text-align:center;"><?php _e('Bonus Points','leagueengine');?></td>
		    	<td style="text-align:center;">
			    	<input style="width:48%;text-align:center;" type="text" name="home_team_bonus" value="<?php echo $match->home_team_bonus;?>">
			    	<input style="width:48%;text-align:center;" type="text" name="away_team_bonus" value="<?php echo $match->away_team_bonus;?>"> 
		    	</td>		    
			    <td style="text-align:center;"><?php _e('Bonus Points','leagueengine');?></td>
			    </tr>		    
			    
			    <?php } ?>
			    
			</table>
			<input style="margin-top:20px;" type="submit" name="save_tournament_match" class="button-primary" value="<?php _e('Save','leagueengine');?>" />
			</form>

		
		</div>
		
		<div id="preview">	
			<form action="" method="post">
				<div class="setting">
				
				<input class="countdown" type="hidden" value="<?php echo $match->match_date . ' ' .$match->match_time; ?>">
				
				<table class="form">
					<tr>
						<th><?php _e('Match Preview','leagueengine');?></th>
						<?php if (strtotime($match->match_date . ' ' .$match->match_time) > time()) { ?>
						<th class="countdown" style="text-align:right;"><?php _e('Match Countdown: ','leagueengine');?> <span></span></th>
						<?php } else { ?>
						<?php } ?>
					</tr>
				</table>
				<?php wp_editor( stripslashes_deep($match->preview), 'match_preview', array( 'media_buttons' => true, 'tinymce' => true, 'quicktags' => true, 'textarea_rows' => 20 )); ?>
				</div>
				<input style="margin-top:20px;" type="submit" name="save_tournament_match_preview" class="button-primary" value="<?php _e('Save','leagueengine'); ?>">
			</form>
		</div>		
		
		<?php if(leagueengine_attributes_exists('tournament_match')) { ?>
			<div id="attributes">	
				<?php echo leagueengine_fetch_attributes('tournament_match',true,true);?>	
			</div>
		<?php } ?>

		<?php
			$table = $wpdb->prefix . 'leagueengine_player_careers';	
			$homeplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND team_id = '$home_team_id'");
			$awayplayers = $wpdb->get_results("SELECT * FROM $table WHERE tournament_id = '$tournament_id' AND  team_id = '$away_team_id'");
			if($homeplayers or $awayplayers && $league_type != 'players') {
		?>
		<div id="lineups">
			<?php echo leagueengine_tournament_match_lineups($tournament_id,$match_id);?>			
		</div>
		<?php } ?>
		
		<?php if(leagueengine_data_exists('event')) { ?>
			<div id="events">
				<?php echo leagueengine_tournament_match_events($tournament_id,$match_id);?>			
			</div>
		<?php } ?>	
		
		<?php if(leagueengine_statistics_exists('tournament_match')) { ?>
		<div id="statistics">	
			<?php echo leagueengine_fetch_statistics('tournament_match',NULL,NULL,$tournament_id,$match_id);?>	
		</div>
		<?php } ?>

		<?php if(leagueengine_h2h_history($match->match_date,$home_team_id,$away_team_id)) { ?>
		<div id="history">	
			<?php echo leagueengine_fetch_h2h_history($match->match_date,$home_team_id,$away_team_id);?>	
		</div>
		<?php } ?>
		
		<div id="report">	
			<form action="" method="post">
				<div class="setting">
				<table class="form">
					<tr><th><?php _e('Match Report','leagueengine');?></th></tr>
				</table>
				<?php wp_editor( stripslashes_deep($match->report), 'match_report', array( 'media_buttons' => true, 'tinymce' => true, 'quicktags' => true, 'textarea_rows' => 20 )); ?>
				</div>
				<input style="margin-top:20px;" type="submit" name="save_tournament_match_report" class="button-primary" value="<?php _e('Save','leagueengine'); ?>">
			</form>
		</div>
		
		</div>	

		</div>		

	</div>

</div>