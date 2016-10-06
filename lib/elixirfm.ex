defmodule Elixirfm do
  @moduledoc """
  Provides a wrapper for the Lastfm API.

  Currently in begining stages of development.  
  """
  use HTTPoison.Base

  @endpoint_base "http://ws.audioscrobbler.com/2.0/"
  @api_key Application.fetch_env!(:elixirfm, :api_key)


  defmodule MissingSecretKeyError do
    defexception message: """
      The secret_key settings is required for some of the Lastfm endpoints. Please include your
      Last.fm api key in your application config file like so:

        config :elixirfm, secret_key: _YOUR_SECRET_KEY_

      You can also set the secret key as an environment variable:

        LASTFM_SECRET_KEY= _YOUR_SECRET_KEY_
    """
  end

  def lastfm_key do
    Application.get_env(:elixirfm, :api_key, System.get_env("LASTFM_SECRET_KEY"))
    || raise MissingSecretKeyError
  end

  def get_request(url) do
    get!(url)
  end

  def process_url(url), do: @endpoint_base <> url <> "&api_key=" <> lastfm_key() <> "&format=json"
  def process_response_body(body), do: body |> Poison.decode!

end
