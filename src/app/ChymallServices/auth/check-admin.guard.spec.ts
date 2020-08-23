import { TestBed, async, inject } from '@angular/core/testing';

import { CheckAdminGuard } from './check-admin.guard';

describe('CheckAdminGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CheckAdminGuard]
    });
  });

  it('should ...', inject([CheckAdminGuard], (guard: CheckAdminGuard) => {
    expect(guard).toBeTruthy();
  }));
});
