import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatTabsModule } from '@angular/material';
import { MetadataComponent } from './metadata.component';

@NgModule({
  imports: [
    CommonModule,
    MatTabsModule
  ],
  declarations: [
    MetadataComponent
  ],
  exports: [
    MetadataComponent
  ]
})
export class MetadataModule { }
