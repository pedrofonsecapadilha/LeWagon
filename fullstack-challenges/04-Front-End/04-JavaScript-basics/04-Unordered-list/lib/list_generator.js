const listItem = (content) => {
  // TODO: return the proper <li> HTML tag with its content (as a string)
  return `<li class="list-group-item">${content}</li>`;
};

const unorderedList = (items) => {
  // TODO: return the proper <ul> markup (as a string)
  return `<ul class="list-group">${(items.map(item => `<li class="list-group-item">${item}</li>`)).join("")}</ul>`;
};

module.exports = { listItem, unorderedList }; // Do not remove.
