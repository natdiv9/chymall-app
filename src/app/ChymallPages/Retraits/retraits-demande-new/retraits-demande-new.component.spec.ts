import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitsDemandeNewComponent } from './retraits-demande-new.component';

describe('RetraitsDemandeNewComponent', () => {
  let component: RetraitsDemandeNewComponent;
  let fixture: ComponentFixture<RetraitsDemandeNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitsDemandeNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitsDemandeNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
