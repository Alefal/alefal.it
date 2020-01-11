import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
//import { NgxSpinnerService } from "ngx-spinner";
import { environment } from '../../../environments/environment';

import { Observable, of, forkJoin } from 'rxjs';

import { catchError, map, tap } from 'rxjs/operators';
import { AppConfigService } from './appconfig.service';
import { StoreService } from './store.service';

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

@Injectable({ providedIn: 'root' })
export class HttpService {
  protected host = '';

  constructor(
    private http: HttpClient,
    private toastr: ToastrService,
    private router: Router,
    private storeService: StoreService
    //private appConfigService: AppConfigService,
    //private spinnerService: NgxSpinnerService
  ) {
    this.host = environment.name === "dev" ? 'http://marketinsights.telecomitalia.local' : this.storeService.appConfig.settings.apiServer.host;
    //this.host = environment.name === "dev" ? 'http://marketinsights.telecomitalia.local' : this.appConfigService.config.settings.apiServer.host;
  }

  /** GET generic from the server */
  getCallHttp(call): Observable<any[]> {
    return this.http.get<any[]>(this.host + '' + call, httpOptions)
      .pipe(
        tap(res => {
          this.catchResponseError(res);
          return res;
        }),
        catchError(this.handleError<any>('getCallHttp'))
      );
  }
  /** POST generic from the server */
  postCallHttp(call, rawData): Observable<any[]> {
    return this.http.post<any[]>(this.host + '' + call, rawData, httpOptions)
      .pipe(
        tap(
          res => {
            this.catchResponseError(res);
            return res;
          },
        ),
        catchError(this.handleError<any>('postCallHttp'))
      );
  }
  /** PUT generic from the server */
  putCallHttp(call, rawData): Observable<any[]> {
    return this.http.put<any[]>(this.host + '' + call, rawData, httpOptions)
      .pipe(
        tap(res => {
          this.catchResponseError(res);
          return res;
        }),
        catchError(this.handleError<any>('putCallHttp'))
      );
  }
  /** DELETE generic from the server */
  deleteCallHttp(call, id): Observable<any> {
    return this.http.delete<any>(this.host + '' + call + '/' + id, httpOptions).pipe(
      tap(_ => this.logInfo(`deleted id=${id}`)),
      catchError(this.handleError<any>('deleteCallHttp'))
    );
  }

  getContentJSON(jsonFile) {
    return this.http.get(jsonFile)
    .pipe(
      tap(
        res => {
          return JSON.stringify(res);
        }
      )
    );
  }

  /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      if (error.status == 401) {
        this.router.navigate(['/login']);
      } else if (error.status === 400) {
        this.showErrorMessage(error.error, 'Error');
      } else {
        console.error(error); // log to console instead
        this.logError(`${operation} failed: ${error.message}`);
        this.router.navigate(['/']);
      }
      return of(result as T);
    };
  }
  private logInfo(message: string) {
    // this.toastr.info(message, 'Info');
  }
  private logError(message: string) {
    this.toastr.error(message, 'XHR Error');
  }

  showErrorMessage(data, title) {
    let errorMessage = '';
    if (data && data.responseCode === -1 && data.payload) {
      errorMessage = data.payload;
    } else if (data && data.responseCode === -2 && data.payload) {
      for (const err of data.payload) {
        errorMessage += err + '; ';
      }
    }
    this.toastr.error(errorMessage, title);
  }

  catchResponseError(res: any) {
    if (res) {
      if (res.ErrorNumber === -99) {
        // this.spinnerService.hide();
        this.errorAlert('Session not valid!');
        return;
      } else if (res.ErrorNumber === -1) {
        // this.spinnerService.hide();
        this.errorAlert('Session expired!');
        return;
      } else if (res.ErrorNumber === 4) {
        // this.spinnerService.hide();
        this.errorAlert('Access Denied!');
        return;
      }

    }
  }

  errorAlert(message: string) {
    console.log(message);
    
    // Swal.fire({
    //   title: message,
    //   text: 'You will be redirect in login page.',
    //   type: 'error',
    //   confirmButtonText: 'Ok',
    //   timer: 5000
    // });
  }
}
