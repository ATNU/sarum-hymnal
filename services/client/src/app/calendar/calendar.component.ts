import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { Computus } from './computus.service';
import { MAT_DATE_FORMATS } from '@angular/material/core';

// Depending on whether rollup is used, moment needs to be imported differently.
// Since Moment.js doesn't have a default export, we normally need to import using the `* as`
// syntax. However, rollup creates a synthetic default module and we thus need to import it using
// the `default as` syntax.
import * as _moment from 'moment';
import {MatDatepickerInputEvent} from '@angular/material';
import { AppService } from '@app/app.service';
// tslint:disable-next-line:no-duplicate-imports
// import {default as _rollupMoment} from 'moment';

const moment = _moment;

// See the Moment.js docs for the meaning of these formats:
// https://momentjs.com/docs/#/displaying/format/
export const MY_FORMATS = {
  parse: {
    dateInput: 'LL',
  },
  display: {
    dateInput: 'LL',
    monthYearLabel: 'MMM YYYY',
    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'MMMM YYYY',
  },
};

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.scss'],
  providers: [
    { provide: MAT_DATE_FORMATS, useValue: MY_FORMATS },
  ]
})
export class CalendarComponent implements OnInit {

  date = moment();
  control = new FormControl({value: this.date, disabled: true });
  computus: Computus;

  dateChange(event: MatDatepickerInputEvent<Date>) {
    this.computus = new Computus(moment(event.value).year());
    this.appService.setDate(event.value);
    this.appService.setComputus(this.computus);
  }

  constructor(private appService: AppService) { }

  ngOnInit() {
    this.computus = new Computus(this.date.year());
    this.appService.setDate(this.date.toDate());
    this.appService.setComputus(this.computus);
  }

}
