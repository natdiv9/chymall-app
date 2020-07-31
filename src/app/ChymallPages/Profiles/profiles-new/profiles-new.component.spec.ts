import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesNewComponent } from './profiles-new.component';

describe('ProfilesNewComponent', () => {
  let component: ProfilesNewComponent;
  let fixture: ComponentFixture<ProfilesNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
