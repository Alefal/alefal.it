<?php
/**
 * Il file base di configurazione di WordPress.
 *
 * Questo file viene utilizzato, durante l’installazione, dallo script
 * di creazione di wp-config.php. Non è necessario utilizzarlo solo via
 * web, è anche possibile copiare questo file in «wp-config.php» e
 * riempire i valori corretti.
 *
 * Questo file definisce le seguenti configurazioni:
 *
 * * Impostazioni MySQL
 * * Prefisso Tabella
 * * Chiavi Segrete
 * * ABSPATH
 *
 * È possibile trovare ultetriori informazioni visitando la pagina del Codex:
 *
 * @link https://codex.wordpress.org/it:Modificare_wp-config.php
 *
 * È possibile ottenere le impostazioni per MySQL dal proprio fornitore di hosting.
 *
 * @package WordPress
 */

// ** Impostazioni MySQL - È possibile ottenere queste informazioni dal proprio fornitore di hosting ** //
/** Il nome del database di WordPress */
define('DB_NAME', 'wordpress');

/** Nome utente del database MySQL */
define('DB_USER', 'root');

/** Password del database MySQL */
define('DB_PASSWORD', '');

/** Hostname MySQL  */
define('DB_HOST', 'localhost');

/** Charset del Database da utilizzare nella creazione delle tabelle. */
define('DB_CHARSET', 'utf8mb4');

/** Il tipo di Collazione del Database. Da non modificare se non si ha idea di cosa sia. */
define('DB_COLLATE', '');

/**#@+
 * Chiavi Univoche di Autenticazione e di Salatura.
 *
 * Modificarle con frasi univoche differenti!
 * È possibile generare tali chiavi utilizzando {@link https://api.wordpress.org/secret-key/1.1/salt/ servizio di chiavi-segrete di WordPress.org}
 * È possibile cambiare queste chiavi in qualsiasi momento, per invalidare tuttii cookie esistenti. Ciò forzerà tutti gli utenti ad effettuare nuovamente il login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '*R*;]Op1:xiqwm_lp9Vcd6N4R&qO4sPLd:5/T_z?/n|!_XgIR;!WHMz/$:m98Qk|');
define('SECURE_AUTH_KEY',  '<ea0eUrIH#.x1kxEAE#yOw>)+Cvp2P:FjORoB6_xfkD.|0#ekq?=,xCp lmX8&0A');
define('LOGGED_IN_KEY',    'i|cI1Ts2wwyiZ%J.-~NbHxlRLvtMX-@him/oq0h0BrR7/8Fw,ewwF5fmq,H?9pIk');
define('NONCE_KEY',        '4?d  /I/Bh-+c*PDx}|F.9>^KGcLQ;|9y,bPyD2##]E| e4@9{g5*iC]Br)1^JPH');
define('AUTH_SALT',        'fv${-Thw7oKws~1[RLB#5ztMj2sf9+4z.Xtgp2hv5%]dQxS-F28#mIiDVfgD((e{');
define('SECURE_AUTH_SALT', '}ZI5I2R}CAcrm7}:N_<QtoBKc0U}[1*6Z]jFRx?P5!G7:C`0=.}ks;fpzN@qKu@8');
define('LOGGED_IN_SALT',   'b6%(6,sj@}=)n-GlSCH`tXt~2*o325BG%C0.v|k&,><s>[%01wPMeV;VulLa`F5$');
define('NONCE_SALT',       'MKE62^j>PE`tS9`c,|I*q5(> Pezr(IeDMwU>(G9co<uhYX)(yh&I0]ePvT+O7!u');

/**#@-*/

/**
 * Prefisso Tabella del Database WordPress.
 *
 * È possibile avere installazioni multiple su di un unico database
 * fornendo a ciascuna installazione un prefisso univoco.
 * Solo numeri, lettere e sottolineatura!
 */
$table_prefix  = 'wp_';

/**
 * Per gli sviluppatori: modalità di debug di WordPress.
 *
 * Modificare questa voce a TRUE per abilitare la visualizzazione degli avvisi
 * durante lo sviluppo.
 * È fortemente raccomandato agli svilupaptori di temi e plugin di utilizare
 * WP_DEBUG all’interno dei loro ambienti di sviluppo.
 */
define('WP_DEBUG', false);

/* Finito, interrompere le modifiche! Buon blogging. */

/** Path assoluto alla directory di WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Imposta le variabili di WordPress ed include i file. */
require_once(ABSPATH . 'wp-settings.php');