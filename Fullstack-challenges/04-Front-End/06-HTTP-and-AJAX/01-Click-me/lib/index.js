const displayAlertOnButtonClick = () => {
  // TODO: Select the big green button
  const button = document.querySelector(".btn");
  console.log(button);

  // TODO: Bind the `click` event to the button
  // TODO: On click, display `Thank you!` in a JavaScript alert!
  button.addEventListener("click", (event) => {
    alert("Thank you!");
  });
};

displayAlertOnButtonClick(); // Do not remove!
