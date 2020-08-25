import { TestBed, async, inject } from '@angular/core/testing';

import { TranfertGuard } from './tranfert.guard';

describe('TranfertGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [TranfertGuard]
    });
  });

  it('should ...', inject([TranfertGuard], (guard: TranfertGuard) => {
    expect(guard).toBeTruthy();
  }));
});
