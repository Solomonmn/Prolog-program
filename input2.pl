% input2.pl
% Sample input 2

% Employees
employee(walter).
employee(ryan).
employee(bob).
employee(yusuf).
employee(alice).
employee(tim).
employee(peter).
employee(frank).
employee(daniel).
employee(harry).
employee(ximena).
employee(sarah).
employee(mira).
employee(ginny).
employee(larry).
employee(jack).
employee(ulysses).
employee(zoey).
employee(erica).

% Workstations: workstation(Number, MinEmployees, MaxEmployees)
workstation(1, 1, 6).
workstation(2, 2, 6).
workstation(3, 1, 9).
workstation(4, 3, 4).
workstation(5, 3, 1).
workstation(6, 2, 2).

% Workstations idle during certain shifts
workstation_idle(_, _) :- fail.  % No workstations are idle in any shift

% Employees avoiding certain workstations
avoid_workstation(_, _) :- fail.  % No workstation avoidance

% Employees avoiding certain shifts
avoid_shift(_, _) :- fail.  % No shift avoidance
