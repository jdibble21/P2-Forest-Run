# Project 2, Iteration 1: 2D Kinematic Motion
First Iteration of a multi part project by Jacob Dibble

2D Platforming game set in a forest environment with spike pits and two enemy sprites

Github Pages: https://bsu-cs315.github.io/P2-Forest-Run/

## Game Instructions
- While playing on GH Pages, you may need to click the game screen before input is recognized
- To walk left and right, hold A and D, to jump, press W
- To attack with sword, hold spacebar (once sword is found in level)
- To reload the game, press R

## Project Report
The most challenging part of this iteration was figuring out how to structure all the code. I felt as if I was writing too much for just 3 files of GDscript, and that I should expand to other classes/scripts, but at the same time didn't want a bunch of other files with few lines of code, and struggled to figure out exactly what I could put in other script files that made sense to move. I also felt as if I used too many global variables in the classes, and probably should have taken a different approach to organization there. 
- [X] D-1: The repository link is submitted to Canvas before the project deadline.
- [X] D-2: The repository contains a <code>README.md</code> file in its top-level directory.
- [X] D-3: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [X] C-1: Your repository is well-formed, with an appropriate <code>.gitignore</code> file and no unnecessary files tracked.
- [X] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [X] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the <code>README.md</code> file.
- [X] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [X] C-5: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of T or less.
- [X] C-6: The game includes a player-controlled character, implemented as a <code>KinematicBody</code> and positioned in a conventional, <code>TileMap</code>-based, 2D-platforming world.
- [X] C-7: The player's character can move left and right, with its movement bounded by impassable tiles.
- [X] C-8: The player's character can jump up and onto tiles.
- [X] C-9: The player's character falls down when walking off a ledge.
- [X] B-1: The <code>README.md</code> file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [X] B-2: The playable game is published to GitHub Pages and linked from the <code>README.md</code> file.
- [X] B-3: The source code and project structure comply with our adopted style guides.
- [X] B-4: There is a sprite element in the level that the player can interact with, such as a collectible, an enemy, a book, or a switch.
- [X] B-5: The camera follows the character through a world that is larger than one screen.
- [X] A-1: Earn one star
- [X] ⭐ Animate the main character using either <code>AnimatedSprite</code> or cutout animation
- [X] ⭐ Include parallax scrolling in the background.
- [X] ⭐ Include tiles that can be passed in one direction, such as being able to jump up through a tile and land atop it.

Based on the completed requirements, I have earned an A on this iteration

## Third-Party Assets

Player sprite and animations are from "Animated Pixel Adventurer". Created by rvros,
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://rvros.itch.io/animated-pixel-hero

Background and foreground environment art is from "Free Pixelart Platformer Tileset". Created by aamatnieks,
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://aamatniekss.itch.io/free-pixelart-platformer-tileset

Enemy sprite and animations are from "Bandits". Created by Sven,
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://sventhole.itch.io/bandits

Additional foreground props are from "TAIGA". Created by vnitti,
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://vnitti.itch.io/taiga-asset-pack

Sans-serif font used is from www.fontspace.com. 
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.fontspace.com/category/sans-serif

Spike prop and sword prop/animation was created using www.piskellapp.com by myself,
[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.piskelapp.com/p/agxzfnBpc2tlbC1hcHByEwsSBlBpc2tlbBiAgKD7g8LpCgw/edit