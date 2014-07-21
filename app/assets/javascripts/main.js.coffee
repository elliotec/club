######## HEADER #########

$(document).ready ->
  menu = $("#navigation-menu")
  menuToggle = $("#js-mobile-menu")
  signUp = $(".sign-up")
  $(menuToggle).on "click", (e) ->
    e.preventDefault()
    menu.slideToggle ->
      menu.removeAttr "style"  if menu.is(":hidden")
      return
    return

  # underline under the active nav item
  $(".nav .nav-link").click ->
    $(".nav .nav-link").each ->
      $(this).removeClass "active-nav-item"
      return
    $(this).addClass "active-nav-item"
    $(".nav .more").removeClass "active-nav-item"
    return
  return


####### SCROLL ARROW ########

$(window).scroll ->
  
  #get scroll position
  topWindow = $(window).scrollTop()
  
  #multipl by 1.5 so the arrow will become transparent half-way up the page
  topWindow = topWindow * 1.5
  
  #get height of window
  windowHeight = $(window).height()
  
  #set position as percentage of how far the user has scrolled 
  position = topWindow / windowHeight
  
  #invert the percentage
  position = 1 - position
  
  #define arrow opacity as based on how far up the page the user has scrolled
  #no scrolling = 1, half-way up the page = 0
  $(".arrow-wrap").css "opacity", position
  return


#Code stolen from css-tricks for smooth scrolling:
$(document).ready ->
  filterPath = (string) ->
    string.replace(/^\//, "").replace(/(index|default).[a-zA-Z]{3,4}$/, "").replace /\/$/, ""
  
  # use the first element that is "scrollable"
  scrollableElement = (els) ->
    i = 0
    argLength = arguments_.length

    while i < argLength
      el = arguments_[i]
      $scrollElement = $(el)
      if $scrollElement.scrollTop() > 0
        return el
      else
        $scrollElement.scrollTop 1
        isScrollable = $scrollElement.scrollTop() > 0
        $scrollElement.scrollTop 0
        return el  if isScrollable
      i++
    []
  locationPath = filterPath(location.pathname)
  scrollElem = scrollableElement("html", "body")
  $("a[href*=#]").each ->
    thisPath = filterPath(@pathname) or locationPath
    if locationPath is thisPath and (location.hostname is @hostname or not @hostname) and @hash.replace(/#/, "")
      $target = $(@hash)
      target = @hash
      if target
        targetOffset = $target.offset().top
        $(this).click (event) ->
          event.preventDefault()
          $(scrollElem).animate
            scrollTop: targetOffset
          , 400, ->
            location.hash = target
            return
          return
    return
  return

header = document.querySelector("header")
headroom = new Headroom(header,
  tolerance: 20
  offset: 200
  classes:
    initial: "animated"
    pinned: "swingInX"
    unpinned: "swingOutX"
    top: "headroom--top"
    notTop: "headroom--not-top"
)
headroom.init()
return