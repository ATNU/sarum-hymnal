'use strict';

var proxyquire = require('proxyquire').noPreserveCache();

var hymnCtrlStub = {
  index: 'hymnCtrl.index',
  show: 'hymnCtrl.show',
  create: 'hymnCtrl.create',
  upsert: 'hymnCtrl.upsert',
  patch: 'hymnCtrl.patch',
  destroy: 'hymnCtrl.destroy'
};

var routerStub = {
  get: sinon.spy(),
  put: sinon.spy(),
  patch: sinon.spy(),
  post: sinon.spy(),
  delete: sinon.spy()
};

// require the index with our stubbed out modules
var hymnIndex = proxyquire('./index.js', {
  express: {
    Router() {
      return routerStub;
    }
  },
  './hymn.controller': hymnCtrlStub
});

describe('Thing API Router:', function() {
  it('should return an express router instance', function() {
    expect(hymnIndex).to.equal(routerStub);
  });

  describe('GET /api/hymns', function() {
    it('should route to hymn.controller.index', function() {
      expect(routerStub.get
        .withArgs('/', 'hymnCtrl.index')
        ).to.have.been.calledOnce;
    });
  });

  describe('GET /api/hymns/:id', function() {
    it('should route to hymn.controller.show', function() {
      expect(routerStub.get
        .withArgs('/:id', 'hymnCtrl.show')
        ).to.have.been.calledOnce;
    });
  });

  describe('POST /api/hymns', function() {
    it('should route to hymn.controller.create', function() {
      expect(routerStub.post
        .withArgs('/', 'hymnCtrl.create')
        ).to.have.been.calledOnce;
    });
  });

  describe('PUT /api/hymns/:id', function() {
    it('should route to hymn.controller.upsert', function() {
      expect(routerStub.put
        .withArgs('/:id', 'hymnCtrl.upsert')
        ).to.have.been.calledOnce;
    });
  });

  describe('PATCH /api/hymns/:id', function() {
    it('should route to hymn.controller.patch', function() {
      expect(routerStub.patch
        .withArgs('/:id', 'hymnCtrl.patch')
        ).to.have.been.calledOnce;
    });
  });

  describe('DELETE /api/hymns/:id', function() {
    it('should route to hymn.controller.destroy', function() {
      expect(routerStub.delete
        .withArgs('/:id', 'hymnCtrl.destroy')
        ).to.have.been.calledOnce;
    });
  });
});
