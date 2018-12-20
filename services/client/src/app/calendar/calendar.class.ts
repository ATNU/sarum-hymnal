import { Injectable } from '@angular/core';

export class Calendar {

  public static dominicalLetters = ['G', 'F', 'E', 'D', 'C', 'B', 'A', 'AG', 'GF', 'FE', 'ED', 'DC', 'CB', 'BA'];
  public static epacts = ['*(XXX)', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX', 'XXI', 'XXII', 'XXIII', 'XXIV', 'XXV', 'XXVI', 'XXVII', 'XXVIII', 'XXIX'];
  public static martyrologyLettersJulian = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u'];
  public static martyrologyLettersGregorian = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'M', 'N', 'P'];
  public static months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  public static weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  public static yearLengths = ['common', 'bissextile'];

  /**
   * Generalized modulo function returns remainder when m is divided by n
   * @param m
   * @param n
   * @returns {number}
   */
  public static gMod(m: number, n: number): number {
    return ((m % n) + n) % n;
  }

  /**
   * Identifies leap years in each calendar type. 1 signifies a leap year, 0 for all other years
   * @param year
   * @param calendarType
   * @returns {number}
   */
  public static yearType(year: number, calendarType: string) {
    let type = Calendar.gMod(year, 4) === 0 ? 1 : 0;
    if (calendarType === 'Gregorian') {
      if (Calendar.gMod(year, 100) === 0) {
        type = 0;
      }
      if (Calendar.gMod(year, 400) === 0) {
        type = 1;
      }
    }
    return type;
  }

  constructor() {
    // Empty constructor
  }
}
