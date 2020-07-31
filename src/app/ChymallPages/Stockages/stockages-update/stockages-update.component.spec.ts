import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StockagesUpdateComponent } from './stockages-update.component';

describe('StockagesUpdateComponent', () => {
  let component: StockagesUpdateComponent;
  let fixture: ComponentFixture<StockagesUpdateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StockagesUpdateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StockagesUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
