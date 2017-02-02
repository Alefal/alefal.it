import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { AngularFire, AuthProviders, AuthMethods, FirebaseListObservable } from 'angularfire2';

@Component({
  selector: 'page-about',
  templateUrl: 'about.html'
})

export class AboutPage {

  errorMessage: string;
  items: FirebaseListObservable<any[]>;

  constructor(public navCtrl: NavController, public af: AngularFire) {
    // Email and password
    af.auth.login({
      email: 'alefalwebmaster@gmail.com',
      password: '123456789',
    },
    {
      provider: AuthProviders.Password,
      method: AuthMethods.Password,
    }).then(function(success) {
      console.log(success);
      alert(success);
    }).catch(function(error) {
      console.error(error);
      alert(error);
    });

    this.items = af.database.list('/items');
    console.log(this.items);

  }

}
