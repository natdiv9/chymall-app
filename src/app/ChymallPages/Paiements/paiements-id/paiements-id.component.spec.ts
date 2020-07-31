import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaiementsIdComponent } from './paiements-id.component';

describe('PaiementsIdComponent', () => {
  let component: PaiementsIdComponent;
  let fixture: ComponentFixture<PaiementsIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaiementsIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaiementsIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
