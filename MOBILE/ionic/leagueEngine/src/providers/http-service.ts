import {Injectable} from '@angular/core';
import { Http, Response, Headers, RequestOptions }   from '@angular/http';
import { Device } from '@ionic-native/device';

import { Observable }       from 'rxjs/Observable';
//import { Observable }       from 'rxjs/Rx';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';
import 'rxjs/add/observable/throw';
  
@Injectable() 
export class HttpService {  

    torneoId: String = '';

    constructor(private http:Http, private device: Device) {
         this.http = http;
    }
  
    /**
    Installare chrome addons:
    https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
    */
    getCallHttp(call,teamId,playerIdOrRound,matchIdOrType,statOrGroup,tipologiaOrObject) {
        console.log('getCallHttp: '+call+' | '+teamId+' | '+playerIdOrRound+' | '+matchIdOrType);

        //Fantacoast Birra Ravello Cup        
        //let host = 'http://localhost/alefal.it/PROJECTS/leagueengine';
        let host = 'http://www.amalficoastapps.it/demo/leagueengine';
        
        let url     = '';
        let headers = new Headers({ 'Content-Type': 'application/x-www-form-urlencoded' });
        let options = new RequestOptions({ headers: headers });
        let body    = new URLSearchParams();

        if(call == 'getTorneo') {
            if(tipologiaOrObject != '') {
                this.torneoId = tipologiaOrObject;
            }
            url = '/wp-content/plugins/alefal_leagueengine/le_typeTournament.php?torneoId='+this.torneoId;
        } 
        else if(call == 'getSponsors') {
            url = '?json=get_tag_posts&tag_slug=sponsors';
        }
        else if(call == 'getComunicatiUfficiali') {
            url = '?json=get_tag_posts&tag_slug=comunicatiUfficiali';
        } 
        else if(call == 'getFotoVideo') {
             url = '?json=get_tag_posts&tag_slug=fotoVideo';
        } 
        else if(call == 'getSquadre') {
            url = '/wp-content/plugins/alefal_leagueengine/le_teams.php?tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti.php?team_id='+teamId+'&tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getGiocatoriAll') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_all.php?tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getGiocatoriStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_statistiche.php?player_id='+playerIdOrRound;
        } 
        else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_leagueengine/le_ranking.php?tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_statistiche.php?stat='+statOrGroup+'&tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getIncontri') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchs.php?round='+playerIdOrRound+'&tipologiaTorneo='+tipologiaOrObject+'&group='+statOrGroup+'&type='+matchIdOrType+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getIncontroEventi') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchEvent.php?event='+encodeURIComponent(tipologiaOrObject)+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getTabellino') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchDetails.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologiaOrObject+'&torneoId='+this.torneoId;
        } 
        else if(call == 'getIncontroAttr') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchAttr.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'registrationDevice') {
            url = '/wp-content/plugins/alefal_notificationGCM/registerGCM.php?register_id='+teamId+'&register_model='+this.device.model;
        }

        console.log('URL: '+url);

        return this.http.post(host + '' + url, body.toString(), options)
            .map(this.extractData)
            .catch(this.handleError);

        /*
        var response = this.http.get(host+''+url, {}, {})
            .then(data => {
                response => response.json()
            })
            .catch(error => {
                this.handleError
            });
        return response;
        */
    }

    private extractData(res: Response) {
        let body = res.json();
        return body || {};
    }

    private handleError(error: Response | any) {
        // In a real world app, you might use a remote logging infrastructure
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json() || '';
            const err = body.error || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        console.error(errMsg);
        return Observable.throw(errMsg);
    }
}