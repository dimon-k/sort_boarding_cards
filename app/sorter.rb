class Sorter
  def initialize(cards)
    @cards = cards
  end

  def call
    ref_point  = cards.first
    @result    = [ref_point]
    directions = [[:to, :from], [:from, :to]]

    directions.each { |direction| look_for_destination(ref_point, *direction) }

    PrettyResult.new(@result).call
  end

  private

  attr_reader :cards

  def look_for_destination(ref_point, a_point, b_point)
    loop do
      ref_point = detect_by(ref_point, a_point, b_point)
      break unless ref_point

      add_to_result(ref_point, a_point)
    end
  end

  def add_to_result(ref_point, a_point)
    return @result.prepend(ref_point) if a_point.eql?(:to)
    return @result.append(ref_point)  if a_point.eql?(:from)
  end

  def detect_by(arg, a_point, b_point)
    cards.detect { |card| card[a_point].eql?(arg[b_point]) }
  end
end
