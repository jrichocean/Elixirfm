defmodule Elixirfm do
  @moduledoc "A simple wrapper for the Lastfm API."
  @moduledoc since: "1.0.0"
  
  alias Elixirfm.{
    RequestError,
    MissingApiKeyError,
    MissingSecretKeyError
  }
  
  @type response :: {atom(), struct()}

  @api_root "http://ws.audioscrobbler.com/2.0/"

  @doc "get_request/1 takes name of uri as string and returns a `t:response/0`, if wanting to pass url params see `get_request/2` "
  @spec get_request(lastfm_uri::String.t) :: response
  def get_request(uri) do
    HTTPoison.request(:get, collate_url(uri, []), [], create_headers())
    |> handle_response()
  end

  @doc "get_request/2 takes name of the lastfm uri `\"/artist\"` as string and a map or list of tuples for url params and returns a `t:response/0`."
  @spec get_request(lastfm_uri::String.t, params_and_opts::map()|[{any(), any()}, ...]|[]) :: response
  def get_request(uri, args) do
    HTTPoison.request(:get, collate_url(uri, args), [], create_headers())
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

  @doc false
  def _encode_params([]), do: ""
  def _encode_params(nil), do: ""
  def _encode_params({_k, 0}), do: ""
  def _encode_params({k, v}), do: "&#{k}=#{v}"
  def _encode_params(args), do: for {k, v} <- args, do: _encode_params({k, v})

  defp collate_url(uri, args) do
    Enum.join([
      _base_url(),
      "?method=",
      uri,
      _encode_params(args),
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

end
