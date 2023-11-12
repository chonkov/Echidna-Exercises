# Echidna Excercises

## Excercise 1

Solution:
There is no overflow/underflow protection when using solidity versions prior to `0.7.0` => Add a check prior to subtracting the balances or use `SafeMath`

## Excercise 2

Solution:
Remove `Owner()`, otherwise anyone can call it and claim the ownership of the Token

## Excercise 3

Solution:
We are converting uint256 to int256. Max value for `uint256 = 2^256 -1` and max value for `int256 = 2^255 - 1`. So if we send value more than `2^255 - 1` conversion `int256(value)` will go to negative number, and then require section is is always true, as negative number is less than 0.

## Excercise 4

Solution:
Similar to solution of `Excercise 1`. Asserts are used, so `--test-mode assertion` flag should be used
