# Mars Rover [![Build Status](https://travis-ci.org/giamir/mars_rover.svg?branch=master)](https://travis-ci.org/giamir/mars_rover)


A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).


**Input:**

* The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

* The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.

* The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.

* Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.


**Output:**

* The output for each rover should be its final co-ordinates and heading.

Test Input:
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```
Expected Output:
```
1 3 N
5 1 E
```

## Installation instructions

Clone from github and move into directory

```
$ git@github.com:giamir/mars_rover.git
$ cd mars_rover
```
If you don't have bundler installed run
```
$ gem install bundler
```

Then install all the dependencies for the application running

```
$ bundle
```

You can now try the app
```
$ rake run
```

### Usage example
```
$ MARS ROVER APP
$ Insert input (type ctrl-d when you have done):
$ 5 5
$ 1 2 N
$ LMLMLMLMM
$ 3 3 E
$ MMRMMRMRRM
$ ^D
$
$ Output:
$ 1 3 N
$ 5 1 E
```

### Technologies

* Ruby 2.2.3
* Rake 10.5.0
* RSpec 3.4.0

### Running tests

To run the full test suite

```
$ rspec
```

Or to run individual components (models, commands and parsers test)

```
$ rspec test/models
$ rspec test/commands
$ rspec test/parsers
```

## Solution description

### General assumptions

* A rover can't go outside the plateau.

* Rovers can occupy the same position.

### Application scaffold

```
lib
├── commands
│   ├── command.rb
│   ├── move_command.rb
│   ├── turn_left_command.rb
│   └── turn_right_command.rb
├── models
│   ├── coordinates.rb
│   ├── direction.rb
│   ├── plateau.rb
│   └── rover.rb
└── parsers
    ├── command_parser.rb
    ├── coordinates_parser.rb
    └── location_parser.rb
```

### Software design decisions





If you want to have a deep understanding of the business logic implemented, please follow [this link](https://github.com/giamir/mars_rover/tree/master/test) where all tests cases are located.


```
                         ;iiiiiiiiiiiiiiiiiiiii;                           
                        L:                     :L                          
   @8t0@.               L:   fGC.        C8f   :L                           
 1t     tt              L: if    @     8.   f1 :L              ;@ @@ @,    
 8       0              L: if    @     @    if :L             ,G      @    
  0C     @.             L:   L@8,       ,8@G   :L     @, @:    @      @    
    @ @ @; @.           L:                     :L   .8     @,CC f@LC@1     
    @ @   @; @.         .@@@@@@@@@@@ @@@@@@@@@@@.   @         LG           
    @ @     @; @L8@G               @ @              @          @:          
    @ @       @      @             @ @              ;L           @;        
  L8   00     @      f;            @ @               i0          .@        
 G.     .0    LL    ,@             @ @                 ,@0    i@8          
 .8888888.      :C:L               @ @                    @ 8              
                ,C:L@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@@@@@@ 8              
                :@                                         @8              
               1G               MARS  ROVER                 8;             
              @                                              ,@            
            ;8 8@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@0 @,          
           @.tG                                               0i;8         
          @ @                                                  ,8 @        
           @ @: .@..@, .         .. @t C8 ..         . i8 .@  ;8 @         
            @            @     G:           iC    .8            @          
          ,0@            88,  f@            .@i  :0L            @0.        
         @      @1  i@      @;     G0   8f     t@     .@:  t@      @       
         0t    @      @    i0@    8      ,G    @@i   ,0      @    Gt       
         8,    @      @    ,@0    0,     if    8@    .8      @    :G       
         @      G8::88      @t     i@1,1@,     C@      88,:8G     .@       
           :8            8:    @            .0    iC            @,         
            @.  :    i  .@     Lf  i    .;  C1     @  .:    1  ,@          
                 @Lf@               L@i@f              ,@tC8               
```

## Contributors

[Giamir Buoncristiani](https://github.com/giamir)
