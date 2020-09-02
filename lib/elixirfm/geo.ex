defmodule Elixirfm.Geo do
  @moduledoc "Last.fm Geo endpoint api"
  
  @method "geo"

  defp req(uri, args), do: Elixirfm.get_request(@method <> uri, args)

  @doc """
  Get the most popular artists on Last.fm by country.

  ```query``` must be a country name, as defined by the [ISO 3166-1](http://www.nationsonline.org/oneworld/country_code_list.htm) country names standard.
  """
  @spec top_artists(String.t(), [limit: non_neg_integer(), page: non_neg_integer()]) :: Elixirfm.response
  def top_artists(query, args \\ [limit: 20, page: 1]), do: req(".gettopartists&country=#{query}", args)

  @doc """
  Get the most popular tracks on Last.fm last week by country.
  """
  @spec top_tracks(String.t(), [limit: non_neg_integer(), page: non_neg_integer(), location: String.t()]) :: Elixirfm.response
  def top_tracks(query, args \\ [page: 1, limit: 10, location: ""]), do: req(".gettoptracks&country=#{query}", args)

end
