import { Component, OnInit } from '@angular/core';
import * as OpenSeadragon from 'openseadragon';

@Component({
    selector: 'seadragon',
    template: require('./viewer.html'),
    styles: [require('./viewer.scss')]
})
export class ViewerComponent implements OnInit {

    ngOnInit() {

        OpenSeadragon.DEFAULT_SETTINGS.timeout = 60000; // or whatever number

        OpenSeadragon({
            id:                 'iiif-viewer',
            prefixUrl:          'components/viewer/images/',
            preserveViewport:   true,
            visibilityRatio:    1,
            minZoomLevel:       1,
            defaultZoomLevel:   1,
            sequenceMode:       true,
            tileSources:   [
                'http://localhost:8182/iiif/2/GB-Osj_MS60_001r.jpg/info.json',
                'http://localhost:8182/iiif/2/GB-Osj_MS60_001v.jpg/info.json',
                'http://localhost:8182/iiif/2/GB-Osj_MS60_002r.jpg/info.json',
            ]
        });
    }

    Router;
}
