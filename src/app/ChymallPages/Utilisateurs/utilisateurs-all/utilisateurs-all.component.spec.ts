import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UtilisateursAllComponent } from './utilisateurs-all.component';

describe('UtilisateursAllComponent', () => {
  let component: UtilisateursAllComponent;
  let fixture: ComponentFixture<UtilisateursAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UtilisateursAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UtilisateursAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
