import { TestBed, async, inject } from '@angular/core/testing';

import { RapportRetraisGuard } from './rapport-retrais.guard';

describe('RapportRetraisGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [RapportRetraisGuard]
    });
  });

  it('should ...', inject([RapportRetraisGuard], (guard: RapportRetraisGuard) => {
    expect(guard).toBeTruthy();
  }));
});
