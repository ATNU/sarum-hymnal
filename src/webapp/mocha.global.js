import app from './';

after(function() {
  return Promise.all([
    // Add any promises here for processes that need to be closed before the tests can finish
    
    new Promise(resolve => {
      app.angularFullstack.close(resolve);
    }),

  ]);
});
