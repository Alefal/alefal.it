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
  
    getCallHttp(call,teamId,playerId,matchId) {
        console.log('getCallHttp: '+call+' | '+teamId+' | '+playerId+' | '+matchId);
        
        //var host = 'http://torneodeirionistorici.altervista.org';
        //var host = '/torneodeirionistorici/rest';
        var host = '/PROJECTS/wordpress_452';

        //var host = '/demo/leagueengine';
        //var host = 'http://www.amalficoastapps.it/demo/leagueengine';
        
        var url = '';
        if(call == 'getComunicatiUfficiali') {
            url = '?json=get_tag_posts&tag_slug=comunicatiUfficiali';
        } else if(call == 'getRioniNews') {
             url = '?json=get_tag_posts&tag_slug=giornalinoUfficiale';
        } else if(call == 'getSquadre') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_teams.php';
        } else if(call == 'getSquadraLogo') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_team.php?team_id='+teamId;
        } else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_atleti.php?team_id='+teamId;
        } else if(call == 'getGiocatoriStatistiche') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_atleti_statistiche.php?player_id='+playerId;
        } else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/ranking.php';
        } else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_torneodeirionistorici/tdrs_marcatori.php?tipo='+playerId;         //TODO: cambiare nome al servizio "tdrs_statistiche.php"
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