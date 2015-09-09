jQuery(document).ready(function($) {

	if ($('form#leagueengine_tinymce select.select2').length) { $("form#leagueengine_tinymce select.select2").select2(); }
	if ($('form#leagueengine_tinymce select.select2-nosearch').length) { $("form#leagueengine_tinymce select.select2-nosearch").select2({minimumResultsForSearch: -1}); }

	if ($("form#leagueengine_tinymce .leagueengine_datepicker_start").length) {
		$('form#leagueengine_tinymce .leagueengine_datepicker_start').datepicker({
			dateFormat: leagueengine_date_format,
			altField: "form#leagueengine_tinymce .leagueengine_datepicker_alt_start",
			altFormat: "yy-mm-dd"
		});
	}

	if ($("form#leagueengine_tinymce .leagueengine_datepicker_end").length) {
		$('form#leagueengine_tinymce .leagueengine_datepicker_end').datepicker({
			dateFormat: leagueengine_date_format,
			altField: "form#leagueengine_tinymce .leagueengine_datepicker_alt_end",
			altFormat: "yy-mm-dd"
		});
	}

	if ($("form#leagueengine_tinymce").length) {
	
		$('div.show_league').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_league'] }
		});

		$('div.show_season').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_season'] }
		});

		$('div.show_tournament').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_tournament'] }
		});

		$('div.show_season_table').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_season_table'] }
		});

		$('div.show_season_matches').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_season_matches'] }
		});

		$('div.show_team').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_team'] }
		});

		$('div.show_player').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_player'] }
		});

		$('div.show_season_match').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_season_match'] }
		});

		$('div.show_tournament_match').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_tournament_match'] }
		});
		
		$('div.show_leaderboard').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_leaderboard'] }
		});

		$('div.show_leaderboard_league').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_leaderboard'] },
			'form#leagueengine_tinymce select#show_leaderboard_competition': { values: ['league'] }
		});

		$('div.show_leaderboard_tournament').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_leaderboard'] },
			'form#leagueengine_tinymce select#show_leaderboard_competition': { values: ['tournament'] }
		});

		$('div.show_leaderboard_group_player').dependsOn({
			'form#leagueengine_tinymce select#insert': { values: ['show_leaderboard'] },
			'form#leagueengine_tinymce select#show_leaderboard_group': { values: ['player'] }
		});
		
	}
		
	if ($("select.pick-league").length) {
		$("select.pick-league").change(function() {
			$("select.pick-season").load( leagueengine_url + "/functions/lookup/season_lookup.php?lid=" + $(this).val());
		});
	}
	
	if ($("select.pick-season").length) {
		$("select.pick-season").change(function() {
			$("select.pick-team").load( leagueengine_url + "/functions/lookup/season_team_lookup.php?sid=" + $(this).val());
		});
	}

	if ($("select.pick-league-single").length) {
		$("select.pick-league-single").change(function() {
			$("select.pick-season-single").load( leagueengine_url + "/functions/lookup/season_lookup.php?lid=" + $(this).val());
		});
	}
	
	if ($("select.pick-season-single").length) {
		$("select.pick-season-single").change(function() {
			$("select.pick-season-match-single").load( leagueengine_url + "/functions/lookup/season_match_lookup.php?lid=" + $("select.pick-league-single").select2('val') + "&sid=" + $(this).val());
		});
	}

	if ($("select.pick-tournament").length) {
		$("select.pick-tournament").change(function() {
			$("select.pick-tournament-match").load( leagueengine_url + "/functions/lookup/tournament_match_lookup.php?tid=" + $(this).val());
		});
	}
	
});