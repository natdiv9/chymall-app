import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientsEnligneComponent } from './clients-enligne.component';

describe('ClientsEnligneComponent', () => {
  let component: ClientsEnligneComponent;
  let fixture: ComponentFixture<ClientsEnligneComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ClientsEnligneComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientsEnligneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
