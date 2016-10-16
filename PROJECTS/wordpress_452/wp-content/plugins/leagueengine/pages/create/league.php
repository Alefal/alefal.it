<tr class="create_league" style="display:none;">
	<td><?php _e('League Type','leagueengine'); ?></td>
	<td>
		<select name="league_type" class="select2-nosearch">
			<option value="teams"><?php _e('Team vs Team','leagueengine'); ?></option>
			<option value="players"><?php _e('Player vs Player','leagueengine'); ?></option>
			<option value="all-teams"><?php _e('All vs All (Teams)','leagueengine'); ?></option>
			<option value="all-players"><?php _e('All vs All (Players)','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_league" style="display:none;">
	<td><?php _e('League Name','leagueengine'); ?></td>
	<td><input type="text" name="league_name"></td>
</tr>

<tr class="create_league" style="display:none;">
	<td><?php _e('Start Date','leagueengine'); ?></td>
	<td>
		<input type="text" name="" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
		<input type="hidden" name="league_start_date" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
	</td>
</tr>

<tr class="create_league" style="display:none;">
	<td><?php _e('First Season Name','leagueengine'); ?></td>
	<td><input type="text" name="new_league_season_name"></td>
</tr>

<tr class="create_league" style="display:none;">
	<td><?php _e('First Season Start Date','leagueengine'); ?></td>
	<td>
		<input type="text" name="" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
		<input type="hidden" name="new_league_season_start_date" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
	</td>
</tr>