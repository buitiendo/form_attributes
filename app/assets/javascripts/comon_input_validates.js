const DEFAULT_TEXT_FIELD_MAX_LENGTH = parseInt('10');
const REGEX_ONLY_INTEGER = /^[0-9]$/;

$(document).on('click', function(){
  $('.js-only-integer').each(function () {
    var elem = $(this);
    elem.on('keypress', function (e) {
      if (!String.fromCharCode(e.keyCode).match(REGEX_ONLY_INTEGER)) {
        e.preventDefault();
      }
    });
  });

  $('.js-max-length').each(function () {
    var elem = $(this);
    elem.on('keypress', function (e) {
      var len = e.currentTarget.value.length;
      var defaultMaxLength = elem.data('max-length') || DEFAULT_TEXT_FIELD_MAX_LENGTH;
      if (len >= defaultMaxLength) e.preventDefault();
    });
  });
});
