<?php
	global $wpdb;
	global $msg;
	$page = $_GET['page'];
	$player_id = $_GET['id'];

	if(isset($_POST['save_attributes'])) { leagueengine_save_attribute_values('player',NULL,NULL,NULL,NULL,$player_id); }

	$table = $wpdb->prefix . 'leagueengine_data';
	$player = $wpdb->get_row("SELECT * FROM $table WHERE id = '$player_id'");
	$player_row = leagueengine_fetch_data_row('team',$player_id);
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
	
		<?php if($msg) { echo $msg; } ?>

		<ul class="breadcrumbs">
			<li><a href="admin.php?page=leagueengine_data&data=players"><?php _e('Players','leagueengine');?></a> <span class="divider">/</span></li>
			<li><?php echo $player->data_value; ?></li>
		</ul>	

		<h2 class="form_title"><?php echo leagueengine_fetch_player_emblem($player_id,30) . leagueengine_fetch_data_from_id($player_id,'data_value'); ?></h2>			

		<?php echo leagueengine_admin_menu('player'); ?>

				<form action="" method="POST">

				<table class="form">
					<tr>
						<td><?php _e('Player Name','leagueengine'); ?></td>
						<td><input type="text" name="name" value="<?php echo $player->data_value; ?>"></td>
					</tr>

					<tr>
						<td><?php _e('Photo','leagueengine'); ?></td>
						<td>		
							<input style="width:367px" id="upload1" type="text" name="image" value="<?php echo $player->image; ?>" />
							<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />
						</td>
					</tr>
					
					<tr>
						<td><?php _e('Squad Number','leagueengine'); ?></td>
						<td><input type="text" name="player_squad_number" value="<?php echo $player->squad_number; ?>"></td>
					</tr>
					
					<tr>
						<td><?php _e('Sort Order','leagueengine'); ?></td>
						<td><input type="text" name="sort_order" value="<?php echo $player->sort_order; ?>"></td>
					</tr>

					<tr>
						<td><?php _e('WordPress User','leagueengine'); ?></td>
						<?php if($player->wp_user) { $user_info = get_userdata($player->wp_user); ?>
							<td><input type="text" name="wp_user" value="<?php echo $user_info->user_login; ?>" class="wp_user_lookup"><input type="hidden" name="wp_user_id" class="wp_user_lookup_id" value="<?php echo $player->wp_user;?>" /></td>
						<?php } else { ?>
							<td><input type="text" name="wp_user" value="" class="wp_user_lookup"><input type="hidden" name="wp_user_id" class="wp_user_lookup_id" value="" /></td>
						<?php } ?>
					</tr>

					<?php echo leagueengine_fetch_attributes('player',true,true,false);?>
					
				</table>
					<input style="margin-top:20px;" type="submit" name="save_attributes" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
				</form>	
			
			</div>

	</div>

</div>