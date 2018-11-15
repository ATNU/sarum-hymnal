import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslateModule } from '@ngx-translate/core';
import { FlexLayoutModule } from '@angular/flex-layout';

import { CoreModule } from '@app/core';
import { SharedModule } from '@app/shared';
import { MaterialModule } from '@app/material.module';
import { HymnalRoutingModule } from './hymnal-routing.module';
import { HymnalComponent } from './hymnal.component';

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
    HymnalRoutingModule,
    MetadataModule,
    ViewerModule,
    CalendarModule
  ],
  declarations: [
    HymnalComponent
  ]
})
export class HymnalModule { }
