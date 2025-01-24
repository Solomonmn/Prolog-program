% schedule.pl
% Main Prolog file for CS4337 Project 2 Fall 2024

:- use_module(library(lists)).

:- dynamic employee/1.
:- dynamic workstation/3.
:- dynamic workstation_idle/2.
:- dynamic avoid_workstation/2.
:- dynamic avoid_shift/2.

% plan/1 predicate
% Generates a work schedule plan(Morning, Evening, Night)
plan(plan(Morning, Evening, Night)) :-
    % Gather all employees in the order they appear in input
    all_employees(Employees),

    % Define shifts
    Shifts = [morning, evening, night],

    % Gather all workstations
    findall(W, workstation(W, _, _), AllWorkstations),

    % Determine active workstations for each shift
    active_workstations(Shifts, AllWorkstations, ShiftWorkstations),

    % Assign employees to shifts and workstations
    assign_shift_workstations(ShiftWorkstations, Employees, Assignments),

    % Group assignments by shift and workstation
    group_assignments(Assignments, GroupedShifts),

    % Verify that for each shift and workstation, the number of employees is between min and max
    verify_constraints(ShiftWorkstations, GroupedShifts),

    % Structure the plan
    extract_plan(GroupedShifts, plan(Morning, Evening, Night)).

% active_workstations/3
active_workstations([], _, []).
active_workstations([Shift|Rest], AllWorkstations, [Shift-ActiveWs|OtherShifts]) :-
    findall(W, (member(W, AllWorkstations), \+ workstation_idle(W, Shift)), ActiveWs),
    active_workstations(Rest, AllWorkstations, OtherShifts).

% assign_shift_workstations/3
assign_shift_workstations([], [], []).
assign_shift_workstations([Shift-Workstations|RestShifts], Employees, Assignments) :-
    assign_workstations(Shift, Workstations, Employees, _, RemainingEmps, ShiftAssignments),
    assign_shift_workstations(RestShifts, RemainingEmps, RestAssignments),
    append(ShiftAssignments, RestAssignments, Assignments).

% assign_workstations/6
assign_workstations(_, [], Employees, Employees, Employees, []).
assign_workstations(Shift, [W|Ws], Employees, AssignedEmps, RemainingEmps, [assignment(Shift, W, Emps)|RestAssignments]) :-
    workstation(W, Min, Max),
    between(Min, Max, N),
    select_employees(Employees, Shift, W, N, Emps),
    subtract(Employees, Emps, NewEmployees),
    assign_workstations(Shift, Ws, NewEmployees, AssignedEmps, RemainingEmps, RestAssignments).

% select_employees/5
% Selects N employees in the order they appear from Employees who can work in Shift and W
select_employees(Employees, Shift, W, N, SelectedEmps) :-
    findall(E, (
        member(E, Employees),
        \+ avoid_shift(E, Shift),
        \+ avoid_workstation(E, W)
    ), Available),
    length(Available, L),
    L >= N,
    prefix_length(Available, SelectedEmps, N).

% prefix_length/3
% Takes the first N elements from List as Prefix
prefix_length(List, Prefix, N) :-
    length(Prefix, N),
    append(Prefix, _, List).

% group_assignments/2
group_assignments(Assignments, GroupedShifts) :-
    findall(Shift-WorkstationList,
        (
            member(Shift, [morning, evening, night]),
            findall(workstation(W, Emps),
                member(assignment(Shift, W, Emps), Assignments),
                WorkstationList
            )
        ),
        GroupedShifts
    ).

% verify_constraints/2
verify_constraints([], _).
verify_constraints([Shift-_|RestShifts], GroupedShifts) :-
    member(Shift-WorkstationList, GroupedShifts),
    forall(
        member(workstation(W, Emps), WorkstationList),
        (
            workstation(W, Min, Max),
            length(Emps, N),
            N >= Min,
            N =< Max
        )
    ),
    verify_constraints(RestShifts, GroupedShifts).

% extract_plan/2
extract_plan(GroupedShifts, plan(Morning, Evening, Night)) :-
    member(morning-Morning, GroupedShifts),
    member(evening-Evening, GroupedShifts),
    member(night-Night, GroupedShifts).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Predicates to Match Provided Queries and Checks %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% no_work/2
no_work(Plan, Employee) :-
    all_employees(All),
    all_assigned(Plan, Assigned),
    member(Employee, All),
    \+ member(Employee, Assigned).

% double_work/2
double_work(Plan, Employee) :-
    all_assigned(Plan, Assigned),
    member(Employee, Assigned),
    select(Employee, Assigned, Remaining),
    member(Employee, Remaining).

% works_at/4
works_at(plan(Morning, Evening, Night), Shift, Employee, W) :-
    (Shift = morning -> Shifts = Morning
    ; Shift = evening -> Shifts = Evening
    ; Shift = night   -> Shifts = Night),
    member(workstation(W, Emps), Shifts),
    member(Employee, Emps).

% Helper predicates
all_employees(All) :-
    findall(E, employee(E), All).

all_assigned(plan(Morning,Evening,Night), Assigned) :-
    findall(E, (member(workstation(_,Es), Morning), member(E,Es)), MEs),
    findall(E, (member(workstation(_,Es), Evening), member(E,Es)), EEs),
    findall(E, (member(workstation(_,Es), Night), member(E,Es)), NEs),
    append(MEs, EEs, MEEs),
    append(MEEs, NEs, Assigned).
