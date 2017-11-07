import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-master-header',
  templateUrl: './master-header.component.html',
  styleUrls: ['./master-header.component.css']
})
export class MasterHeaderComponent implements OnInit {

  envelopeOpen: Boolean = false;
  notificationOpen: Boolean = false;
  flagOpen: Boolean = false;
  profileOpen: Boolean = false;

  LeftMenuCollapse: Boolean = false;

  @Output()
  LeftMenuCollapseOutPut: EventEmitter<Boolean>=new EventEmitter<Boolean>();

  OnSliderClick()
  {
    this.LeftMenuCollapse=!this.LeftMenuCollapse;
    this.LeftMenuCollapseOutPut.emit(this.LeftMenuCollapse);
  }

  constructor() { }

  ngOnInit() {
  }

}
