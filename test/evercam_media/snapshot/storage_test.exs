defmodule EvercamMedia.Snapshot.StorageTest do
  use ExUnit.Case, async: true
  alias EvercamMedia.Snapshot.Storage

  test "file paths are constructed correctly" do
    camera_exid = "austin"
    timestamp = 1454715880

    directory_path = "storage/austin/snapshots/recordings/2016/02/05/23/"
    file_name = "44_40_000.jpg"

    assert Storage.construct_directory_path(camera_exid, timestamp) == directory_path
    assert Storage.construct_file_name(timestamp) == file_name
  end
end