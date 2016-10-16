<tr class="create_team" style="display:none;">
	<td><?php _e('Team Name','leagueengine') ;?></td>
	<td><input autocomplete="off" name="team_name" type="text"></td>
</tr>

<tr class="create_team" style="display:none;">
	<td><?php _e('Team Primary Colour','leagueengine') ;?></td>
	<td><input autocomplete="off" class="leagueengine_colour_picker" name="team_colour" type="text"></td>
</tr>

<tr class="create_team" style="display:none;">
	<td><?php _e('Team Secondary Colour','leagueengine') ;?></td>
	<td><input autocomplete="off" class="leagueengine_colour_picker" name="team_colour_secondary" type="text"></td>
</tr>

<tr class="create_team" style="display:none;">
	<td><?php _e('Nickname','leagueengine') ;?></td>
	<td><input autocomplete="off" name="team_nickname" type="text"></td>
</tr>

<tr class="create_team" style="display:none;">
	<td><?php _e('Logo','leagueengine') ;?></td>
	<td>
		<input style="width:367px;" id="team" type="text" name="team_logo" value="" />
		<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />		
	</td>
</tr>

<tr class="create_team" style="display:none;">
	<td><?php _e('Add team to existing competition','leagueengine'); ?></td>
	<td>
		<select name="add_team_to_competition" id="add_team_to_competition" class="select2">
			<option value="0"><?php _e('No','leagueengine'); ?></option>
			<option value="1"><?php _e('Yes','leagueengine'); ?></option>
		</select>	
	</td>
</tr>

<tr class="add_team_to_competition" style="display:none;">
	<td><?php _e('Competition Type','leagueengine'); ?></td>
	<td>
		<select name="new_team_competition_type" id="new_team_competition_type" class="select2-nosearch">
			<option value="league"><?php _e('League','leagueengine'); ?></option>
			<!--<option value="tournament"><?php _e('Tournament','leagueengine'); ?></option>-->
		</select>
	</td>
</tr>

<tr class="add_team_to_league" style="display:none;">
	<td><?php _e('League','leagueengine'); ?></td>
	<td>
		<select name="new_team_league" class="pick-league select2">
			<?php
				$leagues = leagueengine_data_exists('league');
				echo '<option value=""></option>';
				foreach($leagues as $league) {
					echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
				} ?>
		</select>	
	</td>
</tr>

<tr class="add_team_to_league" style="display:none;">
	<td><?php _e('Season','leagueengine'); ?></td>
	<td>
		<select name="new_team_season" class="pick-season select2"></select>
	</td>
</tr>

<tr class="add_team_to_tournament" style="display:none;">
	<td><?php _e('Tournament','leagueengine'); ?></td>
	<td>
	<select name="new_team_tournament" id="pick-tournament" class="select2">
		<?php
			$tournaments = leagueengine_data_exists('tournament');
			echo '<option value=""></option>';
			foreach($tournaments as $tournament) {
				echo '<option value="'.$tournament->id.'">'.leagueengine_fetch_data_from_id($tournament->id,'data_value').'</option>';
			} ?>
	</select>
	</td>
</tr>