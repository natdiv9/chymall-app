import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitProduitsAllComponent } from './retrait-produits-all.component';

describe('RetraitProduitsAllComponent', () => {
  let component: RetraitProduitsAllComponent;
  let fixture: ComponentFixture<RetraitProduitsAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitProduitsAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitProduitsAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
