$j(function() {


  var MainRouter = Backbone.Router.extend({
    routes: {
      "": "checkModal",
      "icon/:iconName": "showIcon"
    },

    checkModal: function() {
      var $modal = $j("div.modal");
      
      if ($modal.length > 0) {
        $modal.modal("hide");
      }
    },

    showIcon: function(iconName) {
      var $modal = $(mainView.modalTemplate({"iconName": iconName}));

      $modal.modal("show");
      $modal.on('hidden', function () {
        $modal.remove();
        if (firstInHistory) {
          mainRouter.navigate("/", {trigger: false});
          firstInHistory = false;
        } else {
          window.history.back();
        }
      })
    }
  });

  var mainRouter = new MainRouter();
  Backbone.history.start({pushState : false});
});
