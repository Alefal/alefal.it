//declare var push: any;

import { Component, ViewChild } from '@angular/core';
import { Platform, NavController } from 'ionic-angular';
import { StatusBar, Push } from 'ionic-native';

import { HttpService } from '../providers/http-service';

import { HomePage }       from '../pages/home/home';
import { Comunicati }     from '../pages/comunicati/comunicati';
import { FotoVideo }      from '../pages/foto-video/foto-video';
import { Incontri }       from '../pages/incontri/incontri';
import { Classifica }     from '../pages/classifica/classifica';

@Component({
  template: `<ion-nav #myNav [root]="rootPage"></ion-nav>`
})
export class TorneoRioniStorici {
  @ViewChild('myNav') nav: NavController
  rootPage = HomePage;

  constructor(platform: Platform,private httpService: HttpService) {

    platform.ready().then(() => {

      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.
      StatusBar.styleDefault();

      //this.pushNotifications();

      //cordova plugin add phonegap-plugin-push --variable SENDER_ID="274440871330"
      /*** DECOMMENTARE IL PRODUZIONE *****/
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

      if(push.on) {
        console.log('push: '+push);

        push.on('registration', (data) => {
          console.log(data.registrationId);
          //alert(data.registrationId.toString());
          
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
          let json = JSON.parse(JSON.stringify(data.additionalData));
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
            this.nav.push(HomePage);
          }
     
          //alert("Hi, Am a push notification");
        });
        push.on('error', (e) => {
          console.log(e.message);
        });
      }
      /*** ***/
    });
  }
}