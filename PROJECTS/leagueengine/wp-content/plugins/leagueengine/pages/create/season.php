<tr class="create_season" style="display:none;">
	<td><?php _e('League','leagueengine'); ?></td>
	<td>
		<select name="season_league" id="league_season" class="select2">
			<?php
				$leagues = leagueengine_data_exists('league');
				echo '<option value=""></option>';
				foreach($leagues as $league) {
					echo '<option value="'.$league->id.'">'.leagueengine_fetch_data_from_id($league->id,'data_value').'</option>';
				} ?>
		</select>	
	</td>
</tr>

<tr class="create_season" style="display:none;">
	<td><?php _e('Season Name','leagueengine'); ?></td>
	<td><input type="text" id="season_name" name="season_name"></td>
</tr>

<tr class="create_season" style="display:none;">
	<td><?php _e('Start Date','leagueengine'); ?></td>
	<td>
		<input type="text" name="" class="leagueengine_datepicker" value="<?php echo date(leagueengine_fetch_settings('date_format_php'),strtotime(date("Y-m-d"))); ?>">
		<input type="hidden" name="season_start_date" class="leagueengine_datepicker_alt" value="<?php echo date("Y-m-d"); ?>">
	</td>
</tr>