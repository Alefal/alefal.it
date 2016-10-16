<?php
	global $msg;
	$page = $_GET['page'];
	if(isset($_POST['default'])) {
		$default = $_POST['default'];
	} elseif(isset($_GET['default'])) {
		$default = $_GET['default'];
	} else {
		$default = 'competition';
	}
	if(isset($_GET['lid'])) {
		$lid = $_GET['lid'];
	} else {
		$lid = NULL;
	}
	if(isset($_POST['leagueengine_create'])) { leagueengine_create(); }
?>

<div id="leagueengine_admin" class="create">
	<?php echo leagueengine_admin_header(); ?>
	<div id="leagueengine_admin_content">
		<?php if($msg) { echo $msg; } ?>
		
		<h2 class="form_title"><?php _e('Create','leagueengine'); ?></h2>	
	
		<form class="create" action="" method="POST">
			<input type="hidden" name="default" id="default" value="<?php echo $default; ?>">
			<input type="hidden" name="lid" id="lid" value="<?php echo $lid; ?>">
			<table class="form" style="margin-bottom:20px;">
		
				<tr>
					<td><?php _e('What do you want to create?','leagueengine'); ?></td>
					<td>
						<select name="create_type" id="data" class="select2-nosearch">
							<option value="competition"><?php _e('Competition','leagueengine'); ?></option>
							<option value="team"><?php _e('Team','leagueengine'); ?></option>
							<option value="player"><?php _e('Player','leagueengine'); ?></option>
							<option value="attribute"><?php _e('Attribute','leagueengine'); ?></option>
							<option value="statistic"><?php _e('Statistic','leagueengine'); ?></option>
							<option value="event"><?php _e('Event','leagueengine'); ?></option>
						</select>
					</td>
				</tr>

				<tr class="create_competition" style="display:none;">
					<td><?php _e('Competition Type','leagueengine'); ?></td>
					<td>
						<select name="competition_type" id="competition_type" class="select2-nosearch">
							<option value="league"><?php _e('League','leagueengine'); ?></option>
							<option value="season"><?php _e('Season','leagueengine'); ?></option>
							<option value="tournament"><?php _e('Tournament','leagueengine'); ?></option>
						</select>
					</td>
				</tr>

				<?php
					include('league.php');
					include('season.php');
					include('tournament.php');
					include('team.php');
					include('player.php');
					include('attribute.php');
					include('event.php');
				?>

			</table>
			
			<input type="submit" name="leagueengine_create" class="button-primary" value="<?php _e('Create','leagueengine'); ?>">
			
		</form>
				
		
	</div>
</div>