import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitsAllDemandesComponent } from './retraits-all-demandes.component';

describe('RetraitsAllDemandesComponent', () => {
  let component: RetraitsAllDemandesComponent;
  let fixture: ComponentFixture<RetraitsAllDemandesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitsAllDemandesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitsAllDemandesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
