defmodule Usi do
  def transition(:init, ["usi"]), do: :ok
  def transition(:ok, ["setoption", "name", _, "value", _]), do: :ok
  def transition(:ok, ["isready"]), do: :ready
  def transition(:ready, ["usinewgame"]), do: :start
  def transition(:start, ["position" | _rest]), do: :start
  def transition(:start, ["go" | _rest]), do: :play
  def transition(:play, ["gameover" | _rest]), do: :gameover
  def transition(:gameover, ["quit"]), do: :quit
  def transition(_, _), do: :error

  def send_message(:init, :ok) do
    IO.puts "id name ElixirShogi"
    IO.puts "usiok"
  end
  def send_message(:ok, :ok), do: nil
  def send_message(:ok, :ready) do
    IO.puts "readyok"
  end
  def send_message(:ready, :start), do: nil
  def send_message(:start, :start), do: nil
  def send_message(:start, :play) do
    IO.puts "bestmove resign"
  end
  def send_message(:play, :gameover), do: nil
  def send_message(:gameover, :quit), do: nil
  def send_message(_, _), do: nil
end
