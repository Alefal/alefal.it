<tr class="create_tournament" style="display:none;">
	<td><?php _e('Tournament type','leagueengine'); ?></td>
	<td>
		<select name="tournament_team_type" class="select2-nosearch">
			<option value="teams"><?php _e('Team vs Team','leagueengine'); ?></option>
			<option value="players"><?php _e('Player vs Player','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_tournament" style="display:none;">
	<td><?php _e('Tournament Name','leagueengine'); ?></td>
	<td><input name="tournament_name" type="text"></td>
</tr>

<tr class="create_tournament" style="display:none;">
	<td><?php _e('Start Date','leagueengine'); ?></td>
	<td>
		<input type="text" name="" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
		<input type="hidden" name="tournament_start_date" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
	</td>
</tr>

<tr class="create_tournament" style="display:none;">
	<td><?php _e('Type','leagueengine'); ?></td>
	<td>
		<select name="tournament_type" id="tournament_type" class="select2-nosearch">
			<option value="knockout"><?php _e('Knockout','leagueengine'); ?></option>
			<option value="leagueknockout"><?php _e('League/Knockout','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="create_tournament" style="display:none;">
	<td><?php _e('Teams','leagueengine'); ?></td>
	<td>
		<select name="tournament_teams" class="select2-nosearch">
			<option value="4">4</option>
			<option value="8">8</option>
			<option value="16">16</option>
			<option value="32">32</option>
		</select>
	</td>
</tr>

<tr class="leagueknockout" style="display:none;">
	<td><?php _e('Groups','leagueengine'); ?></td>
	<td>
		<select name="tournament_groups" class="select2-nosearch">
			<option value="2x2">2 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 2 <?php _e('Teams','leagueengine'); ?></option>
			<option value="2x4">2 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 4 <?php _e('Teams','leagueengine'); ?></option>
			<option value="4x2">4 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 2 <?php _e('Teams','leagueengine'); ?></option>
			<option value="2x8">2 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 8 <?php _e('Teams','leagueengine'); ?></option>
			<option value="4x4">4 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 4 <?php _e('Teams','leagueengine'); ?></option>
			<option value="2x16">2 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 16 <?php _e('Teams','leagueengine'); ?></option>
			<option value="4x8">4 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 8 <?php _e('Teams','leagueengine'); ?></option>
			<option value="8x4">8 <?php _e('Groups','leagueengine'); ?> <?php _e('x','leagueengine'); ?> 4 <?php _e('Teams','leagueengine'); ?></option>
		</select>
	</td>
</tr>

<tr class="leagueknockout" style="display:none;">
	<td><?php _e('Qualifiers Per Group','leagueengine'); ?></td>
	<td>
		<select name="tournament_qualifiers" class="select2-nosearch">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="4">4</option>
		</select>
	</td>
</tr>