import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesEnligneComponent } from './profiles-enligne.component';

describe('ProfilesEnligneComponent', () => {
  let component: ProfilesEnligneComponent;
  let fixture: ComponentFixture<ProfilesEnligneComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesEnligneComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesEnligneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
