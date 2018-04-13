import { Component } from '@angular/core';

@Component({
    selector: 'app',
    template: `     
    <header>
 
    </header>
    <section class="content">
        <router-outlet></router-outlet>
    </section>
    <footer>

    </footer>`
})
export class AppComponent {}
