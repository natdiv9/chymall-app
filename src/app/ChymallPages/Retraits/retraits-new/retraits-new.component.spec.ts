import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RetraitsNewComponent } from './retraits-new.component';

describe('RetraitsNewComponent', () => {
  let component: RetraitsNewComponent;
  let fixture: ComponentFixture<RetraitsNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RetraitsNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RetraitsNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
