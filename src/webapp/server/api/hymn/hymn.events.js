/**
 * Thing model events
 */

'use strict';

import {EventEmitter} from 'events';
var Hymn = require('../../sqldb').Hymn;
var HymnEvents = new EventEmitter();

// Set max event listeners (0 == unlimited)
HymnEvents.setMaxListeners(0);

// Model events
var events = {
  afterCreate: 'save',
  afterUpdate: 'save',
  afterDestroy: 'remove'
};

// Register the event emitter to the model events
function registerEvents(hymn) {
  for(var e in events) {
    let event = events[e];
    hymn.hook(e, emitEvent(event));
  }
}

function emitEvent(event) {
  return function(doc, options, done) {
    HymnEvents.emit(`${event}:${doc._id}`, doc);
    HymnEvents.emit(event, doc);
    done(null);
  };
}

registerEvents(Hymn);
export default HymnEvents;
