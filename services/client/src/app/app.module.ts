import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { TranslateModule } from '@ngx-translate/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material.module';

import { CoreModule } from '@app/core';
import { SharedModule } from '@app/shared';
import { HymnalModule } from './hymnal/hymnal.module';
import { CalendarModule } from './calendar/calendar.module';
import { AboutModule } from './about/about.module';
import { MetadataModule } from './metadata/metadata.module';
import { ViewerModule } from './viewer/viewer.module';
import { AppComponent } from './app.component';
import { AppService } from './app.service';
import { AppRoutingModule } from './app-routing.module';

@NgModule({
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    TranslateModule.forRoot(),
    BrowserAnimationsModule,
    MaterialModule,
    CoreModule,
    SharedModule,
    HymnalModule,
    CalendarModule,
    AboutModule,
    MetadataModule,
    ViewerModule,
    AppRoutingModule
  ],
  declarations: [
    AppComponent
  ],
  providers: [
    AppService
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule { }
