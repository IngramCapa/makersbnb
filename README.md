### [Makers Academy](http://www.makersacademy.com) - Week 6 Group Programming Project

Makers AirBnb Challenge 
-

[Outline](#Outline) | [Task](#Task) | [Installation Instructions](#Installation) | [User Stories](#Story) | [Objects & Methods](#Methods) | [Feature Tests](#Feature_Tests) 

## <a name="Outline">Outline</a>
 
Build MakersBnb

## <a name="Task">The Task</a>

This week we've been grouped together to build our very own AirBnb clone using everything we've learned over the past 5 weeks at Makers.

## <a name="Installation">Installation Instructions</a>

```
git clone https://github.com/IngramCapa/makersbnb.git
cd makersbnb
```

## <a name="Story">User Stories</a>

```

As a user, 
when I visit Maker's Airbnb,
I would like to sign up with my email and password.

As a user,
when I visit Maker's Airbnb,
I would like to be able to sign in with my account details.

As a user,
when I'm logged into Maker's Airbnb, 
I want to see a list of spaces.

As a user and potential space owner,
when I'm logged into Maker's Airbnb, 
I would like to list a space.

As a user and space owner,
when I list a space on Maker's Airbnb,
I would like to enter details, like a name, description, price, and available dates.

As a user,
when I've chosen a space i'd like to hire, 
I want to see the dates the space is available.

As a user,
when I've chosen a space and the dates i'd like to book,
I want to put in a request to hire that space.

As a user,
when I've chosen a space,
I should be able to see the dates the space has already been booked or that are unavailable.

As a user,
when I have made a request to hire a space,
I would like to see the status of my requests. 

As a user and space owner,
when I have listed my space and another user has requested it, 
I would like to see a list of these requests.

As a user and space owner,
when I've listed a space,
I should be able to receive multiple hire requests for the same dates until one is approved. 

As a user and space owner,
when I receive a hire request, 
I want to be able to confirm or deny the request. 

```
## <a name="Databse">How to set up the database</a>

Connect to `psql` and create the `makersbnb_test` and `makersbnb` databases:

```
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

To set up the appropriate tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
