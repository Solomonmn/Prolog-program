# README

## Files Included
- **schedule.pl**: The main Prolog source file containing the `plan/1` predicate and helper predicate.
- **input1.pl**: A sample input file containing all facts which are employees, workstations, constraints as mentioned in the assignment.
- **README.md**: This file, describes how to set up and run the project.
- **WriteUp.pdf (or WriteUp.docx)**: A separate write-up document explaining the approach, design choices, reversibility, and lessons learned.

## How to Compile and Run
1. Ensure all files (`schedule.pl`, `input1.pl`) or the inputs expected are in the same directory.
2. Open **SWI-Prolog** (or another compatible Prolog environment).
3. Load the project files:
   ```prolog
   ?- consult('schedule').
   ?- consult('input1').
