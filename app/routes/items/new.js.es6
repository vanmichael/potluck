export default Ember.Route.extend({
  model: function() {
    return this.store.createRecord('item');
  },
  deactivate: function() {
    var model = this.get('controller.model');
    if (model.get('isNew')) {
      model.deleteRecord();
    }
  },
  actions: {
    save: function(model) {
      var model = this.get('controller.model');
      var _this = this;
      model.save().then(function() {
        _this.transitionTo('items.show', model);
      });
    },
    cancel: function() {
      this.transitionTo('items.index');
    }
  }
});
