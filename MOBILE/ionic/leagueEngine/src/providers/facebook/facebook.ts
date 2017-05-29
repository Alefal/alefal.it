import { Injectable } from '@angular/core';
import 'rxjs/add/operator/map';

import { Facebook } from '@ionic-native/facebook';

@Injectable()
export class FacebookProvider {

  constructor(private fb: Facebook) {
    console.log('Hello FacebookProvider Provider');
  }

  login() {
    console.log('FbProvider => login()');
    var responseLogin = this.fb.login(['public_profile', 'user_friends']);
    return responseLogin;
  }

  me() {
    console.log('FbProvider => me()');
    var responseMe = this.fb.api('me?fields=id,name,friends.limit(5){name}', ['user_birthday', 'user_friends']);
    //var responseMe = Facebook.api('me?fields=id,name', ['user_birthday', 'user_friends']);
    return responseMe;
  }

  appInvite() {
    console.log('FbProvider => appInvite()');
    var responseAppInvite = this.fb.appInvite({
      url: "https://www.google.it",
      picture: "https://www.google.it/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
    });
    return responseAppInvite;
  }

  postsPage() {
    console.log('FbProvider => postsPage()');
    var responsePostsPage = this.fb.api('827924854014826/feed?fields=created_time,message,picture,id,link', ['user_friends']);
    return responsePostsPage;
  }

}
