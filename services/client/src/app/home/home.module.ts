import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslateModule } from '@ngx-translate/core';
import { FlexLayoutModule } from '@angular/flex-layout';

import { CoreModule } from '@app/core';
import { SharedModule } from '@app/shared';
import { MaterialModule } from '@app/material.module';
import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';

import { MetadataModule} from '@app/metadata/metadata.module';
import { ViewerModule} from '@app/viewer/viewer.module';
import { CalendarModule } from '@app/calendar/calendar.module';

@NgModule({
  imports: [
    CommonModule,
    TranslateModule,
    CoreModule,
    SharedModule,
    FlexLayoutModule,
    MaterialModule,
    HomeRoutingModule,
    MetadataModule,
    ViewerModule,
    CalendarModule
  ],
  declarations: [
    HomeComponent
  ]
})
export class HomeModule { }
