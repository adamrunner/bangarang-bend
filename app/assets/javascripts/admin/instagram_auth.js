Bangarang.IGAuth = {

  submitCode: function() {
    var form = document.getElementById('ig-auth-form'),
        code = document.getElementById('instagram_auth_code');
    code.value = this.getCode();

    var postCode = $.ajax({
      method  : form.method,
      url     : form.action,
      data    : $(form).serialize(),
      cache   : false,
      dataType: 'json'
    });

    setTimeout(Bangarang.IGAuth.updateStatus, 500);

    postCode.fail(function(jqXHR, textStatus, errorThrown) {
      Bangarang.trigger( 'flashMessage', $.parseJSON(jqXHR.responseText) );
    });
  },

  getCode: function() {
    return window.location.search.replace(/\?code=/, '');
  },

  updateStatus: function() {
    var $igAuth     = $('#ig-auth'),
        $authStatus = $igAuth.find('#auth-status'),
        $progress   = $igAuth.find('#progress'),
        $indicator  = $igAuth.find('#activity-indicator');

    var status = $.ajax({
      method  : 'get',
      url     : "/admin/auth_status",
      cache   : false,
      dataType: 'json'
    });

    status.always(function(data, textStatus, jqXHR) {
      Bangarang.IGAuth.setValues($authStatus, $progress, data);

      switch (data["type"]) {
        case 'success':
          setTimeout(Bangarang.IGAuth.updateStatus, 500);
          break;
        case 'complete':
          Bangarang.IGAuth.setSuccess($authStatus, $progress, $indicator, data);
          setTimeout(Bangarang.IGAuth.redirectHome, 3000);
          break;
        case 'error':
          Bangarang.IGAuth.setError($authStatus, $progress, $indicator, data);
          break;
      }
    });
  },

  setValues: function($authStatus, $progress, data) {
    $authStatus.html(data['msg'])
    $progress.animate({"value" : data['percent'] + "%"}, {duration: 500, easing: 'linear'});
  },

  setSuccess: function($authStatus, $progress, $indicator, data) {
    $progress.addClass('progress-success');
    $authStatus.addClass('text-success');
    $indicator.html('<i class="btl bt-check-circle bt-3x text-success"></i>')
  },

  setError: function($authStatus, $progress, $indicator, data) {
    $progress.addClass('progress-danger');
    $authStatus.addClass('text-danger');
    $indicator.html('<i class="btl bt-exclamation-triangle bt-3x text-danger"></i>')
  },

  redirectHome: function() {
    window.location = "/admin";
  }
}
