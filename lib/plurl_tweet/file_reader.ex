defmodule PlurlTweet.FileReader do
  def get_strings_to_tweet(path) do
    File.read!(path)
    |> pick_string
  end

  def pick_string(str) do
    str
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) <= 140))
    |> Enum.filter(fn str -> String.length(str) <= 140 end)
    |> Enum.random()
  end
end
