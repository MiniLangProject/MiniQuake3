import mq3.client.ui_input_latch as latch

function require(condition,message)
  if not condition then return error(9703,message) end if
  return void
end function

function main(args)
  state=latch.create(256);if state is error then return state end if
  observed=latch.observe(state,latch.INPUT_KEY,13,1);if observed is error then return observed end if
  observed=latch.observe(state,latch.INPUT_KEY,13,0);if observed is error then return observed end if
  checked=require(latch.keyDown(state,13),"a down/up pair in one poll must remain visible for one UI frame");if checked is error then return checked end if
  begun=latch.beginFrame(state);if begun is error then return begun end if
  checked=require(not latch.keyDown(state,13),"released pulse must expire on the next UI frame");if checked is error then return checked end if
  observed=latch.observe(state,latch.INPUT_KEY,178,1);if observed is error then return observed end if
  begun=latch.beginFrame(state);if begun is error then return begun end if
  checked=require(latch.keyDown(state,178),"held key state must survive frame boundaries");if checked is error then return checked end if
  observed=latch.observe(state,latch.INPUT_KEY,178,0);if observed is error then return observed end if
  checked=require(not latch.keyDown(state,178),"released held state must clear without a stale pulse");if checked is error then return checked end if
  ignored=latch.observe(state,3,13,1);if ignored is error then return ignored end if
  checked=require(not ignored and not latch.keyDown(state,13),"non-key events must not affect key state");if checked is error then return checked end if
  print "PASS: UI input latch preserves short edges and held state"
  return 0
end function
