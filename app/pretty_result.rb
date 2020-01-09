class PrettyResult
  def initialize(result)
    @result = result
  end

  def call
    result.map { |card| build_a_message(card) }
          .append(final_destination_message)
  end

  private

  attr_reader :result

  def build_a_message(card)
    send("#{card[:type].gsub(' ', '_')}_message", card)
  end

  def train_message(card)
    "Take #{card[:type]} #{card[:number]} from #{card[:from]} to #{card[:to]}. Sit in seat #{card[:seat]}."
  end

  def airport_bus_message(card)
    "Take the #{card[:type]} from #{card[:from]} to #{card[:to]}. No seat assignment."
  end

  def airplane_message(card)
    "From #{card[:from]}, take flight #{card[:number]} to #{card[:to]}. Gate #{card[:gate]}, seat #{card[:seat]}. ".concat(baggage(card, result.last))
  end

  def baggage(card, last_result)
    return "Baggage drop at ticket counter #{card[:counter]}." unless card.eql?(last_result)

    "Baggage will we automatically transferred from your last leg."
  end

  def final_destination_message
    'You have arrived at your final destination.'
  end
end
