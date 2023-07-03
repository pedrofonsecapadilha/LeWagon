// TODO: Autocomplete the input with AJAX calls.

// const box = document.querySelector("#search");
// box.addEventListener(("keyup"), (event) => {

//   const list = document.querySelector("#results");

//   fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${event.target.value}`)
//     .then(response => response.json())
//     .then((data) => {
//       list.innerHTML = "";
//       data.words.forEach((i) => {
//         const tag = `<li>${i}</li>`;
//         list.insertAdjacentHTML("beforeend", tag);
//       });
//     });
// });

const addToList = ((data) => {
  const list = document.querySelector("#results");
  list.innerHTML = "";
  data.words.forEach((i) => {
    const tag = `<li>${i}</li>`;
    list.insertAdjacentHTML("beforeend", tag);
  });
});

const searchWord = ((event) => {
  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${event.target.value}`)
    .then(response => response.json())
    .then(addToList);
});

const box = document.querySelector("#search");
box.addEventListener(("keyup"), searchWord);
