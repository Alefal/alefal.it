<?php

// SHORTCODE: LEAGUEENGINE_SHOW_SEASON
// DESCRIPTION: OPTIONALLY DISPLAY SEASON TABLE, FUTURE MATCHES AND NEWS

add_shortcode('leagueengine_show_season', 'leagueengine_show_season');

function leagueengine_show_season($atts, $content = null) {
	
	// PARAMETERS
	extract(shortcode_atts(array(
		'class' => '',
		'lid' => '',
		'sid' => '',
		'show_table' => 'show',
		'show_matches' => 'show',
		'news_cat' => '',
		'news_count' => 5,
		'text_news' => __('News','leagueengine'),
	), $atts));
	
	global $wpdb;
	ob_start();
	$output = '';
	$output .= '<div class="leagueengine show_season '.$class.'">';
	
	$table = $wpdb->prefix . "leagueengine_league_seasons";

	if($sid == '' or $sid == NULL) {
		$today = date("Y-m-d");
		$sid = $wpdb->get_var("SELECT max(season_id) FROM $table WHERE league_id = '$lid' AND start_date < '$today' ORDER BY start_date DESC LIMIT 1");
		$season = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid'");
	} else {
		$season = $wpdb->get_results("SELECT * FROM $table WHERE league_id = '$lid' AND season_id = '$sid'");
	}
		
	if($lid && $sid) {
		if($show_table == 'show') $output .= leagueengine_show_season_table(array('lid' => $lid, 'sid' => $sid));
		if($show_matches == 'show') $output .= leagueengine_show_season_matches(array('lid' => $lid, 'sid' => $sid));
		if($news_cat && $news_count > 0) {
			$args = array('posts_per_page' => $news_count, 'category' => $news_cat);
			$myposts = get_posts($args);
			if($myposts > 0 ) {
				$output .= '<h3>'.$text_news.'</h3>';
				$output .= '<div class="show_season_news">';
					$args = array('posts_per_page' => $news_count, 'category' => $news_cat);
					$myposts = get_posts($args);
					foreach ($myposts as $post) : setup_postdata($post);
						$output .= '<div class="show_season_news_article">';
							$output .= '<p class="show_season_news_title"><a href="'.$post->guid.'">'.$post->post_title.'</a></p>';
							$output .= '<p class="show_season_news_text">'.$post->post_excerpt.'</p>';
						$output .= '</div>';
					endforeach; 
					wp_reset_postdata();
				$output .= '</div>';	
			}
		}
	}
	
	$output .= '</div>';
	$output .= ob_get_clean();
	return $output;
	
}

?>