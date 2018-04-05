import { Component } from '@angular/core';

@Component({
    selector: 'app',
    template: `<navbar></navbar>
    <router-outlet></router-outlet>
    <seadragon></seadragon>
    <footer></footer>`
})
export class AppComponent {}
