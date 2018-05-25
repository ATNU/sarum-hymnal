import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { MatIconModule, MatCardModule, MatTabsModule, MatListModule, MatButtonModule, MatProgressSpinnerModule } from '@angular/material';

import { RouterModule, Routes } from '@angular/router';


import { MainComponent } from './main.component';
import { DirectivesModule } from '../../components/directives.module';


export const ROUTES: Routes = [
    { path: '', component: MainComponent },
];


@NgModule({
    imports: [
        BrowserModule,
        FormsModule,
        RouterModule.forChild(ROUTES),
        DirectivesModule,
        MatIconModule,
        MatCardModule,
        MatTabsModule,
        MatListModule,
        MatButtonModule,
        MatProgressSpinnerModule
    ],
    declarations: [
        MainComponent,
    ],

    exports: [
        MainComponent,
    ],
})
export class MainModule {}
