import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PactsAllComponent } from './pacts-all.component';

describe('PactsAllComponent', () => {
  let component: PactsAllComponent;
  let fixture: ComponentFixture<PactsAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PactsAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PactsAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
