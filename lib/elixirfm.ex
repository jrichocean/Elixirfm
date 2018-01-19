defmodule Elixirfm do
  @moduledoc """
  A simple wrapper for the Lastfm API.
  """
  @type response :: {atom(), struct()}

  alias Elixirfm.{
    RequestError,
    MissingApiKeyError,
    MissingSecretKeyError
  }

  @api_root "http://ws.audioscrobbler.com/"

  @doc false
  def lastfm_key() do
    Application.get_env(:elixirfm, :api_key, System.get_env("LASTFM_API_KEY"))
    || raise MissingApiKeyError
  end

  @doc false
  def lastfm_secret() do
    Application.get_env(:elixirfm, :secret_key, System.get_env("LASTFM_SECRET_KEY"))
    || raise MissingSecretKeyError
  end

  @spec get_request(String.t(), keyword()) :: {atom(), term()}
  def get_request(endpoint, opts \\ [api_version: "2.0"]) do
    HTTPoison.request(:get, request_url(endpoint, opts[:api_version]), [], create_headers())
    |> handle_response()
  end

  defp request_url(endpoint, opts) do
    Enum.join([@api_root, "#{opts}/?method=", endpoint, "&api_key=", lastfm_key(), "&format=json"])
  end

  defp create_headers(), do: [{"Authorization", "Bearer #{lastfm_key()}"}]

  @spec handle_response({atom(), map()}) :: tuple()
  defp handle_response({:error, struct}), do: {:error, "There was an error", struct}
  defp handle_response({:ok, %{body: body, status_code: 200}}), do: Poison.decode(body)
  defp handle_response({:ok, %{body: body, headers: headers, status_code: code}}) do
    %{"error" => error, "message" => message} = Poison.decode!(body)
    error_struct = %RequestError{type: code, error: error, message: message, headers: headers}
    {:error, error_struct}
  end
end
