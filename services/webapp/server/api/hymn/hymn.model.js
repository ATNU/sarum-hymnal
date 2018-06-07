'use strict';

export default function(sequelize, DataTypes) {
  return sequelize.define('Hymn', {
    _id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    folio: DataTypes.STRING,
    staves: DataTypes.STRING,
    name: DataTypes.STRING,
    clef: DataTypes.STRING,
    firstLine: { type: DataTypes.STRING, field: 'first_line'},
    melody: DataTypes.STRING,
    cycle: DataTypes.STRING,
    feastOrSeason: { type: DataTypes.STRING, field: 'feast_or_season'},
    grade: DataTypes.STRING,
    days: DataTypes.STRING,
    startDate: { type: DataTypes.DATEONLY, field: 'start_date'},
    endDate: { type: DataTypes.DATEONLY, field: 'end_date'},
    office: DataTypes.STRING,
    notes: DataTypes.TEXT
  });
}
