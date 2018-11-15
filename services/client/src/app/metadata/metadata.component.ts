import { Component, OnInit } from '@angular/core';
import { MetadataService } from './metadata.service';
import { AppService } from './../app.service';
import * as Moment from 'moment';

const moment = Moment;

@Component({
  selector: 'app-metadata',
  templateUrl: './metadata.component.html',
  styleUrls: ['./metadata.component.scss']
})
export class MetadataComponent implements OnInit {

  public metadata: object;
  private date: string;
  private easter: string;

  constructor(private metadataService: MetadataService, private appService: AppService) { }

  getFolio(folio: string) {
    this.metadataService.getFolio(folio).subscribe(
      data => { this.metadata = data; },
      err => console.error(err)
    );
  }

  getDate(date: string, easter: string) {
    this.metadataService.getDate(date, easter).subscribe(
      data => { this.metadata = data; },
      err => console.error(err)
    );
  }

  ngOnInit() {
    this.appService.getFolio().subscribe((folio) => {
      this.getFolio(folio);
    });

    this.appService.getDate().subscribe((date) => {
      this.date = moment(date).toISOString();
    });

    this.appService.getComputus().subscribe((computus) => {
      const easterSunday = moment(this.date);
      easterSunday.month(computus.gregorian.easterSunday[0]);
      easterSunday.day(computus.gregorian.easterSunday[1]);

      this.easter = easterSunday.toISOString();

      this.getDate(this.date, this.easter);
    });
  }

}
