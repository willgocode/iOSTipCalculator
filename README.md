# Pre-work - Tip Calculator

Tipulator is a tip calculator application for iOS.

Submitted by: William Wu

Time spent: 3 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/IjIVxBq.gifv' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I have experience developing for iOS already. There are things that I have learned from this project however, such as ctrl clicking to clone UI element multiple times and through my own research, learned about global tinting. Overall, I really enjoy developing for iOS as it allows me to easily create UIs and see the changes in real time. I can also easily test my app on my device by just plugging in a USB cord. Swift is also an easy language to learn. The syntax is easy to grasp and Xcode's suggestions make it even easier.

I would say that outlets and actions are functions that are tied to a specific UI element. A text field outlet would be a variable that allows a developer to modify any of that UI element's properties. An action is tied to a function and it's usually tied to a button. Viewing the source code does somewhat confirm my beliefs. As where it's exactly locating the functions and variables that the UI element is tied to, I do not know. Perhaps it has something to do with the id and destination keys, but they don't seem to make any sense to me, so I assume that is generated when we control drag into a connection into a view controller.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** ARC manages memory by automatically keeping track of strong references to a specific variable. It allocates the space when its initialized and if all references to it are gone, the space is deallocated. A closure strong reference cycle can occur when a closure and a class interact without a capture list. The cycle is caused when you have variables inside the class that the closure relies on and thus they have strong references to it. When the strong reference variable to the class is set to nil, the strong reference cycle does not break because the closure is still referencing the variables in the class and the class also has a reference to the closure variables.


## License

    Copyright [2017] [William Wu]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
