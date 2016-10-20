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
  
    getCallHttp(call,teamId,playerId,matchId,stat) {
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
            url = '/wp-content/plugins/alefal_leagueengine/le_teams.php';
        } else if(call == 'getSquadreTorneo') {
            url = '/wp-content/plugins/alefal_leagueengine/le_tourn_teams.php';
        } else if(call == 'getSquadraLogo') {
            url = '/wp-content/plugins/alefal_leagueengine/le_team.php?team_id='+teamId;
        } else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti.php?team_id='+teamId;
        } else if(call == 'getGiocatoriStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_statistiche.php?player_id='+playerId;
        } else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_leagueengine/le_ranking.php';
        } else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_statistiche.php?stat='+stat;
        } else if(call == 'getIncontri') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchs.php';
        } else if(call == 'getTabellino') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchDetails.php?match_id='+matchId;
        } else if(call == 'getIncontroAttr') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchAttr.php?match_id='+matchId;
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