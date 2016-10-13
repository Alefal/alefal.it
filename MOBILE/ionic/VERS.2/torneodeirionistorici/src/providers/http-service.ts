import {Injectable} from '@angular/core';
import {Http} from '@angular/http';
//import {Observable} from 'rxjs/Observable';
import 'rxjs/Rx';
import 'rxjs/add/operator/toPromise';
  
@Injectable() 
export class HttpService {  
    constructor(private http:Http) {
         this.http = http;
    }
  
    getCallHttp(call,teamId,tipoStat,matchId) {
        console.log('getCallHttp: '+call+' | '+teamId+' | '+tipoStat+' | '+matchId);
        
        var host = 'http://torneodeirionistorici.altervista.org';
        //var host = '/torneodeirionistorici/rest';
        var url = '';
        if(call == 'getComunicatiUfficiali') {
            url = '/wp-json/posts?filter[tag]=comunicatiUfficiali';
        } else if(call == 'getRioniNews') {
             url = '/wp-json/posts?filter[tag]=giornalinoUfficiale';
        } else if(call == 'getSquadre') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_teams.php';
        } else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_atleti.php?team_id='+teamId;
        } else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/ranking.php?league_id=171&season_id=172';   //TODO: inserire gli ID's nel servizio php
        } else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_marcatori.php?tipo='+tipoStat;         //TODO: cambiare nome al servizio "tdrs_statistiche.php"
        } else if(call == 'getIncontri') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_matchs.php';
        } else if(call == 'getTabellino') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_matchDetails.php?match_id='+matchId;
        } else if(call == 'checkUpdateApp') {
            url = '/wp-content/plugins/alefal_notificationGCM/checkUpdateApp.php?nameApp=NAME';                 //non usata perchè è su Google Play
        }

        console.log('URL: '+url);

        var response = this.http.get(host+''+url)
               .toPromise()
               .then(response => response.json())
               .catch(this.handleError);
        return response;
    }

    private handleError(error: any) {
        console.error('An error occurred', error);
        return Promise.reject(error.message || error);
    }
}