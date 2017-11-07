import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-master-nav',
  templateUrl: './master-nav.component.html',
  styleUrls: ['./master-nav.component.css']
})
export class MasterNavComponent implements OnInit {

  ChartExpand:Boolean=false;
  ItemsExpand:Boolean=false;
  ReportExpand:Boolean=false;
  
  constructor() { }

  ngOnInit() {
  }

}
