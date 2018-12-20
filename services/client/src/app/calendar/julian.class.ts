import { Injectable } from '@angular/core';
import { Calendar } from './calendar.class';

export class Julian extends Calendar {

  public dominicalLetter: string;
  public easterFullMoon: number[];
  public easterSunday: number[];
  public goldenNumber: number;
  public martyrologyLetter: string;
  public solarCycle: number;

  constructor(year: number) {

    super();

    const A = Calendar.gMod(year, 19);
    const goldenNumber = A + 1;                                         // Golden Number
    const B = Calendar.gMod(year, 4);
    const C = Calendar.gMod(year, 7);
    let  D = Calendar.gMod((19 * A + 15), 30);
    D = goldenNumber === 1 ? D + 1 : D;
    const E = Calendar.gMod((2 * B + 4 * C - D + 6), 7);
    const easterFullMoon = 113 + D;                                     // Easter full moon [days after -92 March]
    const dmj = easterFullMoon + E + 1;                                 // Easter Sunday [days after -92 March]
    const monthEasterFullMoon = Math.floor(easterFullMoon / 31);     // month Easter full moon [March = 3; April = 4]
    const dayEasterFullMoon = Calendar.gMod(easterFullMoon, 31) + 1; // day Easter full moon
    const monthEasterSunday = Math.floor(dmj / 31);                  // month Easter Sunday [March = 3; April = 4]
    const dayEasterSunday = Calendar.gMod(dmj, 31) + 1;              // day Easter Sunday
    const solarCycle = Calendar.gMod((year + 8), 28) + 1;            // Number in Solar Cycle
    const s = Calendar.gMod((4 + Math.floor(5 * year / 4 )), 7);
    const dominicalLetter = Calendar.dominicalLetters[s + 7 * Calendar.yearType(year, 'Julian')];
    const martyrologyLetter = Calendar.martyrologyLettersJulian[goldenNumber - 1];

    this.dominicalLetter = dominicalLetter;
    this.easterFullMoon = [dayEasterFullMoon, monthEasterFullMoon];
    this.easterSunday = [dayEasterSunday, monthEasterSunday];
    this.goldenNumber = goldenNumber;
    this.martyrologyLetter = martyrologyLetter;
    this.solarCycle = solarCycle;
  }
}
