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
define('DB_NAME', 'wpmultilanguage');

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
define('AUTH_KEY',         'Boz8-p%5&ptOKOoCL?Q9^B]Sjn(0G7og- yc:mEB}BxUM6-*h:@AA<~u+lXwu<|n');
define('SECURE_AUTH_KEY',  '!`TKia7#^R1pU*7xn(7:>tHHR5toUz3klF*n<jX?neg1&YV_jRj mr@EU]#ek`R0');
define('LOGGED_IN_KEY',    'EyHimy86Q%E6TH7%hf_KfU~2*[ULm_e-|@<a83_ta#7H-MJ0oNc1o dI@Bhxfes8');
define('NONCE_KEY',        'Y+@3F[ovUFu+5o(t_R`yDz+-=prqh[HXHSJ[Kvy,*z>xJ>oKuVX%}o-hE,Pt^v>7');
define('AUTH_SALT',        'u^,WT3I[~OF|m!QXGcwqz@_(zq+Km@}AOvw2 &iF F:V*.`PlV>~-1AiP[<bE2Iq');
define('SECURE_AUTH_SALT', 'Pk/{k<P)Lg7$Z@f`3nMl6+H)Li[9&}l_&B`%Reh%roT?WX(U<:]-yNfF%M`Hm+Y3');
define('LOGGED_IN_SALT',   '2a@y]2(xso8(XrDg?FoX;P4J%T!:Phr>NJp}N0}0eAa}n=ky{5y8Xx&zx6$Xb/+8');
define('NONCE_SALT',       '|giN?^OC20Ok%d?[:x>vt!F4+qok{9z+-5^+<~gJMCN8+zdtE$%-8->0gj/,cp+p');

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