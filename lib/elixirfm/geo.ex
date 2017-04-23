defmodule Elixirfm.Geo do
  @moduledoc """
  Last.fm Geo endpoint api
  """

  @doc false
  def endpoint(), do: "geo"

  @doc """
  Get the most popular artists on Last.fm by country.

  ```query``` must be a country name, as defined by the [ISO 3166-1](http://www.nationsonline.org/oneworld/country_code_list.htm) country names standard.
  """
  @spec get_top_artists(String.t(), [limit: non_neg_integer(), page: non_neg_integer()]) :: Elixirfm.response
  def get_top_artists(query, args \\ [limit: 20, page: 1]) do
    Elixirfm.get_request("#{endpoint()}.gettopartists&country=#{query}&limit=#{args[:limit]}&page=#{args[:page]}")
  end

  @doc """
  Get the most popular tracks on Last.fm last week by country.
  """
  @spec get_top_tracks(String.t(), [limit: non_neg_integer(), page: non_neg_integer(), location: String.t()]) :: Elixirfm.response
  def get_top_tracks(query, args \\ [page: 1, limit: 10, location: ""]) do
    Elixirfm.get_request("#{endpoint()}.gettoptracks&country=#{query}&page=#{args[:page]}&limit=#{args[:limit]}&location=#{args[:location]}")
  end

end
