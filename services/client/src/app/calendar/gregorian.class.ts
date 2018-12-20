import { Injectable } from '@angular/core';
import { Calendar } from './calendar.class';

export class Gregorian extends Calendar {

  public dominicalLetter: string;
  public easterFullMoon: number[];
  public easterSunday: number[];
  public goldenNumber: number;
  public martyrologyLetter: string;
  public solarCycle: number;

  constructor(year: number) {

    super();

    const a = Calendar.gMod(year, 19);
    const goldenNumber = a + 1;                                           // Golden Number
    const b = Math.floor(year / 100);
    const c = Calendar.gMod(year, 100);
    const d = Math.floor(b / 4);
    const e = Calendar.gMod(b, 4);
    const f = Math.floor((b + 8) / 25);
    const g = Math.floor((b - f + 1) / 3);
    const h = Calendar.gMod((19 * a + b - d - g + 15), 30);
    const i = Math.floor(c / 4);
    const k = Calendar.gMod(c, 4);
    const l = Calendar.gMod((2 * e + 2 * i - h - k + 4), 7);
    const m = Math.floor((a + 11 * h + 22 * l ) / 451);
    const ep = Calendar.gMod((11 * a + 8 - b + d + Math.floor((8 * b + 13 ) / 25)), 30);

    let fmg = ep <= 23 ? 136 - ep : null;                          // Easter full moon [days after -92 March]
    fmg = (ep === 24) || (ep === 25) ? 141 : fmg;
    fmg = (ep === 25) && (goldenNumber > 11) ? 140 : fmg;
    fmg = (ep >= 26 ) ? 166 - ep : fmg;

    const easterSunday = 114 + h - 7 * m + l;                                  // Easter Sunday [days after -92 March]
    const monthEasterFullMoon = Math.floor(fmg / 31);                          // month Easter full moon [March = 3; April = 4]
    const dayEasterFullMoon = Calendar.gMod(fmg, 31) + 1;                              // day Easter full moon
    const monthEasterSunday = Math.floor(easterSunday / 31);                          // month Easter Sunday [March = 3; April = 4]
    const dayEasterSunday = Calendar.gMod(easterSunday, 31) + 1;                              // day Easter Sunday
    let s = 0;

    s = ((b === 0) && (Calendar.gMod(year, 400) !== 0)) ? 5 : s;
    const solarCycle = Calendar.gMod((year + 8), 28) + 1;                           // Number in Solar Cycle
    s = Calendar.gMod((6 + Math.floor(5 * year / 4) - Math.floor(year / 100) + Math.floor(year / 400)), 7);
    const dominicalLetter = Calendar.dominicalLetters[s + 7 * Calendar.yearType(year, 'Gregorian')];
    const martyrologyLetter = !isNaN(ep) ? Calendar.martyrologyLettersGregorian[ep - 1] : null;

    this.dominicalLetter = dominicalLetter;
    this.easterFullMoon = [dayEasterFullMoon, monthEasterFullMoon];
    this.easterSunday = [dayEasterSunday, monthEasterSunday];
    this.goldenNumber = goldenNumber;
    this.martyrologyLetter = martyrologyLetter;
    this.solarCycle = solarCycle;
  }
}
