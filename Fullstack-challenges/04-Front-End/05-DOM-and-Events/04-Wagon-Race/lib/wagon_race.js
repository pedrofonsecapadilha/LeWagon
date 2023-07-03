// TODO: write your code here
// Remove the active class on the current player’s td and add that class to the next td.
const array1 = document.querySelectorAll("#player1-race td");

document.addEventListener(("keyup"), (event) => {
  if (event.keyCode === 81) {
    const player1 = document.querySelector("#player1-race .active");
    let nextPositionIndex1 = player1.cellIndex + 1;
    array1[player1.cellIndex].classList.remove("active");
    array1[nextPositionIndex1].classList.add("active");
    victory1();
  }
});

const array2 = document.querySelectorAll("#player2-race td");
document.addEventListener(("keyup"), (event) => {
  if (event.keyCode === 80) {
    const player2 = document.querySelector("#player2-race .active");
    let nextPositionIndex2 = player2.cellIndex + 1;
    array2[player2.cellIndex].classList.remove("active");
    array2[nextPositionIndex2].classList.add("active");
    victory2();
  }
});

// const checkVictory = () => {
//   let win1 = document.querySelectorAll("#player1-race td");
//   let win2 = document.querySelectorAll("#player2-race td");

//   if ((win1[win1.length - 1].outerHTML) === "<td class=\"active\"></td>") {
//     alert("Player 1 Win !!!");
//   } else if ((win2[win2.length - 1].outerHTML) === "<td class=\"active\"></td>") {
//     alert("Player 2 Win !!!");
//   }
// };

const victory1 = () => {
  let win1 = document.querySelectorAll("#player1-race td");
  if ((win1[win1.length - 1].outerHTML) === "<td class=\"active\"></td>") {
    alert("Player 1 Win !!!");
  }
};

const victory2 = () => {
  let win2 = document.querySelectorAll("#player2-race td");
  if ((win2[win2.length - 1].outerHTML) === "<td class=\"active\"></td>") {
    alert("Player 2 Win !!!");
  }
};
