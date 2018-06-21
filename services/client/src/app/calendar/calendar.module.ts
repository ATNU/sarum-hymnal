import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule, MatDatepickerModule, MatInputModule, MatFormFieldModule } from '@angular/material';
import { CalendarComponent } from './calendar.component';
import { MomentDateModule } from '@angular/material-moment-adapter';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MomentModule } from 'angular2-moment';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MomentDateModule,
    MomentModule,
    MatIconModule,
    MatDatepickerModule,
    MatInputModule,
    MatFormFieldModule
  ],
  declarations: [
    CalendarComponent
  ],
  exports: [
    CalendarComponent
  ]
})
export class CalendarModule { }
