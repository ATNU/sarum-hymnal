import {Component, OnInit} from '@angular/core';
import {Computus} from 'ng-computus';

@Component({
    selector: 'footer',
    template: require('./footer.html'),
    styles: [require('./footer.scss')]
})
export class FooterComponent implements OnInit {

    ngOnInit(){
        const computus = new Computus(2000);
        console.log(computus);
    }

    Router;
}
