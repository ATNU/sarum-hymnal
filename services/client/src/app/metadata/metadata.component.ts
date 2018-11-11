import { Component, OnInit } from '@angular/core';
import { MetadataService } from './metadata.service';

@Component({
  selector: 'app-metadata',
  templateUrl: './metadata.component.html',
  styleUrls: ['./metadata.component.scss']
})
export class MetadataComponent implements OnInit {

  public metadata: any;
  
  constructor(private _metadataService: MetadataService) { }

  getFolio(folio: string) {
    this._metadataService.getFolio(folio).subscribe(
      data => { this.metadata = data},
      err => console.error(err),
      () => console.log('done loading metadata')
    );
  }

  ngOnInit() {
    this.getFolio('001r');
  }

}
