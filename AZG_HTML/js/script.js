$(document).ready(function () {
  const nav = () => {
    $(window).scroll(function() {
      if ($(this).scrollTop() > 100) {
        $('#header').addClass('sticky-header');
      } else {
        $('#header').removeClass('sticky-header');
      }
    });

    $(".small-menu-trigger").on("click", function () {
      $(".small-menu-area").addClass("active");
    });
    $(".close-small-menu-area").on("click", function () {
      $(".small-menu-area").removeClass("active");
    });
  };

  var scale = $(".scale-carousel");
  scale.owlCarousel({
    items: 3,
    loop: true,
    nav: true,
    onChanged: callback,
    // startPosition: 0,
    margin: 30,
    responsiveClass: true,
    responsive: {
      0: {
        items: 1,
      },
      768: {
        items: 2,
      },
      992: {
        items: 3,
      },
      1200: {
        items: 3,
      },
    },
  });
  function callback(event) {
    var activeItem = event.item.index;
    scale.find('.item').removeClass('current');
    scale.find('.item').eq(activeItem).addClass('current');
  }


  $(".eH-Area").each(function() {
    $(this).find(".eH").matchHeight()
  })

  if($(window).width() > 991){
    $(".scale-item.video-item .video-area").css({
      'height' : $(".media .vids-area").height() -120
    })
    $(".scale-item.video-item iframe").css({
      'height' : $(".media .vids-area").height() -170
    })
  }

  nav();
});

$(window).ready(function(){
  setTimeout(function() {
    $(".loader-area").fadeOut();
  }, 1000);
})
