import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitsIdComponent } from './produits-id.component';

describe('ProduitsIdComponent', () => {
  let component: ProduitsIdComponent;
  let fixture: ComponentFixture<ProduitsIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProduitsIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProduitsIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
