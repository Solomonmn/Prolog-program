% input4.pl
% Sample input 4

% Employees
employee(ginny).
employee(daniel).
employee(sarah).
employee(mira).
employee(nick).
employee(charlie).
employee(erica).
employee(kimberly).
employee(ryan).
employee(tim).
employee(alice).
employee(quinn).
employee(ulysses).
employee(harry).
employee(iris).
employee(yusuf).
employee(bob).
employee(larry).
employee(zoey).
employee(jack).
employee(frank).

% Workstations: workstation(Number, MinEmployees, MaxEmployees)
workstation(1, 2, 6).
workstation(2, 1, 1).
workstation(3, 1, 5).
workstation(4, 2, 7).

% Workstations idle during certain shifts
workstation_idle(_, _) :- fail.  % No workstations are idle in any shift

% Employees avoiding certain workstations
avoid_workstation(daniel, 4).
avoid_workstation(daniel, 3).
avoid_workstation(iris, 2).
avoid_workstation(iris, 3).
avoid_workstation(iris, 1).
avoid_workstation(jack, 3).

% Employees avoiding certain shifts
avoid_shift(sarah, night).
avoid_shift(ulysses, morning).
