import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitsIdComponent } from './retraits-id.component';

describe('RetraitsIdComponent', () => {
  let component: RetraitsIdComponent;
  let fixture: ComponentFixture<RetraitsIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitsIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitsIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
