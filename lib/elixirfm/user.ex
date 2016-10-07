defmodule Elixirfm.User do
  @moduledoc """
  Last.fm User Enpoints
  """

  @doc """
  Get the top albums listened to by a user. You can stipulate a time period. Sends the overall chart by default.

  ```peroid``` argument acceptes: overall | 7day | 1month | 3month | 6month | 12month
  """
  def get_top_albums(query, args \\ [peroid: "overall", page: 1, limit: 15]) do
    Elixirfm.get_request("?method=user.gettopalbums&user=#{query}&peroid=#{args[:peroid]}&page=#{args[:page]}&limit=#{args[:limit]}")
  end


  @doc """
  Get the top artists listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  def get_top_artists(query, args \\ [peroid: "overall", page: 1, limit: 15]) do
    Elixirfm.get_request("?method=user.gettopartists&user=#{query}&peroid=#{args[:peroid]}&limit=#{args[:limit]}&page=#{args[:page]}")
  end

  @doc """
  Get the top tags used by this user.
  """
  def get_top_tags(query, args \\ [limit: 15]) do
    Elixirfm.get_request("?method=user.gettoptags&user=#{query}&limit=#{args[:limit]}")
  end

  @doc """
  Get the top tracks listened to by a user. You can stipulate a time period. Sends the overall chart by default.
  """
  def get_top_track(query, args \\ [peroid: "overall", page: 1, limit: 15]) do
    Elixirfm.get_request("?method=user.gettoptracks&user=#{query}&page=#{args[:page]}&limit=#{args[:limit]}")
  end

  # @doc """
  # Get an album chart for a user profile, for a given date range. 
  # If no date range is supplied, it will return the most recent album chart for this user.
  # """
  # def get_album_chart(query args \\ [from: , to: ]) do
  #   Elixirfm.get_request("?method=user.getweeklyalbumchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  # @doc """
  # def get_artist_chart(Get an artist chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent artist chart for this user.)
  # """
  # def get_artist_chart(query args \\ [from: , to: ]) do
  #   Elixirfm.get_request("?method=user.getweeklyartistchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

  @doc """
  Get a list of available charts for this user, expressed as date ranges which can be sent to the chart services.
  """
  def get_weekly_charts(user) do
    Elixirfm.get_request("?method=user.getweeklychartlist&user=#{user}")
  end

  # @doc """
  # Get a track chart for a user profile, for a given date range.
  # If no date range is supplied, it will return the most recent track chart for this user.
  # """
  # def get_weekly_track_chart(query args \\ [from: , to: ]) do
  #   Elixirfm.get_request("?method=user.getweeklytrackchart&user=#{query}&from=#{args[:from]}&to=#{args[:to]}")
  # end

end
