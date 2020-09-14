import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FactureRetraitArgentComponent } from './facture-retrait-argent.component';

describe('FactureRetraitArgentComponent', () => {
  let component: FactureRetraitArgentComponent;
  let fixture: ComponentFixture<FactureRetraitArgentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FactureRetraitArgentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FactureRetraitArgentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
