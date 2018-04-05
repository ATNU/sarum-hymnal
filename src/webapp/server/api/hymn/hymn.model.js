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
    firstLine: DataTypes.STRING,
    melody: DataTypes.STRING,
    cycle: DataTypes.STRING,  
    active: DataTypes.BOOLEAN
  });
}
