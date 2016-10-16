<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['save_settings'])) { leagueengine_save_settings('display'); }
?>

<div id="leagueengine_admin" class="<?php echo $page; ?>">

	<?php echo leagueengine_admin_header(); ?>
	
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		<h2 class="form_title"><?php _e('Settings','leagueengine'); ?></h2>
		<?php echo leagueengine_admin_menu('settings'); ?>

		<form action="" method="POST">
		<table class="form">
			<tr>
				<td><?php _e('LeagueEngine Theme','leagueengine'); ?></td>
				<td>
					<select class="select2" name="theme">
					<?php
					$path = LEAGUEENGINE_DIRPATH . '/functions/themes/';
					$dirs = array_filter(glob($path.'*'), 'is_dir');
					foreach($dirs as $dir) {
						$theme = substr( $dir, strrpos( $dir, '/' )+1 );
						if(leagueengine_fetch_settings('theme') == $theme) {
							echo '<option value="'.$theme.'" selected="selected">'.$theme.'</option>';
						} else {
							echo '<option value="'.$theme.'">'.$theme.'</option>';
						}					
					}
					?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('LeagueEngine Page','leagueengine'); ?></td>
				<td>
					
					<select class="select2" name="redirect"> 
						<option value=""><?php _e('Choose Page','leagueengine');?>...</option> 
						<?php 
						$pages = get_pages(); 
						
						foreach ( $pages as $page ) {
						if(leagueengine_fetch_settings('redirect') == rtrim(get_permalink($page->ID))) { $selected = ' selected="selected"'; } else { $selected = ''; }
						$option = '<option'.$selected.' value="' . $page->ID . '">';
						$option .= $page->post_title;
						$option .= '</option>';
						echo $option;
						}
						?>
					</select>
					
				</td>
			</tr>
			<tr>
				<td><?php _e('WordPress Theme Page Template','leagueengine'); ?></td>
				<td>
					<select class="select2" name="template"> 
						<option value=""><?php _e('Choose page','leagueengine');?>...</option> 
						<?php 
						$templates = get_page_templates(); 
						foreach ( $templates as $template_name => $template_filename ) {
						if(leagueengine_fetch_settings('template') == rtrim($template_filename)) { $selected = ' selected="selected"'; } else { $selected = ''; }
						$option = '<option'.$selected.' value="' . $template_filename . '">';
						$option .= $template_name;
						$option .= '</option>';
						echo $option;
						}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Load Default LeagueEngine CSS','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="auto_style">
					<option value="1"<?php if(leagueengine_fetch_settings('auto_style') == '1') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
					<option value="0"<?php if(leagueengine_fetch_settings('auto_style') == '0') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Automatic Linking','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="automatic_links">
					<option value="on"<?php if(leagueengine_fetch_settings('automatic_links') == 'on') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
					<option value="off"<?php if(leagueengine_fetch_settings('automatic_links') == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Team Logos In Tables','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="table_logo">
					<option value="on"<?php if(leagueengine_fetch_settings('table_logo') == 'on') { echo ' selected="selected"'; } ?>><?php _e('On','leagueengine');?></option>
					<option value="off"<?php if(leagueengine_fetch_settings('table_logo') == 'off') { echo ' selected="selected"'; } ?>><?php _e('Off','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Match Events Order','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="site_match_events_order">
					<option value="ASC"<?php if(leagueengine_fetch_settings('site_match_events_order') == 'ASC') { echo ' selected="selected"'; } ?>><?php _e('Ascending','leagueengine');?></option>
					<option value="DESC"<?php if(leagueengine_fetch_settings('site_match_events_order') == 'DESC') { echo ' selected="selected"'; } ?>><?php _e('Descending','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Match Events Images','leagueengine'); ?></td>
				<td>
				<select class="select2-nosearch" name="site_match_events_image">
					<option value="on"<?php if(leagueengine_fetch_settings('site_match_events_image') == 'on') { echo ' selected="selected"'; } ?>><?php _e('Show','leagueengine');?></option>
					<option value="off"<?php if(leagueengine_fetch_settings('site_match_events_image') == 'off') { echo ' selected="selected"'; } ?>><?php _e('Hide','leagueengine');?></option>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php _e('Match Statistics Colour','leagueengine'); ?></td>
				<td><input type="text" name="site_match_statistics_bg" class="leagueengine_colour_picker" value="<?php echo leagueengine_fetch_settings('site_match_statistics_bg'); ?>"></td>
			</tr>
			<tr>
				<td><?php _e('Form Matches','leagueengine'); ?></td>
				<td><input type="text" name="form_count" value="<?php echo leagueengine_fetch_settings('form_count'); ?>"></td>
			</tr>
		</table>
		
		<input style="margin-top:20px;" type="submit" name="save_settings" class="button-primary" value="<?php _e('Save','leagueengine'); ?>" />
		
		</form>		
	
	</div>

</div>