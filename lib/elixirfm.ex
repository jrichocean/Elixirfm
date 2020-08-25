defmodule Elixirfm do
  @moduledoc "A simple wrapper for the Lastfm API."
  @type response :: {atom(), struct()}

  alias Elixirfm.{
    RequestError,
    MissingApiKeyError,
    MissingSecretKeyError
  }

  @api_root "http://ws.audioscrobbler.com/2.0/"

  @doc "get_request/1 takes name of endpoint as string"
  def get_request(endpoint) do
    HTTPoison.request(:get, request_url(endpoint, nil), [], create_headers())
    |> handle_response()
  end

  @doc "get_request/2 takes name of endpoint as string and args"
  def get_request(endpoint, args) do
    HTTPoison.request(:get, request_url(endpoint, args), [], create_headers())
    |> handle_response()
  end

  @doc false
  def _base_url(), do: Application.get_env(:elixirfm, :lastfm_ws) || @api_root

  @doc false
  def _lastfm_key() do
    Application.get_env(:elixirfm, :api_key, System.get_env("LASTFM_API_KEY"))
    || raise MissingApiKeyError
  end

  @doc false
  def _lastfm_secret() do
    Application.get_env(:elixirfm, :secret_key, System.get_env("LASTFM_SECRET_KEY"))
    || raise MissingSecretKeyError
  end

  defp request_url(endpoint, args) do
    Enum.join([
      _base_url(),
      "?method=",
      endpoint,
      encode_params(args),
      "&api_key=",
      _lastfm_key(),
      "&format=json"
    ])
  end

  defp create_headers(),
    do: [{"Authorization", "Bearer #{_lastfm_key()}"}]

  @spec handle_response({atom(), map()}) :: tuple()
  defp handle_response({:error, struct}), do: {:error, "There was an error", struct}
  defp handle_response({:ok, %{body: body, status_code: 200}}), do: Poison.decode(body)
  defp handle_response({:ok, %{body: body, headers: headers, status_code: code}}) do
    %{"error" => error, "message" => message} = Poison.decode!(body)
    error_struct = %RequestError{type: code, error: error, message: message, headers: headers}
    {:error, error_struct}
  end

  defp encode_params(nil), do: ""
  defp encode_params({_k, 0}), do: ""
  defp encode_params({k, v}), do: "&#{k}=#{v}"
  defp encode_params(args), do: for {k, v} <- args, do: encode_params({k, v})
end
