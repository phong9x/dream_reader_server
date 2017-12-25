
$(document).ready(function() {

 
  /* --------------------------------------------------------------------- */
  /* MAIN NAV MENU
  /* --------------------------------------------------------------------- */
  (function($) {
    if (!$('.sf-menu').length) return;

    // superfish menu
    $('.sf-menu').superfish({
      cssArrows: false
    });

    // add class: .active
    $('.header .main-nav li.active').parents('li').addClass('active');
  })(jQuery);


  /* --------------------------------------------------------------------- */
  /* footerAbsoluteBottom
  /* --------------------------------------------------------------------- */
  (function($) {
    var getViewport = function() {
      var e = window,
        a = 'inner';
      return 'innerWidth' in window || (a = 'client', e = document.documentElement || document.body), { width: e[a + 'Width'], height: e[a + 'Height'] } };

    function footerAbsoluteBottom() {
      if ($('.body').height() < getViewport().height) {
        $('.body').css('min-height', getViewport().height);
        $('.footer').addClass('footer-absolute-bottom');
      } else {
        $('.body').css('min-height', '');
        $('.footer').removeClass('footer-absolute-bottom');
      }
    }

    $(window).on('load', function() {
      footerAbsoluteBottom();
    });
  })(jQuery);


  /* --------------------------------------------------------------------- */
  /* data-tr-placeholder
  /* --------------------------------------------------------------------- */
  (function($) {
    if (!$("[data-tr-placeholder]").length) return;

    $("[data-tr-placeholder]").each(function() {
      var placeholderContent = $(this).attr("data-tr-placeholder");
      $(this).attr("placeholder", placeholderContent);

      $(this).on("focus", function() {
        $(this).attr("placeholder", "");
      });

      $(this).on("blur", function() {
        $(this).attr("placeholder", placeholderContent);
      });
    });
  })(jQuery);

});

