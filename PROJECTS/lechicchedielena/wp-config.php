<?php
/**
 * Il file base di configurazione di WordPress.
 *
 * Questo file definisce le seguenti configurazioni: impostazioni MySQL,
 * Prefisso Tabella, Chiavi Segrete, Lingua di WordPress e ABSPATH.
 * E' possibile trovare ultetriori informazioni visitando la pagina: del
 * Codex {@link http://codex.wordpress.org/Editing_wp-config.php
 * Editing wp-config.php}. E' possibile ottenere le impostazioni per
 * MySQL dal proprio fornitore di hosting.
 *
 * Questo file viene utilizzato, durante l'installazione, dallo script
 * di creazione di wp-config.php. Non è necessario utilizzarlo solo via
 * web,è anche possibile copiare questo file in "wp-config.php" e
 * rimepire i valori corretti.
 *
 * @package WordPress
 */

// ** Impostazioni MySQL - E? possibile ottenere questoe informazioni
// ** dal proprio fornitore di hosting ** //
/** Il nome del database di WordPress */
define('DB_NAME', 'lechicchedielena');

/** Nome utente del database MySQL */
define('DB_USER', 'root');

/** Password del database MySQL */
define('DB_PASSWORD', '');

/** Hostname MySQL  */
define('DB_HOST', 'localhost');

/** Charset del Database da utilizare nella creazione delle tabelle. */
define('DB_CHARSET', 'utf8mb4');

/** Il tipo di Collazione del Database. Da non modificare se non si ha
idea di cosa sia. */
define('DB_COLLATE', '');

/**#@+
 * Chiavi Univoche di Autenticazione e di Salatura.
 *
 * Modificarle con frasi univoche differenti!
 * E' possibile generare tali chiavi utilizzando {@link https://api.wordpress.org/secret-key/1.1/salt/ servizio di chiavi-segrete di WordPress.org}
 * E' possibile cambiare queste chiavi in qualsiasi momento, per invalidare tuttii cookie esistenti. Ciò forzerà tutti gli utenti ad effettuare nuovamente il login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$J<fXz/no-tA2:Y2Wj#KJ|j]rOcK17wPVi4;0ZDMc0*p:m<,u=YSm#+]Ld|0i6/F');
define('SECURE_AUTH_KEY',  '%Mn$xo^%7^2x)Ig ]zJ.30nnv&IBdGs!Bend{E,s&{.8cZ6O/^MVP1-Kp-PyqU~|');
define('LOGGED_IN_KEY',    'EWD?MRlzct@!@=-_mt&z}/~D|5,Rc|l42MnX8e:s|M[7oiAZJP]EPuAS&L8]R1^o');
define('NONCE_KEY',        '(uJeTJ+W.:|Sjv&Nl`w@@wF|B=QSZ>8ncU41xxG$;JR-ju61;3!2Ur}X6XY6V/H7');
define('AUTH_SALT',        '|jmBV-^XJiI#<S4RghT(-vn;k$4#}#h`%9gqj(V-,;04+oa;|$sZSJXrMs5+|[wJ');
define('SECURE_AUTH_SALT', 'b7;-EC@klW0SKk,7.?^l;?34#{|!zcn{&o&yj7dZ4}vWd>Xlhsp+D*zKt#}{xc+e');
define('LOGGED_IN_SALT',   '>@V=??n.x.tRXnC@7Ao|Bt*kGwg_Z%KFVEw);y671x>s?V,oU<3f-6NAe2CB2OnF');
define('NONCE_SALT',       '`=jN|V>auEvX;+~K|F4YHIx#eP=4M~YZhB1%O5Nf=wP_Ef]$yw&-/uUdb.  e$^#');

/**#@-*/

/**
 * Prefisso Tabella del Database WordPress .
 *
 * E' possibile avere installazioni multiple su di un unico database if you give each a unique
 * fornendo a ciascuna installazione un prefisso univoco.
 * Solo numeri, lettere e sottolineatura!
 */
$table_prefix  = 'wp_';

/**
 * Per gli sviluppatori: modalità di debug di WordPress.
 *
 * Modificare questa voce a TRUE per abilitare la visualizzazione degli avvisi
 * durante lo sviluppo.
 * E' fortemente raccomandato agli svilupaptori di temi e plugin di utilizare
 * WP_DEBUG all'interno dei loro ambienti di sviluppo.
 */
define('WP_DEBUG', true);

/* Finito, interrompere le modifiche! Buon blogging. */

/** Path assoluto alla directory di WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Imposta lle variabili di WordPress ed include i file. */
require_once(ABSPATH . 'wp-settings.php');
