defmodule Mix.Tasks.Listen do
  use Mix.Task

  @shortdoc "Monitor Twitter for the search term."

  @default_search_term "lunch"

  def run([]),            do: listen_for(@default_search_term)
  def run([search_term]), do: listen_for(search_term)

  defp listen_for(search_term) do
    IO.inspect search_term
  end

end
