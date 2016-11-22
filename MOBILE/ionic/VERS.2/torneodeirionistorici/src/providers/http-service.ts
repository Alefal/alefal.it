import {Injectable} from '@angular/core';
import {Http} from '@angular/http';

import { Device } from 'ionic-native';

//import {Observable} from 'rxjs/Observable';
import 'rxjs/Rx';
import 'rxjs/add/operator/toPromise';
  
@Injectable() 
export class HttpService {  
    constructor(private http:Http) {
         this.http = http;
    }
  
    /**
    Installare chrome addons:
    https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
    */
    getCallHttp(call,teamId,playerIdOrRound,matchIdOrType,statOrGroup,tipologia) {
        console.log('getCallHttp: '+call+' | '+teamId+' | '+playerIdOrRound+' | '+matchIdOrType);
        
        var host = 'http://localhost/alefal.it/PROJECTS/leagueengine';
        //var host = '/demo/leagueengine';
        //var host = 'http://www.amalficoastapps.it/demo/leagueengine';
        
        var url = '';
        if(call == 'getTorneo') {
            url = '/wp-content/plugins/alefal_leagueengine/le_typeTournament.php';
        } else if(call == 'getComunicatiUfficiali') {
            url = '?json=get_tag_posts&tag_slug=comunicatiUfficiali';
        } else if(call == 'getRioniNews') {
             url = '?json=get_tag_posts&tag_slug=fotoVideo';
        } else if(call == 'getSquadre') {
            url = '/wp-content/plugins/alefal_leagueengine/le_teams.php?tipologiaTorneo='+tipologia;
        } else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti.php?team_id='+teamId+'&tipologiaTorneo='+tipologia;
        } else if(call == 'getGiocatoriStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_statistiche.php?player_id='+playerIdOrRound;
        } else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_leagueengine/le_ranking.php?tipologiaTorneo='+tipologia;
        } else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_statistiche.php?stat='+statOrGroup+'&tipologiaTorneo='+tipologia;
        } else if(call == 'getIncontri') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchs.php?round='+playerIdOrRound+'&tipologiaTorneo='+tipologia+'&group='+statOrGroup+'&type='+matchIdOrType;
        } else if(call == 'getTabellino') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchDetails.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologia;
        } else if(call == 'getIncontroAttr') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchAttr.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologia;
        } else if(call == 'registrationDevice') {
            url = '/wp-content/plugins/alefal_notificationGCM/registerGCM.php?register_id='+teamId+'&register_model='+Device.device.model;
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