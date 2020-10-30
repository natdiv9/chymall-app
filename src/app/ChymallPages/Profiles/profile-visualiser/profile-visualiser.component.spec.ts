import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileVisualiserComponent } from './profile-visualiser.component';

describe('ProfileVisualiserComponent', () => {
  let component: ProfileVisualiserComponent;
  let fixture: ComponentFixture<ProfileVisualiserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfileVisualiserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfileVisualiserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
