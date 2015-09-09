<?php

class leagueengine_widget_box extends WP_Widget {

    function leagueengine_widget_box() {
        parent::WP_Widget(false, $name = __('LeagueEngine', 'wp_widget_plugin') );
    }

	function form($instance) {
		if( $instance) {
		     $title = esc_attr($instance['title']);
		     $code = esc_attr($instance['code']);
		} else {
		     $title = '';
		     $code = '';
		}
		?>
		<p>
			<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e('Title', 'wp_widget_plugin'); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo $title; ?>" />
		</p>
		<p>
			<label for="<?php echo $this->get_field_id('code'); ?>"><?php _e('Shortcode', 'wp_widget_plugin'); ?></label>
			<input class="widefat" id="<?php echo $this->get_field_id('code'); ?>" name="<?php echo $this->get_field_name('code'); ?>" type="text" value="<?php echo $code; ?>" />
		</p>
		<?php
	}

	function update($new_instance, $old_instance) {
		$instance = $old_instance;
		$instance['title'] = strip_tags($new_instance['title']);
		$instance['code'] = strip_tags($new_instance['code']);
		return $instance;
	}

	function widget($args, $instance) {
		extract( $args );
		$title = apply_filters('widget_title', $instance['title']);
		$code = apply_filters('widget_title', $instance['code']);
		echo $before_widget;
		echo '<div class="leagueengine-widget">';
		if ($code) {
			$return = $before_title;
			if($title) {
				echo '<h3 class="widget-title">'.$title.'</h3>';
			}
			$return .= $after_title;
			echo $return;
		}
		if($code) {
			echo do_shortcode($code);
		}
	   echo '</div>';
	   echo $after_widget;
	}

}

add_action('widgets_init', create_function('', 'return register_widget("leagueengine_widget_box");'));

?>