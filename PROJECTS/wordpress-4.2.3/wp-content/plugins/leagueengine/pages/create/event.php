<tr class="create_event" style="display:none;">
	<td><?php _e('Event Name','leagueengine'); ?></td>
	<td><input type="text" name="event_name"></td>
</tr>

<tr class="create_event" style="display:none;">
	<td><?php _e('Abbreviation','leagueengine'); ?></td>
	<td><input type="text" name="event_abbreviation" maxlength="3" style="text-transform:uppercase;"></td>
</tr>

<tr class="create_event" style="display:none;">
	<td><?php _e('Plural','leagueengine'); ?></td>
	<td><input type="text" name="event_plural"></td>
</tr>

<tr class="create_event" style="display:none;">
	<td><?php _e('Image','leagueengine') ;?></td>
	<td>
		<input style="width:367px;" id="event" type="text" name="event_image" value="" />
		<input style="margin:0;" class="button upload_image_button" type="button" value="<?php _e('Browse','leagueengine');?>" />		
	</td>
</tr>

<tr class="create_event" style="display:none;">
	<td><?php _e('Sort Order','leagueengine'); ?></td>
	<td><input type="text" name="event_sort_order"></td>
</tr>