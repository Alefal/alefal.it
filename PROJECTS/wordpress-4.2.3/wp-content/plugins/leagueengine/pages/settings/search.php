<?php
	global $wpdb;
	$results = '';
	if(isset($_POST['search'])) {
		$query = $_POST['search'];
		$table = $wpdb->prefix . 'leagueengine_data';
		$results = $wpdb->get_results("SELECT * FROM $table WHERE data_value LIKE '%$query%'");
		$countresults = $wpdb->get_var("SELECT COUNT(id) FROM $table WHERE data_value LIKE '%$query%'");
	}
	$page = $_GET['page'];
	if(isset($_POST['search'])) { $query = $_POST['search']; } else { $query = ''; }
	if(isset($_GET["pagenumber"])) { $pagenumber = $_GET["pagenumber"]; } else { $pagenumber = 1; }; 
	$pagination = ($pagenumber - 1) * leagueengine_fetch_settings('pagination');
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<h2 class="form_title"><?php _e('Search','leagueengine'); ?></h2>
		
		<form action="admin.php?page=leagueengine_search" method="POST">
		<table class="form"<?php if($results) { echo ' style="margin-bottom:20px;"'; } ?>>
			<tr><td>
				<input type="text" name="search" autocomplete="off" value="<?php echo $query; ?>">
			</td></tr>
		</table>
		</form>
		
		<?php
			if(isset($_POST['search'])) {
				$output = '';
				$pagination_rows = $countresults;
				$pagination_pages = ceil($pagination_rows / leagueengine_fetch_settings('pagination_search'));
				if($results) {
					$output .= '<form action="" method="POST">';	
					$output .= '<table class="form">';	
					$output .= '<tr>';
					$output .= '<th style="width:50%;">' . __('Result','leagueengine') . '</th>';
					$output .= '<th style="width:50%;">' . __('Type','leagueengine') . '</th>';
					$output .= '</tr>';
					foreach($results as $result) {
					
					if($result->data_type == 'event' or $result->data_type == 'attribute') {
						$output .= '<tr>';
						$output .= '<td><a href="admin.php?page=leagueengine_'.$result->data_type.'&id='.$result->id.'">' . $result->data_value . '</a></td>';
						$output .= '<td>' . ucfirst($result->data_type) . '</td>';
						$output .= '</tr>';				
					} elseif($result->data_type == 'season') {
						$output .= '<tr>';
						$output .= '<td><a href="admin.php?page=leagueengine_'.$result->data_type.'&lid=' . leagueengine_fetch_league_from_season($result->id,'id') . '&sid=' . $result->id . '">' . $result->data_value . '</a> - <a href="admin.php?page=leagueengine_'.$result->data_type.'_table&lid=' . leagueengine_fetch_league_from_season($result->id,'id') . '&sid=' . $result->id . '">' . __('Table','leagueengine') . '</a> - <a href="admin.php?page=leagueengine_'.$result->data_type.'_matches&lid=' . leagueengine_fetch_league_from_season($result->id,'id') . '&sid=' . $result->id . '">' . __('Matches','leagueengine') . '</a></td>';
						$output .= '<td>' . ucfirst($result->data_type) . '</td>';
						$output .= '</tr>';			
					} else {
						$output .= '<tr>';
						$output .= '<td><a href="admin.php?page=leagueengine_'.$result->data_type.'&id=' . $result->id . '">' . $result->data_value . '</a></td>';
						$output .= '<td>' . ucfirst($result->data_type) . '</td>';
						$output .= '</tr>';				
					}
								
					}
					$output .= '</table>';
					
					if($pagination_pages > 1) {
						$output .= '<div id="leagueengine_admin_pagination">';
						for ($i=1; $i<=$pagination_pages; $i++) {
							if($i == $pagenumber) {
								$output .= "<a class='active' href='admin.php?page=leagueengine_search&pagenumber=".$i."'>".$i."</a> ";	
							} else {
								$output .= "<a href='admin.php?page=leagueengine_search&pagenumber=".$i."'>".$i."</a> ";
							} 
						};
						$output .= '</div>';
					}
					
				}
			
				echo $output;
			}
			
		?>
		
		
	
	</div>

</div>