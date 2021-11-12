/*
Program to establish family relationships between persons
Source of the data:
    https://family-tree-template.org/greek-mythology-family-tree/
Try:
aunt(X, zeus).
mother(X, Y), aunt(X, Y).
father(X, Y), not(father(Z, X)).
Gilberto Echeverria
06/10/2020
*/

%%%% FACTS %%%%
% God order
primordial(chaos).
primordial(tartarus).
primordial(gaia).
primordial(eros).
primordial(erebus).
primordial(nyx).
primordial(nesoi).
primordial(ourea).
primordial(pontus).
primordial(uranus).
titan(coeus).
titan(tethys).
titan(oceanus).
titan(phoebe).
titan(cronus).
titan(rhea).
titan(metis).
titan(lelantos).
titan(asteria).
titan(leto).
olympian(hades).
olympian(hestia).
olympian(demeter).
olympian(zeus).
olympian(hera).
olympian(poseidon).
olympian(athena).
olympian(aphrodite).
olympian(apollo).
olympian(artemis).
olympian(persephone).
olympian(hares).
olympian(hephaestus).
olympian(heracles).

% Gender
% Primordials
male(tartarus).
male(eros).
male(erebus).
male(pontus).
male(uranus).
% Titans
male(oceanus).
male(coeus).
male(lelantos).
male(cronus).
% Olympians
male(hades).
male(zeus).
male(poseidon).
male(dionysus).
male(apollo).
male(hares).
male(hephaestus).
% Other
male(heracles).
male(hermes).
male(pan).
% Primordials
female(gaia).
female(nyx).
% Titans
female(tethys).
female(metis).
female(phoebe).
female(asteria).
female(leto).
female(rhea).
% Olympians
female(hestia).
female(demeter).
female(hera).
female(athena).
female(aphrodite).
female(artemis).
female(persephone).
% Other
female(alcmene).
female(dione).
female(semele).
female(maia).

% Fathers
% Primordials
father(uranus, oceanus).
father(uranus, tethys).
father(uranus, coeus).
father(uranus, phoebe).
father(uranus, cronus).
father(uranus, rhea).
% Titans
father(oceanus, metis).
father(coeus, lelantos).
father(coeus, asteria).
father(coeus, leto).
father(cronus, hades).
father(cronus, hestia).
father(cronus, demeter).
father(cronus, zeus).
father(cronus, hera).
father(cronus, poseidon).
% Olympians
father(zeus, athena).
father(zeus, aphrodite).
father(zeus, dionysus).
father(zeus, apollo).
father(zeus, artemis).
father(zeus, persephone).
father(zeus, hares).
father(zeus, hephaestus).
father(zeus, hermes).
father(zeus, pan).
father(zeus, heracles).
father(zeus, zagreus).
father(zeus, melinoe).

% Mothers
% Primordials
mother(gaia, nesoi).
mother(gaia, ourea).
mother(gaia, pontus).
mother(gaia, uranus).
mother(gaia, oceanus).
mother(gaia, tethys).
mother(gaia, coeus).
mother(gaia, phoebe).
mother(gaia, cronus).
mother(gaia, rhea).
% Titans
mother(tethys, metis).
mother(phoebe, lelantos).
mother(phoebe, asteria).
mother(phoebe, leto).
mother(rhea, hades).
mother(rhea, hestia).
mother(rhea, demeter).
mother(rhea, zeus).
mother(rhea, hera).
mother(rhea, poseidon).
% Olympians
mother(metis, athena).
mother(dione, aphrodite).
mother(semele, dionysus).
mother(leto, apollo).
mother(leto, artemis).
mother(demeter, persephone).
mother(hera, ares).
mother(hera, hephaestus).
mother(maia, hermes).
mother(maia, pan).
mother(alcmene, heracles).
mother(persephone, zagreus).
mother(persephone, melinoe).