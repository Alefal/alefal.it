import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AppConfigService } from './appconfig.service';
import { IAppConfig } from '../models/interfaces/app-config.model';

import { FieldType, Formatters, Formatter, Column } from 'angular-slickgrid';

// create my custom Formatter with the Formatter type
const myCustomCheckmarkFormatter: Formatter = (row, cell, value, columnDef, dataContext) => {
  // you can return a string of a object (of type FormatterResultObject), the 2 types are shown below
  return value ? `<i class="fa fa-fire red" aria-hidden="true"></i>` : { text: '<i class="fa fa-snowflake-o" aria-hidden="true"></i>', addClasses: 'lightblue', toolTip: 'Freezing' };
};

const customEnableButtonFormatter: Formatter = (row: number, cell: number, value: any, columnDef: Column, dataContext: any, grid: any) => {
  return `<span style="margin-left: 5px">
      <button class="btn btn-xs btn-default">
        <i class="fa ${value ? 'fa-check-circle' : 'fa-circle-thin'} fa-lg" style="color: ${value ? 'black' : 'lavender'}"></i>
      </button>
    </span>`;

};

/*
[
  'attribuire'
  'autocc'
  'autocm'
  'autorizzata'
  'bozza'
  'chiusa'
  'chiusanegativo'
  'confermata'
  'daautorizzare'
  'invalutazione'
  'negativo'
  'nonautorizzato'
  'positivo'
  'verificata'
];
*/
const stateFormatter: Formatter = (row: number, cell: number, value: any, columnDef: Column, dataContext: any, grid: any) => {
  var icon = ''; 
  if(value == 'attribuire')
    icon = '?';
  if(value == 'autocc')
    icon = 'Cc';
  if(value == 'autocm')
    icon = 'Cm';
  if(value == 'autorizzata')
    icon = 'A';
  if(value == 'bozza')
    icon = 'B';
  if(value == 'chiusa')
    icon = 'C';
  if(value == 'chiusanegativo')
    icon = 'C';
  if(value == 'confermata')
    icon = 'OK';
  if(value == 'daautorizzare')
    icon = 'A';
  if(value == 'invalutazione')
    icon = 'Iv';
  if(value == 'negativo')
    icon = 'Pn';
  if(value == 'nonautorizzato')
    icon = 'x';
  if(value == 'positivo')
    icon = 'Pp';
  if(value == 'verificata')
    icon = 'V';

  return '<div id="boxState" class="'+value+'BoxState"><span class="elementState '+value+'State">'+icon+'</span></div>';
};

@Injectable()
export class SharedService {

  userProfile: any;
  appConfig: IAppConfig;

  constructor(private toastr: ToastrService) {
    this.appConfig = JSON.parse(localStorage.getItem('appConfig'));
  }

  checkExtensionFile(permittedExtensionFile, fileExtension) {
    let result: boolean = false;
    permittedExtensionFile = permittedExtensionFile.replace(/\./g, '');
    let permittedExtensionFileCollection = permittedExtensionFile.split(",");
    for (var i = 0; i < permittedExtensionFileCollection.length; i++) {
      if (permittedExtensionFileCollection[i] === fileExtension) {
        result = true;
        break;
      }
    }
    return result;
  }

  printConsoleLog(log, object) {
    console.log(log, object);
  }

  showError(error) {
    console.error('error', error);
    let title = '';
    let message = '';

    if(error && error.error.message && error.error.modelState) {
      title = error.error.message;
      message = error.error.modelState[''][0];
    } 
    else if(error && error.error.error && error.error.error_description) {
      title = error.error.error;
      message = error.error.error_description;
    } 
    else if(error && error.statusText && error.message) {
      title = error.statusText;
      message = error.message;
    } 
    else {
      title = 'Error';
      message = 'Generic Error';
    }
    this.toastr.error(message, title);
  }

  configColumn(col) {
    // TYPE
    if(col && col.type == 'FieldType.string') {
      col.type = FieldType.string;
    } 
    else if(col && col.type == 'FieldType.dateIso') {
      col.type = FieldType.dateIso;
    } 
    else if(col && col.type == 'FieldType.number') {
      col.type = FieldType.number;
    }
    // FORMATTER
    if(col && col.formatter == 'Formatters.dateIso') {
      col.formatter = Formatters.dateIso;
    }
    else if(col && col.formatter == 'Formatters.mask') {
      col.formatter = Formatters.mask;
    }
    else if(col && col.formatter == 'Formatters.percentCompleteBar') {
      col.formatter = Formatters.percentCompleteBar;
    }
    else if(col && col.formatter == 'Formatters.progressBar') {
      col.formatter = Formatters.progressBar;
    }
    else if(col && col.formatter == 'stateFormatter') {
      col.formatter = stateFormatter;
    }

    return col;
  }
}
