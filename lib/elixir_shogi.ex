defmodule ElixirShogi do
  def main do
    run(:init)
  end

  defp run(:quit), do: nil
  defp run(:error), do: nil
  defp run(state) do
    tokens = IO.gets("") |> String.split

    next_state = Usi.transition(state, tokens)

    Usi.send_message(state, next_state)

    run(next_state)
  end
end
