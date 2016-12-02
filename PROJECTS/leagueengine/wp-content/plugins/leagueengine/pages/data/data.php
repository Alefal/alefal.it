<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_GET['data'])) { 
		$data = $_GET['data'];
	} else {
		$data = $_GET['data_type'];
	}

	// UPDATE DATA VARIABLE
	if($data == 'competition') { $data = 'competitions'; }
	elseif($data == 'teams') { $data = 'team'; }
	elseif($data == 'players') { $data = 'player'; }
	elseif($data == 'attributes') { $data = 'attribute'; }
	elseif($data == 'statistics') { $data = 'statistic'; }
	elseif($data == 'events') { $data = 'event'; }
	
?>

<div id="leagueengine_admin" class="<?php echo $data; ?>">
	<?php echo leagueengine_admin_header(); ?>
	<div id="leagueengine_admin_content">
	
		<?php
			if($msg) { echo $msg; }
			$count = leagueengine_fetch_data($data);
			if($count) {
				
				// FETCH CLASS
				if($data == 'competitions') { $leagueengine_data_table = new leagueengine_data_table_competitions(); }
				elseif($data == 'team') { $leagueengine_data_table = new leagueengine_data_table_teams(); }
				elseif($data == 'player') { $leagueengine_data_table = new leagueengine_data_table_players(); }
				elseif($data == 'attribute') { $leagueengine_data_table = new leagueengine_data_table_attributes(); }
				elseif($data == 'statistic') { $leagueengine_data_table = new leagueengine_data_table_statistics(); }
				elseif($data == 'event') { $leagueengine_data_table = new leagueengine_data_table_events(); }
				
				// START FORM
				echo '<form id="leagueengine_competitions" method="get">';
				
				// SET TITLE
				if($data == 'competitions') { echo '<h2 class="form_title">'.__('Competitions','leagueengine').'</h2>'; }
				elseif($data == 'team') { echo '<h2 class="form_title">'.__('Teams','leagueengine').'</h2>'; }
				elseif($data == 'player') { echo '<h2 class="form_title">'.__('Players','leagueengine').'</h2>'; }
				elseif($data == 'attribute') { echo '<h2 class="form_title">'.__('Attributes','leagueengine').'</h2>'; }
				elseif($data == 'statistic') { echo '<h2 class="form_title">'.__('Statistics','leagueengine').'</h2>'; }
				elseif($data == 'event') { echo '<h2 class="form_title">'.__('Events','leagueengine').'</h2>'; }				
			
				if($data == 'competitions') { $data = 'competition'; }
				echo '<a class="button-primary addCompetition" href="admin.php?page=leagueengine_create&default='. $data .'" >'. __('New','leagueengine') . ' ' . ucfirst($data) . '</a>';
							
				// CHECK FOR SEARCH
				if(isset($_GET['s'])) { echo $leagueengine_data_table->prepare_items($_GET['s']); } 
				else { echo $leagueengine_data_table->prepare_items(); }
				
				echo '<input type="hidden" name="data_type" value="' . $data . '" />';
				echo '<input type="hidden" name="page" value="' . $_REQUEST['page'] . '" />';
				echo $leagueengine_data_table->search_box('search', 'name');
				echo $leagueengine_data_table->display();
				echo '</form>';
					
			} else {
				// NO RESULTS	
			}
		?>
	</div>
</div>