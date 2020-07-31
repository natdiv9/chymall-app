import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesIdComponent } from './profiles-id.component';

describe('ProfilesIdComponent', () => {
  let component: ProfilesIdComponent;
  let fixture: ComponentFixture<ProfilesIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
