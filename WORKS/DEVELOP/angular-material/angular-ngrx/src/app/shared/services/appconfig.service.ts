import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { IAppConfig } from '../models/interfaces/app-config.model';
import { Store } from '@ngrx/store';
import AppState from '../../store/state/app.state';
import { map } from 'rxjs/operators';

@Injectable()
export class AppConfigService {

    config: IAppConfig;

    constructor(
        private http: HttpClient,
        private store: Store<{ appState: AppState }>
    ) {}

    load(overwrite: boolean) {
        const jsonFile = `assets/config/config.${environment.name}.json.js`;
        return new Promise<void>((resolve, reject) => {
            this.http.get(jsonFile + '?' + Date.now()).toPromise().then((response: HttpResponse<any>) => {
                this.config = response as any;
                this.store.pipe(
                    map(x => {
                      x.appState.Config = this.config;
                    })
                  )
                  .subscribe();
                resolve();
            }).catch((response: any) => {
               reject(`Could not load file '${jsonFile}': ${JSON.stringify(response)}`);
            });
        });
    }
}
