import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UtilisateursIdComponent } from './utilisateurs-id.component';

describe('UtilisateursIdComponent', () => {
  let component: UtilisateursIdComponent;
  let fixture: ComponentFixture<UtilisateursIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UtilisateursIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UtilisateursIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
