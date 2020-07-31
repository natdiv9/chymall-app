import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CrudService {

  constructor() { }

  uploadFile(file: File) {
    return new Promise(
        (resolve, reject) => {
          const almostUniqueFileName = Date.now().toString();
        }
    );
  }
}
