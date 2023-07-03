const sumOfNegative = (numbers) => {
  // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
  // [0, -1, 1]
  let sum = 0;
  numbers.forEach((number) => {
    if (number < 0) {
      sum += number;
    } else {
      // eslint-disable-next-line no-unused-expressions
      sum;
    }
  });
  return sum;
};

module.exports = sumOfNegative; // Do not remove.
