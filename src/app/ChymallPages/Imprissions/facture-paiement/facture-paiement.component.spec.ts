import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FacturePaiementComponent } from './facture-paiement.component';

describe('FacturePaiementComponent', () => {
  let component: FacturePaiementComponent;
  let fixture: ComponentFixture<FacturePaiementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FacturePaiementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FacturePaiementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
