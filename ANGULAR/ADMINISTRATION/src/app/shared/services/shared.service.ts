import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { User } from '../models/classes/user';
import { IAppConfig } from '../models/interfaces/app-config.model';

@Injectable()
export class SharedService {

  public userProfile: User;
  public config: IAppConfig;

  showPassword: boolean;

  deleteTitle = '';
  deleteMessage = '';
  deleteConfirm = '';
  deleteErrorTitle = '';
  deleteErrorMessage = '';

  sweet_confirmButtonText   = '';
  sweet_cancelButtonText    = '';

  sweet_confirmButtonClass  = 'btn btn-danger';
  sweet_cancelButtonClass   = 'btn btn-default';

  operationTitle = '';
  operationMessage = '';
  operationConfirm = '';
  operationErrorTitle = '';
  operationErrorMessage = '';

  sweet_confirmOperationButtonText   = '';
  sweet_cancelOperationButtonText    = '';

  sweet_confirmOperationButtonClass  = 'btn btn-success';
  sweet_cancelOperationButtonClass   = 'btn btn-danger';

  constructor(private translate: TranslateService) { }

  showHidePassword() {
    this.showPassword = !this.showPassword;
  }
  getUserProfile() {
    this.userProfile = JSON.parse(localStorage.getItem('userLoggedin'));
  }
  getSettings() {
    this.config = JSON.parse(localStorage.getItem('config'));
  }

  checkExtensionFile(permittedExtensionFile, fileExtension) {
    let result: boolean = false;
    permittedExtensionFile = permittedExtensionFile.replace(/\./g, '');
    const permittedExtensionFileCollection = permittedExtensionFile.split(',');
    for (let i = 0; i < permittedExtensionFileCollection.length; i++) {
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

  public removeLocalStorage() {
    localStorage.clear();
  }

  setConfirmVariables() {
    this.deleteTitle = '';
    this.deleteMessage = '';
    this.deleteConfirm = '';
    this.deleteErrorTitle = '';
    this.deleteErrorMessage = '';
    this.sweet_confirmButtonText = '';
    this.sweet_cancelButtonText = '';

    this.translate.get('generic.message.delete.title').subscribe((res: string) => {
      this.deleteTitle = res;
    });
    this.translate.get('generic.message.delete.message').subscribe((res: string) => {
        this.deleteMessage = res;
    });
    this.translate.get('generic.message.delete.confirm').subscribe((res: string) => {
        this.deleteConfirm = res;
    });
    this.translate.get('generic.message.delete.error.title').subscribe((res: string) => {
        this.deleteErrorTitle = res;
    });
    this.translate.get('generic.message.delete.error.message').subscribe((res: string) => {
        this.deleteErrorMessage = res;
    });
    this.translate.get('generic.button.yes').subscribe((res: string) => {
        this.sweet_confirmButtonText = res;
    });
    this.translate.get('generic.button.no').subscribe((res: string) => {
        this.sweet_cancelButtonText = res;
    });

    this.operationTitle = '';
    this.operationMessage = '';
    this.operationConfirm = '';
    this.operationErrorTitle = '';
    this.operationErrorMessage = '';
    this.sweet_confirmOperationButtonText   = '';
    this.sweet_cancelOperationButtonText    = '';

    this.translate.get('generic.message.operation.title').subscribe((res: string) => {
      this.operationTitle = res;
    });
    this.translate.get('generic.message.operation.message').subscribe((res: string) => {
        this.operationMessage = res;
    });
    this.translate.get('generic.message.operation.confirm').subscribe((res: string) => {
        this.operationConfirm = res;
    });
    this.translate.get('generic.message.operation.error.title').subscribe((res: string) => {
        this.operationErrorTitle = res;
    });
    this.translate.get('generic.message.operation.error.message').subscribe((res: string) => {
        this.operationErrorMessage = res;
    });
    this.translate.get('generic.button.yes').subscribe((res: string) => {
        this.sweet_confirmOperationButtonText = res;
    });
    this.translate.get('generic.button.no').subscribe((res: string) => {
        this.sweet_cancelOperationButtonText = res;
    });
  }

  pathExistAndIsVisible(key) {
    let visible = false;
    key = key.replace(/\//g, '');
    // DEBUG
    return true;

    //Check COMMON settings
    if(this.config.settings.features.common.hasOwnProperty(key)) {
      visible = this.config.settings.features.common[key];
    } 
    //Check ADMIN settings
    else if(this.userProfile.authorities[0].authority == 'ROLE_ADMIN') {
      if(this.config.settings.features.admin.hasOwnProperty(key)) {
        visible = this.config.settings.features.admin[key];
      } else {
        visible = false;
      }
    }
    //Check OPERATOR settings 
    else if(this.userProfile.authorities[0].authority == 'ROLE_OPERATORE'){ 
      if(this.config.settings.features.operator.hasOwnProperty(key)) {
        visible = this.config.settings.features.operator[key];
      } else {
        visible = false;
      }
    }
    else {
      visible = false;
    }
    return visible;
  }
}
