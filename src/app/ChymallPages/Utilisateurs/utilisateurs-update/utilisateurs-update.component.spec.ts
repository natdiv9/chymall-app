import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UtilisateursUpdateComponent } from './utilisateurs-update.component';

describe('UtilisateursUpdateComponent', () => {
  let component: UtilisateursUpdateComponent;
  let fixture: ComponentFixture<UtilisateursUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UtilisateursUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UtilisateursUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
