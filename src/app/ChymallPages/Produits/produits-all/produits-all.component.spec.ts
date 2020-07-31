import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitsAllComponent } from './produits-all.component';

describe('ProduitsAllComponent', () => {
  let component: ProduitsAllComponent;
  let fixture: ComponentFixture<ProduitsAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProduitsAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProduitsAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
