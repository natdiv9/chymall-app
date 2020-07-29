import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UtilisateursNewComponent } from './utilisateurs-new.component';

describe('UtilisateursNewComponent', () => {
  let component: UtilisateursNewComponent;
  let fixture: ComponentFixture<UtilisateursNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UtilisateursNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UtilisateursNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
