<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['sync_tables'])) { leagueengine_sync_season_tables(); }
	if(isset($_POST['wipe_tables'])) { leagueengine_wipe('tables'); }
	if(isset($_POST['wipe_data'])) { leagueengine_wipe('all'); }
?>

<?php if(leagueengine_tables_check() == FALSE) { ?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">
	
	<div id="leagueengine_admin_content">
		<h3><?php _e('LeagueEngine','leagueengine'); ?></h3>
		<p><?php _e('Database tables do not exist. Please re-install the plugin.','leagueengine');?></p>
	
<?php } else { ?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('System','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>
			<form action="" method="POST">
			<table class="form" style="margin-bottom:40px;">
				<tr>
					<td><?php _e('Multi Site','leagueengine');?></td>
					<td><?php echo is_multisite() ? 'Yes' . "\n" : 'No'; ?></td>
				</tr>
				<tr>
					<td><?php _e('Site URL','leagueengine');?></td>
					<td><?php echo site_url(); ?></td>
				</tr>
				<tr>
					<td><?php _e('Home URL','leagueengine');?></td>
					<td><?php echo home_url(); ?></td>
				</tr>
				<tr>
					<td><?php _e('PHP Version','leagueengine');?></td>
					<td><?php echo PHP_VERSION; ?></td>
				</tr>
				<tr>
					<td><?php _e('MySQL Version','leagueengine');?></td>
					<td><?php echo mysql_get_server_info(); ?></td>
				</tr>
				<tr>
					<td><?php _e('LeagueEngine Version','leagueengine');?></td>
					<td><?php echo leagueengine_version(); ?></td>
				</tr>
				<tr>
					<td><?php _e('WordPress Version','leagueengine');?></td>
					<td><?php echo get_bloginfo('version'); ?></td>
				</tr>
				<tr>
					<td><?php _e('Web Server Information','leagueengine');?></td>
					<td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
				</tr>
				<tr>
					<td><?php _e('PHP Memory Limit','leagueengine');?></td>
					<td><?php echo ini_get('memory_limit'); ?></td>
				</tr>
				<tr>
					<td><?php _e('PHP Post Max Size','leagueengine');?></td>
					<td><?php echo ini_get('post_max_size'); ?></td>
				</tr>
				<tr>
					<td><?php _e('WordPress Debug','leagueengine');?></td>
					<td><?php echo defined('WP_DEBUG') ? WP_DEBUG ? 'Enabled' : 'Disabled' : 'Not set'; ?></td>
				</tr>
				<tr>
					<td><?php _e('WordPress Table Prefix','leagueengine');?></td>
					<td><?php global $wpdb; echo $wpdb->prefix; ?></td>
				</tr>
				<tr>
					<td><?php _e('Active Theme','leagueengine');?></td>
					<td>
					<?php
							if ( get_bloginfo('version') < '3.4' ) {
								$theme_data = get_theme_data(get_stylesheet_directory() . '/style.css');
								echo $theme_data['Name'] . ': ' . $theme_data['Version'];
							} else {
								$theme_data = wp_get_theme();
								echo $theme_data->Name . ': ' . $theme_data->Version;
							}
						?>
					</td>
				</tr>
				<tr>
					<td valign="top"><?php _e('Active Plugins','leagueengine');?></td>
					<td>
						<?php
						$plugins = get_plugins();
						$active_plugins = get_option('active_plugins', array());
						
						foreach ( $plugins as $plugin_path => $plugin ):
						
							//If the plugin isn't active, don't show it.
							if ( !in_array($plugin_path, $active_plugins) )
								continue;
						?>
							<?php echo $plugin['Name']; ?>: <?php echo $plugin['Version']; ?><br/>
						<?php endforeach; ?>
					</td>
				</tr>

			<tr>
				<td><?php _e('Re-Synchronise Tables','leagueengine'); ?></td>
				<td><input type="submit" name="sync_tables" class="button" value="<?php _e('Re-Synchronise Tables','leagueengine'); ?>" style="margin:0;" onclick="return confirm('Are you sure?');"></td>
			</tr>
			<tr>
				<td><?php _e('Wipe Database Tables','leagueengine'); ?></td>
				<td><input type="submit" name="wipe_tables" class="button" value="<?php _e('Wipe Database Tables','leagueengine'); ?>" style="margin:0;" onclick="return confirm('Are you sure?');"></td>
			</tr>
			<tr>
				<td><?php _e('Wipe Tables And Data','leagueengine'); ?></td>
				<td><input type="submit" name="wipe_data" class="button" value="<?php _e('Wipe Tables And Data','leagueengine'); ?>" style="margin:0;" onclick="return confirm('Are you sure?');"></td>
			</tr>
		</table>
			
		</form>	

<?php } ?>

	</div>
</div>