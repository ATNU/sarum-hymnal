import { Injectable } from '@angular/core';
import { Observable, Subject, ReplaySubject } from 'rxjs';
import { Computus } from './calendar/computus.service';
import * as Images from '@assets/data/images.json';
import * as _ from 'lodash';

@Injectable()
export class AppService {

    private imageList: string[] = [];
    private totalPages = 0;
    private currentPage: ReplaySubject<number>;
    private folio: ReplaySubject<string>;
    private date: Subject<Date>;
    private computus: Subject<Computus>;

    constructor() {

        this.currentPage = new ReplaySubject<number>();
        this.folio = new  ReplaySubject<string>();
        this.date = new Subject<Date>();
        this.computus = new  Subject<Computus>();

        const imagePaths: string[] = [];

        _.forEach(Images.default, function(image: string) {
            imagePaths.push('cantaloupe:2400/iiif/2/' + image + '/info.json');
        });

        this.imageList = imagePaths;
        this.totalPages = imagePaths.length;
        this.currentPage.next(0);
        this.folio.next(imagePaths[0].split('_')[2].split('.')[0]);
    }

    setImageList(imageList: string[]) {
        this.imageList = imageList;
    }

    getImageList() {
        return this.imageList;
    }

    setTotalPages(totalPages: number) {
        this.totalPages = totalPages;
    }

    getTotalPages() {
        return this.totalPages;
    }

    setCurrentPage(currentPage: number) {
        this.setFolio(this.imageList[currentPage].split('_')[2].split('.')[0]);
        this.currentPage.next(currentPage);
    }

    getCurrentPage() {
        return this.currentPage.asObservable();
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
