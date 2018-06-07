'use strict';

export default function(sequelize, DataTypes) {
  return sequelize.define('Image', {
    _id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    filename: { type: DataTypes.STRING, allowNull: false }
  });
}
