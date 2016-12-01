import { Component } from '@angular/core';
import { NavParams, ViewController, LoadingController, AlertController } from 'ionic-angular';

import { HttpService } from '../../providers/http-service';
import { ConnectivityService }  from '../../providers/connectivity-service';

//import { LoopNumber } from '../../pipes/loopnumber.pipe.ts'

@Component({
  selector: 'page-tabellino-modal',
  templateUrl: 'tabellino-modal.html'
})
export class TabellinoModal {

  matchId: number;
  teamHome: string;
  teamAway: string;
  result: string;

  tabellinoHome: any;
  tabellinoAway: any;

  loading: any;
  errorMessage: string;
  errorMessageView: any;

  match: any;
  matchesEvents: any;
  home_team_id: number;
  away_team_id: number;

  home_team_score: number = 0;
  away_team_score: number = 0;

  home_team_logo: string;
  away_team_logo: string;

  tipologiaTorneo: string;

  intervalId: any;

  //LIVE INSERT
  public tap: number = 0;
  showButtonAfterTap = false;

  liveEventId: number = 0;
  liveSquadraId: string = '';
  liveMinuto: string = '';
  liveEvento: string = '';
  liveGiocatori: any;
  liveSelectedGiocatore: any;
  liveEventsArray: Array<string> = [];
  livePlayersTeamHomeArray: Array<string>;

  constructor(
    public params: NavParams,
    public viewCtrl: ViewController,
    private httpService: HttpService,
    public loadingCtrl: LoadingController,
    public alertCtrl: AlertController,
    public connectivityService: ConnectivityService
  ) {
    this.matchId          = params.get('id');
    this.teamHome         = params.get('teamHome');
    this.teamAway         = params.get('teamAway');
    this.result           = params.get('result');
    this.home_team_id     = params.get('home_team_id');
    this.away_team_id     = params.get('away_team_id');
    this.home_team_logo   = params.get('home_team_logo');
    this.away_team_logo   = params.get('away_team_logo');

    console.log(this.home_team_logo);
    console.log(this.away_team_logo);

    this.tipologiaTorneo = params.get('tipologiaTorneo');

    this.getTabellino(this.matchId);

    this.intervalId = setInterval(() => {
      if(this.connectivityService.connectivityFound) {
        this.getTabellinoPolling(this.matchId);
      }
    }, 10000);
    
  }

  dismiss() {
    clearInterval(this.intervalId);
    this.viewCtrl.dismiss();
  }

  counter(num) {
    console.log(num);
  }

  getTabellino(matchId) {
    this.loading = this.loadingCtrl.create({
      spinner: 'crescent',
      //content: 'Please wait...'
    });
    this.loading.present();

    this.httpService
      .getCallHttp('getTabellino','','',matchId,'',this.tipologiaTorneo)
      .then(res => {
        //console.log('SUCCESS: ' + JSON.stringify(res));

        if (res[0].response[0].result == 'OK') {
          //this.match          = res[0].match;
          this.home_team_score  = res[0].match[0].home_team_score;
          this.away_team_score  = res[0].match[0].away_team_score;
          this.matchesEvents    = res[0].matchesEvents;
          this.liveEventId      = res[0].matchesEvents[0].event_id;
          
          console.log('home_team_score: ' + this.home_team_score);
          console.log('away_team_score: ' + this.away_team_score);
        }
        this.loading.dismiss();
      })
      .catch(error => {
        console.log('ERROR: ' + error);
        this.errorMessage = 'Tabellino disponibile solo online! Controlla la tua connessione di rete.';
        this.errorMessageView = true;
        this.loading.dismiss();
      });
  }
  getTabellinoPolling(matchId) {
    this.httpService
      .getCallHttp('getTabellino','','',matchId,'',this.tipologiaTorneo)
      .then(res => {
        if (res[0].response[0].result == 'OK') {
          //this.match          = res[0].match;
          this.result           = res[0].match[0].home_team_score +' - '+ res[0].match[0].away_team_score;
          this.home_team_logo   = res[0].match[0].home_team_logo;
          this.away_team_logo   = res[0].match[0].away_team_logo;

          this.matchesEvents  = res[0].matchesEvents;
        }
      })
      .catch(error => {
        console.log('ERROR: ' + error);
      });
  }

  tapEvent(e) {
    this.tap++;
    if(this.tap == 10) {
      this.authorization();
    }
  }
  tapAnnulla() {
    this.tap = 0;
    this.showButtonAfterTap = false;
  }

  liveGetGiocatori() {
    console.log('-> '+this.liveSquadraId);

    if(this.connectivityService.connectivityFound) {
      this.liveSelectedGiocatore = '';
      this.httpService
        .getCallHttp('getGiocatori',this.liveSquadraId,'','','',this.tipologiaTorneo)
        .then(res => {
          console.log('SUCCESS: ' + JSON.stringify(res));

          if(res[0].response[0].result == 'OK') {
            this.liveGiocatori = res[0].atleti;
          } else {
            this.liveGiocatori = 'Nessun dato! Riprovare più tardi.';
          }
        })
        .catch(error => {
          console.log('ERROR: ' + error);
        });
    } else {
      this.livePlayersTeamHomeArray = [];

      let players = JSON.parse(localStorage.getItem('getGiocatori'));
      console.log(players);
      for (let player of players) {
        console.log(player.teamId);
        if(player.teamId == this.liveSquadraId) {
          this.livePlayersTeamHomeArray.push(player);
        }
      }
      this.liveGiocatori = this.livePlayersTeamHomeArray;
      console.log('this.liveGiocatori: '+this.liveGiocatori);
    }
    
  }
  liveSalva() {
    console.log('-> '+this.matchId+' | '+this.liveEventId+' | '+this.liveSquadraId+' | '+this.liveMinuto+' | '+this.liveEvento);
    if(this.liveSelectedGiocatore && this.matchId != 0 && this.liveSquadraId != '' && this.liveMinuto != '' && this.liveEvento != '') {
      console.log('-> '+this.liveSelectedGiocatore.playerId); 
      
      let event = '{"match_id":"'+this.matchId+'","event_id":"'+this.liveEventId+'","team_id":"'+this.liveSquadraId+'","player_id":"'+this.liveSelectedGiocatore.playerId+'","event_time":"'+this.liveMinuto+'","timeline_text":"'+this.liveEvento+'","tipologiaTorneo":"'+this.tipologiaTorneo+'","home_team_score":"'+this.home_team_score+'","away_team_score":"'+this.away_team_score+'"}';

      if(this.connectivityService.connectivityFound) {
        this.loading = this.loadingCtrl.create({
          spinner: 'crescent'
        });
        this.loading.present();
        
        this.httpService
          .getCallHttp('getIncontroEventi','','','','',event)
          .then(res => {
            console.log('SUCCESS: ' + JSON.stringify(res));

            if(res[0].response[0].result == 'OK') {
              console.log('OK');
            } else {
              console.log('KO');
            }
            this.loading.dismiss();
          })
          .catch(error => {
            console.log('ERROR: ' + error);
            this.loading.dismiss();
          });
      } else {
        //Salvare nel localStorage: mi serve la lista di giocatori di ogni squadra!!!
        this.liveEventsArray.push(event);
        localStorage.setItem('liveEventsArray',JSON.stringify(this.liveEventsArray));
      }

      //Reset per evitare inserimenti multipli dello stesso evento
      this.liveSelectedGiocatore = '';
      this.liveSquadraId = '';
      this.liveMinuto = '';
      this.liveEvento = '';

    } else {
      this.showMessage('Inserisci tutti i campi!');
    }
  }

  authorization() {
    let prompt = this.alertCtrl.create({
      title: 'Codice di autorizzazione',
      message: 'Inserisci il codice di autorizzazione per accedere alla sezione di amministrazione',
      enableBackdropDismiss: false,
      inputs: [
        {
          name: 'code',
          placeholder: 'Codice autorizzazione'
        },
      ],
      buttons: [
        {
          text: 'Cancel',
          handler: data => {
            console.log('Cancel clicked');
            this.tap = 0;
          }
        },
        {
          text: 'Save',
          handler: data => {
            console.log('Saved clicked: '+data.code);
            this.tap = 0;
            if(data.code == '01230') {
              this.showButtonAfterTap = true;
            } else {
              this.showAlert();
            }
          }
        }
      ]
    });
    prompt.present();
  }

  showAlert() {
    this.tap = 0;
    let alert = this.alertCtrl.create({
      title: 'Attenzione!',
      subTitle: 'Codice di autorizzazione NON VALIDO!',
      buttons: ['OK']
    });
    alert.present();
  }
  showMessage(message) {
    this.tap = 0;
    let alert = this.alertCtrl.create({
      title: 'Attenzione!',
      subTitle: message,
      buttons: ['OK']
    });
    alert.present();
  }
}