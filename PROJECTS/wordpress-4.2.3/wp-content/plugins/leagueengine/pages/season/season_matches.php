<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_GET["pagenumber"])) { $pagenumber = $_GET["pagenumber"]; } else { $pagenumber = 1; }; 
	$pagination = ($pagenumber - 1) * leagueengine_fetch_settings('pagination');
	$league_id = $_GET['lid'];
	$season_id = $_GET['sid'];
	$season = leagueengine_fetch_data_row('season',$season_id);
	if(isset($_POST['save_season_matches'])) { leagueengine_save_season_matches($league_id,$season_id,$_POST['season_match_id'],$_POST['home_team_id'],$_POST['home_team_score'],$_POST['away_team_id'],$_POST['away_team_score']); }
	if(isset($_POST['add_match_to_season'])) { leagueengine_add_match_to_season($league_id,$season_id,$_POST['date_alt'],$_POST['time_alt'],$_POST['home_team'],$_POST['away_team']); }
	if(isset($_POST['generate_season'])) { leagueengine_generate_season($league_id,$season_id,$_POST['start_date_alt'],$_POST['generate_time'],$_POST['interval'],$_POST['interval_type'],$_POST['repeat'],$_POST['shuffle']); }
	if(isset($_POST['delete_all_matches'])) { leagueengine_delete_all_season_matches($league_id,$season_id); }
	if(isset($_POST['delete_season_match'])) { leagueengine_delete_match_from_season($league_id,$season_id,$_POST['match_id']); $msg = '<div class="success">'.__('Success!','leagueengine').'</div>'; }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_league&id=<?php echo $league_id; ?>"><?php echo leagueengine_fetch_data_from_id($league_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><a href="admin.php?page=leagueengine_season&lid=<?php echo $league_id; ?>&sid=<?php echo $season_id; ?>"><?php echo leagueengine_fetch_data_from_id($season_id,'data_value'); ?></a> <span class="divider">/</span></li>
			<li><?php _e('Matches','leagueengine');?></li>
		</ul>

		<h2 class="form_title"><?php echo $season->data_value; ?></h2>
		<?php echo leagueengine_admin_menu('season_matches'); ?>
		
		<?php echo leagueengine_season_matches_table($league_id,$season_id,$page,$pagination,true); ?>
		
	</div>

</div>