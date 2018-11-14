import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';

@Injectable()
export class AppService {

    private folio: Subject<string>;

    constructor() {
        this.folio = new Subject<string>();
    }

    setFolio(folio: string) {
        this.folio.next(folio);
    }

    getFolio() {
        return this.folio.asObservable();
    }
}
