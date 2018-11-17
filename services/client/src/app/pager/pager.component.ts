import { Component, OnInit } from '@angular/core';
import { AppService } from './../app.service';

@Component({
  selector: 'app-pager',
  templateUrl: './pager.component.html',
  styleUrls: ['./pager.component.scss']
})
export class PagerComponent implements OnInit {

  totalPages: number;
  currentPage = 0;

  constructor(private appService: AppService) { }

  ngOnInit() {
    console.log();
    this.totalPages = Number(this.appService.getTotalPages());
  }

  public previousPage = function() {
    if (this.currentPage > 0) {
      this.currentPage--;
      this.appService.setCurrentPage(this.currentPage);
    }
  };

  public nextPage = function() {
    if (this.currentPage < this.totalPages - 1) {
      this.currentPage++;
      this.appService.setCurrentPage(Number(+this.currentPage));
    }
  };
}
