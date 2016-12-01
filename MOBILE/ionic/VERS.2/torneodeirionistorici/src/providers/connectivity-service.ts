//declare var connectivityFound: boolean;

import { Injectable } from '@angular/core';
import { Platform, AlertController, ToastController, NavController, App } from 'ionic-angular';
import { Network } from 'ionic-native';

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
    private app:App
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
    Network.onDisconnect().subscribe(() => {
      console.log('network was disconnected :-( ');
      this.connectivityFound = false;
    });

    // watch network for a connection
    Network.onConnect().subscribe(() => {
      console.log('network connected!');

      if(localStorage.getItem('liveEventsArray') === null) {
        console.log('Nessun evento da sincronizzare!');
      } else {
        let events = JSON.parse(localStorage.getItem('liveEventsArray'));

        for (let event of events) {
          console.log(JSON.stringify(event)); 
          
          this.httpService
            .getCallHttp('getIncontroEventi','','','','',event)
            .then(res => {
              console.log('SUCCESS: ' + JSON.stringify(res));

              if(res[0].response[0].result == 'OK') {
                console.log('OK: '+JSON.stringify(event));
              } else {
                console.log('KO: '+JSON.stringify(event));
              }
            })
            .catch(error => {
              console.log('ERROR: ' + error);
            });
          
        }
      }

      this.connectivityFound = true;
      setTimeout(() => {
        if (Network.connection === 'wifi') {
          console.log('we got a wifi connection, woohoo!');
        }
      }, 3000);
    });
  }

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