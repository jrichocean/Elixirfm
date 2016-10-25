defmodule Elixirfm do
  @moduledoc """
  Provides a wrapper for the Lastfm API.
  """

  use HTTPoison.Base
  alias Elixirfm.{
          InvalidRequestError,
          MissingApiKeyError,
          MissingSecretKeyError
        }

  @api_root "http://ws.audioscrobbler.com/"


  @doc false
  def lastfm_key do
    Application.get_env(:elixirfm, :api_key, System.get_env("LASTFM_API_KEY"))
    || raise MissingApiKeyError
  end

  @doc false
  def lastfm_secret do
    Application.get_env(:elixirfm, :secret_key, System.get_env("LASTFM_SECRET_KEY"))
    || raise MissingSecretKeyError
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
    HTTPoison.get(url, create_headers()) |> handle_response
  end

  defp handle_response({:ok, %{body: body, status_code: 200}}) do
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %{body: body, status_code: code}}) do  
  # Handle status codes other then 200 with this.
  end

  defp process_response_body(body), do: body |> Poison.decode!

end
