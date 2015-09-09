<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$attribute_id = $_GET['id'];

	if(isset($_POST['save'])) { leagueengine_save_statistic($attribute_id,$_POST['statistic_sort_order'],$_POST['attribute_name'],$_POST['attribute_assign']); }

	$table = $wpdb->prefix . 'leagueengine_data';
	$attribute = $wpdb->get_row("SELECT * FROM $table WHERE id = '$attribute_id'");
	$attribute_row = leagueengine_fetch_data_row('attribute',$attribute_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
	
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=statistics"><?php _e('Statistics','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $attribute->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo leagueengine_fetch_data_from_id($attribute_id,'data_value'); ?></h2>
		<form action="" method="POST">
		<table class="form">
		
		<tr class="create_attribute">
			<td><?php _e('Statistic Name','leagueengine'); ?></td>
			<td><input type="text" name="attribute_name" value="<?php echo $attribute->data_value;?>"></td>
		</tr>

		<tr class="create_attribute">
			<td><?php _e('Target','leagueengine'); ?></td>
			<td>
				<select id="attribute_assign" name="attribute_assign" class="select2-nosearch">
					<option<?php if($attribute->data_assign == 'season_match') { echo ' selected="selected"'; } ?> value="season_match"><?php _e('League Matches','leagueengine'); ?></option>
					<option<?php if($attribute->data_assign == 'tournament_match') { echo ' selected="selected"'; } ?> value="tournament_match"><?php _e('Tournament Matches','leagueengine'); ?></option>
				</select>
			</td>
		</tr>	
		
		<tr class="create_attribute">
			<td><?php _e('Sort Order','leagueengine'); ?></td>
			<td><input type="text" name="statistic_sort_order" value="<?php echo $attribute->sort_order;?>"></td>
		</tr>
		
		</table>
		
			<input style="margin-top:20px" type="submit" name="save" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		

		</div>		

	</div>

</div>