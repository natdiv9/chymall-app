import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesUpdateComponent } from './profiles-update.component';

describe('ProfilesUpdateComponent', () => {
  let component: ProfilesUpdateComponent;
  let fixture: ComponentFixture<ProfilesUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
