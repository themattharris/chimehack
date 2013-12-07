# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MIN = 0
MAX = 200
STEP = 20
INITIAL = 20

rewards = [
  "The children die"
  "A child gets a vaccine for polio"
  "10 children are innoculated against anthrax"
  "20 children are saved from a life of circus clowning"
  "25 children are given 1st generation Xbox's"
  "30 children are freed from the Foxconn factory"
  "Miley Cyrus performs for the children"
  "30 children are given one week of free Uber X rides"
  "50 child soldiers have their guns upgraded"
  "100 children are given a single Tom's shoe (to encourage team work and sharing)"
  "You actually own this child asking for money"
]

updateDonation = (val) ->
  text = rewards[Math.floor(Math.abs(val)/STEP)] || rewards[rewards.length - 1]
  $(".donationReward").text("$" + val + " - " + text)

$().ready ->
  $('.slider').slider
    orientation:'vertical'
    min: MIN
    max: MAX
    value: INITIAL
    step: INITIAL
    reversed: true
    selection: 'after'
  $('.slider').on 'slide', (ev) ->
    updateDonation(ev.value)
  updateDonation(INITIAL)

