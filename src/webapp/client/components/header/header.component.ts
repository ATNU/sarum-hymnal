import { Component } from '@angular/core';


@Component({
    selector: 'header',
    template: require('./header.html'),
    styles: [require('./header.scss')]
})
export class HeaderComponent {
    isCollapsed = true;
    menu = [{
        title: 'Home',
        'link': '/',
    }];
    Router;
}
