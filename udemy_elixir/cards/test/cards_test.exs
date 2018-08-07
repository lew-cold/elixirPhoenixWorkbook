defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20 #assert is the special key word - it will reso;ve to a boolean value
  end

  test "shuffling a deck randomises it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) #Refute deck equal to shuffled deck.
  end
end
