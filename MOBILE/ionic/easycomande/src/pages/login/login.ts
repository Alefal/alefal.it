import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController, AlertController } from 'ionic-angular';

import { User }         from '../../models/user';
import { TabsPage }     from '../tabs/tabs';

import { HttpService }  from '../../providers/http-service';

@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {

  user: User = new User();

  loading: any;
  errorMessage: string;
  errorMessageView: any;

  //SERVER INFORMATION
  public tap: number = 0;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController,
  ) { }

  ionViewDidLoad() {
    console.log('Hello Login Page');

    if(localStorage.getItem('currentUserRemeberMe')) {
      this.user.username    = localStorage.getItem('currentUserEmail');
      this.user.password    = localStorage.getItem('currentUserPass');
      this.user.rememberme  = localStorage.getItem('currentUserRemeberMe');
      this.login();
    }
  }

  login(){
    //let username = this.params.get('username');
    //let password = this.params.get('password');

    console.log('username: '+this.user.username+' | password: '+this.user.password);

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('authentication',this.user.username,this.user.password,'','')
      .subscribe(user => {
        console.log('user: '+JSON.stringify(user));

        if(user.logged == 'autenticated') {
          
          if(this.user.rememberme) {
            localStorage.setItem('currentUserEmail', this.user.username);
            localStorage.setItem('currentUserPass', this.user.password);
            localStorage.setItem('currentUserRemeberMe', this.user.rememberme);
          }
          localStorage.setItem('api_token', user.api_token);
          this.navCtrl.setRoot(TabsPage);
        } else {
          this.errorMessage = 'Username o Password errati!';
          this.errorMessageView = true;
        }

        this.loading.dismiss();
      },
      error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'LOGIN: problemi di comunicazione col server';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

  tapEvent(e) {
    this.tap++;
    if(this.tap == 10) {
      this.httpService.getServerInformation();
      this.tap = 0;
    }
  }

}
