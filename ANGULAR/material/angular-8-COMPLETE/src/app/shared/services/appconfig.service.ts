import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { IAppConfig } from '../models/interfaces/app-config.model';

@Injectable()
export class AppConfigService {

    static config: IAppConfig;

    constructor(private http: HttpClient) {}

    load(overwrite: boolean) {
        const jsonFile = `assets/config/config.${environment.name}.json.js`;
        return new Promise<void>((resolve, reject) => {
            this.http.get(jsonFile + '?' + Date.now()).toPromise().then((response: HttpResponse<any>) => {
                AppConfigService.config = response as any;
            }).catch((response: any) => {
               reject(`Could not load file '${jsonFile}': ${JSON.stringify(response)}`);
            });
        });
    }
}
