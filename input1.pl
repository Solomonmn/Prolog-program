% input1.pl
% Sample input 1

% Employees
employee(ulysses).
employee(bob).
employee(zoey).
employee(ximena).
employee(jack).
employee(harry).
employee(mira).
employee(erica).
employee(tim).
employee(peter).
employee(larry).
employee(ginny).
employee(daniel).
employee(yusuf).
employee(ophelia).
employee(frank).
employee(walter).
employee(charlie).
employee(venessa).
employee(sarah).
employee(ryan).
employee(quinn).
employee(alice).
employee(kimberly).
employee(nick).
employee(iris).

% Workstations: workstation(Number, MinEmployees, MaxEmployees)
workstation(1, 2, 4).
workstation(2, 5, 9).
workstation(3, 1, 1).

% Workstations idle during certain shifts
workstation_idle(3, morning).

% Employees avoiding certain workstations
avoid_workstation(ophelia, 3).
avoid_workstation(ophelia, 1).

% Employees avoiding certain shifts
avoid_shift(daniel, night).
