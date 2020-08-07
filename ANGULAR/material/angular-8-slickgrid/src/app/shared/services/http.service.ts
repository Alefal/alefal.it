import { Injectable, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from "ngx-spinner";
import { environment } from '../../../environments/environment';

import { Observable, of, forkJoin } from 'rxjs';

import { AppConfigService } from './appconfig.service';

const httpOptionsAuth = {
  headers: new HttpHeaders(
    {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  )
};

@Injectable({ providedIn: 'root' })
export class HttpService {
  
  // Example MOCK API: http://5bce1f21a0c99b001337a9e5.mockapi.io/users
  private ApiURL: string = '';
  private ApiToken: string = '';

  httpOptionsToken = {};

  constructor(
    private http: HttpClient,
    private spinner: NgxSpinnerService,
  ) { }

  getCallHttp(call): Observable<any[]> {
    return this.http.get<any[]>(this.ApiURL + '' + call, this.httpOptionsToken);
  }
  postCallHttp(call, payload): Observable<any[]> {
    return this.http.post<any>(this.ApiURL + '' + call, JSON.stringify(payload), this.httpOptionsToken);
  }
  putCallHttp(call, payload): Observable<any[]> {
    return this.http.put<any>(this.ApiURL + '' + call, payload, this.httpOptionsToken);
  }
  deleteCallHttp(call, payload): Observable<any[]> {
    return this.http.delete<any>(this.ApiURL + '' + call + '/' + payload.id, this.httpOptionsToken);
  }
}
