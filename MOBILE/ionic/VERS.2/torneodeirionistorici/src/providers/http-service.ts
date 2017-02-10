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
    getCallHttp(call,teamId,playerIdOrRound,matchIdOrType,statOrGroup,tipologiaOrObject) {
        console.log('getCallHttp: '+call+' | '+teamId+' | '+playerIdOrRound+' | '+matchIdOrType);

        //Torneo dei Rioni Storici 2016/17        
        //var host = 'http://localhost/alefal.it/PROJECTS/leagueengine';
        var host = 'http://torneodeirionistorici.altervista.org';

        //Torneo dei Tifosi 2016
        //var host = 'http://www.amalficoastapps.it/demo/leagueengine';
        
        var url = '';
        if(call == 'getTorneo') {
            url = '/wp-content/plugins/alefal_leagueengine/le_typeTournament.php';
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
            url = '/wp-content/plugins/alefal_leagueengine/le_teams.php?tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getGiocatori') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti.php?team_id='+teamId+'&tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getGiocatoriAll') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_all.php?tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getGiocatoriStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_atleti_statistiche.php?player_id='+playerIdOrRound;
        } 
        else if(call == 'getClassifica') {
            url = '/wp-content/plugins/alefal_leagueengine/le_ranking.php?tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getStatistiche') {
            url = '/wp-content/plugins/alefal_leagueengine/le_statistiche.php?stat='+statOrGroup+'&tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getIncontri') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchs.php?round='+playerIdOrRound+'&tipologiaTorneo='+tipologiaOrObject+'&group='+statOrGroup+'&type='+matchIdOrType;
        } 
        else if(call == 'getIncontroEventi') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchEvent.php?event='+encodeURIComponent(tipologiaOrObject);
        } 
        else if(call == 'getTabellino') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchDetails.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'getIncontroAttr') {
            url = '/wp-content/plugins/alefal_leagueengine/le_matchAttr.php?match_id='+matchIdOrType+'&tipologiaTorneo='+tipologiaOrObject;
        } 
        else if(call == 'registrationDevice') {
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