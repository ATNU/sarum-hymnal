import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';

import { CoreModule } from '@app/core';
import { SharedModule } from '@app/shared';
import { MaterialModule } from '@app/material.module';
import { HymnalComponent } from './hymnal.component';

describe('HymnalComponent', () => {
  let component: HymnalComponent;
  let fixture: ComponentFixture<HymnalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
        imports: [
          BrowserAnimationsModule,
          FlexLayoutModule,
          MaterialModule,
          CoreModule,
          SharedModule,
          HttpClientTestingModule
        ],
        declarations: [HymnalComponent],
        providers: []
      })
      .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HymnalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
