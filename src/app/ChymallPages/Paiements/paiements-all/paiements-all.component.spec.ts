import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaiementsAllComponent } from './paiements-all.component';

describe('PaiementsAllComponent', () => {
  let component: PaiementsAllComponent;
  let fixture: ComponentFixture<PaiementsAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaiementsAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaiementsAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
