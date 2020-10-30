import { TestBed, async, inject } from '@angular/core/testing';

import { ProfilesUpdateGuard } from './profiles-update.guard';

describe('ProfilesUpdateGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ProfilesUpdateGuard]
    });
  });

  it('should ...', inject([ProfilesUpdateGuard], (guard: ProfilesUpdateGuard) => {
    expect(guard).toBeTruthy();
  }));
});
