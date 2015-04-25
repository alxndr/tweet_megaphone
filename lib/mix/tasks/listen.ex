defmodule Mix.Tasks.Listen do
  use Mix.Task

  @shortdoc "Monitor Twitter for the search term."

  @default_search_term "lunch"

  def run([]),            do: listen_for(@default_search_term)
  def run([search_term]), do: listen_for(search_term)

  defp listen_for(search_term) do
    IO.puts "listening for: #{search_term}"
    stream = ExTwitter.stream_filter(track: search_term, receive_messages: true)
    for message <- stream do
      case message do
        tweet = %ExTwitter.Model.Tweet{} ->
          IO.puts "tweet = #{tweet.text}"
        deleted_tweet = %ExTwitter.Model.DeletedTweet{} ->
          IO.puts "deleted tweet = #{deleted_tweet.status[:id]}"
        limit = %ExTwitter.Model.Limit{} ->
          IO.puts "limit = #{limit.track}"
        stall_warning = %ExTwitter.Model.StallWarning{} ->
          IO.puts "stall warning = #{stall_warning.code}"
        _ ->
          IO.inspect message
      end
    end
  end

end
