import { Component, OnInit } from '@angular/core';
import { MetadataService } from './metadata.service';
import { AppService } from './../app.service';

@Component({
  selector: 'app-metadata',
  templateUrl: './metadata.component.html',
  styleUrls: ['./metadata.component.scss']
})
export class MetadataComponent implements OnInit {

  public metadata: object;
  constructor(private metadataService: MetadataService, private appService: AppService) { }

  getFolio(folio: string) {
    this.metadataService.getFolio(folio).subscribe(
      data => { this.metadata = data; },
      err => console.error(err)
    );
  }

  ngOnInit() {
    this.appService.getFolio().subscribe((data) => {
      this.getFolio(data);
    });

    this.appService.getDate().subscribe((data) => {
      console.log(data);
    });

    this.appService.getComputus().subscribe((data) => {
      console.log(data);
    });
  }

}
