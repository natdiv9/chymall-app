import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesAllComponent } from './profiles-all.component';

describe('ProfilesAllComponent', () => {
  let component: ProfilesAllComponent;
  let fixture: ComponentFixture<ProfilesAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
