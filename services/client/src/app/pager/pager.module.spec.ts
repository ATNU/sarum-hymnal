import { PagerModule } from './pager.module';

describe('PagerModule', () => {
  let pagerModule: PagerModule;

  beforeEach(() => {
    pagerModule = new PagerModule();
  });

  it('should create an instance', () => {
    expect(pagerModule).toBeTruthy();
  });
});
