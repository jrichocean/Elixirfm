defmodule Elixirfm do
  @moduledoc """
  Provides a wrapper for the Lastfm API.

  _Currently in early stages of development._
  """
  use HTTPoison.Base

  alias Elixirfm.InvalidRequestError

  @api_root "http://ws.audioscrobbler.com/"
  @api_key Application.fetch_env!(:elixirfm, :api_key)


  defmodule MissingApiKeyError do
    defexception message: """
      The secret_key settings is required for some of the Lastfm endpoints. Please include your
      Last.fm api key in your application config file like so:

        config :elixirfm, api_key: _YOUR_API_KEY_

      You can also set the secret key as an environment variable:

        LASTFM_API_KEY= _YOUR_API_KEY_
    """
  end

  def lastfm_key do
    Application.get_env(:elixirfm, :api_key, System.get_env("LASTFM_API_KEY"))
    || raise MissingApiKeyError
  end

  defp request_url(endpoint, opts \\ [api_version: "2.0"]) do
    Path.join(@api_root, "#{opts[:api_version]}/?method=#{endpoint}&api_key=#{lastfm_key()}&format=json")
  end

  defp create_headers do
    app_version = Mix.Project.config[:version]
    bearer_token = lastfm_key()

    [{"Authorization", "Bearer #{bearer_token}"},
     {"User-Agent", "Elixirfm/v1 elixirfm/#{app_version}"},]
  end

  def get_request(endpoint) do
    url = request_url(endpoint)
    HTTPoison.get(url, create_headers())
    |> handle_response
  end

  defp handle_response({:ok, %{body: body, status_code: 200}}) do
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %{body: body, status_code: code}}) do  
  # Handle status codes other then 200 with this.
  end

  defp process_response_body(body), do: body |> Poison.decode!

end
