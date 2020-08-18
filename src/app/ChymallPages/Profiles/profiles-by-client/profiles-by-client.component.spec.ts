import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfilesByClientComponent } from './profiles-by-client.component';

describe('ProfilesByClientComponent', () => {
  let component: ProfilesByClientComponent;
  let fixture: ComponentFixture<ProfilesByClientComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfilesByClientComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfilesByClientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
