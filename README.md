# Project 1 - *Flix_clone*

**Flix_clone** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **6** hours spent in total

## User Stories

The following **required** user stories are complete:

- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

The following **optional** user stories are implemented:

- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples
include better ways to implement something, how to extend your app in certain ways, etc):

1.About setting the height of each cell according to the overview
2.About adding a filter according to the types of the movies

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/a/gewR4' title='flix_clone Demo' width='' alt='flix_clone Demo' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

Had a lot of trouble trying to adjust the height of each cell. I tried the typical function for 
setting the height, but somehow it totally skipped the function. So I hard-coded it at last. 
So this is something I need to update in the future.


## License

    Copyright [2018] [Guanxin]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
