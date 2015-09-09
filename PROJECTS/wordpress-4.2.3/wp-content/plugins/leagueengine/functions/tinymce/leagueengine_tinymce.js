(function() {
	tinymce.create('tinymce.plugins.leagueengine', {

		init : function(ed, url) {
			
			/*
			|--------------------------------------------------------------------------
			| Main Variables
			|--------------------------------------------------------------------------
			*/
			
			var t = this;
			t.url = url;
												
			/*
			|--------------------------------------------------------------------------
			| Register the command to open the testimonialsshortcode popup
			|--------------------------------------------------------------------------
			*/

			ed.addCommand('open_leagueengine_shortcode_popup', function() {

				// Console
				//console.log("parameters = %o", t.values);
				
				ed.windowManager.open({
					file : url + '/popup.php',
					width : 600 + parseInt(ed.getLang('button.delta_width', 0)),
					height : 600 + parseInt(ed.getLang('button.delta_height', 0)),
					inline : 1
				}, {
					plugin_url : url,
					parameters: t.values,
					leagueengine_url: leagueengine.plugin_url,
					leagueengine_date_format: leagueengine.date_format
				});

			});

			/*
			|--------------------------------------------------------------------------
			| Open testimonials shortcode popup on double click and load shortcode variables
			|--------------------------------------------------------------------------
			*/
			
			ed.onDblClick.add(function(ed, e) {
				
				if ( e.target.nodeName == 'IMG' && ed.dom.hasClass(e.target, 'leagueengine_shortcode') ) {
					var target_content = e.target.title.replace("leagueengine ", "");
					var re_key_value = /([a-zA-Z0-9_]*)=\"([a-zA-Z0-9_]*)\"/g;
					var match;
					
					t.values = new Array();
					
					// For each key-value
					while ( ( match = re_key_value.exec(target_content) ) != null )
					{
						// console.log("key : " + match[1]);
						// console.log("value : " + match[2]);
						t.values[ match[1] ] = match[2];
					}
					
					ed.execCommand("open_leagueengine_shortcode_popup");
				}
			});

			//replace shortcode before editor content set
			ed.onBeforeSetContent.add(function(ed, o) {
				o.content = t._do_leagueengine_shortcode(o.content);
			});

			
			//replace shortcode as its inserted into editor (which uses the exec command)
			ed.onExecCommand.add(function(ed, cmd) {
			    if (cmd ==='mceInsertContent'){
					tinyMCE.activeEditor.setContent( t._do_leagueengine_shortcode(tinyMCE.activeEditor.getContent()) );
				}
			});
			
			//replace the image back to shortcode on save
			ed.onPostProcess.add(function(ed, o) {
				if (o.get)
					o.content = t._get_leagueengine_shortcode(o.content);
			});

	        
			ed.addCommand('mceinsertleagueengine', function() {
				ed.execCommand("open_leagueengine_shortcode_popup");
			});
			 
			
			ed.addButton('leagueengine', {
				title : 'LeagueEngine', 
				cmd : 'mceinsertleagueengine', 
				image: leagueengine.plugin_url + '/functions/tinymce/images/icon.png' 
			});


		},
		
		createControl : function(n, cm) {
            return null;
        },
        
		_do_leagueengine_shortcode : function(co) {
			return co.replace(/\[leagueengine([^\]]*)\]/g, function(a,b){
				return '<img style="height: 100px !important;width: 100% !important;background: #F5F5F5 url('+leagueengine.plugin_url+'/functions/tinymce/images/shortcode.png) no-repeat scroll center center !important; border: 1px dashed #333 !important;" src="'+leagueengine.plugin_url+'/functions/tinymce/images/t.gif" class="leagueengine_shortcode mceItem" title="leagueengine'+tinymce.DOM.encode(b)+'" id="leagueengine" />';
			});
		},
		
		_get_leagueengine_shortcode : function(co) {

			function getAttr(s, n) {
				n = new RegExp(n + '=\"([^\"]+)\"', 'g').exec(s);
				return n ? tinymce.DOM.decode(n[1]) : '';
			};

			return co.replace(/(?:<p[^>]*>)*(<img[^>]+>)(?:<\/p>)*/g, function(a,im) {
				var cls = getAttr(im, 'class');

				if ( cls.indexOf('leagueengine_shortcode') != -1 )
					return '<p>['+tinymce.trim(getAttr(im, 'title'))+']</p>';

				return a;
			});
		},
		
		// Get TinyMCE plugin data
		getInfo : function() {
			return {
				longname : 'LeagueEngine',
				author : '2DMonkey',
				authorurl : 'http://2dmonkey.com',
				infourl : '',
				version : "1.0"
			};
		}
		

	});

	tinymce.PluginManager.add('leagueengine', tinymce.plugins.leagueengine);
})();
