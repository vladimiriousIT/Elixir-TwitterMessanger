defmodule PlurlTweet.Scheduler do
  def schedule_file(schedule, file) do
    Quantum.add_job(schedule, fn ->
      IO.puts()

      PlurlTweet.FileReader.get_strings_to_tweet(file)
      |> PlurlTweet.TweetServer.tweet()
    end)
  end
end
