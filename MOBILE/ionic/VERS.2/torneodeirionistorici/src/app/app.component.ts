//declare var push: any;

import { Component } from '@angular/core';
import { Platform } from 'ionic-angular';
import { StatusBar, Push } from 'ionic-native';

import { HttpService } from '../providers/http-service';

import { HomePage } from '../pages/home/home';

@Component({
  template: `<ion-nav [root]="rootPage"></ion-nav>`
})
export class TorneoRioniStorici {
  rootPage = HomePage;

  constructor(platform: Platform, private httpService: HttpService) {
    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();

      //this.pushNotifications();

      //cordova plugin add phonegap-plugin-push --variable SENDER_ID="274440871330"
      console.log('constructor');

      var push = Push.init({
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
      });

      console.log('push: '+push);

      push.on('registration', (data) => {
        console.log(data.registrationId);
        alert(data.registrationId.toString());
        
        //Error in Success callbackId: PushNotification272037515 : TypeError: Cannot read property 'getCallHttp' of undefined
        this.httpService
          .getCallHttp('registrationDevice',data.registrationId,'','','','')
          .then(res => {
            if(res[0].response[0].result == 'OK') {
              console.log('data: '+data);
            }
          })
          .catch(error => {
            console.log('ERROR: ' + error);
          });
        
      });
      push.on('notification', (data) => {
        console.log(data);
        alert("Hi, Am a push notification");
      });
      push.on('error', (e) => {
        console.log(e.message);
      });
    });
  }

/*
  pushNotifications(): void {

    push = Push.init({
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
    });

    push.on('registration', (data) => {
      console.log(data.registrationId);
      alert(data.registrationId.toString());
      
      //Error in Success callbackId: PushNotification272037515 : TypeError: Cannot read property 'getCallHttp' of undefined
      this.httpService
        .getCallHttp('registrationDevice',data.registrationId,'','','','')
        .then(res => {
          if(res[0].response[0].result == 'OK') {
            console.log('data: '+data);
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
      
    });
    push.on('notification', (data) => {
      console.log(data);
      alert("Hi, Am a push notification");
    });
    push.on('error', (e) => {
      console.log(e.message);
    });
  }
*/
}