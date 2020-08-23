import { TestBed } from '@angular/core/testing';

import { AdhesionGuardService } from './adhesion-guard.service';

describe('AdhesionGuardService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AdhesionGuardService = TestBed.get(AdhesionGuardService);
    expect(service).toBeTruthy();
  });
});
