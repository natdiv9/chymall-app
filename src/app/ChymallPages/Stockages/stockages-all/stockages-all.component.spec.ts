import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StockagesAllComponent } from './stockages-all.component';

describe('StockagesAllComponent', () => {
  let component: StockagesAllComponent;
  let fixture: ComponentFixture<StockagesAllComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StockagesAllComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StockagesAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
