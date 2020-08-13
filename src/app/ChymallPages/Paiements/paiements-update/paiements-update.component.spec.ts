import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaiementsUpdateComponent } from './paiements-update.component';

describe('PaiementsUpdateComponent', () => {
  let component: PaiementsUpdateComponent;
  let fixture: ComponentFixture<PaiementsUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaiementsUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaiementsUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
