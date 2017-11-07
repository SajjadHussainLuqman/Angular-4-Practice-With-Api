import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WebIndexComponent } from './web-index.component';

describe('WebIndexComponent', () => {
  let component: WebIndexComponent;
  let fixture: ComponentFixture<WebIndexComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WebIndexComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WebIndexComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
