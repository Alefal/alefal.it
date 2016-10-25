<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
//REMOTE
/*
define('DB_NAME', 'Sql879752_2');
define('DB_USER', 'Sql879752');
define('DB_PASSWORD', '3r22nw0etv');
define('DB_HOST', '62.149.150.236');
*/
/** The name of the database for WordPress */
//LOCALE
define('DB_NAME', 'leagueengine');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ']8h0ST4Tco3m1QPg?5W9UOVnv1r>zfzDfBZUOnkdkX5KB3fpf9|qR<d1)K=WE6ia');
define('SECURE_AUTH_KEY',  'Zk7aX 3,Vp#KXy3tP2!.{t0Jgas`NXQ49f6n`EfNdO;#qq/v`,}Y`MWnXJ2A[lI>');
define('LOGGED_IN_KEY',    '3T4uo|;J]<F%(iNoK&*kum}j*r4f/=at=CT]8)O![w9GYKmPXh3h>b[0=WU.g8fa');
define('NONCE_KEY',        '?QZ,/<nzhQDIWFLRTEPHm)f{Sm }0$=J8qd50| I2;Evj-{&t*0sz`w)#{}rhz>B');
define('AUTH_SALT',        'UV!3wg8FeJkyI{mQ&3poxbALlE*EaNxv)[Sm_%H&_Kt6t?:hqW18vzI}r~^-q5>9');
define('SECURE_AUTH_SALT', '{-Gc6S)3J?M|Q/9cds-Q<WN1N=J0x{cZ#Qx3aY&Ji*17Mz4*bQ1<^zfHiINq,lm&');
define('LOGGED_IN_SALT',   'e:If^^h6N8mbdxLW/q.<)sB=W!xrOZMX_-a_pA^=RQd{;K&5y`H>]Lg=eHt#]I.[');
define('NONCE_SALT',       '!o@^?<]S}/|Z7~%h#`w=~37)Un_|1[J_:7YiBoEH$ HJL~B &0Mqq,&^Cwt/f-[g');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'le_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
