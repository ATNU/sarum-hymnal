import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule, MatCardModule, MatTabsModule, MatListModule, MatButtonModule, MatProgressSpinnerModule } from '@angular/material';

import { RouterModule } from '@angular/router';

import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { ViewerComponent } from './viewer/viewer.component';

import {FlexLayoutModule} from '@angular/flex-layout';
import {MetadataComponent} from './metadata/metadata.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

@NgModule({
    imports: [
        CommonModule,
        RouterModule,
        FlexLayoutModule,
        MatIconModule,
        MatCardModule,
        MatTabsModule,
        MatListModule,
        MatButtonModule,
        MatProgressSpinnerModule,
        BrowserAnimationsModule
    ],
    declarations: [
        HeaderComponent,
        FooterComponent,
        ViewerComponent,
        MetadataComponent
    ],
    exports: [
        HeaderComponent,
        FooterComponent,
        ViewerComponent,
        MetadataComponent
    ]
})
export class DirectivesModule {}
