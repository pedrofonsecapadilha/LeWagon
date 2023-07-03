// // selecionar o primeiro botão
// const bnts = document.querySelectorAll(".clickable");
// const bnt1 = bnts[0];

// // fazer o toggle desse botão quando for clicado
// bnt1.addEventListener("click", (event) => {
//   bnt1.classList.toggle("active");
// });

// // reproduzir para os outros 5 botões
// const bnt2 = bnts[1];
// bnt2.addEventListener("click", (event) => {
//   bnt2.classList.toggle("active");
// });
// const bnt3 = bnts[2];
// bnt3.addEventListener("click", (event) => {
//   bnt3.classList.toggle("active");
// });
// const bnt4 = bnts[3];
// bnt4.addEventListener("click", (event) => {
//   bnt4.classList.toggle("active");
// });
// const bnt5 = bnts[4];
// bnt5.addEventListener("click", (event) => {
//   bnt5.classList.toggle("active");
// });
// const bnt6 = bnts[5];
// bnt6.addEventListener("click", (event) => {
//   bnt6.classList.toggle("active");
// });

// pensar em um jeito lógico de repetir a ação com apenas 1 código

// const bnts = document.querySelectorAll(".clickable");
// bnts.forEach((button) => {
//   button.addEventListener("click", (event) => {
//     button.classList.toggle("active");
//   });
// });


// Optional do Challenge

const bnts = document.querySelectorAll(".clickable");

const displayClickedElement = (event) => {
  event.currentTarget.classList.toggle("active");
};

const bindButtonToClick = (button) => {
  button.addEventListener("click", displayClickedElement);
};

bnts.forEach(bindButtonToClick);
