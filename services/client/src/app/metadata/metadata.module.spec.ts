import { MetadataModule } from './metadata.module';

describe('MetadataModule', () => {
  let metadataModule: MetadataModule;

  beforeEach(() => {
    metadataModule = new MetadataModule();
  });

  it('should create an instance', () => {
    expect(metadataModule).toBeTruthy();
  });
});
