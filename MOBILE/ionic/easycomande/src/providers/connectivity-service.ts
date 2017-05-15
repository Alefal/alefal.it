import { Injectable } from '@angular/core';
import { Platform, AlertController, ToastController, NavController, App } from 'ionic-angular';
import { Network } from '@ionic-native/network';

import { HttpService }          from './http-service';

@Injectable()
export class ConnectivityService {
 
  onDevice: boolean;
  connectivityFound: boolean;
  
  private nav:NavController;
 
  constructor(
    private platform: Platform,
    private httpService: HttpService,
    public alertCtrl: AlertController,
    public toastCtrl: ToastController,
    private app:App,
    private network: Network
  ){

    this.connectivityFound = true; //TODO: cambiare a TRUE per la produzione
    console.log('ConnectivityService: '+this.connectivityFound);

    this.nav = app.getActiveNav();

    this.onDevice = this.platform.is('ios') || this.platform.is('android');
    console.log('ConnectivityService: '+this.onDevice);
    
    if(this.onDevice) {
      this.load();
    }
  }

  load() {
    this.network.onDisconnect().subscribe(() => {
      console.log('network was disconnected :-( ');
      this.shoConnectionInfo('Nessuna connessione di rete :-( ');
      this.connectivityFound = false;
    });

    // watch network for a connection
    this.network.onConnect().subscribe(() => {
      console.log('network connected!');
      this.shoConnectionInfo('Connesso alla rete :-) ');

      if(localStorage.getItem('liveEventsArray') === null) {
        console.log('Nessun evento da sincronizzare!');
      } else {
        //let events = JSON.parse(localStorage.getItem('liveEventsArray'));

        //SINCRONIZZAZIONE
      }

      this.connectivityFound = true;
    });
  }

  shoConnectionInfo(message) {
    let toast = this.toastCtrl.create({
      message: message,
      duration: 3000
    });
    toast.present();
  }

}