<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$event_id = $_GET['id'];

	if(isset($_POST['save'])) { leagueengine_save_event($event_id,$_POST['event_name'],$_POST['event_abbreviation'],$_POST['event_image'],$_POST['event_plural'],$_POST['event_sort_order']); }

	$table = $wpdb->prefix . 'leagueengine_data';
	$event = $wpdb->get_row("SELECT * FROM $table WHERE id = '$event_id'");
	$event_row = leagueengine_fetch_data_row('event',$event_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
	
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=events"><?php _e('Events','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $event->data_value; ?></li>
		</ul>

		<h2 class="form_title"><?php echo leagueengine_fetch_data_from_id($event_id,'data_value'); ?></h2>
		<form action="" method="POST">
		<table class="form">
		
			<tr class="create_event">
				<td><?php _e('Name','leagueengine'); ?></td>
				<td><input type="text" name="event_name" value="<?php echo $event->data_value;?>"></td>
			</tr>
			
			<tr class="create_event">
				<td><?php _e('Abbreviation','leagueengine'); ?></td>
				<td><input type="text" name="event_abbreviation" maxlength="3" style="text-transform:uppercase;" value="<?php echo $event->data_abbreviation;?>"></td>
			</tr>
						
			<tr class="create_event">
				<td><?php _e('Plural','leagueengine'); ?></td>
				<td><input type="text" name="event_plural" value="<?php echo $event->data_plural;?>"></td>
			</tr>
			
			<tr class="create_event">
				<td><?php _e('Image','leagueengine') ;?></td>
				<td>
					<input style="width:367px;" id="event" type="text" name="event_image" value="<?php echo $event->image;?>" />
					<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />		
				</td>
			</tr>
			
			<tr class="create_event">
				<td><?php _e('Sort Order','leagueengine'); ?></td>
				<td><input type="text" name="event_sort_order" value="<?php echo $event->sort_order;?>" /></td>
			</tr>
						
		</table>
		
			<input style="margin-top:20px" type="submit" name="save" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		

		</div>		

	</div>

</div>