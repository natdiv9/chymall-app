import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitsNewComponent } from './produits-new.component';

describe('ProduitsNewComponent', () => {
  let component: ProduitsNewComponent;
  let fixture: ComponentFixture<ProduitsNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProduitsNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProduitsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
