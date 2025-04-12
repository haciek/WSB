% autor: Maciej Habasiński
% nr_albumu: 152697

% =========================
%         Część I
% =========================

% Definicje fiLmów
film("Terminator", "SciFi", 8, 107, 1984).
film("Terminator 2: Judgment Day", "SciFi", 9, 137, 1991).
film("Terminator 3: Rise of the Machines", "SciFi", 6, 109, 2003).
film("Conan the Barbarian", "Akcja", 7, 129, 1982).
film("Conan the Destroyer", "Akcja", 6, 103, 1984).
film("Predator", "Akcja", 8, 107, 1987).
film("Total Recall", "SciFi", 8, 113, 1990).
film("True Lies", "Akcja", 7, 141, 1994).
film("Commando", "Akcja", 7, 90, 1985).
film("The Running Man", "Akcja", 7, 101, 1987).
film("Red Sonja", "Akcja", 5, 89, 1985).
film("Kindergarten Cop", "Komedia", 6, 111, 1990).
film("Last Action Hero", "Akcja", 6, 130, 1993).
film("Eraser", "Akcja", 6, 115, 1996).
film("Jingle All the Way", "Komedia", 6, 89, 1996).
film("Batman & Robin", "Akcja", 4, 125, 1997).
film("End of Days", "Akcja", 6, 121, 1999).
film("The 6th Day", "SciFi", 6, 123, 2000).
film("Collateral Damage", "Akcja", 6, 108, 2002).
film("The Expendables", "Akcja", 7, 103, 2010).
film("The Last Stand", "Akcja", 6, 107, 2013).
film("Escape Plan", "Akcja", 7, 115, 2013).
film("Sabotage", "Akcja", 6, 109, 2014).
film("Terminator Genisys", "SciFi", 6, 126, 2015).
film("Aftermath", "Dramat", 7, 93, 2017).


filmy_gatunek(Gatunek, ListaFilmow) :-
  findall(Tytul, film(Tytul, Gatunek, _, _, _), ListaFilmow).

filmy_ocena(MinOcena, ListaFilmow) :-
  findall(Tytul, (film(Tytul, _, Ocena, _, _), Ocena >= MinOcena), ListaFilmow).

filmy_rok(Rok, ListaFilmow) :-
  findall(Tytul, film(Tytul, _, _, _, Rok), ListaFilmow).

filmy_dlugosc_min(MinDlugosc, ListaFilmow) :-
  findall(Tytul, (film(Tytul, _, _, Dlugosc, _), MinDlugosc =< Dlugosc), ListaFilmow).

filmy_dlugosc_max(MaxDlugosc, ListaFilmow) :-
  findall(Tytul, (film(Tytul, _, _, Dlugosc, _), Dlugosc =< MaxDlugosc), ListaFilmow).

wyswietl_filmy_gatunek(Gatunek) :-
  filmy_gatunek(Gatunek, ListaFilmow),
  write('Filmy gatunku '), write(Gatunek), write(': '),
  write(ListaFilmow), nl.

wyswietl_filmy_ocena(MinOcena) :-
  filmy_ocena(MinOcena, ListaFilmow),
  write('Filmy z oceną co najmniej '), write(MinOcena), write(': '),
  write(ListaFilmow), nl.

wyswietl_filmy_rok(Rok) :-
  filmy_rok(Rok, ListaFilmow),
  write('Filmy z roku '), write(Rok), write(': '),
  write(ListaFilmow), nl.

wyswietl_filmy_dlugosc_min(Min) :-
  filmy_dlugosc_min(Min, ListaFilmow),
  write('Filmy o minimalnej długości '), write(Min), write(' minut: '),
  write(ListaFilmow), nl.

wyswietl_filmy_dlugosc_max(Max) :-
  filmy_dlugosc_min(Max, ListaFilmow),
  write('Filmy o maksymalnej długości '), write(Max), write(' minut: '),
  write(ListaFilmow), nl.

wyswietl_filmy_dlugosc_przedzial(Min, Max) :-
  filmy_dlugosc_min(Min, ListaMin),
  filmy_dlugosc_min(Max, ListaMax),
  intersection(ListaMin, ListaMax, ListaFilmow),
  write('Filmy o długości '), write(Min), write('-'), write(Max), write(' minut: '),
  write(ListaFilmow), nl.

wyswietl_filmy_rok_ocena(Rok, MinOcena) :-
  filmy_ocena(MinOcena, ListaOcena),
  filmy_rok(Rok, ListaRok),
  intersection(ListaOcena, ListaRok, ListaFilmow),
  write('Filmy z roku '), write(Rok), write(' z oceną co najmiej '), write(MinOcena), write(': '),
  write(ListaFilmow), nl.

wyswietl_filmy_gatunek_ocena(Gatunek, MinOcena) :-
  filmy_ocena(MinOcena, ListaOcena),
  filmy_gatunek(Gatunek, ListaGatunek),
  intersection(ListaOcena, ListaGatunek, ListaFilmow),
  write('Filmy gatunku '), write(Gatunek), write(' z oceną co najmiej '), write(MinOcena), write(': '),
  write(ListaFilmow), nl.


:- wyswietl_filmy_gatunek("Komedia").
:- wyswietl_filmy_ocena(4).
:- wyswietl_filmy_rok(1990).
:- wyswietl_filmy_dlugosc_min(100).
:- wyswietl_filmy_dlugosc_max(125).
:- wyswietl_filmy_dlugosc_przedzial(100, 125).
:- wyswietl_filmy_rok_ocena(1994, 6).
:- wyswietl_filmy_gatunek_ocena("SciFi", 5).


% =========================
%         Część II
% =========================

node("Karol", "Kowal", 72, "Teodor", "Kowal", "Janina", "Mnich").
node("Marta", "Lenarczyk", 68, "Bogumił", "Lenarczyk", "Teresa", "Mączna").
node("Tadeusz", "Cieśla", 76, "Marek", "Cieśla", "Teresa", "Moher").
node("Helena", "Malina", 70, "Tomasz", "Malina", "Kamila", "Morela").
node("Marcin", "Kowal",  47, "Karol", "Kowal", "Marta", "Lenarczyk").
node("Natalia", "Szwacz", 47, "Tadeusz", "Szwacz", "Iga", "Nowak").
node("Julia", "Kowal",  44, "Kamil",   "Kowal", "Natalia", "Szwacz").
node("Karolina", "Kowal", 49, "Karol", "Kowal", "Marta", "Kowal").
node("Tomasz", "Cieśla", 50, "Tadeusz", "Cieśla", "Helena", "Malina").
node("Gabriela", "Kowal",  23, "Marcin",  "Kowal", "Julia",   "Nowak").
node("Amanda", "Cieśla", 30, "Tomasz", "Cieśla", "Karolina", "Kowal").
node("Kamil", "Cieśla", 30, "Tomasz", "Cieśla", "Karolina", "Kowal").
node("Kamila", "Cieśla", 28, "Tomasz", "Cieśla", "Karolina", "Kowal").
node("Krzysztof", "Adamczyk", 50, "Jan", "Adamczyk", "Maria", "Nowak").
node("Magdalena", "Adamczyk", 48, "Jan", "Adamczyk", "Maria", "Nowak").
node("Sebastian", "Adamczyk", 22, "Jan", "Adamczyk", "Magdalena", "Kowalska").
node("Michał", "Walczak", 34, "Andrzej", "Walczak", "Irena", "Szymańska").
node("Alicja", "Walczak", 31, "Andrzej", "Walczak", "Irena", "Szymańska").
node("Dominik", "Walczak", 20, "Andrzej", "Walczak", "Irena", "Szymańska").
node("Jakub", "Kanar", 39, "Marek", "Kanar", "Zofia", "Pawlak").
node("Katarzyna", "Kanar", 35, "Marek", "Kanar", "Zofia", "Pawlak").


% Reguły
node_younger(Age, Nodes) :-
  findall([NodeName, NodeSurname, NodeAge],
  (node(NodeName, NodeSurname, NodeAge, _, _, _, _),
    NodeAge < Age),
    Nodes).

node_older(Age, Nodes) :-
  findall([NodeName, NodeSurname, NodeAge],
  (node(NodeName, NodeSurname, NodeAge, _, _, _, _),
    NodeAge > Age),
    Nodes).

node_father(Name, Surname, Nodes) :-
  findall([NodeFatherName, NodeFatherSurname],
  (node(NodeName, NodeSurname, _, NodeFatherName, NodeFatherSurname, _, _),
  NodeName == Name, NodeSurname == Surname),
  Nodes).

node_mother(Name, Surname, Nodes) :-
  findall([NodeMotherName, NodeMotherSurname],
  (node(NodeName, NodeSurname, _, _, _, NodeMotherName, NodeMotherSurname),
  NodeName == Name, NodeSurname == Surname),
  Nodes).

node_children(Name, Surname, Nodes) :-
  findall([NodeName, NodeSurname],
  (node(NodeName, NodeSurname, _, NodeFatherName, NodeFatherSurname, NodeMotherName, NodeMotherSurname),
  (NodeFatherName == Name, NodeFatherSurname == Surname) ; (NodeMotherName == Name, NodeMotherSurname == Surname)),
  Nodes).

node_siblings(Name, Surname, Nodes) :-
  node_father(Name, Surname, FatherArrayNode),
  nth0(0, FatherArrayNode, FatherNode),
  nth0(0, FatherNode, FatherName),
  nth0(1, FatherNode, FatherSurname),

  node_mother(Name, Surname, MotherArrayNode),
  nth0(0, MotherArrayNode, MotherNode),
  nth0(0, MotherNode, MotherName),
  nth0(1, MotherNode, MotherSurname),

  findall(
  (NodeName, NodeSurname),
  (node(NodeName, NodeSurname, _, NodeFatherName, NodeFatherSurname, NodeMotherName, NodeMotherSurname),
  (
    (NodeFatherName == FatherName, NodeFatherSurname == FatherSurname,
    NodeMotherName == MotherName, NodeMotherSurname == MotherSurname),
    (NodeName \= Name ; NodeSurname \= Surname)
  )), 
  Nodes).

% Zapytania
find_younger(Age) :-
  node_younger(Age, Nodes),
  write("Younger than "), write(Age), write(": "),
  write(Nodes), nl.

find_older(Age) :-
  node_older(Age, Nodes),
  write("Older than "), write(Age), write(": "),
  write(Nodes), nl.

find_father(Name, Surname) :-
  node_father(Name, Surname, Nodes),
  write(Name), write(" "), write(Surname), write(" father is: "),
  write(Nodes), nl.

find_mother(Name, Surname) :-
  node_mother(Name, Surname, Nodes),
  write(Name), write(" "), write(Surname), write(" mother is: "),
  write(Nodes), nl.

find_children(Name, Surname) :-
  node_children(Name, Surname, Nodes),
  write(Name), write(" "), write(Surname), write(" chldren: "),
  write(Nodes), nl.

find_siblings(Name, Surname) :-
  node_siblings(Name, Surname, Nodes),
  write(Name), write(" "), write(Surname), write(" siblings: "),
  write(Nodes), nl.


:- find_younger(50).
:- find_older(50).
:- find_father("Gabriela", "Kowal").
:- find_mother("Gabriela", "Kowal").
:- find_children("Karol", "Kowal").
:- find_siblings("Amanda", "Cieśla").
