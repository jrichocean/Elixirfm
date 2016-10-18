defmodule Elixrfm.AlbumTest do
  use ExUnit.Case, async: true
  alias Elixirfm.Album

  test "returns existing searched album" do
    assert {:ok, %{"results" => %{}}} 
      = Album.search("Meir")
  end

end
