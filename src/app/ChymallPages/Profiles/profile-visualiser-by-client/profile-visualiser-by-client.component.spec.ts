import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProfileVisualiserByClientComponent } from './profile-visualiser-by-client.component';

describe('ProfileVisualiserByClientComponent', () => {
  let component: ProfileVisualiserByClientComponent;
  let fixture: ComponentFixture<ProfileVisualiserByClientComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProfileVisualiserByClientComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProfileVisualiserByClientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
