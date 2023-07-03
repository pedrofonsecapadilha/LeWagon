/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practice. Each time you make some progress in software
// development, you want to save a snapshot.


module.exports = function runChallenges(check) {
  // Ex 1. Read what's written in the email input
  //       Make the function getEmail() return it
  const getEmail = () => {
    // TODO: return the email
    const email = document.getElementById("email");
    return email.value;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  // Ex 2. Change the content of the email input by writing your own email address
  // eslint-disable-next-line no-undef
  email.value = "pedrofpadilha@gmail.com";


  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag
  const emailHint = document.getElementById("email-hint");
  emailHint.innerHTML = "<strong>This is my email now</strong>";


  // Ex 4. Add the .blue CSS class to the th elements
  const thElements = document.querySelectorAll(".table > thead > tr > th");
  // thElements[0].classList.add("blue");
  // thElements[1].classList.add("blue");
  // thElements[2].classList.add("blue");
  thElements.forEach((th) => {
    th.classList.add("blue");
  });


  // Ex 5. Count the number of table body rows there are
  //       Make the function teamCount() return it
  const teamCount = () => {
    // TODO: return the number of teams
    const elements = document.querySelectorAll(".table > tbody > tr");
    return elements.length;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.
  const teamList = document.querySelector(".table > tbody");
  teamList.insertAdjacentHTML("beforeend", "<tr><td>15</td><td>Pedro's Team</td><td>0</td></tr>");


  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it
  const summarizePoints = () => {
    // TODO: return the sum
    let array = [];
    const points = document.querySelectorAll(".table > tbody > tr");
    points.forEach((i) => {
      array.push(parseInt((i.children[2].innerHTML), 10));
    });
    const sum = array.reduce((a, b) => a + b, 0);
    return sum;
  };


  // Ex 8. Change the background color of all `<th>` cells to #DDF4FF
  const background = document.querySelectorAll("th");
  background.forEach((i) => {
    i.style.backgroundColor = "#DDF4FF";
  });


  // Ex 9. Remove the "Email:" label from the DOM
  const label = document.querySelector("label");
  label.remove();


  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(borisesEmail, teamCountBeforeAddition, summarizePoints());
};
