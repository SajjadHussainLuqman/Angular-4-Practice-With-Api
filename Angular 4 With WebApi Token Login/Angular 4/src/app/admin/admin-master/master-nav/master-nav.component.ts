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
  SettingExpand:Boolean=false;
  SettingSubExpand:Boolean=false;
  SettingSubThirdExpand:Boolean=false;
  SalesOrderExpand:Boolean=false;
  
  constructor() { }

  ngOnInit() {
  }

}
