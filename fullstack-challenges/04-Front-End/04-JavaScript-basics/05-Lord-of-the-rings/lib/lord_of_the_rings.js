/* eslint-disable no-restricted-syntax */
/* eslint-disable no-undef */
const isGood = (soldierType) => {
  // TODO: return `true` if the soldierType is Good.
  // Hint: Hobbits, Elves, Dwarves and Eagles are Good
  if (soldierType === "Hobbits") {
    return true;
  } if (soldierType === "Elves") {
    return true;
  } if (soldierType === "Dwarves") {
    return true;
  } if (soldierType === "Eagles") {
    return true;
  }
  return false;
};

const buildSoldierObject = (battlefield) => {
  // TODO: Given a battlefield (String), return an object of forces.
  // let battlefield = "Hobbits:1,Elves:2,Dwarves:3,Eagles:4,Orcs:5,Wargs:6,Goblins:7"
  const object = {};
  const array = battlefield.split(",").map(i => i.split(":"));
  array.forEach((value) => {
    object[value[0]] = parseInt(value[1], 10);
  });
  return object;
};

const whoWinsTheWar = (battlefield) => {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  // let battlefield = 'Elves:3,Eagles:5,Goblins:2,Uruk-hai:6';

  // fazer uma grande Hash com os soldados
  const soldiers = buildSoldierObject(battlefield);

  // iterar e separra os soldados bons e ruins
  goodSoldiers = [];
  evilSoldiers = [];
  for (const key in soldiers) {
    if (isGood(key) === true) {
      goodSoldiers.push(soldiers[key]);
    } else {
      evilSoldiers.push(soldiers[key]);
    }
  }

  // comparar quem vence
  // eslint-disable-next-line no-undef
  if (goodSoldiers.reduce((a, b) => a + b, 0) > evilSoldiers.reduce((a, b) => a + b, 0)) {
    return "Good";
  // eslint-disable-next-line no-undef
  } if (goodSoldiers.reduce((a, b) => a + b, 0) < evilSoldiers.reduce((a, b) => a + b, 0)) {
    return "Evil";
  }
  return "Tie";
};

module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
