defmodule PlurlTweetTest do
  use ExUnit.Case
  doctest PlurlTweet

  test "greets the world" do
    assert PlurlTweet.hello() == :world
  end
end
