import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RapportProfileComponent } from './rapport-profile.component';

describe('RapportProfileComponent', () => {
  let component: RapportProfileComponent;
  let fixture: ComponentFixture<RapportProfileComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RapportProfileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RapportProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
