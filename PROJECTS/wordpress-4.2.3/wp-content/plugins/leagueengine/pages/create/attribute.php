<tr class="create_attribute" style="display:none;">
	<td><?php _e('Attribute Name','leagueengine'); ?></td>
	<td><input type="text" name="attribute_name"></td>
</tr>

<tr class="create_attribute" style="display:none;">
	<td><?php _e('Target','leagueengine'); ?></td>
	<td>
		<select id="attribute_assign" name="attribute_assign" class="select2-nosearch">
			<option value="season_match"><?php _e('League Matches','leagueengine'); ?></option>
			<option value="tournament_match"><?php _e('Tournament Matches','leagueengine'); ?></option>
			<option value="team"><?php _e('Teams','leagueengine'); ?></option>
			<option value="player"><?php _e('Players','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_attribute" style="display:none;">
	<td><?php _e('Format','leagueengine'); ?></td>
	<td>
		<select name="attribute_type" class="select2-nosearch">
			<option value="text"><?php _e('Text','leagueengine'); ?></option>
			<option value="hyperlink"><?php _e('Hyperlink','leagueengine'); ?></option>
			<option value="date"><?php _e('Date','leagueengine'); ?></option>
			<option value="time"><?php _e('Time','leagueengine'); ?></option>
			<option value="colour"><?php _e('Colour','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_attribute" style="display:none;">
	<td><?php _e('Sort Order','leagueengine'); ?></td>
	<td><input type="text" name="attribute_sort_order"></td>
</tr>


<tr class="create_statistic" style="display:none;">
	<td><?php _e('Statistic Name','leagueengine'); ?></td>
	<td><input type="text" name="statistic_name"></td>
</tr>

<tr class="create_statistic" style="display:none;">
	<td><?php _e('Target','leagueengine'); ?></td>
	<td>
		<select id="statistic_assign" name="statistic_assign" class="select2-nosearch">
			<option value="season_match"><?php _e('League Matches','leagueengine'); ?></option>
			<option value="tournament_match"><?php _e('Tournament Matches','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_statistic" style="display:none;">
	<td><?php _e('Sort Order','leagueengine'); ?></td>
	<td><input type="text" name="statistic_sort_order"></td>
</tr>