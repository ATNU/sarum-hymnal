import { Component, OnInit } from '@angular/core';
import { AppService } from './../app.service';
import * as Images from '@assets/data/images.json';
import * as OpenSeadragon from 'openseadragon';
import * as _ from 'lodash';

@Component({
  selector: 'app-viewer',
  templateUrl: './viewer.component.html',
  styleUrls: ['./viewer.component.scss']
})
export class ViewerComponent implements OnInit {

  constructor(private appService: AppService) { }

  ngOnInit() {

    const appService = this.appService;

    OpenSeadragon.DEFAULT_SETTINGS.timeout = 60000; // or whatever number

    const viewer = OpenSeadragon({
      id:                 'iiif-viewer',
      prefixUrl:          'assets/viewer/',
      preserveViewport:   true,
      visibilityRatio:    1,
      minZoomLevel:       1,
      defaultZoomLevel:   1,
      sequenceMode:       true,
      tileSources:        this.appService.getImageList(),
      nextButton:         'next',
      previousButton:     'previous',
    });

    this.appService.getCurrentPage().subscribe((page) => {
      viewer.goToPage(page);
    });
  }
}
