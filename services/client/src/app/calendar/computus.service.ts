import { Injectable } from '@angular/core';
import { Gregorian } from './gregorian.class';
import { Julian } from './julian.class';

/**
 * Computus class.
 */
export class Computus {

  public gregorian: Gregorian;
  public julian: Julian;

  constructor(year: number) {
    this.gregorian = new Gregorian(year);
    this.julian = new Julian(year);
  }
}
