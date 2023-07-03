const valid = (email) => {
  // TODO: return true if the `email` string has the right pattern!
  const regex = /\w.{1,}@\w+[.]\w{2,}/;
  return regex.test(email);
};

module.exports = valid; // Do not remove.
