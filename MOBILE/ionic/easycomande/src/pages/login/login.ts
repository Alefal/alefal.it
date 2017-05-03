import { Component } from '@angular/core';
import { NavController, NavParams, LoadingController } from 'ionic-angular';

import { HomePage }             from '../home/home';

import { HttpService }          from '../../providers/http-service';

@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {

  username:   string = 'manager';
  password:   string = 'manager';
  userLogged: string;

  loading: any;
  errorMessage: string;
  errorMessageView: any;

  constructor(
    public navCtrl: NavController,
    public params: NavParams, 
    private httpService: HttpService,
    public loadingCtrl: LoadingController
  ) { }

  ionViewDidLoad() {
    console.log('Hello Login Page');
  }

  login(){
    //let username = this.params.get('username');
    //let password = this.params.get('password');

    console.log('username: '+this.username+' | password: '+this.password);

    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('authentication',this.username,this.password,'','')
      .then(res => {
        console.log('res: '+JSON.stringify(res));

        if(res.status == 'error') {
          this.errorMessage = res.error;
          this.errorMessageView = true;
        } else if(res.status == 'ok') {
          this.userLogged = res.user.nickname;

          this.navCtrl.setRoot(HomePage);
        } else {
          this.errorMessage = 'Error!';
          this.errorMessageView = true;
        }
        /*
        -> ERROR
        {"status":"error","error":"Invalid username/email and/or password."}
        
        -> SUCCESS
        {  
          "status":"ok",
          "cookie":"admin|1479202274|HmSrJQ5F108eMjy1YbFXDw4SN2HWONkDoxLdecfXdua|7207047a09cb9792198f5bbc47e1786312fecd11df35c708eee670bf2a4167df",
          "cookie_name":"wordpress_logged_in_6087a37993e6306ed3a245a1f81a262b",
          "user":{  
              "id":1,
              "username":"admin",
              "nicename":"admin",
              "email":"alefalwebmaster@gmail.com",
              "url":"",
              "registered":"2016-05-09 12:51:37",
              "displayname":"admin",
              "firstname":"",
              "lastname":"",
              "nickname":"admin",
              "description":"",
              "capabilities":{  
                "administrator":true
              },
              "avatar":null
          }
        }
        */
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Error!';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }

}
