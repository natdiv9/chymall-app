import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesCompleterUsernameComponent } from './profiles-completer-username.component';

describe('ProfilesCompleterUsernameComponent', () => {
  let component: ProfilesCompleterUsernameComponent;
  let fixture: ComponentFixture<ProfilesCompleterUsernameComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesCompleterUsernameComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesCompleterUsernameComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
