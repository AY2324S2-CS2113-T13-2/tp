# Developer Guide

## Acknowledgements

{list here sources of all reused/adapted ideas, code, documentation, and third-party libraries -- include links to the original source as well}

## Design & implementation

### Save timetable function
The saving timetable mechanism is facilitated by the Storage class. It implements the following operations: 
* `Storgae#createFolder()`: Creates a folder in the directory where all the users' timetable will be stored in the local computer.
* `Storage#addExistingUsers()`: Loops through the folder to add all previous saved users upon opening the app, as well as their corresponding tasks.
* `Storage#addUserInFolder(User user)`: When a new user is added, a file with the name of the user will be created in the folder.
* `Storage#writeTaskInFile(User user)`: when a new task of a specific user is added, it will be written into the correct file.

The following sequence diagram shows how the operations in the Storage class goes through when the app is opened and it loads data from history:
![Storage UML](StorageUML.png)
## Product scope
### Target user profile

{Describe the target user profile}: Students (NUS student?)

### Value proposition

{Describe the value proposition: what problem does it solve?}

## User Stories

|Version| As a ... | I want to ... | So that I can ...                                           |
|--------|----------|---------------|-------------------------------------------------------------|
|v1.0| new user |see usage instructions| refer to them when I forget how to use the application      |
|v2.0| user     |find a to-do item by name| locate a to-do without having to go through the entire list |
|    | user     |add a task to the timetable| record when a task needs to be done  |
 

## Non-Functional Requirements

{Give non-functional requirements}

## Glossary

* *glossary item* - Definition

## Instructions for manual testing

{Give instructions on how to do a manual product testing e.g., how to load sample data to be used for testing}
