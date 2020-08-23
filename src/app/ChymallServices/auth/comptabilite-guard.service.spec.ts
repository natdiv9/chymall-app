import { TestBed } from '@angular/core/testing';

import { ComptabiliteGuardService } from './comptabilite-guard.service';

describe('ComptabiliteGuardService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ComptabiliteGuardService = TestBed.get(ComptabiliteGuardService);
    expect(service).toBeTruthy();
  });
});
