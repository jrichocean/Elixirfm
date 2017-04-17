defmodule Elixirfm do
  @moduledoc """
  A simple wrapper for the Lastfm API.
  """

  alias Elixirfm.{
          RequestError,
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

  @spec get_request(String.t()) :: {atom(), term()}
  def get_request(endpoint) do
    HTTPoison.request(:get, request_url(endpoint), [], create_headers())
    |> handle_response()
  end

  defp request_url(endpoint, opts \\ [api_version: "2.0"]) do
    @api_root <> "#{opts[:api_version]}/?method=" <> endpoint <> "&api_key=" <> lastfm_key() <> "&format=json"
  end

  defp create_headers do
    app_version = Mix.Project.config[:version]
    [{"Authorization", "Bearer #{lastfm_key()}"},
     {"User-Agent", "Elixirfm/v1 elixirfm/#{app_version}"}]
  end

  defp handle_response({:error, struct}), do: {:error, "There was an error", struct}
  defp handle_response({:ok, %{body: body, status_code: 200}}), do: {:ok, process_response_body(body)}
  defp handle_response({:ok, %{body: body, status_code: code}}) do
    %{"error" => error, "message" => message} = Poison.decode!(body)

    error_struct = %RequestError{type: code, error: error, message: message}

    {:error, error_struct}
  end

  defp process_response_body(body), do: body |> Poison.decode!()

end
