import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitProduitsNewComponent } from './retrait-produits-new.component';

describe('RetraitProduitsNewComponent', () => {
  let component: RetraitProduitsNewComponent;
  let fixture: ComponentFixture<RetraitProduitsNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitProduitsNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitProduitsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
