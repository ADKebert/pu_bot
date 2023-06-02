defmodule PuBot.Ratings.Openskill.Harness do
  @moduledoc """
  This module is a wrapper around the openskill library.
  It lets us set defaults for starting mu and rating model.
  """

  @default_mu 10
  @default_model Openskill.PlackettLuce

  @doc """
  Returns a rating.  Can be initialized with sigma and/or mu.
  If not initialized uses our default mu
      iex(28)> {10, 8.333333333333334} = OpenskillHarness.rating()
      {10, 8.333333333333334}

      iex(29)> OpenskillHarness.rating(25)                        
      {25, 8.333333333333334}
  """
  def rating(mu \\ @default_mu, sigma \\ nil) do
    Openskill.rating(mu, sigma)
  end

  @doc """
  Simple passthrough to Openskill.ordinal.
  Returns mu - 3 * sigma
      iex(30)> OpenskillHarness.ordinal({10, 1})
      7
  """
  def ordinal({mu, sigma}) do
    Openskill.ordinal({mu, sigma})
  end

  @doc """
  Returns new ratings based on the teams in the ratings group.
  Rating_groups should be a list and each team should be a list within.
  Place the winning team first to indicate they've won.
      iex(33)> OpenskillHarness.rate([[{10,2}, {9,3}, {30,2}], [{22,2}, {21,2}, {8,1}]])
      [
          [
              {10.501506786227846, 1.975760733255116},
              {10.128390269012653, 2.9175553602384334},
              {30.501506786227846, 1.975760733255116}
          ],
          [
              {21.498493213772154, 1.9823927136447954},
              {20.498493213772154, 1.9823927136447954},
              {7.874623303443038, 0.997806371218634}
          ]
  ]
  """
  def rate(rating_groups, options \\ [model: @default_model]) do
    Openskill.rate(rating_groups, options)
  end
end
