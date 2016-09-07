import {Component} from '@angular/core';
import {NavController, Platform} from 'ionic-angular';
import { Facebook } from 'ionic-native';

import {FbProvider} from '../../providers/fb-provider/fb-provider';

@Component({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {

  posts: any;

  constructor(
    private navCtrl: NavController,
    platform: Platform,
    fbProvider: FbProvider
  ) {

    // Login
    fbProvider.login().then((responseLogin) => {
      console.log('responseLogin: ', JSON.stringify(responseLogin));

      // Me
      fbProvider.me().then((responseMe) => {
        console.log('me: ', JSON.stringify(responseMe));
        console.log('Good to see you, ' + responseMe.name + '.');
      }, (err) => {
        console.error('Unable to execute me: ', err);
      });
      
    }, (err) => {
      console.error('Unable to execute login: ', err);
    });
    
    // Posts Page
    fbProvider.postsPage().then((responsePostsPage) => {
      console.log('me: ', JSON.stringify(responsePostsPage));
      this.posts = responsePostsPage.data;
    }, (err) => {
      console.error('Unable to execute postsPage: ', err);
    });

    /** AppInvite
    fbProvider.appInvite().then((responseAppInvite) => {
      console.log('appInvite: ', JSON.stringify(responseAppInvite));
    }, (err) => {
      console.error('Unable to execute appInvite: ', err);
    });
    */
  }
}
