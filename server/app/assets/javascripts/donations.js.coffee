# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

ready = ->
  console.log("Donations test")
  if ($('#donation_amount').length == 0)
    return false
  if localStorage.currentDonation
    $('#donation_amount').val(localStorage.currentDonation)

$(document).ready ready
$(document).on('page:load', ready);
