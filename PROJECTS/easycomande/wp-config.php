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
define('DB_NAME', 'Sql879752_4');
define('DB_USER', 'Sql879752');
define('DB_PASSWORD', '3r22nw0etv');
define('DB_HOST', '62.149.150.236');
*/
/** The name of the database for WordPress */
//LOCALE
define('DB_NAME', 'easycomande');
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
define('AUTH_KEY',         '{ X=e2J~Q~L}`g[];x)ujN:ey0H-lW2S}RkOzO2:qeVrqQ7n~1XjhDiA[hI[)xIu');
define('SECURE_AUTH_KEY',  '_F`TlT-v<i]3xy$M*K!VfU)7moC4$B(bFtLcmKXv3rS^tPqDHdh+Z5}Wu{YF@jP6');
define('LOGGED_IN_KEY',    'J}-wd`;#@536Q9T/fo)(6F*VnD$#M~O-x!mwr]DTZ9_-;p/Tj ([cBj;<T>)4JAC');
define('NONCE_KEY',        '&s)=xTc08JU^O.sijv9K^)`NBfZ.WMslaDUD-u5QL|s1iL!U^K10(fs[,ngw6Xl=');
define('AUTH_SALT',        '|!,M<%di4~N_7$|)O2:^S:5!ZGt#_w`rUfDAG4.REX=_9bo4rZRS[B<&!M4UI7UB');
define('SECURE_AUTH_SALT', ':dem[{WR~OeM6*wmS@QAvHe72%rzN|/:qc.mZ9}3$A=(q b)zwdKHM:Xc*NTj6}y');
define('LOGGED_IN_SALT',   '*X/aW~Vnlg=vEax[prGe0j]=}>YFPM_De;|U@7d@9sf`X3T*/Ho s2[NHtKn0y=H');
define('NONCE_SALT',       'U`#EAB~/WZV!(g6tm4om4RGt]vOU(8,L)byxJ:MLU*&]`jBY8kcSzYI]d_Xf_)^j');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

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

define('WPLANG', 'it_IT');

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
