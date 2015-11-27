<div class="wrap">
<h1>Services Utility</h1>

<div class="card pressthis" style="max-width:100%">
	<h3>Funzionalità disponibili</h3>
	<p>Le funzionalità disponibili nel plugin sono le seguenti:</p>
	<ol>
		<li>
			Funzione
			<!--
			<button type="button" class="button button-secondary pressthis-js-toggle js-show-pressthis-code-wrap" aria-expanded="false" aria-controls="pressthis-code-wrap">
				<span class="dashicons dashicons-clipboard"></span>
				<span class="screen-reader-text">Copia il codice del bookmarklet “Press This”</span>
			</button>
			-->
		</li>
	</ol>


	<form>
		<h3>Installa Press This</h3>
		<h4>Bookmarklet</h4>
		<p>Trascina il bookmarklet sotto la tua barra preferiti. Quindi, quando sei su una pagina che vuoi condividere, semplicemente “fai clic” su di essa.</p>

		<p class="pressthis-bookmarklet-wrapper">
			<a class="pressthis-bookmarklet" onclick="return false;" href='javascript:(function(a,b,c,d){function e(a,c){if("undefined"!=typeof c){var d=b.createElement("input");d.name=a,d.value=c,d.type="hidden",p.appendChild(d)}}var f,g,h,i,j,k,l,m,n,o=a.encodeURIComponent,p=b.createElement("form"),q=b.getElementsByTagName("head")[0],r="_press_this_app",s=!0;if(d){if(!c.match(/^https?:/))return void(top.location.href=d);if(d+="&amp;u="+o(c),c.match(/^https:/)&amp;&amp;d.match(/^http:/)&amp;&amp;(s=!1),a.getSelection?h=a.getSelection()+"":b.getSelection?h=b.getSelection()+"":b.selection&amp;&amp;(h=b.selection.createRange().text||""),d+="&amp;buster="+(new Date).getTime(),s||(b.title&amp;&amp;(d+="&amp;t="+o(b.title.substr(0,256))),h&amp;&amp;(d+="&amp;s="+o(h.substr(0,512)))),f=a.outerWidth||b.documentElement.clientWidth||600,g=a.outerHeight||b.documentElement.clientHeight||700,f=800>f||f>5e3?600:.7*f,g=800>g||g>3e3?700:.9*g,!s)return void a.open(d,r,"location,resizable,scrollbars,width="+f+",height="+g);i=q.getElementsByTagName("meta")||[];for(var t=0;t<i.length&amp;&amp;!(t>200);t++){var u=i[t],v=u.getAttribute("name"),w=u.getAttribute("property"),x=u.getAttribute("content");x&amp;&amp;(v?e("_meta["+v+"]",x):w&amp;&amp;e("_meta["+w+"]",x))}j=q.getElementsByTagName("link")||[];for(var y=0;y<j.length&amp;&amp;!(y>=50);y++){var z=j[y],A=z.getAttribute("rel");("canonical"===A||"icon"===A||"shortlink"===A)&amp;&amp;e("_links["+A+"]",z.getAttribute("href"))}b.body.getElementsByClassName&amp;&amp;(k=b.body.getElementsByClassName("hfeed")[0]),k=b.getElementById("content")||k||b.body,l=k.getElementsByTagName("img")||[];for(var B=0;B<l.length&amp;&amp;!(B>=100);B++)n=l[B],n.src.indexOf("avatar")>-1||n.className.indexOf("avatar")>-1||n.width&amp;&amp;n.width<256||n.height&amp;&amp;n.height<128||e("_images[]",n.src);m=b.body.getElementsByTagName("iframe")||[];for(var C=0;C<m.length&amp;&amp;!(C>=50);C++)e("_embeds[]",m[C].src);b.title&amp;&amp;e("t",b.title),h&amp;&amp;e("s",h),p.setAttribute("method","POST"),p.setAttribute("action",d),p.setAttribute("target",r),p.setAttribute("style","display: none;"),a.open("about:blank",r,"location,resizable,scrollbars,width="+f+",height="+g),b.body.appendChild(p),p.submit()}})(window,document,top.location.href,"http:\/\/localhost\/alefal.it\/PROJECTS\/wordpress\/wp-admin\/press-this.php?v=8");'><span>Press This</span></a>
			<button type="button" class="button button-secondary pressthis-js-toggle js-show-pressthis-code-wrap" aria-expanded="false" aria-controls="pressthis-code-wrap">
				<span class="dashicons dashicons-clipboard"></span>
				<span class="screen-reader-text">Copia il codice del bookmarklet “Press This”</span>
			</button>
		</p>

		<div class="hidden js-pressthis-code-wrap clear" id="pressthis-code-wrap">
			<p id="pressthis-code-desc">
				Se non puoi trascinare il bookmarklet nei tuoi preferiti, copia il seguente codice e crea un nuovo preferito. Incolla il codice nel campo indirizzo URL del nuovo preferito.			</p>
			<p>
				<textarea class="js-pressthis-code" rows="5" cols="120" readonly="readonly" aria-labelledby="pressthis-code-desc">javascript:(function(a,b,c,d){function e(a,c){if("undefined"!=typeof c){var d=b.createElement("input");d.name=a,d.value=c,d.type="hidden",p.appendChild(d)}}var f,g,h,i,j,k,l,m,n,o=a.encodeURIComponent,p=b.createElement("form"),q=b.getElementsByTagName("head")[0],r="_press_this_app",s=!0;if(d){if(!c.match(/^https?:/))return void(top.location.href=d);if(d+="&amp;u="+o(c),c.match(/^https:/)&amp;&amp;d.match(/^http:/)&amp;&amp;(s=!1),a.getSelection?h=a.getSelection()+"":b.getSelection?h=b.getSelection()+"":b.selection&amp;&amp;(h=b.selection.createRange().text||""),d+="&amp;buster="+(new Date).getTime(),s||(b.title&amp;&amp;(d+="&amp;t="+o(b.title.substr(0,256))),h&amp;&amp;(d+="&amp;s="+o(h.substr(0,512)))),f=a.outerWidth||b.documentElement.clientWidth||600,g=a.outerHeight||b.documentElement.clientHeight||700,f=800&gt;f||f&gt;5e3?600:.7*f,g=800&gt;g||g&gt;3e3?700:.9*g,!s)return void a.open(d,r,"location,resizable,scrollbars,width="+f+",height="+g);i=q.getElementsByTagName("meta")||[];for(var t=0;t&lt;i.length&amp;&amp;!(t&gt;200);t++){var u=i[t],v=u.getAttribute("name"),w=u.getAttribute("property"),x=u.getAttribute("content");x&amp;&amp;(v?e("_meta["+v+"]",x):w&amp;&amp;e("_meta["+w+"]",x))}j=q.getElementsByTagName("link")||[];for(var y=0;y&lt;j.length&amp;&amp;!(y&gt;=50);y++){var z=j[y],A=z.getAttribute("rel");("canonical"===A||"icon"===A||"shortlink"===A)&amp;&amp;e("_links["+A+"]",z.getAttribute("href"))}b.body.getElementsByClassName&amp;&amp;(k=b.body.getElementsByClassName("hfeed")[0]),k=b.getElementById("content")||k||b.body,l=k.getElementsByTagName("img")||[];for(var B=0;B&lt;l.length&amp;&amp;!(B&gt;=100);B++)n=l[B],n.src.indexOf("avatar")&gt;-1||n.className.indexOf("avatar")&gt;-1||n.width&amp;&amp;n.width&lt;256||n.height&amp;&amp;n.height&lt;128||e("_images[]",n.src);m=b.body.getElementsByTagName("iframe")||[];for(var C=0;C&lt;m.length&amp;&amp;!(C&gt;=50);C++)e("_embeds[]",m[C].src);b.title&amp;&amp;e("t",b.title),h&amp;&amp;e("s",h),p.setAttribute("method","POST"),p.setAttribute("action",d),p.setAttribute("target",r),p.setAttribute("style","display: none;"),a.open("about:blank",r,"location,resizable,scrollbars,width="+f+",height="+g),b.body.appendChild(p),p.submit()}})(window,document,top.location.href,"http:\/\/localhost\/alefal.it\/PROJECTS\/wordpress\/wp-admin\/press-this.php?v=8");</textarea>
			</p>
		</div>

		<h4>Link diretto (meglio per il mobile)</h4>
		<p>Segui il link per aprire Press This. Quindi aggiungilo ai preferiti del tuo dispositivo oppure all'home screen.</p>

		<p>
			<a class="button button-secondary" href="http://localhost/alefal.it/PROJECTS/wordpress/wp-admin/press-this.php">Apri Press This</a>
		</p>
		<script>
			jQuery( document ).ready( function( $ ) {
				var $showPressThisWrap = $( '.js-show-pressthis-code-wrap' );
				var $pressthisCode = $( '.js-pressthis-code' );

				$showPressThisWrap.on( 'click', function( event ) {
					var $this = $( this );

					$this.parent().next( '.js-pressthis-code-wrap' ).slideToggle( 200 );
					$this.attr( 'aria-expanded', $this.attr( 'aria-expanded' ) === 'false' ? 'true' : 'false' );
				});

				// Select Press This code when focusing (tabbing) or clicking the textarea.
				$pressthisCode.on( 'click focus', function() {
					var self = this;
					setTimeout( function() { self.select(); }, 50 );
				});

			});
		</script>
	</form>
</div>
<div class="card">
    <h3 class="title">Convertitore di categorie e tag</h3>
    <p>Se si desidera convertire le categorie in tag (o viceversa), utilizzare lo strumento <a href="import.php">Convertitore di Categorie e Tag</a> disponibile dalla pagina di Importazione.</p>
</div>
</div>