import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitsUpdateComponent } from './produits-update.component';

describe('ProduitsUpdateComponent', () => {
  let component: ProduitsUpdateComponent;
  let fixture: ComponentFixture<ProduitsUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProduitsUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProduitsUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
