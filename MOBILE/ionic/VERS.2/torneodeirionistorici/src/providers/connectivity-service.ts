import {Injectable} from '@angular/core';
import {Platform} from 'ionic-angular';
import {Network} from 'ionic-native';

@Injectable()
export class ConnectivityService {
 
  onDevice: boolean;
 
  constructor(private platform: Platform){
    console.log('ConnectivityService');
    this.onDevice = this.platform.is('ios') || this.platform.is('android');

    if(this.onDevice) {
      this.load();
    }
  }

  load() {
    Network.onDisconnect().subscribe(() => {
      console.log('network was disconnected :-( ')
    });

    // watch network for a connection
    Network.onConnect().subscribe(() => {
      console.log('network connected!');
      setTimeout(() => {
        if (Network.connection === 'wifi') {
          console.log('we got a wifi connection, woohoo!');
        }
      }, 3000);
    });
  }

}