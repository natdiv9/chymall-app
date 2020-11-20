import { TestBed, async, inject } from '@angular/core/testing';

import { ClientUpdateGuard } from './client-update.guard';

describe('ClientUpdateGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ClientUpdateGuard]
    });
  });

  it('should ...', inject([ClientUpdateGuard], (guard: ClientUpdateGuard) => {
    expect(guard).toBeTruthy();
  }));
});
