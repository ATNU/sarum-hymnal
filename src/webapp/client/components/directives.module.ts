import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule, MatCardModule, MatTabsModule, MatListModule, MatButtonModule, MatProgressSpinnerModule } from '@angular/material';

import { RouterModule } from '@angular/router';

import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { ViewerComponent } from './viewer/viewer.component';

import {FlexLayoutModule} from "@angular/flex-layout";

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
    ],
    declarations: [
        HeaderComponent,
        FooterComponent,
        ViewerComponent,

    ],
    exports: [
        HeaderComponent,
        FooterComponent,
        ViewerComponent,

    ]
})
export class DirectivesModule {}
