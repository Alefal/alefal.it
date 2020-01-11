import { Injectable } from '@angular/core';
import { HttpService } from './http.service';
import { AppConfigService } from './appconfig.service';
import { ToastrService } from 'ngx-toastr';

@Injectable()
export class SharedService {

  userProfile: any;
  constructor(public appConfigService: AppConfigService, private httpService: HttpService, private toastr: ToastrService) { }

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
}
