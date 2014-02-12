var Router = Ember.Router.extend();

Router.map(function() {
  this.resource('items', function() {
    this.route('new');
    this.route('show', {path: ':item_id'});
    this.route('edit', {path: ':item_id/edit'});
  });

  this.route('about');
});

export default Router;
