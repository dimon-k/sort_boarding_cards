class Sorter
  def initialize(cards)
    @cards = cards
  end

  def call
    result = []
    arg_to = arg_from = cards.first

    loop do
      result.prepend(arg_to)
      arg_to = detect_to(arg_to)
      break unless arg_to
    end

    loop do
      arg_from = detect_from(arg_from)
      break unless arg_from
      result.append(arg_from)
    end

    pretty_result(result)
  end

  private

  attr_reader :cards

  def detect_from(arg)
    cards.detect { |x| x[:from].eql?(arg[:to]) }
  end

  def detect_to(arg)
    cards.detect { |x| x[:to].eql?(arg[:from]) }
  end

  def pretty_result(result)
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

  def baggage(card, result)
    if card.eql?(result.last)
      "Baggage will we automatically transferred from your last leg."
    else
      "Baggage drop at ticket counter #{card[:counter]}."
    end
  end
end
