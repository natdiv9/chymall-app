import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ActivitesComponent } from './activites.component';

describe('ActivitesComponent', () => {
  let component: ActivitesComponent;
  let fixture: ComponentFixture<ActivitesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ActivitesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ActivitesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
