import { Component, ViewChild }           from '@angular/core';
import { Nav, Platform }                  from 'ionic-angular';
import { StatusBar }                      from '@ionic-native/status-bar';
import { SplashScreen }                   from '@ionic-native/splash-screen';
import { Push, PushObject, PushOptions }  from '@ionic-native/push';
import { OneSignal }                      from '@ionic-native/onesignal';

import { HttpService }    from '../providers/http-service';

import { PostsPage }      from '../pages/posts/posts';
import { HomePage }       from '../pages/home/home';
import { Incontri }       from '../pages/incontri/incontri';
import { Classifica }     from '../pages/classifica/classifica';
import { Statistiche }    from '../pages/statistiche/statistiche';
import { Squadre }        from '../pages/squadre/squadre';

@Component({
  templateUrl: 'app.html'
})
export class RavelloBirraCup {
  @ViewChild(Nav) nav: Nav;
  rootPage: any = PostsPage;

  pages: Array<{title: string, component: any, icon: string}>;

  constructor(
    public platform: Platform, 
    public statusBar: StatusBar, 
    public splashScreen: SplashScreen,
    private httpService: HttpService,
    private push: Push,
    private _oneSignal: OneSignal
  ) {
    this.initializeApp();

    // used for an example of ngFor and navigation
    this.pages = [
      { title: 'News',        component: PostsPage,     icon: 'list-box' },
      { title: 'Torneo',      component: HomePage,      icon: 'football' },
      { title: 'Incontri',    component: Incontri,      icon: 'information' },
      { title: 'Classifica',  component: Classifica,    icon: 'quote' },
      { title: 'Statistiche', component: Statistiche,   icon: 'trending-up' },
      { title: 'Squadre',     component: Squadre,       icon: 'people' },
    ];

  }

  initializeApp() {
    this.platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      this.statusBar.styleDefault();
      this.splashScreen.hide();

      this._oneSignal.startInit('9539b123-55d4-41e1-b0c9-4353431b81f5', '981915802905');
      this._oneSignal.inFocusDisplaying(this._oneSignal.OSInFocusDisplayOption.Notification);
      this._oneSignal.setSubscription(true);
      this._oneSignal.handleNotificationReceived().subscribe(
        (notification: any) => {
          console.log('Received a notification', notification);
          // handle received here how you wish.
      });
      this._oneSignal.handleNotificationOpened().subscribe(
        (notification: any) => {
          console.log('Received a notification', notification);
          // handle opened here how you wish.
      });
      this._oneSignal.endInit();  

      /***
      //cordova plugin add phonegap-plugin-push --variable SENDER_ID="274440871330"
      const options: PushOptions = {
        android: {
          vibrate: true,
          sound: true,
          senderID: "274440871330"
        },
        ios: {
          alert: "true",
          badge: true,
          sound: 'false'
        },
        windows: {}
      };
      const pushObject: PushObject = this.push.init(options);

      if(pushObject.on) {
        console.log('pushObject: '+pushObject);

        pushObject.on('registration').subscribe(
          (registration: any) => {
            console.log('Device registered', registration);
            this.httpService
            .getCallHttp('registrationDevice',registration.registrationId,'','','','')
            .then(res => {
              if(res[0].response[0].result == 'OK') {
                console.log('data: '+registration);
              }
            })
            .catch(error => {
              console.log('ERROR: ' + error);
            });
          }
        );

        pushObject.on('notification').subscribe(
          (notification: any) => {
            console.log('Received a notification', notification);
            console.log(notification);
            let json = JSON.parse(JSON.stringify(notification.additionalData));
            //console.log(json.section);

            if(json.section == 'comunicati') {
              this.nav.push(Comunicati);
            } else if(json.section == 'fotovideo') {
              this.nav.push(FotoVideo);
            }  else if(json.section == 'incontri') {
              this.nav.push(Incontri, {
                tipologia: json.tipologia
              });
            }  else if(json.section == 'classifica') {
              this.nav.push(Classifica, {
                tipologia: json.tipologia
              });
            } else {
              this.nav.push(PostsPage);
            }
          }
        );

        pushObject.on('error').subscribe(error => console.error('Error with Push plugin', error));

      }
        ***/
    });
  }

  openPage(page) {
    // Reset the content nav to have just this page
    // we wouldn't want the back button to show in this scenario
    this.nav.setRoot(page.component);
  }
}
