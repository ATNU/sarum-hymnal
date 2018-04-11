import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



import { RouterModule } from '@angular/router';


import { NavbarComponent } from './navbar/navbar.component';
import { FooterComponent } from './footer/footer.component';
import { ViewerComponent } from './viewer/viewer.component';


@NgModule({
    imports: [
        CommonModule,
        RouterModule,
    ],
    declarations: [
        NavbarComponent,
        FooterComponent,
        ViewerComponent,

    ],
    exports: [
        NavbarComponent,
        FooterComponent,
        ViewerComponent,

    ]
})
export class DirectivesModule {}
