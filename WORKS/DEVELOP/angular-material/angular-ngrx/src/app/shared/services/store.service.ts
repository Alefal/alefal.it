import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IAppConfig } from '../models/interfaces/app-config.model';
import { Store, select } from '@ngrx/store';
import AppState from '../../store/state/app.state';

import { getAppConfig } from '../../store/selectors/app.selectors';
import { map } from 'rxjs/operators';

@Injectable()
export class StoreService {

  appConfig$: Observable<any>;
  appConfig: IAppConfig;
  
  constructor(
    private store: Store<{ appState: AppState }>
  ) { 
    this.appConfig$ = this.store.pipe(select(getAppConfig));

    // SELECTOR AppState -> Config 
    this.appConfig$
      .pipe(
        map(el => {
          this.appConfig = el;
        })
      )
      .subscribe();
  }
}
