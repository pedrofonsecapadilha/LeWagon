// TODO: React to a click on the button!
const reaction = document.getElementById('clickme');
console.log(reaction.textContent);

reaction.addEventListener("click", (event) => {
  // The button to be disabled. This can be done by adding the .disabled class.
  reaction.classList.add("disabled");

  // The button text to change from “Click me!” to “Bingo!”
  reaction.textContent = "Bingo!";

  // Optional: the sound.mp3 plays in the Browser
  const audio = new Audio('../sound.mp3');
  audio.play();
});
