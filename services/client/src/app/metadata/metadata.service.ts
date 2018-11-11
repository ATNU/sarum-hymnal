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

    getDate(date: string) {
        return this.http.get('/date/' + date);
    }
}
