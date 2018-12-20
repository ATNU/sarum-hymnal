import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class MetadataService {

    constructor(private http: HttpClient) {}

    getFolio(folio: string) {
        return this.http.get('/folio/' + folio);
    }

    getDate(date: string, easter: string) {
        return this.http.get('/date/' + date + '?easter=' + easter);
    }
}

export class DateMetadata {
    lauds: any;
    matins: any;
    prime: any;
    sext: any;
    terce: any;
    vespers: any;
}
