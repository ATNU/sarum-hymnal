'use strict';

var app = require('../..');
import request from 'supertest';

var newHymn;

describe('Hymn API:', function() {
  describe('GET /api/hymns', function() {
    var hymns;

    beforeEach(function(done) {
      request(app)
        .get('/api/hymns')
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err, res) => {
          if(err) {
            return done(err);
          }
          hymns = res.body;
          done();
        });
    });

    it('should respond with JSON array', function() {
      expect(hymns).to.be.instanceOf(Array);
    });
  });

  describe('POST /api/hymns', function() {
    beforeEach(function(done) {
      request(app)
        .post('/api/hymns')
        .send({
          name: 'New Hymn',
          info: 'This is the brand new hymn!!!'
        })
        .expect(201)
        .expect('Content-Type', /json/)
        .end((err, res) => {
          if(err) {
            return done(err);
          }
          newHymn = res.body;
          done();
        });
    });

    it('should respond with the newly created hymn', function() {
      expect(newHymn.name).to.equal('New Hymn');
      expect(newHymn.info).to.equal('This is the brand new hymn!!!');
    });
  });

  describe('GET /api/hymns/:id', function() {
    var hymn;

    beforeEach(function(done) {
      request(app)
        .get(`/api/hymns/${newHymn._id}`)
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err, res) => {
          if(err) {
            return done(err);
          }
          hymn = res.body;
          done();
        });
    });

    afterEach(function() {
      hymn = {};
    });

    it('should respond with the requested hymn', function() {
      expect(hymn.name).to.equal('New Hymn');
      expect(hymn.info).to.equal('This is the brand new hymn!!!');
    });
  });

  describe('PUT /api/hymns/:id', function() {
    var updatedHymn;

    beforeEach(function(done) {
      request(app)
        .put(`/api/hymns/${newHymn._id}`)
        .send({
          name: 'Updated Hymn',
          info: 'This is the updated hymn!!!'
        })
        .expect(200)
        .expect('Content-Type', /json/)
        .end(function(err, res) {
          if(err) {
            return done(err);
          }
          updatedHymn = res.body;
          done();
        });
    });

    afterEach(function() {
      updatedHymn = {};
    });

    it('should respond with the updated hymn', function() {
      expect(updatedHymn.name).to.equal('Updated Hymn');
      expect(updatedHymn.info).to.equal('This is the updated hymn!!!');
    });

    it('should respond with the updated hymn on a subsequent GET', function(done) {
      request(app)
        .get(`/api/hymns/${newHymn._id}`)
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err, res) => {
          if(err) {
            return done(err);
          }
          let hymn = res.body;

          expect(hymn.name).to.equal('Updated Hymn');
          expect(hymn.info).to.equal('This is the updated hymn!!!');

          done();
        });
    });
  });

  describe('PATCH /api/hymns/:id', function() {
    var patchedHymn;

    beforeEach(function(done) {
      request(app)
        .patch(`/api/hymns/${newHymn._id}`)
        .send([
          { op: 'replace', path: '/name', value: 'Patched Hymn' },
          { op: 'replace', path: '/info', value: 'This is the patched hymn!!!' }
        ])
        .expect(200)
        .expect('Content-Type', /json/)
        .end(function(err, res) {
          if(err) {
            return done(err);
          }
          patchedHymn = res.body;
          done();
        });
    });

    afterEach(function() {
      patchedHymn = {};
    });

    it('should respond with the patched hymn', function() {
      expect(patchedHymn.name).to.equal('Patched Hymn');
      expect(patchedHymn.info).to.equal('This is the patched hymn!!!');
    });
  });

  describe('DELETE /api/hymns/:id', function() {
    it('should respond with 204 on successful removal', function(done) {
      request(app)
        .delete(`/api/hymns/${newHymn._id}`)
        .expect(204)
        .end(err => {
          if(err) {
            return done(err);
          }
          done();
        });
    });

    it('should respond with 404 when hymn does not exist', function(done) {
      request(app)
        .delete(`/api/hymns/${newHymn._id}`)
        .expect(404)
        .end(err => {
          if(err) {
            return done(err);
          }
          done();
        });
    });
  });
});
