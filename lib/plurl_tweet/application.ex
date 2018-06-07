defmodule PlurlTweet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: PlurlTweet.Worker.start_link(arg)
      # {PlurlTweet.Worker, arg},
      worker(PlurlTweet.TweetServer, [])
    ]

    #elixir-lang.org/Supervisor.html
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlurlTweet.Supervisor]
    Supervisor.start_link(children, opts)

    PlurlTweet.Scheduler.schedule_file(
      "* * * * *",
      Path.join("#{:code.priv_dir(:plurl_tweet)}", "sample.txt")
    )

    process
  end
end
