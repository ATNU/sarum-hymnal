import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule, MatDatepickerModule, MatInputModule, MatFormFieldModule } from '@angular/material';
import { PagerComponent } from './pager.component';

@NgModule({
  imports: [
    CommonModule,
    MatIconModule,
    MatDatepickerModule,
    MatInputModule,
    MatFormFieldModule
  ],
  exports: [
    PagerComponent
  ],
  declarations: [PagerComponent]
})
export class PagerModule { }
