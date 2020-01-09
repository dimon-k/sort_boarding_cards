# sort_boarding_cards

Project written in pure Ruby code.

#### Ruby version: 2.6.5

To run tests, run:
```
irb test/sorter_test.rb
```

Sorter Input example:
```
[
  { type: 'train', number: '78A', from: 'Madrid', to: 'Barcelona', seat: '45B' },
  { type: 'airport bus', from: 'Barcelona', to: 'Gerona Airport' },
  { type: 'airplane', number: 'SK455', from: 'Gerona Airport', to: 'Stockholm', seat: '3A', gate: '45B', counter: '344' },
  { type: 'airplane', number: 'SK22', from: 'Stockholm', to: 'New York JFK', seat: '7B', gate: '22' }
]
```

Sorter Output example:
```
Take train 78A from Madrid to Barcelona. Sit in seat 45B.
Take the airport bus from Barcelona to Gerona Airport. No seat assignment.
From Gerona Airport, take flight SK455 to Stockholm. Gate 45B, seat 3A. Baggage drop at ticket counter 344.
From Stockholm, take flight SK22 to New York JFK. Gate 22, seat 7B. Baggage will we automatically transferred from your last leg.
You have arrived at your final destination.
```
