Group Project - README Template
===

# HappyHR

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
HappyHr is an app that allows users to find bars near by that they will enjoy and drinks they favor. 

### App Evaluation
[Evaluation of your app across the following attributes Scale 1-5]
- **Category:**
- **Mobile: 5**
- **Story: 3**
- **Market:5**
- **Habit:5**
- **Scope:4**

## Product Spec

### 1. User Stories (Required and Optional)

**Authentication View**

* User can choose to sign-up/log in
* User may continue to report/view without an accou

**Dashboard/Stream View (Home)**

* User can choose to make a review
* User can see top three locations in their area
* User can filter based on best drinks
* User can search for bars

**Report View**
* User can add a review on a location
* User can choose to report without an account



### 2. Screen Archetypes

* Login/Register
   * User signs up or logs into their account
* Profile
   * User can view their identity and stats

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Discover
* Home
* Profile

**Flow Navigation** (Screen to Screen)

* Authentication View
   * Sign-up View
   * Feed/Dashboard View
* Feed/Dashboard View
   * Report View
   * Detail View

## Wireframes
[Add picture of your hand sketched wireframes in this section]
![imgur](https://imgur.com/gLYVYmu.png)
![imgur](https://i.imgur.com/nLO24ku.png)

![imgur](https://i.imgur.com/Oxe3kLx.png)

![Imgur](https://i.imgur.com/SskWCwv.png)
### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
- Authentication View
  * User can choose to sign-up/log in 
  * User may continue to report/view without an account
- Dashboard/Stream View (home)
  * User can choose to make a review
  * User can see top three locations in their area
  * User can filter based on best drinks
  * User can search for bars
- Report View
  * User can add a review on a location
  * User can choose to report without an account

### Networking
- Authentication View 
    (for people with accounts)
   * Username
   * Password
   * Email
    For an existing user…
   * (Read/GET) Retrieve the list of existing accounts’ usernames and passwords
     [Query objects and set conditions] Check if entered password + username match one record
   *  GET Request
      '''
      Take in inputUsername, take in inputPassword
            Query -> Search through all records and refine by: 
            Where username == inputUsername & 
              Where password == inputPassword
            If there is a match, 
            ActiveUser = username 
            '''
    For a new user… (sign-up)
  * (Create/POST) [create and save objects] Send the new username and password to database (has to be unique)
  * POST Request
    '''
    Take in inputUser, take in inputPassword
    Db.username = inputUsername
    Db.password = inputPassword
    Save as a record to db
    (Create/POST) [create and save objects] Send marked preferred drinks to database
    '''
  * POST Request
    '''
    Take in preferences as input
    Db.user.preferences.add(inputPreference)
    '''



 - Feed View
    * (For non-users this is an available feature but with limited access)
    * (READ/GET) Receive users drinks from database -> Query and set conditions: Fetching posts for a user’s drink preferences
    * (PROMPT/PRINT) Drinks with attributes in their objects -> Query object and set conditions: Fetching posts for user’s drink preferences
    * (PROMPT/PRINT)Retrieve drinks that have matching attributes to the drinks that have been liked in the past -> Query object, update properties & save: Changing a user’s drink recommendations based on recently liked drinks
    * (READ/GET) user’s fav drinks (marked previously) from database -> Query objects and set conditions: Fetching drink from users database
    * (READ/GET) Retrieve bars that serve the drink they like (if no hotspots) -> Create and save objects -> Creating a post for bars that serve the drink they like 
    * (PROMPT/GET) Retrieve “hotspot” that has reached a threshold of good ratings / time -> Query objects and set conditions: Fetching hotspot for a user’s ratings


 - Report View
    (For non-users, this is not an available feature - possibly a chance to promo sign-up)
    * (CREATE/POST) Users can report on a bar
    * (CREATE/POST), (Update/PUT), (Delete) Sending rating and possibly comment information to our database
    * (READ/GET) User can create post if registered user (check if registered) 
    Find user in data→if in system, continue →  if not there, error/sign up? 
    * (Update/PUT) → request and replace existing file 
    Get user id,comment ID, and comment from existing data→ ask for user review→ user enters review→ replace previous content → 
    * (Delete) → Get Request to delete file at specific location
    * Comment ID → delete comment ID (will delete comment, comment Id)


  - Detail View
    * (Read/GET) [Query object and set conditions] Retrieving the list of reviews associated with a bar
    GET Request
    '''
    *user selects a bar* 
    activeBar = Bar.selected
    Query-> find the bar that matches ID of activeBar in records
    fetch all reviews in activeBar
    ''' 
WALKTHROUGH LINK - [click here](https://imgur.com/nFEr7LK)
[narrated walkthrough](https://youtu.be/nE45-hpgCL8)
