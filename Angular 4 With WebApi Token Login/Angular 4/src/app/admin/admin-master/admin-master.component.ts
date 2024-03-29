import { Component, OnInit  } from '@angular/core';

@Component({
  selector: 'app-admin-master',
  templateUrl: './admin-master.component.html',
  styleUrls: ['./admin-master.component.css']

})
export class AdminMasterComponent implements OnInit {
  
  LeftMenuCollapse: Boolean = false;

  OnHeaderComponentChange(leftMenuStatus: Boolean): void
  {
    this.LeftMenuCollapse=leftMenuStatus;
  }

  constructor() { }

  ngOnInit() {
  }

}
