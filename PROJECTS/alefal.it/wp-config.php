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
define('DB_NAME', 'alefal.it');
//define('DB_NAME', 'c1alefalwp');

/** Nome utente del database MySQL */
define('DB_USER', 'root');
//define('DB_USER', 'c1alefal');

/** Password del database MySQL */
define('DB_PASSWORD', '');
//define('DB_PASSWORD', 'lafela123');

/** Hostname MySQL  */
define('DB_HOST', 'localhost');

/** Charset del Database da utilizzare nella creazione delle tabelle. */
define('DB_CHARSET', '');

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
define('AUTH_KEY',         '6Qt<,;]V`5_lC=D0{qwVvfc f]-<Znch<LMudX!|Fs+{KP%R^uLS]peA`)Ac-/(g');
define('SECURE_AUTH_KEY',  'bELjl5gXard~Fq|=b=5VMSoqTnnH#3]$-x2k 9TD&rAF_jyIf$mQfD&^f6mWD@K~');
define('LOGGED_IN_KEY',    '|1OosAwU@IJ8 9|:){z{+>y8cl#U`ki$=[2mYi76?/QNh.=v7bkx4H!i/X)KPa1:');
define('NONCE_KEY',        '}L+P$?`+!,K`M/u1atj+$N&(y^i2&Gha*+MiBamud&=<MJ`f!Zc~QC[|._mQR^d(');
define('AUTH_SALT',        'aVY}|s*SjI{/|WXonWzOZyh2:hg2sM|y=:b|gn>.Sy&,D2G(Z-~2EY>I;+chd_QM');
define('SECURE_AUTH_SALT', 'wfKFqJ7*z4?{1(JN==Yoy|K2WI#H7QEZk-0@,7!6mE]4~n=~%,Gr$<ES2^K:fmD+');
define('LOGGED_IN_SALT',   'HW+0ycvHem@TW?*kuMP5fcW,,C,t/|G_+q1iSkgy!`]9X3&+NdKHL_p+dT[`P~7q');
define('NONCE_SALT',       'tk$3{$a,/4-s9w;Df9pRo~192vu+s3`2]l3H&Kq&=b1rK[i|Y1tB0Vzrn7+tMKVF');

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