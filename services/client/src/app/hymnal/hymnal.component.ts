import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { finalize } from 'rxjs/operators';

@Component({
  selector: 'app-hymnal',
  templateUrl: './hymnal.component.html',
  styleUrls: ['./hymnal.component.scss']
})
export class HymnalComponent implements OnInit {

  constructor(public route: ActivatedRoute) { }

  ngOnInit() {

  }

}
