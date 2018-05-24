/**
 * Using Rails-like standard naming convention for endpoints.
 * GET     /api/hymns              ->  index
 * POST    /api/hymns              ->  create
 * GET     /api/hymns/:id          ->  show
 * PUT     /api/hymns/:id          ->  upsert
 * PATCH   /api/hymns/:id          ->  patch
 * DELETE  /api/hymns/:id          ->  destroy
 */

'use strict';

import { applyPatch } from 'fast-json-patch';
import {Hymn} from '../../sqldb';

function respondWithResult(res, statusCode) {
  statusCode = statusCode || 200;
  return function(entity) {
    if(entity) {
      return res.status(statusCode).json(entity);
    }
    return null;
  };
}

function patchUpdates(patches) {
  return function(entity) {
    try {
      applyPatch(entity, patches, /*validate*/ true);
    } catch(err) {
      return Promise.reject(err);
    }

    return entity.save();
  };
}

function removeEntity(res) {
  return function(entity) {
    if(entity) {
      return entity.destroy()
        .then(() => res.status(204).end());
    }
  };
}

function handleEntityNotFound(res) {
  return function(entity) {
    if(!entity) {
      res.status(404).end();
      return null;
    }
    return entity;
  };
}

function handleError(res, statusCode) {
  statusCode = statusCode || 500;
  return function(err) {
    res.status(statusCode).send(err);
  };
}

// Gets a list of Hymns
export function index(req, res) {
  return Hymn.findAll()
    .then(respondWithResult(res))
    .catch(handleError(res));
}

// Gets a single Hymn from the DB
export function show(req, res) {
  return Hymn.find({
    where: {
      _id: req.params.id
    }
  })
    .then(handleEntityNotFound(res))
    .then(respondWithResult(res))
    .catch(handleError(res));
}

// Gets a images for a single Hymn from the DB
export function showImages(req, res) {
  return Hymn.find({
    where: {
      _id: req.params.id
    }
  }).then(function() {
    return res.getImages();
  })
    .then(handleEntityNotFound(res))
    .then(respondWithResult(res))
    .catch(handleError(res));
}

// Creates a new Hymn in the DB
export function create(req, res) {
  return Hymn.create(req.body)
    .then(respondWithResult(res, 201))
    .catch(handleError(res));
}

// Upserts the given Hymn in the DB at the specified ID
export function upsert(req, res) {
  if(req.body._id) {
    Reflect.deleteProperty(req.body, '_id');
  }

  return Hymn.upsert(req.body, {
    where: {
      _id: req.params.id
    }
  })
    .then(respondWithResult(res))
    .catch(handleError(res));
}

// Updates an existing Hymn in the DB
export function patch(req, res) {
  if(req.body._id) {
    Reflect.deleteProperty(req.body, '_id');
  }
  return Hymn.find({
    where: {
      _id: req.params.id
    }
  })
    .then(handleEntityNotFound(res))
    .then(patchUpdates(req.body))
    .then(respondWithResult(res))
    .catch(handleError(res));
}

// Deletes a Hymn from the DB
export function destroy(req, res) {
  return Hymn.find({
    where: {
      _id: req.params.id
    }
  })
    .then(handleEntityNotFound(res))
    .then(removeEntity(res))
    .catch(handleError(res));
}
