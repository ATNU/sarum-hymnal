import { Component, OnInit } from '@angular/core';
import { AppService } from './../app.service';

@Component({
  selector: 'app-pager',
  templateUrl: './pager.component.html',
  styleUrls: ['./pager.component.scss']
})
export class PagerComponent implements OnInit {

  totalPages: number;
  currentPage: number;

  constructor(private appService: AppService) { }

  ngOnInit() {
    this.totalPages = this.appService.getTotalPages();

    this.appService.getCurrentPage().subscribe((page) => {
      this.currentPage = page;
    });
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
