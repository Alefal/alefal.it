<div class="wrap">
	<h1>Services Utility</h1>

	<div class="card pressthis" style="max-width:100%">
		<h3>Funzionalità disponibili</h3>
		<p>Le funzionalità disponibili nel plugin sono le seguenti:</p>

		<h4>Sottotitolo</h4>
		<p>Testo</p>

		<p class="pressthis-bookmarklet-wrapper">
			<a class="pressthis-bookmarklet"><span>Press This</span></a>
			<button type="button" class="button button-secondary pressthis-js-toggle js-show-pressthis-code-wrap" aria-expanded="false" aria-controls="pressthis-code-wrap">
				<span class="dashicons dashicons-clipboard"></span>
				<span class="screen-reader-text">Copia il codice del bookmarklet “Press This”</span>
			</button>
			<a class="button button-secondary" href="http://HOST/wp-admin/press-this.php">Apri Press This</a>
		</p>
	
	</div>
	<div class="card" style="max-width:100%">
	    <h3>JSON API USER</h3>
	    <p>Installare ed attivare il plugin. Servizi disponibili:</p>

	    <h4>AUTHENTICATION</h4>
		<p><i>http://HOST/api/user/generate_auth_cookie/?username=admin&password=admin</i></p>

		<h4>FB CONNECT</h4>
		<p><i>/api/user/fb_connect/?access_token=CAACEdEose0cBADLKmcHWOZCnW4RGU8emG</i></p>

		<h4>REGISTER</h4>
		<ol>
			<li>
				Recuperare ONCE:
				<br />
				<i>http://HOST/api/get_nonce/?controller=user&method=register</i>
				<br />
				<i>{"status":"ok","controller":"user","method":"register","nonce":"3818ac2f0d"}</i>
			</li>
			<li>
				Registrate:
				<br />
				<i>http://HOST/api/user/register/?username=test&email=test@domain.com&nonce=3818ac2f0d&display_name=Test&user_pass=test&notify=no</i>
			</li>
		</ol>

		<h4>USER</h4>
		<ol>
			<li>
				INFO:
				<br />
				<i>http://HOST/api/user/get_userinfo/?user_id=1</i>
			</li>
			<li>
				RETRIEVE:
				<br />
				<i>http://HOST/api/user/retrieve_password/?user_login=test</i>
				<br />
				<i>{"status":"ok","msg":"Link for password reset has been emailed to you. Please check your email."}</i>
			</li>
		</ol>
	</div>

	<div class="card" style="max-width:100%">
	    <h3>JSON API</h3>
	    <p>Installare ed attivare il plugin. Servizi disponibili:</p>

	    <h4>POSTS</h4>
		<ol>
			<li>
				Recent posts:
				<br />
				<i>http://HOST/?json=get_recent_posts</i>
				<br />
				<i>http://HOST/api/get_recent_posts/</i>		(With user-friendly permalinks configured)
			</li>
			<li>
				Post:
				<br />
				<i>http://HOST/?json=get_post&post_id=1</i>
			</li>
		</ol>

		<h4>CATEGORIES (solo quelli associati ad un post)</h4>
		<p><i>http://HOST/?json=get_category_index</i></p>

		<h4>TAGS (solo quelli associati ad un post)</h4>
		<p><i>http://HOST/?json=get_tag_index</i></p>
	</div>
</div>