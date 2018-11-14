import { Injectable } from '@angular/core';

@Injectable()
export class AppService {

    currentFolio: string;

    constructor() {
        this.currentFolio = null;
    }

    setFolio(folio: string) {
        this.currentFolio = folio;
    }
}
