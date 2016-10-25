<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$team_id = $_GET['id'];

	if(isset($_POST['save_attributes'])) { leagueengine_save_attribute_values('team',NULL,NULL,NULL,$team_id); }

	$table = $wpdb->prefix . 'leagueengine_data';
	$team = $wpdb->get_row("SELECT * FROM $table WHERE id = '$team_id'");
	$team_row = leagueengine_fetch_data_row('team',$team_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
	
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=teams"><?php _e('Teams','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $team->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo leagueengine_fetch_team_emblem($team_id,30) . leagueengine_fetch_data_from_id($team_id,'data_value'); ?></h2>
		<form action="" method="POST">
		<table class="form">
			<tr>
				<td><?php _e('Team Name','leagueengine'); ?></td>
				<td><input type="text" name="name" value="<?php echo $team->data_value; ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Primary Colour','leagueengine'); ?></td>
				<td><input type="text" name="colour" value="<?php echo $team->colour; ?>" class="leagueengine_colour_picker"></td>
			</tr>
			<tr>
				<td><?php _e('Secondary Colour','leagueengine'); ?></td>
				<td><input type="text" name="colour_secondary" value="<?php echo $team->colour_secondary; ?>" class="leagueengine_colour_picker"></td>
			</tr>
			<tr>
				<td><?php _e('Nickname','leagueengine'); ?></td>
				<td><input type="text" name="nickname" value="<?php echo $team->nickname; ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Logo','leagueengine'); ?></td>
				<td>
				<input style="width:367px" id="upload1" type="text" name="image" value="<?php echo $team->image; ?>" />
				<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />				
				</td>
			</tr>
			
			<?php echo leagueengine_fetch_attributes('team',true,true,false);?>
						
		</table>
		
			<input style="margin-top:20px" type="submit" name="save_attributes" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		

		</div>		

	</div>

</div>