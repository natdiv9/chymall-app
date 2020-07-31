import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StockagesNewComponent } from './stockages-new.component';

describe('StockagesNewComponent', () => {
  let component: StockagesNewComponent;
  let fixture: ComponentFixture<StockagesNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StockagesNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StockagesNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
