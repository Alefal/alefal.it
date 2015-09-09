jQuery(document).ready(function($) {
	
	if ($("#leagueengine_admin .success").length) {
		$('#leagueengine_admin  .success').delay(5000).slideToggle(100);
	}
	
	if ($("#leagueengine_admin .error").length) {	
		$('#leagueengine_admin .error').delay(5000).slideToggle(100);
	}
	
	if ($("#leagueengine_admin #leagueengine_tabs").length) {	
		var index = 'key';
		var dataStore = window.sessionStorage;
		try {
			var oldIndex = dataStore.getItem(index);
		} catch(e) {
			var oldIndex = 0;
		}
		$( "#leagueengine_admin #leagueengine_tabs").tabs({
	        active : oldIndex,
	        activate : function( event, ui ){
	            var newIndex = ui.newTab.parent().children().index(ui.newTab);
	            dataStore.setItem( index, newIndex ) 
	        }
		});
	}

	if ($(".leagueengine_dirurl").length) { var leagueengine_dirurl = $(".leagueengine_dirurl").val(); }
	if ($(".leagueengine_date_format").length) { var leagueengine_date_format = $(".leagueengine_date_format").val(); }
	if ($(".leagueengine_time_format").length) { var leagueengine_time_format = $(".leagueengine_time_format").val(); }
	if ($(".leagueengine_colour_picker").length) { var myOptions = { hide: true, palettes: false }; $(".leagueengine_colour_picker").wpColorPicker(myOptions); }
	
	if ($("#leagueengine_admin .leagueengine_datepicker").length) {
		$('#leagueengine_admin .leagueengine_datepicker').datepicker({
			dateFormat: leagueengine_date_format,
			altField: ".leagueengine_datepicker_alt",
			altFormat: "yy-mm-dd"
		});
	}
	
	if ($("#leagueengine_admin .leagueengine_timepicker").length) {
		$('#leagueengine_admin .leagueengine_timepicker').timepicker({
			timeFormat: leagueengine_time_format,
			altField: ".leagueengine_timepicker_alt",
			showSecond: false,
			altFieldTimeOnly: true,
			altFormat: "yy-mm-dd",
			altTimeFormat: "HH:mm:ss"
		});
	}
	
	
	
	if ($('#leagueengine_admin select.select2').length) { $("#leagueengine_admin select.select2").select2(); }
	if ($('#leagueengine_admin select.select2-nosearch').length) { $("#leagueengine_admin select.select2-nosearch").select2({minimumResultsForSearch: -1}); }

	if ($("#leagueengine_admin input.team_lookup").length) {
		$("#leagueengine_admin input.team_lookup")
			.autocomplete({
				source: leagueengine_dirurl + "functions/lookup/team_lookup.php",
		        change: function (e, ui) {
		            if (!ui.item) {
		                 $(this).val('');
		             }
		        },
				matchContains: true,
				delay: 0,
				mustMatch: true,
				multiple: true,
				multipleSeparator: ", ",
				select: function(e, ui) {
					e.preventDefault()
					$("#leagueengine_admin .team_lookup_id").val(ui.item.value);
					$(this).val(ui.item.label);
				}
			});
	}

	if ($("#leagueengine_admin input.event_lookup").length) {
		$("#leagueengine_admin input.event_lookup")
			.autocomplete({
				source: leagueengine_dirurl + "functions/lookup/event_lookup.php",
		        change: function (e, ui) {
		            if (!ui.item) {
		                 $(this).val('');
		             }
		        },
				matchContains: true,
				delay: 0,
				mustMatch: true,
				multiple: true,
				multipleSeparator: ", ",
				select: function(e, ui) {
					e.preventDefault()
					$("#leagueengine_admin .event_lookup_id").val(ui.item.value);
					$(this).val(ui.item.label);
				}
			});
	}

	if ($("#leagueengine_admin input.wp_user_lookup").length) {
		$("#leagueengine_admin input.wp_user_lookup")
			.autocomplete({
				source: leagueengine_dirurl + "functions/lookup/wp_user_lookup.php",
		        change: function (e, ui) {
		            if (!ui.item) {
		                 $(this).val('');
		             }
		        },
				matchContains: true,
				delay: 0,
				mustMatch: true,
				multiple: true,
				multipleSeparator: ", ",
				select: function(e, ui) {
					e.preventDefault()
					$("#leagueengine_admin .wp_user_lookup_id").val(ui.item.value);
					$(this).val(ui.item.label);
				}
			});
	}
	
	if ($('#leagueengine_admin #tournament_competition').length) {
		$("#leagueengine_admin #tournament_competition").change(function() {
		    if (this.value == 'tournament') {
		        $('#leagueengine_admin table tr.tournament_competition').show();
		    } else {
		        $('#leagueengine_admin table tr.tournament_competition').hide();
		    }
		});
		if ($('#leagueengine_admin #tournament_type').length) {
			$("#leagueengine_admin #tournament_type").change(function() {
			    if (this.value == 'leagueknockout') {
			        $('#leagueengine_admin table tr.leagueknockout').show();
			    } else {
			        $('#leagueengine_admin table tr.leagueknockout').hide();
			    }
			});
		}
	}
	
	$("select.pick-league").change(function() {
		$("select.pick-season").load( leagueengine_dirurl + "functions/lookup/season_lookup.php?lid=" + $(this).val());
	});
	
	$("select.pick-season").change(function() {
		$("select.pick-team").load( leagueengine_dirurl + "functions/lookup/season_team_lookup.php?sid=" + $(this).val());
	});
	
	$("select.pick-tournament").change(function() {
		$("select.pick-tournament-team").load( leagueengine_dirurl + "functions/lookup/tournament_team_lookup.php?tid=" + $(this).val());
	});
	
	if ($("#leagueengine_admin .upload_image_button").length) {

	var leagueengine_uploader;
	$('#leagueengine_admin .upload_image_button').click(function(e) {
		formfieldID=jQuery(this).prev().attr("id");
		formfield = jQuery("#"+formfieldID).attr('name');

	    if (leagueengine_uploader) {
	        leagueengine_uploader.open();
	        return;
	    }
	    leagueengine_uploader = wp.media.frames.file_frame = wp.media({
	        title: 'Choose Image',
	        button: {
	            text: 'Choose Image'
	        },
	        multiple: false
	    });
	    leagueengine_uploader.on('select', function() {
	        attachment = leagueengine_uploader.state().get('selection').first().toJSON();
	        $("#"+formfieldID).val(attachment.url);
	    });

	    leagueengine_uploader.open();
	
	});
	
	}
	
	if ($("#leagueengine_admin form.create").length) {
		
		$("select#data").select2().select2('val', $("input#default").val());
		$('select#data').change(function() {    
		    var item=$(this);
		   $("input#default").val(item.val());
		});
		
		if($('input#lid').val()) {
			$("select#data").select2().select2('val', 'competition');
			$("select#competition_type").select2().select2('val', 'season').val();
			$("select#league_season").select2().select2('val', $("input#lid").val());
			$("form input#season_name").blur();
		}
		
		$('tr.create_competition').dependsOn({
			'select#data': { values: ['competition'] }
		});

		$('tr.create_competition').dependsOn({
			'select#data': { values: ['competition'] }
		});
		
		$('tr.create_league').dependsOn({
			'select#data': { values: ['competition'] },
			'select#competition_type': { values: ['league'] }
		});

		$('tr.create_season').dependsOn({
			'select#data': { values: ['competition'] },
			'select#competition_type': { values: ['season'] }
		});

		$('tr.create_tournament').dependsOn({
			'select#data': { values: ['competition'] },
			'select#competition_type': { values: ['tournament'] }
		});

		$('tr.leagueknockout').dependsOn({
			'select#data': { values: ['competition'] },
			'select#competition_type': { values: ['tournament'] },
			'select#tournament_type': { values: ['leagueknockout'] }
		});

		$('tr.create_team').dependsOn({
			'select#data': { values: ['team'] },
		});

		$('tr.add_team_to_competition').dependsOn({
			'select#data': { values: ['team'] },
			'select#add_team_to_competition': { values: ['1'] }
		});
		
		$('tr.add_team_to_league').dependsOn({
			'select#data': { values: ['team'] },
			'select#add_team_to_competition': { values: ['1'] },
			'select#new_team_competition_type': { values: ['league'] }
		});
		
		$('tr.add_team_to_tournament').dependsOn({
			'select#data': { values: ['team'] },
			'select#add_team_to_competition': { values: ['1'] },
			'select#new_team_competition_type': { values: ['tournament'] }
		});		
	
		$('tr.create_player').dependsOn({
			'select#data': { values: ['player'] }
		});

		$('tr.add_player_to_team').dependsOn({
			'select#data': { values: ['player'] },
			'select#add_player_to_team': { values: ['1'] }
		});

		$('tr.create_attribute').dependsOn({
			'select#data': { values: ['attribute'] }
		});

		$('tr.create_statistic').dependsOn({
			'select#data': { values: ['statistic'] }
		});

		$('tr.create_event').dependsOn({
			'select#data': { values: ['event'] }
		});

	}

	if ($("#leagueengine_admin form.career").length) {
	
		$('tr.career_league').dependsOn({
			'select#career_competition': { values: ['league'] }
		});

		$('tr.career_tournament').dependsOn({
			'select#career_competition': { values: ['tournament'] }
		});
		
	}
	
	if ($("#leagueengine_admin select#new_matches").length) {
	
		$('form.single_match').dependsOn({
			'select#new_matches': { values: ['single'] }
		});

		$('form.generate_match').dependsOn({
			'select#new_matches': { values: ['generate'] }
		});
		
	}
	
	if ($("#leagueengine_admin input.countdown").length) {
	    $('#leagueengine_admin th.countdown span').countdown({
	        date: $("#leagueengine_admin input.countdown").val()
	    });
	}

	if ($("#leagueengine_admin #all_home_apps").length) {
		$('#all_home_apps').click(function(event) {   
		    if(this.checked == false) {
		        $('.homeplayers:checkbox').each(function() {
		        	this.checked = false;                      
		        });
		    } else {
		        $('.homeplayers:checkbox').each(function() {
		        	this.checked = true;                      
		        });	    
		    }
		});
	}
	
	if ($("#leagueengine_admin #all_home_subs").length) {
		$('#all_home_subs').click(function(event) {   
		    if(this.checked == false) {
		        $('.homesubs:checkbox').each(function() {
		        	this.checked = false;                      
		        });
		    } else {
		        $('.homesubs:checkbox').each(function() {
		        	this.checked = true;                      
		        });	    
		    }
		});
	}

	if ($("#leagueengine_admin #all_away_apps").length) {
		$('#all_away_apps').click(function(event) {   
		    if(this.checked == false) {
		        $('.awayplayers:checkbox').each(function() {
		        	this.checked = false;                      
		        });
		    } else {
		        $('.awayplayers:checkbox').each(function() {
		        	this.checked = true;                      
		        });	    
		    }
		});
	}
	
	if ($("#leagueengine_admin #all_away_subs").length) {
		$('#all_away_subs').click(function(event) {   
		    if(this.checked == false) {
		        $('.awaysubs:checkbox').each(function() {
		        	this.checked = false;                      
		        });
		    } else {
		        $('.awaysubs:checkbox').each(function() {
		        	this.checked = true;                      
		        });	    
		    }
		});
	}
	
});