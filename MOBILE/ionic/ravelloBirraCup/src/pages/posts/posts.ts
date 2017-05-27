import { Component, ViewChild } from '@angular/core';
import { Nav, NavController }   from 'ionic-angular';

import { Facebook, FacebookLoginResponse } from '@ionic-native/facebook';
import { SocialSharing } from '@ionic-native/social-sharing';

import { FacebookProvider } from '../../providers/facebook/facebook';

import { HomePage }       from '../home/home';

@Component({
  selector: 'page-posts',
  templateUrl: 'posts.html'
})
export class PostsPage {
  @ViewChild(Nav) nav: Nav;

  posts: any;

  constructor(
    public navCtrl: NavController, 
    private fb: Facebook, 
    private facebookProvider: FacebookProvider,  
    private socialSharing: SocialSharing
  ) {

    this.fb.getAccessToken()
      .then((res: string) => console.log('getAccessToken', res))
      .catch(e => console.log('Error logging into Facebook', e));

    this.fb.login(['public_profile', 'user_friends', 'email'])
      .then((res: FacebookLoginResponse) => console.log('Logged into Facebook!', res))
      .catch(e => console.log('Error logging into Facebook', e));

    //this.fb.logEvent(this.fb.EVENTS.EVENT_NAME_ADDED_TO_CART);

    // Posts Page
    facebookProvider.postsPage().then((responsePostsPage) => {
      console.log('postsPage: ', JSON.stringify(responsePostsPage));
      this.posts = responsePostsPage.data;
      console.log('%ò', this.posts);
    }, (err) => {
      console.error('Unable to execute postsPage: ', err);
    });
    
  }

  share(message) {
    this.socialSharing.share(message, 'Birra Ravello Cup 2017', '', '').then(() => {
      console.log('success');
    }).catch((e) => {
      console.error('error: '+e);
    });
  }

  openPage() {
    this.navCtrl.setRoot(HomePage);
  }

}
