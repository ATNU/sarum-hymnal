import { Component, OnInit } from '@angular/core';
import { AppService } from './../app.service';
import * as OpenSeadragon from 'openseadragon';

@Component({
  selector: 'app-viewer',
  templateUrl: './viewer.component.html',
  styleUrls: ['./viewer.component.scss']
})
export class ViewerComponent implements OnInit {

  constructor(private appService: AppService) { }

  ngOnInit() {

    const service = this.appService;

    console.log(service);

    OpenSeadragon.DEFAULT_SETTINGS.timeout = 60000; // or whatever number

    const viewer = OpenSeadragon({
      id:                 'iiif-viewer',
      prefixUrl:          'assets/viewer/',
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

    service.setFolio(viewer.tileSources[0].split('_')[2].split('.')[0]);

    viewer.addHandler('page', function(event: any) {
      let folio = viewer.tileSources[event.page].split('_')[2];
      folio = folio.split('.')[0];
      service.setFolio(folio);
    });
  }
}
