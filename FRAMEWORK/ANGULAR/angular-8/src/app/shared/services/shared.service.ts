import { Injectable } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Injectable()
export class SharedService {

  userProfile: any;
  constructor(private toastr: ToastrService) { }

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
}
