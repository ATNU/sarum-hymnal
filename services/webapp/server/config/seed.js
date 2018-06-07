/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';
import sqldb from '../sqldb';
let Hymn = sqldb.Hymn;
let Image = sqldb.Image;

Hymn.sync()
  .then(() => Hymn.destroy({ where: {} }))
  .then(() => Hymn.bulkCreate([{
    folio: '1r',
    staves: '4-9',
    name: 'Conditor alme syderum',
    clef: 'F3',
    firstLine: 'E C E G A A F G',
    melody: null,
    cycle: 'Temporal',
    feastOrSeason: 'Advent',
    grade: null,
    days: 'Daily',
    startDate: null,
    endDate: null,
    office: 'Vespers',
    notes: 'Notes'
  }, {
    folio: '1v',
    staves: '1-7',
    name: 'Conditor alme syderum',
    clef: 'F3',
    firstLine: 'E C E G A A F G',
    melody: null,
    cycle: 'Temporal',
    feastOrSeason: 'Advent',
    grade: null,
    days: 'Daily',
    startDate: null,
    endDate: null,
    office: 'Vespers',
    notes: 'Notes'
  }
  ])
  .then(() => Image.sync()
    .then(() => Image.destroy({ where: {} }))
    .then(() => Image.bulkCreate(
      [
        {
          filename: 'GB-Osj_MS60_001r.tif'
        }
      ]
    ))
  )
  .then(() => Hymn.findAll({
    limit: 1
  })
  )
  .then(Hymns => Image.findAll({
    limit: 1
  })
  .then(Images =>
    Hymns[0].addImage(Images[0]).then(() =>
      Hymns[0].getImages()
      //Hymns[0].getImages().then(imgs => console.log(imgs))
    )
  )));

