//declare var connectivityFound: boolean;

import { Injectable } from '@angular/core';
import { Platform, AlertController, ToastController, NavController, App } from 'ionic-angular';
import { Network } from 'ionic-native';

@Injectable()
export class ConnectivityService {
 
  onDevice: boolean;
  connectivityFound: boolean;
  
  private nav:NavController;
 
  constructor(
    private platform: Platform,
    public alertCtrl: AlertController,
    public toastCtrl: ToastController,
    private app:App
  ){

    this.connectivityFound = true; //TODO: cambiare a TRUE
    console.log('ConnectivityService: '+this.connectivityFound);

    this.nav = app.getActiveNav();

    this.onDevice = this.platform.is('ios') || this.platform.is('android');
    if(this.onDevice) {
      this.load();
    }
  }

  load() {
    Network.onDisconnect().subscribe(() => {
      console.log('network was disconnected :-( ');
      this.connectivityFound = false;
    });

    // watch network for a connection
    Network.onConnect().subscribe(() => {
      console.log('network connected!');
      this.connectivityFound = true;
      setTimeout(() => {
        if (Network.connection === 'wifi') {
          console.log('we got a wifi connection, woohoo!');
        }
      }, 3000);
    });
  }
  /*
  showAlert() {
    let alert = this.alertCtrl.create({
      title: 'Connessione assente!',
      subTitle: 'I dati richiesti sono disponibili solo online',
      buttons: ['OK']
    });
    alert.present();
  }

  showInfo() {
    let alert = this.alertCtrl.create({
      title: 'Connessione assente!',
      subTitle: 'I dati potrebbero non essere aggiornati',
      buttons: ['OK']
    });
    alert.present();
  }
  */

  showAlert() {
    let toast = this.toastCtrl.create({
      message: 'Connessione assente! I dati richiesti sono disponibili solo online',
      duration: 3000
    });
    toast.present();
  }
  showInfo() {
    let toast = this.toastCtrl.create({
      message: 'Connessione assente! I dati potrebbero non essere aggiornati',
      duration: 3000
    });
    toast.present();
  }
  showInfoNoData() {
    let alert = this.alertCtrl.create({
      title: 'Connessione assente!',
      subTitle: 'Nessun dato disponibile',
      buttons: [
        {
          text: 'Ok',
          handler: () => {
            this.nav.popToRoot();
          }
        }
      ]
    });
    alert.present();
  }

}