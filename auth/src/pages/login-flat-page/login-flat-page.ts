import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

import { LoadingService } from '../../services/loading-service';
import { LoginService } from '../../services/login-service';
import { ToastService } from '../../services/toast-service'
import { HttpService } from '../../services/http.service'

@IonicPage()
@Component({
  selector: 'login-flat-page',
  templateUrl: 'login-flat-page.html',
  providers: [
    LoginService, ToastService, HttpService, LoadingService
  ]
})
export class LoginFlatPage {

  /*  Necessary data and events
      ================================*/
  data : {};
  events: {};
  loading: any;

  constructor(
    public navCtrl: NavController, 
    public navParams: NavParams, 
    public loadingService: LoadingService,
    public service: LoginService, 
    private toastCtrl: ToastService,
    private httpService: HttpService
  ) {
    this.data = this.service.getDataForLoginFlat();
    this.events =  {
      "onLogin" : this.onLogin
    }
  }

  /*  Todo override this function with your logic
  =================================================*/
  onLogin = (params): void => {
    console.log('params',params);

    this.loadingService.show();

    this.httpService
      .getCallHttp('authentication',params.username,params.password,'','')
      .subscribe(user => {
        console.log('user: '+JSON.stringify(user));

        if(user.logged == 'autenticated') {
          this.toastCtrl.presentToast('Login Now');
        } else {
          this.toastCtrl.presentToast('Login Error!');
        }
        this.loadingService.hide();
      },
      error => {
        console.log('ERROR: ' + error);
        this.loadingService.hide();
        this.toastCtrl.presentToast('Login Error!');
      });
  };
}
