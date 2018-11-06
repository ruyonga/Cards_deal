defmodule Cards do
  @moduledoc """
    provides methods for creating and handling a deck of cards
  """

##Modules are collections of methods and functions[Elixir is functional languange]
##Partern matching is the variable assignment
 

@doc """
  Returns a list od strings representing a deck of playing cards
"""
def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    ##for loop <=> list comprehension
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end 
    
    # List.flatten(cards)
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
    
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
    
  end

  @doc """
    Determines whether a deck contains a specified card

  ## Examples
        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "Ace of Spades")
        true

    """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the reminder of the 
    of the deck. `hand_size` indicates how many cards should be in hand.
  
    ## Examples

          iex> deck = Cards.create_deck
          iex> {hand, deck} = Cards.deal(deck, 1)
          iex> hand
          ["Ace of Spades"]   
    """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # def load(filename) do
  #   {status, binary} = File.read(filename)

  #     case status do
  #       :ok -> :erlang.binary_to_term binary
  #       :error -> "That file doesnt exist"
  #     end 
  # end  

  def load(filename) do
   
      case File.read(filename) do
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason} -> "That file doesnt exist"
      end 
  end  
# |> pipe side...direct passing of value
  def create_hand(hand_size) do
      Cards.create_deck
      |> Cards.shuffle
      |> Cards.deal(hand_size)
  end





end
