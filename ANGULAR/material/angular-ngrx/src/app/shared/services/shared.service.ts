import { Injectable } from '@angular/core';

@Injectable()
export class SharedService {

  userProfile: any;
  constructor() { }

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
