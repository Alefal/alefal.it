<?php

	class leagueengine {
	
		function __construct(){    
			global $wpdb;    
		}
	
		function get_leagues() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'league'");
		}

		function get_seasons() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'season'");
		}

		function get_teams() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'team'");
		}

		function get_players() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'player'");
		}

		function get_attributes() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'attribute'");
		}

		function get_events() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'event'");
		}
		
		function get_statistics() {
			global $wpdb;   
			$table = $wpdb->prefix . 'leagueengine_data';
			return $wpdb->get_results("SELECT * FROM $table WHERE data_type = 'statistic'");
		}
		
	}

?>