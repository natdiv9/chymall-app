import { TestBed } from '@angular/core/testing';

import { TechniqueGuardService } from './technique-guard.service';

describe('TechniqueGuardService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TechniqueGuardService = TestBed.get(TechniqueGuardService);
    expect(service).toBeTruthy();
  });
});
