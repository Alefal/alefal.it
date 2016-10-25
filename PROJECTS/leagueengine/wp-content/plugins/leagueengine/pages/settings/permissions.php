<?php
	global $msg;
	$page = $_GET['page'];
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
		<h2 class="form_title"><?php _e('Permissions','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>

		<?php
			$all_users = get_users();
			$specific_users = array();
			foreach($all_users as $user){
			
			    if($user->has_cap('leagueengine')){
			        $specific_users[] = $user;
			    }
			
			}
			if(count($specific_users) > 0) {
				echo '<p style="clear:both;">' . __('Users with access to LeagueEngine:','leagueengine') . '</p>';
				echo '<table class="form" style="width:100%;table-layout:fixed;">';
				echo '<tr>';
					echo '<th>'.__('User','leagueengine').'</th>';
					echo '<th>'.__('Role','leagueengine').'</th>';
				echo '</tr>';
				foreach($specific_users as $specific_user) {
					echo '<tr><td><a href="'.get_edit_user_link($specific_user->ID).'">'.$specific_user->display_name.'</a></td>';
					echo '<td>';
					if(count($specific_user->roles) > 1) {
						foreach($specific_user->roles as $role) {
							echo $role . ', ';
						}						
					} else {
						foreach($specific_user->roles as $role) {
							echo $role;
						}
					}
					echo '</td></tr>';
				}
				echo '</table>';
			}
		?>	
			
<?php } ?>

	</div>
</div>