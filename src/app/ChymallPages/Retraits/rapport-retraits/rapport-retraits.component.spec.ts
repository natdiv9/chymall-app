import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RapportRetraitsComponent } from './rapport-retraits.component';

describe('RapportRetraitsComponent', () => {
  let component: RapportRetraitsComponent;
  let fixture: ComponentFixture<RapportRetraitsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RapportRetraitsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RapportRetraitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
