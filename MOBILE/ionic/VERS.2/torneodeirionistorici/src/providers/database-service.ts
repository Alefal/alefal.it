import { Injectable } from '@angular/core';
//import { Http } from '@angular/http';
//import { Observable } from 'rxjs/Observable';
import { SQLite } from 'ionic-native';

import 'rxjs/Rx';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class DatabaseService {

    private db = new SQLite();
    constructor() { }

    createDbSqlLite() {
        this.db.openDatabase({
            name: 'amalficoastapps.db',
            location: 'default' // the location field is required
        }).then(() => {
            this.db.executeSql('CREATE TABLE IF NOT EXISTS favorite (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, lat LONG, lon LONG)', {}).then((data) => {
                console.log('TABLE CREATED: ', data);
            }, (err) => {
                console.error('Unable to execute sql: ', err);
            });
        }, (err) => {
            console.error('Unable to open database: ', err);
        });
    }

    executeSql(sql): string {
        console.log('Execute SQL: ' + sql);
        let message = '';
        this.db.openDatabase({
            name: 'amalficoastapps.db',
            location: 'default' // the location field is required
        }).then(() => {
            this.db.executeSql(sql, {}).then((data) => {
                console.log('Success: ', data);
                message = 'Aggiunto ai preferiti';
            }, (err) => {
                console.error('Unable to execute sql: ', err);
                message = 'Si è verificato un problema. Riprovare più tardi!';
            });
        }, (err) => {
            console.error('Unable to open database: ', err);
            message = 'Unable to open database';
        });
        return message;
    }
    
}