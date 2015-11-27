###
 @title Pursuing Nav
 @url http://akurganow.github.io/pursuing-nav
 @version 0.3.0
 @author Alexander Kurganov
 @license MIT
###

`(function($) {`

$.fn.pursuingNav = (options = {}) ->
  userAgent = navigator.userAgent
  is_pursuing = !/android|iphone|ipad/i.test(userAgent)

  element = this
  height = options.height || element.outerHeight()
  offsetTop = element.offset().top
  stick = height + offsetTop
  preSTop = $(document).scrollTop()

  if is_pursuing
    element.css
      position: 'absolute'
      top: offsetTop

    $(window).on 'scroll', ->
      sTop = $(document).scrollTop()

      height = element.outerHeight() unless options.height
      offsetTop = element.offset().top
      stick = height + offsetTop

      if sTop >= 0
        if preSTop < sTop # Scrolling downwards
          if sTop == offsetTop
            invisibleHeight = stick - preSTop - height
            invisibleHeight = height if invisibleHeight > height # Fallback for scroll-clicks

            element.css
              position: 'absolute'
              top: sTop - invisibleHeight

          else if sTop > stick
            element.css
              position: 'absolute'
              top: sTop - height

        else if preSTop > sTop # Scrolling upwards
          if sTop <= offsetTop # When scrolled to the top of pursued element, make it fixed
            element.css
              position: 'fixed'
              top: 0

      preSTop = sTop

  else
    element.css
      position: 'fixed'
      top: offsetTop

`})(jQuery);`
