# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MIN = 0
MAX = 100
STEP = 10
INITIAL = 10

rewards =
  1: "Protein biscuits for a hungry child"
  6: "A soccer ball for children in refugee camps."
  20: "Bed nets to protect families from deadly malaria-carrying mosquitoes."
  35: "Vaccines to protect 50 kids from killer diseases."
  70: "High-protein peanut paste to protect kids from malnutrition."
  100: "A bicycle to deliver medicines."

updateDonation = (val) ->
  val = neverZero(val)
  # OMG this is bad, don't judge me
  localStorage.currentDonation = val
  for key of rewards
    if key <= val
      text = rewards[key]
    else
      break
  $(".donationReward").text("$" + val + " - " + text)

neverZero = (val) ->
  if val == 0
    1
  else
    val

ready = ->
  if ($('.slider').length == 0)
    return false
  $('.slider').slider
    min: MIN
    max: MAX
    value: INITIAL
    step: STEP
    formater: neverZero
  $('.slider').on 'slide', (ev) ->
    updateDonation(ev.value)
  updateDonation(INITIAL)

$(document).ready ready
$(document).on('page:load', ready);

