import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StockagesIdComponent } from './stockages-id.component';

describe('StockagesIdComponent', () => {
  let component: StockagesIdComponent;
  let fixture: ComponentFixture<StockagesIdComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StockagesIdComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StockagesIdComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
