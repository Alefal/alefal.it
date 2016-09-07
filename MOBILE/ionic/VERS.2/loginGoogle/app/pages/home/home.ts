import {Component} from '@angular/core';
import {NavController} from 'ionic-angular';
import {GooglePlus} from 'ionic-native'; 

@Component({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {

  public userData; 
  constructor(private navCtrl: NavController) {
  
  }

  loginUser() { 
    GooglePlus.login({}) 
      .then( 
      (res) => { 
        console.log('good'); 
        this.userData = res; 
      }, 
      (err) => { 
        console.log('error'); 
        console.log(err); 
      }); 
  } 

  logoutUser() { 
    GooglePlus.logout().then(() => this.userData = null); 
  } 
}
