import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientsIdComponent } from './clients-id.component';

describe('ClientsIdComponent', () => {
  let component: ClientsIdComponent;
  let fixture: ComponentFixture<ClientsIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClientsIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientsIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
