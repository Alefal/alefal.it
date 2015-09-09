<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$league_id = $_GET['id'];
	if(isset($_GET["pagenumber"])) { $pagenumber = $_GET["pagenumber"]; } else { $pagenumber = 1; }; 
	if(isset($_POST['new_data'])) { leagueengine_new_data('season',$_POST['data_value'],$league_id); }
	if(isset($_POST['delete']) && isset($_POST['delete_id'])) { leagueengine_delete_data('season',$_POST['delete_id'],NULL,$league_id); }
	if(isset($_POST['save_league'])) { leagueengine_save_league($league_id); }
	$pagination = ($pagenumber - 1) * leagueengine_fetch_settings('pagination');
	$table = $wpdb->prefix . 'leagueengine_leagues';
	$league = leagueengine_fetch_data_row('league',$league_id);
	$league_row = $wpdb->get_row("SELECT * FROM $table WHERE data_id = '$league_id'");

?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">

		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=competitions"><?php _e('Competitions','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $league->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo $league->data_value; ?></h2>

		<form action="" method="POST" style="margin-bottom:20px;">

		<table class="form">
			<tr>
				<td><?php _e('League Name','leagueengine');?></td>
				<td><input type="text" name="league_name" value="<?php echo $league->data_value; ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Start Date','leagueengine');?></td>
				<td>
					<input type="text" name="leaguestart_date" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime($league_row->start_date)); ?>">
					<input type="hidden" name="date_alt" class="leagueengine_datepicker_alt" value="<?php echo $league_row->start_date; ?>">
				</td>
			</tr>
		</table>
		
		<input style="margin:20px 0 0" type="submit" name="save_league" class="button-primary" value="<?php _e('Save','leagueengine');?>" />
		
		</form>
		
		<?php
			$count = leagueengine_fetch_data('season');
			if($count) {
				
				// FETCH CLASS
				$leagueengine_data_table = new leagueengine_data_table_seasons();
				
				// START FORM
				echo '<form id="leagueengine_seasons" method="get">';
				
				echo '<h2 class="form_title">'.__('Seasons','leagueengine').'</h2>';				
			
				echo '<a class="button-primary" href="admin.php?page=leagueengine_create&default=competition&new_season=true&lid='.$league_id.'">'. __('New Season','leagueengine') .'</a>';
							
				// CHECK FOR SEARCH
				if(isset($_GET['s'])) { echo $leagueengine_data_table->prepare_items($league_id,$_GET['s']); } 
				else { echo $leagueengine_data_table->prepare_items($league_id); }
				
				echo '<input type="hidden" name="data_type" value="league" />';
				echo '<input type="hidden" name="id" value="'.$league_id.'" />';
				echo '<input type="hidden" name="page" value="' . $_REQUEST['page'] . '" />';
				echo $leagueengine_data_table->search_box('search', 'name');
				echo $leagueengine_data_table->display();
				echo '</form>';
					
			} else {
				echo '<a style="float:left;clear:both;margin:0;" class="button-primary" href="admin.php?page=leagueengine_create&default=competition&new_season=true&lid='.$league_id.'">'. __('New Season','leagueengine') .'</a></h2>';	
			}
		?>

	</div>

</div>