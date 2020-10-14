import { TestBed, async, inject } from '@angular/core/testing';

import { ProfileEnligneGuard } from './profile-enligne.guard';

describe('ProfileEnligneGuard', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ProfileEnligneGuard]
    });
  });

  it('should ...', inject([ProfileEnligneGuard], (guard: ProfileEnligneGuard) => {
    expect(guard).toBeTruthy();
  }));
});
