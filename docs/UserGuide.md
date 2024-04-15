# User Guide

### Introduction

Welcome to **TimeTableComparer**! This application is meant for creating and storing task within a weekly calendar and seeing shared time between user's timetables. A convient way to determine shared free time!

## Table of Contents
- [Quick Start](#quick-start)
- [Features](#features)
    - [Adding a user: `adduser`](#adduser)
    - [Show current user: `current`](#current)
    - [Listing all users: `list`](#list)
    - [Switch users: `switch`](#switch)
    - [Adding a task: `task`](#addtask)
    - [Adding a task (duplication check): `addtwdc`](#addtwdc)
    - [Deleting a task: `deletetask`](#deletetask)
    - [Comparing two timetables: `compare`](#compare)
    - [Comparing all timetables: `compareall`](#compareall)
    - [Add a task for all users: `addforall`](#addforall)
    - [Changing a task's times: `changetasktiming`](#changetasktiming)
    - [Changing a task's type: `changetasktype`](#changetasktype)
    - [View today's tasks: `todaytask`](#todaytask)
    - [Add a recurring task: `addrepeattask`](#addrepeattask)
    - [View urgent tasks in next few hours: `urgent`](#urgent)
    - [Add a task for certain users: `addfor`](#addfor)
    - [Help: `help`](#help)
    - [Exit program: `bye`](#bye)
- [FAQ](#faq)
- [Command Summary](#commandsummary)

## Quick Start <a name="quick-start"></a>
Downloading TimeTableComparer

1. Ensure that you have [Java 11](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) or above installed.
2. Down the latest version of `tP.jar` from [here](http://link.to/duke).
3. Copy the file to the folder you want to use as the home folder for the application. For example,`C:\Users\setupuser\Documents\StockPal\stockpal.jar`.
4. Open your terminal or gitBash and `cd` into the folder you placed the .jar file.
5. Run `java -jar tP.jar`

## Features <a name="features"></a>
> Note: `CAPITAL_LETTERS` Indicate the section for user's input.

## Adding a user: `adduser` <a name="adduser"></a>

Add a new user into the user list.

Format: `adduser NAME`

Example: `adduser mike`

Expected Output: 
```
New user added: mike
The active user is: mike
File created: mike.txt
```
> *If this is the first user created then the active user will be set to the new user*

## Show current user: `current` <a name="current"></a>

Displays the active user.

Format:`current`

Example: `current`
```
adduser john
adduser jill
adduser jack
current
```
Expected Output:
```
The active user is: john
```

## Listing all existing users: `list` <a name="list"></a>

View the list of existing usernames.

Format: `list`

Example: `list`

Expected Output: 
```
The current users are: 
jane
john
jill
```

## Switch to another user: `switch` <a name="switch"></a>

Switch the active user to the inputted name.

Format: `switch USER_NAME`

Example: `switch jane`

Expected Output:
```
The active user is: jane
```

## Adding a task: `addtask` <a name="addtask"></a>

Add a new task into the active user's list.

Format: `addtask /on DAY /task TASK_NAME /from TIME /to TIME /type TASK_TYPE`
> * Both starting time and end time must be in the format of HH:MM or H:MM.
> * TASK_TYPE is either `f` (for flexible tasks) or `c` (for compulsory tasks).

Example: `addtask /on monday /task lecture /from 11:00 /to 12:00 /type f`

Expected Output: 
```
The following task is added: lecture (monday from 11:00 to 12:00) type: f
Timetable has been written to data/mike.txt
```

## Adding a task with duplication check: `addtwdc` <a name="addtwdc"></a>

Adding a new task with a duplication check, ensuring that task of this type does not get duplicated.

Format: `addtwdc /on DATE /task TASK_NAME /from TIME /to TIME /type TASK_TYPE`
>* Both starting time and end time must be in the format of HH:MM or H:MM.
>* TASK_TYPE is either `f` (for flexible tasks) or `c` (for compulsory tasks).

Example: `addtwdc /on monday /task lecture /from 11:00 /to 12:00 /type f`

Expected Output (Duplicate Found):
```
Invalid command. 
Task already exists. Cannot add duplicate task.
```

## Delete task from one user's timetable: `deletetask` <a name="deletetask"></a>

Delete a task given a specific day and task number.

Format: `deletetask /on DAY /index TASK_INDEX`

Example: `deletetask /on monday /index 1`

Expected Output:
```
Task lecture is deleted from monday
New task list for Monday:
No task for monday!
Timetable has been written to data/jane.txt
```
> This output is given that we deleted the only task on monday.

## Compare two timetables: `compare` <a name="compare"></a>

Compare timetables between two specified users.

Format: `compare NAME_1 NAME_2`

Example: `compare john jane`

Expected Output:
```
_________________________________________
Shared free time on Monday:
    00:00 - 09:00
    11:00 - 12:00
    13:00 - 23:59
_________________________________________
Shared free time on Tuesday:
    00:00 - 09:00
    11:00 - 23:59
_________________________________________
Shared free time on Wednesday:
    ** Whole day is free on Wednesday
_________________________________________
Shared free time on Thursday:
    ** Whole day is free on Thursday
_________________________________________
Shared free time on Friday:
    00:00 - 13:00
    14:00 - 23:59
_________________________________________
Shared free time on Saturday:
    ** Whole day is free on Saturday
_________________________________________
Shared free time on Sunday:
    ** Whole day is free on Sunday
```

## Compare all timetables: `compareall` <a name="compareall"></a>

Compare timetables between all existing users.

Format: `compareall`

Example: `compareall`

Expected Output:
```
Comparing all timetables: 
_________________________________________
Shared free time on Monday:
    00:00 - 09:00
    11:00 - 12:00
    13:00 - 23:59
_________________________________________
Shared free time on Tuesday:
    00:00 - 09:00
    11:00 - 23:59
_________________________________________
Shared free time on Wednesday:
    ** Whole day is free on Wednesday
_________________________________________
Shared free time on Thursday:
    ** Whole day is free on Thursday
_________________________________________
Shared free time on Friday:
    00:00 - 13:00
    14:00 - 23:59
_________________________________________
Shared free time on Saturday:
    00:00 - 02:00
    04:00 - 23:59
_________________________________________
Shared free time on Sunday:
    ** Whole day is free on Sunday

```

## Add a task for all existing users: `addforall` <a name="addforall"></a>

Add a task for all existing users.

Format: `addforall /on DAY /task TASK_NAME /from TIME /to TIME`

Example: `addforall /on sunday /task laundry /from 7:00 /to 9:00`
* Note: there is no need to specify type for common events as tasks added for all users are assumed to be of type "common",

Expected Output:
```
Timetable has been written to data/jane.txt
Timetable has been written to data/john.txt
Timetable has been written to data/jill.txt
The following task is added for all users: laundry (sunday from 07:00 to 09:00)
```

## Change the start time or end time of a task: `changetasktiming` <a name="changetasktiming"></a>

Change the starting/ending time of a task given a day and task number.

Format:`changetasktiming /on DAY /index TASK_INDEX /from TIME /to TIME`

Example: `changetasktiming /on monday /index 1 /from 12:00 /to 13:00`

Expected Output:
```
Flexible task timing changed successfully.
Timetable has been written to data/jane.txt
```

## Change the task type: `changetasktype` <a name="changetasktype"></a>

Format:`changetasktype /on DAY /index TASK_INDEX /type F_OR_C`

Example: `changetasktype /on monday /index 1 /type c`

Expected Output:
```
Task type changed successfully.
Timetable has been written to data/jane.txt
```

## View today's tasks: `todaytask` <a name="todaytask"></a>

Format: `todaytask`

Example: `todaytask`

Expected Output:
```
_________________________________________
Today :
    1. walk dog (friday from 13:00 to 14:00) type: c
```
>Given that tasks exist the day this command is ran.

## Add a task which occurs on multiple days: `addrepeattask` <a name="addrepeattask"></a>

Add a task which occurs on multiple days given a set of days.

Format: `addrepeattask /task TASK_NAME /on DAYS /from START_TIME /to END_TIME /type F_OR_C`

Example: `addrepeattask /task lecture /on monday tuesday /from 9:00 /to 11:00 /type c`

Expected Output:
```
Timetable has been written to data/user.txt
Repeated task added successfully!

```

## Find urgent tasks which happen in a day within next few hours:`urgent` <a name="urgent"></a>

Format: `urgent /in HOURS`

Example: `urgent /in 3`

Expected output:
```
Urgent tasks within the next 3 hours:
lec (Monday from 12:00 to 13:00) type: c
```

## Add a task for multiple users: `addfor` <a name="addfor"></a>

Format: `addfor /user USER1, USER2, ... /on DAYS /task DESCRIPTION /from START_TIME /to END_TIME /type F_OR_C`

Example: `addfor /user simon, helen, tim /on monday /task project meeting /from 9:00 /to 11:00 /type f`

* Note: The usernames have to be separated by ",".

Expected Output: 
```
Timetable has been written to data/Simon.txt
Timetable has been written to data/Helen.txt
Timetable has been written to data/Tim.txt
```

## List name of commands: `help` <a name="help"></a>

Format: `help`

Example: `help`

## Exit the program: `bye` <a name="bye"></a>

Format: `bye`

Example: `bye`

Expected Output: `Bye.`

## FAQ <a name="faq"></a>

**Q**: Where are the timetables stored?

**A**: The timetables are stored in the folder named "data" in the same directory. 
The name of the file indicates the owner of the timetable.

**Q**: Can I delete a user from the userlist?

**A**: No.

## Command Summary <a name="commandsummary"></a>

- Add User `adduser NAME`
- Show Active User `current`
- List All Users `list`
- Switch Users `switch`
- Adding a Task `addtask /on DAY /task DESCRIPTION /from START /to END /type [f/c]`
- Adding a Task (Duplication Check) `addtwdc /on DAY /task DESCRIPTION /from START /to END /type [f/c]`
- Delete a Task `deletetask /on DAY /index TASK_NUMBER`
- Compare Two Timetables `compare NAME_1 NAME_2`
- Compare All Timetables `compareall`
- Add a Task For All Users `addforall /on DAY /task DESCRIPTION /from START /to END`
- Changing a Task's Time `changetasktiming /on DAY /index TASK_INDEX /from TIME /to TIME`
- Changing a Task's Type `changetasktype /on DAY /index TASK_INDEX /type F_OR_C`
- List Today's Tasks `todaytask`
- Add a Recurring task `addrepeattask /task TASK_NAME /on DAYS /from START_TIME /to END_TIME /type F_OR_C`
- Find urgent tasks in next few hours `urgent /in HOURS`
- Add Task For Certain Users `addfor /user USER1, USER2, ... /on DAYS /task DESCRIPTION /from START_TIME /to END_TIME /type F_OR_C`
- Help `help`
- Exit Program `bye`
