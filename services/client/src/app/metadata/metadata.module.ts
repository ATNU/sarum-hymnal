import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { MatTabsModule } from '@angular/material';
import { MetadataComponent } from './metadata.component';
import { MetadataService } from './metadata.service';

@NgModule({
  imports: [
    HttpClientModule,
    CommonModule,
    MatTabsModule
  ],
  declarations: [
    MetadataComponent
  ],
  exports: [
    MetadataComponent
  ],
  providers: [
    MetadataService
  ]
})
export class MetadataModule { }
