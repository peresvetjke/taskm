# taskm

This program is a simple task manager.

The following options are available:

     -l      View task list.

     -a      Add new task. You will be able to specify the task name.
     
     -c      Mark task as completed (required string number as argument).
     
     -d      Delete task (required string number as argument).
     
## Usage

```
$ ruby todo.rb -l
1. [x] Buy milk
2. [ ] Feed the dog

$ ruby todo.rb -c 2
1. [x] Buy milk
2. [x] Feed the dog

```
