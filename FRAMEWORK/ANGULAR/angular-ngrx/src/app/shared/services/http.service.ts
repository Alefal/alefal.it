import { Injectable, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from "ngx-spinner";
import { environment } from '../../../environments/environment';

import { Observable, of, forkJoin } from 'rxjs';

import { catchError, map, tap } from 'rxjs/operators';
import { User } from '../models/interfaces/user.interface';

import { AppConfigService } from './appconfig.service';
import { Store, select } from '@ngrx/store';
import AppState from '../../store/state/app.state';
import { getApiURL } from '../../store/selectors/app.selectors';

//import Swal from 'sweetalert2/dist/sweetalert2.js';

const httpOptions = {
  headers: new HttpHeaders(
    {
      'Content-Type': 'application/json',
      'X-CustomHeader': 'custom header value',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET,POST,PATCH,DELETE,PUT,OPTIONS',
      'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token, content-type'
    }
  )
};
const httpOptionsNGRX = {
  headers: new HttpHeaders(
    {
      'Content-Type': 'application/json'
    }
  )
};

@Injectable({ providedIn: 'root' })
export class HttpService {

  // Example MOCK API: http://5bce1f21a0c99b001337a9e5.mockapi.io/users
  private ApiURL: string = '';

  appConfig$: Observable<any>;
  getApiURL$: Observable<string>;

  constructor(
    private http: HttpClient,
    private spinner: NgxSpinnerService,
    private storeApp: Store<{ appState: AppState }>,
  ) { }

  getConfig() {
    console.log('AppConfigService.config', AppConfigService.config);
    //this.ApiURL = AppConfigService.config.settings.apiServer.host;
    
    this.spinner.show();
    
    //FUNZIONA: se richiamato nel CONSTUCTOR non funziona perchè il CONSTUCTOR viene caricato prima dello STORE
    this.getApiURL$ = this.storeApp.pipe(select(getApiURL));
    this.getApiURL$
      .pipe(
        map(item => {
          console.log('getApiURL$', item);
          this.ApiURL = item;
        })
      )
      .subscribe();
  }

  getCallHttpNGRX(call): Observable<any[]> {
    this.getConfig();
    return this.http.get<any[]>(this.ApiURL + '' + call, httpOptionsNGRX);
  }
  postCallHttpNGRX(call, payload): Observable<any[]> {
    return this.http.post<any[]>(this.ApiURL + '' + call, payload, httpOptionsNGRX);
  }
  putCallHttpNGRX(call, payload): Observable<any[]> {
    return this.http.put<any[]>(this.ApiURL + '' + call, payload, httpOptionsNGRX);
  }
  deleteCallHttpNGRX(call, payload): Observable<any[]> {
    return this.http.delete<any[]>(this.ApiURL + '' + call + '/' + payload.id, httpOptionsNGRX);
  }

  ////////// USERS
  getUserDetail(action): Observable<User> {
    this.getConfig();
    return this.http.get<User>(this.ApiURL + '/' + action.id);
  }
  createUser(action): Observable<User> {
    this.getConfig();
    return this.http.post<User>(this.ApiURL, JSON.stringify(action), {
      headers: { 'Content-Type': 'application/json' }
    });
  }
  editUser(action): Observable<User> {
    this.getConfig();
    return this.http.put<User>(this.ApiURL + '/' + action.id, JSON.stringify(action), {
      headers: { 'Content-Type': 'application/json' }
    });
  }
}
