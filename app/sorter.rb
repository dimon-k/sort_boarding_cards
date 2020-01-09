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

    PrettyResult.new(result).call
  end

  private

  attr_reader :cards

  def detect_from(arg)
    cards.detect { |x| x[:from].eql?(arg[:to]) }
  end

  def detect_to(arg)
    cards.detect { |x| x[:to].eql?(arg[:from]) }
  end
end
