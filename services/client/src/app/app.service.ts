import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { Computus } from 'ng-computus';

@Injectable()
export class AppService {

    private folio: Subject<string>;
    private date: Subject<Date>;
    private computus: Subject<Computus>;

    constructor() {
        this.folio = new Subject<string>();
        this.date = new Subject<Date>();
        this.computus = new Subject<Computus>();
    }

    setFolio(folio: string) {
        this.folio.next(folio);
    }

    getFolio() {
        return this.folio.asObservable();
    }

    setDate(date: Date) {
        this.date.next(date);
    }

    getDate() {
        return this.date.asObservable();
    }

    setComputus(computus: Computus) {
        this.computus.next(computus);
    }

    getComputus() {
        return this.computus.asObservable();
    }
}
