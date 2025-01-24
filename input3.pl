% input3.pl
% Sample input 3

% Employees
employee(zoey).
employee(ophelia).
employee(ulysses).
employee(kimberly).
employee(erica).
employee(sarah).
employee(jack).
employee(ginny).
employee(ximena).
employee(walter).
employee(quinn).
employee(iris).
employee(tim).
employee(larry).
employee(daniel).
employee(mira).
employee(frank).

% Workstations: workstation(Number, MinEmployees, MaxEmployees)
workstation(1, 1, 5).
workstation(2, 2, 3).

% Workstations idle during certain shifts
workstation_idle(_, _) :- fail.  % No workstations are idle in any shift

% Employees avoiding certain workstations
avoid_workstation(tim, 2).

% Employees avoiding certain shifts
avoid_shift(ulysses, evening).
avoid_shift(erica, evening).
avoid_shift(daniel, morning).
avoid_shift(daniel, evening).
