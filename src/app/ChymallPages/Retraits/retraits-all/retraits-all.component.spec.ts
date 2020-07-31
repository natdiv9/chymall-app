import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitsAllComponent } from './retraits-all.component';

describe('RetraitsAllComponent', () => {
  let component: RetraitsAllComponent;
  let fixture: ComponentFixture<RetraitsAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitsAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitsAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
