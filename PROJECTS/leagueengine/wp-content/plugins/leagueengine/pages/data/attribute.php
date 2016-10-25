<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$attribute_id = $_GET['id'];

	if(isset($_POST['save'])) { leagueengine_save_attribute($attribute_id,$_POST['attribute_sort_order'],$_POST['attribute_name'],$_POST['attribute_type'],$_POST['attribute_assign']); }

	$table = $wpdb->prefix . 'leagueengine_data';
	$attribute = $wpdb->get_row("SELECT * FROM $table WHERE id = '$attribute_id'");
	$attribute_row = leagueengine_fetch_data_row('attribute',$attribute_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
	
		<?php if($msg) { echo $msg; } ?>
		
		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=attributes"><?php _e('Attributes','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $attribute->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo leagueengine_fetch_data_from_id($attribute_id,'data_value'); ?></h2>
		<form action="" method="POST">
		<table class="form">
		
		<tr class="create_attribute">
			<td><?php _e('Attribute Name','leagueengine'); ?></td>
			<td><input type="text" name="attribute_name" value="<?php echo $attribute->data_value;?>"></td>
		</tr>

		<tr class="create_attribute">
			<td><?php _e('Target','leagueengine'); ?></td>
			<td>
				<select id="attribute_assign" name="attribute_assign" class="select2-nosearch">
					<option<?php if($attribute->data_assign == 'season_match') { echo ' selected="selected"'; } ?> value="season_match"><?php _e('League Matches','leagueengine'); ?></option>
					<option<?php if($attribute->data_assign == 'tournament_match') { echo ' selected="selected"'; } ?> value="tournament_match"><?php _e('Tournament Matches','leagueengine'); ?></option>
					<option<?php if($attribute->data_assign == 'team') { echo ' selected="selected"'; } ?> value="team"><?php _e('Teams','leagueengine'); ?></option>
					<option<?php if($attribute->data_assign == 'player') { echo ' selected="selected"'; } ?> value="player"><?php _e('Players','leagueengine'); ?></option>
				</select>
			</td>
		</tr>
		
		<tr class="create_attribute">
			<td><?php _e('Format','leagueengine'); ?></td>
			<td>
				<select name="attribute_type" class="select2-nosearch">
					<option<?php if($attribute->att_type == 'text') { echo ' selected="selected"'; } ?> value="text"><?php _e('Text','leagueengine'); ?></option>
					<option<?php if($attribute->att_type == 'hyperlink') { echo ' selected="selected"'; } ?> value="hyperlink"><?php _e('Hyperlink','leagueengine'); ?></option>
					<option<?php if($attribute->att_type == 'date') { echo ' selected="selected"'; } ?> value="date"><?php _e('Date','leagueengine'); ?></option>
					<option<?php if($attribute->att_type == 'time') { echo ' selected="selected"'; } ?> value="time"><?php _e('Time','leagueengine'); ?></option>
					<option<?php if($attribute->att_type == 'colour') { echo ' selected="selected"'; } ?> value="colour"><?php _e('Colour','leagueengine'); ?></option>
				</select>
			</td>
		</tr>
		
		<tr class="create_attribute">
			<td><?php _e('Sort Order','leagueengine'); ?></td>
			<td><input type="text" name="attribute_sort_order" value="<?php echo $attribute->sort_order;?>"></td>
		</tr>
						
		</table>
		
			<input style="margin-top:20px" type="submit" name="save" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		

		</div>		

	</div>

</div>