<tr class="create_player" style="display:none;">
	<td><?php _e('Player Name','leagueengine'); ?></td>
	<td><input type="text" name="player_name"></td>
</tr>

<tr class="create_player" style="display:none;">
	<td><?php _e('Photo','leagueengine') ;?></td>
	<td>
		<input style="width:367px;" id="player" type="text" name="player_photo" value="" />
		<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />		
	</td>
</tr>

<tr class="create_player" style="display:none;">
	<td><?php _e('Squad Number','leagueengine'); ?></td>
	<td><input type="text" name="player_squad_number"></td>
</tr>

<tr class="create_player" style="display:none;">
	<td><?php _e('Sort Order','leagueengine'); ?></td>
	<td><input type="text" name="player_sort_order"></td>
</tr>

<tr class="create_player" style="display:none;">
	<td><?php _e('WordPress User','leagueengine'); ?></td>
	<td><input type="text" name="wp_user"></td>
</tr>

<tr class="create_player" style="display:none;">
	<td><?php _e('Add player to existing team','leagueengine'); ?></td>
	<td>
		<select name="add_player_to_team" id="add_player_to_team" class="select2">
			<option value="0"><?php _e('No','leagueengine'); ?></option>
			<option value="1"><?php _e('Yes','leagueengine'); ?></option>
		</select>	
	</td>
</tr>

<tr class="add_player_to_team" style="display:none;">
	<td><?php _e('League','leagueengine'); ?></td>
	<td>
		<select name="new_player_league" class="pick-league select2">
			<?php
				$leagues = leagueengine_data_exists('league');
				echo '<option value=""></option>';
				foreach($leagues as $league) {
					echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
				} ?>
		</select>	
	</td>
</tr>

<tr class="add_player_to_team" style="display:none;">
	<td><?php _e('Season','leagueengine'); ?></td>
	<td>
		<select name="new_player_season" class="pick-season select2"></select>
	</td>
</tr>

<tr class="add_player_to_team" style="display:none;">
	<td><?php _e('Team','leagueengine'); ?></td>
	<td>
		<select name="new_player_team" class="pick-team select2"></select>
	</td>
</tr>