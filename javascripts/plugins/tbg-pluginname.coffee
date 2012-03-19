!(( $ ) -> 

  "use strict"


  # CLASSNAME CLASS DEFINITION
  # ========================== #

  ClassName = ( element, options) ->
    process = $.proxy(@.process, this)
    $element = if $(element).is('body') then $(window) else $(element)
    @options = $.extend({}, $.fn.pluginname.defaults, options)


  ClassName.prototype = 
    
    constructor: ClassName

    method: () ->
      "I'm a bad ass method"

    # Method bound events hit first
    process: () ->
      alert 'process'





 # PLUGIN DEFINITION
 # =========================== #

  $.fn.pluginname = ( option ) ->
    this.each () ->
      $this = $(this)
      data = $this.data('pluginname')
      options = typeof option == 'object' and option
      if !data then $this.data('pluginname', (data = new ClassName(this, options)))
      if typeof option == 'string' then data[option]()



  $.fn.pluginname.defaults =
    offset: 10


  $.fn.pluginname.Constructor = ClassName

 # CLASSNAME DATA-API — NB. This will change per plugin
 # ================== #
  $(()->
    $('body').on  'click.plugin.data-api', '[data-plugin]', (e) ->
      e.preventDefault()
      $(this).pluginname()
  )

)( window.jQuery )