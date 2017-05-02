import { Component } from '@angular/core';
import { NavParams } from 'ionic-angular';
//import {HttpService} from '../../providers/http-service';

@Component({
  selector: 'page-classifica-detail',
  templateUrl: 'classifica-detail.html'
})
export class ClassificaDetail {

  rank: any;
  loading: any;
  errorMessage: String;
  errorMessageView: any;

  constructor(params: NavParams) { 
    this.rank = params.get('rank');
  }

  ionViewDidLoad() {
    console.log('Hello Classifica Detail Page');
  }

}
