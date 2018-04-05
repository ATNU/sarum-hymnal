import { Component, OnInit } from '@angular/core';
import * as OpenSeadragon from 'openseadragon';

@Component({
    selector: 'seadragon',
    template: require('./viewer.html'),
    styles: [require('./viewer.scss')]
})
export class ViewerComponent implements OnInit {

    ngOnInit(){
        OpenSeadragon({
            id:                 "iiif-viewer",
            prefixUrl:          "components/viewer/images/",
            preserveViewport:   true,
            visibilityRatio:    1,
            minZoomLevel:       1,
            defaultZoomLevel:   1,
            sequenceMode:       true,
            tileSources:   [{
                "@context": "http://iiif.io/api/image/2/context.json",
                "@id": "https://libimages1.princeton.edu/loris/pudl0001%2F4609321%2Fs42%2F00000001.jp2",
                "height": 7200,
                "width": 5233,
                "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                "protocol": "http://iiif.io/api/image",
                "tiles": [{
                    "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                    "width": 1024
                }]
            },{
                "@context": "http://iiif.io/api/image/2/context.json",
                "@id": "https://libimages1.princeton.edu/loris/pudl0001%2F4609321%2Fs42%2F00000002.jp2",
                "height": 7200,
                "width": 5093,
                "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                "protocol": "http://iiif.io/api/image",
                "tiles": [{
                    "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                    "width": 1024
                }]
            },{
                "@context": "http://iiif.io/api/image/2/context.json",
                "@id": "https://libimages1.princeton.edu/loris/pudl0001%2F4609321%2Fs42%2F00000003.jp2",
                "height": 7200,
                "width": 5387,
                "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                "protocol": "http://iiif.io/api/image",
                "tiles": [{
                    "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                    "width": 1024
                }]
            },{
                "@context": "http://iiif.io/api/image/2/context.json",
                "@id": "https://libimages1.princeton.edu/loris/pudl0001%2F4609321%2Fs42%2F00000004.jp2",
                "height": 7200,
                "width": 5434,
                "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                "protocol": "http://iiif.io/api/image",
                "tiles": [{
                    "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                    "width": 1024
                }]
            }]
        });
    }

    Router;
}
