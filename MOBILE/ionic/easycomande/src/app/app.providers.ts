import { IonicErrorHandler, ToastController }    from 'ionic-angular';

import { ErrorHandler }         from '@angular/core';

import { Network }              from '@ionic-native/network';
import { StatusBar }            from '@ionic-native/status-bar';
import { SplashScreen }         from '@ionic-native/splash-screen';

import { HttpService }          from '../providers/http-service';
import { ConnectivityService }  from '../providers/connectivity-service';
 
//Mock class: before of @NgModule
class NetworkMock extends Network {
  // ?????
}
 
export class AppProviders {
 
    public static getProviders() {
 
        let providers;
 
        if(document.URL.includes('https://') || document.URL.includes('http://')){
 
          // Use browser providers
          providers = [
            HttpService,
            ConnectivityService,
            StatusBar,
            SplashScreen,
            {provide: Network, useClass: NetworkMock}, //MOCK
            {provide: ErrorHandler, useClass: IonicErrorHandler}
          ];
 
        } else {
 
          // Use device providers
          providers = [
            HttpService,
            ConnectivityService,
            StatusBar,
            SplashScreen,
            Network,
            {provide: ErrorHandler, useClass: IonicErrorHandler}
          ];  
 
        }
 
        return providers;
 
    }
 
}