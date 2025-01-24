% input5.pl
% Sample input 5

% Employees
employee(ophelia).
employee(peter).
employee(ximena).
employee(venessa).
employee(bob).
employee(jack).
employee(alice).
employee(iris).
employee(nick).
employee(ryan).
employee(kimberly).
employee(charlie).
employee(harry).

% Workstations: workstation(Number, MinEmployees, MaxEmployees)
workstation(1, 1, 6).

% Workstations idle during certain shifts
workstation_idle(_, _) :- fail.  % No workstations are idle in any shift

% Employees avoiding certain workstations
avoid_workstation(_, _) :- fail.  % No workstation avoidance

% Employees avoiding certain shifts
avoid_shift(ophelia, morning).
