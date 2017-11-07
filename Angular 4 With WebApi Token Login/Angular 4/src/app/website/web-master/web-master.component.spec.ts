import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WebMasterComponent } from './web-master.component';

describe('WebMasterComponent', () => {
  let component: WebMasterComponent;
  let fixture: ComponentFixture<WebMasterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WebMasterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WebMasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
