defmodule Utilities.MapTest do
  use ExUnit.Case
  doctest Utilities.Map

  alias Utilities.Map

  test "convert map with camelCase string keys to underscore string keys" do
    map = %{
      "ccyPair" => "BTCHKD",
      "orderId" => "67e7ba03-c323-432e-8a71-82de52f08c17",
      "price" => "62898.95000",
      "settlementCurrencyFillAmount" => "628.99",
      "settlementCurrencyFillAmountUnrounded" => "628.98950000",
      "side" => "BUY",
      "timestamp" => "1527049333000",
      "tradeId" => "a3445758-9f1b-455c-9843-5a46567c9fb7",
      "tradedCurrencyFillAmount" => "0.01000000"
    }

    expected_map = %{
      "ccy_pair" => "BTCHKD",
      "order_id" => "67e7ba03-c323-432e-8a71-82de52f08c17",
      "price" => "62898.95000",
      "settlement_currency_fill_amount" => "628.99",
      "settlement_currency_fill_amount_unrounded" => "628.98950000",
      "side" => "BUY",
      "timestamp" => "1527049333000",
      "trade_id" => "a3445758-9f1b-455c-9843-5a46567c9fb7",
      "traded_currency_fill_amount" => "0.01000000"
    }

    converted_map = Map.to_underscore_keys(map)
    assert converted_map == expected_map
  end

  test "convert map with underscore string keys to camelCase string keys" do
    map = %{
      "ccy_pair" => "BTCHKD",
      "order_id" => "67e7ba03-c323-432e-8a71-82de52f08c17",
      "price" => "62898.95000",
      "settlement_currency_fill_amount" => "628.99",
      "settlement_currency_fill_amount_unrounded" => "628.98950000",
      "side" => "BUY",
      "timestamp" => "1527049333000",
      "trade_id" => "a3445758-9f1b-455c-9843-5a46567c9fb7",
      "traded_currency_fill_amount" => "0.01000000"
    }

    expected_map = %{
      "ccyPair" => "BTCHKD",
      "orderId" => "67e7ba03-c323-432e-8a71-82de52f08c17",
      "price" => "62898.95000",
      "settlementCurrencyFillAmount" => "628.99",
      "settlementCurrencyFillAmountUnrounded" => "628.98950000",
      "side" => "BUY",
      "timestamp" => "1527049333000",
      "tradeId" => "a3445758-9f1b-455c-9843-5a46567c9fb7",
      "tradedCurrencyFillAmount" => "0.01000000"
    }

    converted_map = Map.to_camelcase_keys(map)
    assert converted_map == expected_map
  end
end
