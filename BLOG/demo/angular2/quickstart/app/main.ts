import {bootstrap}    	from '@angular/platform-browser-dynamic';
import {AppComponent} 	from './app.component';
import {User} 			from './generic';	//Importo la classe definita con la parola chiave "export"

bootstrap(AppComponent);

var user = new User('Ale', 'Fal');
alert(user.hello());