Developer Journal:


Decided to start keeping a record of what I learned or what code I shamelessly stole.
Give credit where it's due, I always say.
Didn't start this until later in the project.

Recap Feature - needed to figure out how to make a page-swipe widget
- might use this for GuildSmith, too, but I think bottom-nav and swipe-nav is a little silly
- https://www.youtube.com/watch?v=3aChah4Fyak
- Watched this helpful guy's video for about 90 seconds before I had what I needed.
- PageView Widget, with children populated by grabbing PageContents using the recap Set's index values
!! ran into trouble with data persisting across page changes:
  - when switching to Recap route, the _storyRecap Set reverts to initial value
  - had to learn about Provider (great...sounds like Redux now)  