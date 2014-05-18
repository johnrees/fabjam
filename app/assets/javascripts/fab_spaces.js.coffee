jQuery ->

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
    map = L.map('map').setView([51.505, -0.09], 13)
    L.tileLayer('http://{s}.tiles.mapbox.com/v3/johnrees.i8b9pofn/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
    }).addTo(map)

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
