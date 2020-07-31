import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PaiementsNewComponent } from './paiements-new.component';

describe('PaiementsNewComponent', () => {
  let component: PaiementsNewComponent;
  let fixture: ComponentFixture<PaiementsNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PaiementsNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PaiementsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
