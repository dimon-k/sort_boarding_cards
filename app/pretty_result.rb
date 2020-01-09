class PrettyResult
  def initialize(result)
    @result = result
  end

  def call
    result.map do |card|
      case card[:type]
      when 'train'
        "Take #{card[:type]} #{card[:number]} from #{card[:from]} to #{card[:to]}. Sit in seat #{card[:seat]}."
      when 'airport bus'
        "Take the #{card[:type]} from #{card[:from]} to #{card[:to]}. No seat assignment."
      when 'airplane'
        "From #{card[:from]}, take flight #{card[:number]} to #{card[:to]}. Gate #{card[:gate]}, seat #{card[:seat]}. ".concat(baggage(card, result))
      end
    end.append('You have arrived at your final destination.')
  end

  private

  attr_reader :result

  def baggage(card, result)
    if card.eql?(result.last)
      "Baggage will we automatically transferred from your last leg."
    else
      "Baggage drop at ticket counter #{card[:counter]}."
    end
  end
end
