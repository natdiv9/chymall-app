import { TestBed, async, inject } from '@angular/core/testing';

import { RetraitsAllGuard } from './retraits-all.guard';

describe('RetraitsAllGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [RetraitsAllGuard]
    });
  });

  it('should ...', inject([RetraitsAllGuard], (guard: RetraitsAllGuard) => {
    expect(guard).toBeTruthy();
  }));
});
