import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitProduitsIdComponent } from './retrait-produits-id.component';

describe('RetraitProduitsIdComponent', () => {
  let component: RetraitProduitsIdComponent;
  let fixture: ComponentFixture<RetraitProduitsIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitProduitsIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitProduitsIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
