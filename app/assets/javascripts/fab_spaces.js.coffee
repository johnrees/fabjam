jQuery ->

  $("#fab_space_name").selectize
    maxItems: 1
    valueField: "url"
    labelField: "name"
    searchField: "name"
    create: false
    render:
      option: (item, escape) ->
        "<div>" + "<span class=\"t\">" + "<span class=\"name\"><i class=\"icon " + ((if item.fork then "fork" else "source")) + "\"></i>" + escape(item.name) + "</span>" + "<span class=\"by\">" + escape(item.username) + "</span>" + "</span>" + "<span class=\"description\">" + escape(item.description) + "</span>" + "<ul class=\"meta\">" + ((if item.language then "<li class=\"language\">" + escape(item.language) + "</li>" else "")) + "<li class=\"watchers\"><span>" + escape(item.watchers) + "</span> watchers</li>" + "<li class=\"forks\"><span>" + escape(item.forks) + "</span> forks</li>" + "</ul>" + "</div>"

    score: (search) ->
      score = @getScoreFunction(search)
      (item) ->
        score(item) * (1 + Math.min(item.watchers / 100, 1))

    load: (query, callback) ->
      return callback()  unless query.length
      $.ajax
        url: "https://api.github.com/legacy/repos/search/" + encodeURIComponent(query)
        type: "GET"
        error: ->
          callback()

        success: (res) ->
          callback res.repositories.slice(0, 10)




  $("#geocomplete").geocomplete
    map: "#geocomplete-map"
    details: 'form'
    detailsAttribute: 'data-geo'
    location: $('#geocomplete').data('latlng')
    markerOptions:
      draggable: true
  .bind "geocode:dragged", (event, latLng) ->
    $("input#fab_space_lat").val latLng.lat()
    $("input#fab_space_lng").val latLng.lng()
  .bind "geocode:result", (event, result) ->
    $("input#fab_space_lat").val result.geometry.location.lat()
    $("input#fab_space_lng").val result.geometry.location.lng()


  if $('#map').length > 0
    map = L.map('map').setView([21.505, -15.09], 1)
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/johnrees.i8b9pofn/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
    }).addTo(map)

    $.getJSON '/spaces.json', (result) ->
      for fab_space in result.fab_spaces
        if fab_space.lat
          marker = L.marker([fab_space.lat, fab_space.lng]).addTo(map)
          marker.bindPopup("<b><a href='/spaces/#{fab_space.slug}'>#{fab_space.name}</a></b><br>#{fab_space.description}")


  if $(".slider").length > 0
    $(".slider").noUiSlider
      start: 1
      step: 1
      range:
        min: parseInt 0#$(this).data('min')
        max: 50
      serialization:
        lower: [
          $.Link
            target: (value, handleElement, slider) ->
              slider.prev('p').find('span').text(value)
              slider.next('input').val(value)
        ]
        format:
          decimals: 0
