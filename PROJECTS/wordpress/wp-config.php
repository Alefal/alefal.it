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
define('AUTH_KEY',         'v4/F!^rLq=j+8*.p=1/CfQ+L?|rbaI:0fHtSD3Kc.q,pdO]{odmTUwa9/(Z@<~Q.');
define('SECURE_AUTH_KEY',  '[eN0^|)q}KLfc/$aE.^/Kx=j=o}J|,-r.zJXz?8JD+yBg]2o0Vz^jW[S}V1VU-)Q');
define('LOGGED_IN_KEY',    '73sKQF.a%0__W+(t5*S(#.6CdDyBFgM[E!~W]h c*+ZTpX9{oEWhwupX_~/JQ^ h');
define('NONCE_KEY',        '+t?LwzUi$R59qJ01/H6Xil)73Xv4@or#:j11,-w@Bk9T<jZiA%qdA7+-7M`NR{Ia');
define('AUTH_SALT',        '=OoCMhd]C5!gUv-H|H+|gP6cc%ur]GU~!;g@:lV}-53Z/f<y^u/&rsjd^TPA-p)/');
define('SECURE_AUTH_SALT', 'p+Rj~6~*s!XV~Vj7EL)9V/+t2RdjBYc4D{pgj9~p-c=5W*qF/YE/|w9_cO,[skb>');
define('LOGGED_IN_SALT',   'x|[@EX3<N^PxS%h|,-%4dWdt.3Y2twghP^V,*_fEH__YO8Lr5.~4)*ceW*%zq-TW');
define('NONCE_SALT',       '00.k2=6<[[i6/e#I!0Gezdi|L-z(I]su8S1g*GHmARe~A ]tb4Q0.2@V_S$ZiI{H');

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