# Selection Phobia App (iOS & Android)
Repository for the mobile app portion of the Selection Phobia web application.

![Demo_Gif](https://github.com/Isaac-Tong/selectionphobia-mobile/blob/master/readme/showcase_gif.gif)

## Published on the Playstore!
https://play.google.com/store/apps/details?id=com.isaactong.selectionphobiamobile


## Overview the Project
Selection Phobia is a social networking site that helps people with indecisive tendencies to decide. This process is done by an anonymous voting system where users can write a question and provide a few options for our community members to vote on. Other uses can then vote on which option the asker should do/decide on, thus giving the asker a good consensus on what other people would do in their shoes. 

## iOS & Android App Showcase
*The screenshots below are ***actual screenshots*** of the app running on an android phone, and not just renders*

![Homepage](https://github.com/Isaac-Tong/selectionphobia-mobile/blob/master/readme/Showcase_1.png)
![LoginPages](https://github.com/Isaac-Tong/selectionphobia-mobile/blob/master/readme/Showcase_2.png)

## Development
<hr />

## Features and Key Notes
1. The mobile app is designed to create a fluid experience for the user. Common gestures such as pull down to refresh data, and swipe to switch pages are fully implemented. 

2. Pagination of data is implemented onto the mobile app. Only when the user hits the end of the page will more data be loaded. This is to minimize device cache/storage size and also networking transfer size. 

3. Backend and mobile front end communicates through a RESTful API that is built on top of an express server.

4. Frontend website and REST API both are served from the same server. Distinction between a browser request and a request from the mobile app is made by a key value pair in the HTTP request header. An extra key value pair "platform: mobile" is added to the request header if request was sent from a mobile device. 

5. Tokens are issued through JSON web tokens to eliminate the need of a session based authentication system. This simplifies authentication between the mobile and browser platforms. 

## Frameworks/Languages Used
* Dart/Flutter *(For the Android * iOS app)*
* Node/Express/MongoDB *(For the backend)*

## Privacy Policy
To comply with relevant privacy laws, a [website](https://isaac-tong.github.io/selection_phobia_privacypolicy/) that describes my privacy policy (hosted on GitHub Pages) is created. It can be accessed via the link below.
https://isaac-tong.github.io/selection_phobia_privacypolicy/
