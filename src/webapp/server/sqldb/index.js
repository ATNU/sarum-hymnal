/**
 * Sequelize initialization module
 */

'use strict';

import config from '../config/environment';
import Sequelize from 'sequelize';

var db = {
  Sequelize,
  sequelize: new Sequelize(config.sequelize.uri, config.sequelize.options)
};

// Insert models below
db.Hymn = db.sequelize.import('../api/hymn/hymn.model');
db.Image = db.sequelize.import('../api/image/image.model');

db.Hymn.belongsToMany(db.Image, {through: 'hymn_images'});
db.Image.belongsToMany(db.Hymn, {through: 'hymn_images'});

module.exports = db;
