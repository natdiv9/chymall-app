import { TestBed } from '@angular/core/testing';

import { RetraitGuardService } from './retrait-guard.service';

describe('RetraitGuardService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: RetraitGuardService = TestBed.get(RetraitGuardService);
    expect(service).toBeTruthy();
  });
});
