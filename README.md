# Chaltén

[![Build Status](https://travis-ci.org/ba-st/chalten.svg?branch=development)](https://travis-ci.org/ba-st/chalten)
[![Coverage Status](https://coveralls.io/repos/github/ba-st/chalten/badge.svg?branch=development)](https://coveralls.io/github/ba-st/chalten?branch=development)

This is a time model that allows to use dates, months, years, etc. in an easy way.

## Why a new model of Dates?
This model was created due to the Smalltalk-80's model problems. That model does not provide good solutions to all possible time related problems mainly because:
It lacks proper abstractions of some important time domain entities (i.e., month, day)
Time objects are not immutable (i.e., Time) therefore, they do not properly model time entities, Time Entities Immutability and Validity.
The ANSI Smalltalk model adds some abstractions but it is based on the Smalltalk one and have the same problems.
The Chronology package has some issues also.

## What's the metaphor behind the model?
We used a metaphor to understand the time domain. In this metaphor, time entities are points in a line, a line that represents the passing time. The observers of that line can zoom in and out the points it contains. When the observer zooms in he sees smaller points (i.e., dates), when the observer zooms out he sees bigger points (i.e., years). We say that the timeline has different scales or that timelines of different scale can represent the passing time.
### Let’s see an example.
A year represents a point in time but with less resolution than a date. If the year is zoomed in, new points are observed; those points are the months of that year. If one of those points is picked and zoomed in, the points representing the dates of that month are obtained. If one of this dates is selected and zoomed in, points representing the hour of that date are obtained. Let’s do it with concrete entities. If the year 2014 is selected and zoomed in, months from January of 2014 to December of 2014 appear. If January of 2014 is zoomed in, dates from January 1st of 2014 to January 31st of 2014 are seen. If January 1st of 2014 is zoomed in, the entities January 1st of 2014 at 00: 00: 00 to January 1st of 2014 at 23:59:59 are seen.

## What's the behavior that the model provides?
Not only the metaphor helped us to understand the problem and create a model based on it, but it also allowed us to easily define the expected behaviour of the model, such as:
- Determine which point comes before or after another (ordering of time points along the time line).
- Go from one point in the timeline to another.
- Obtain the distance between two time points.
- Represent segments of the timeline of any scale.
- Switch from one scale to another.
- Represent intervals between points.
- Filter the timeline with certain rules.
- Work with dates expresed in four calendars: Gregorian, Julian, Islamic and Hebrew.
- Represent times of day according to differents time zones.
 
## Why dates are inmutable and validated when they are created?
Something we have noticed about time entities is that they are immutable; they do not change, they are immutable like the numbers. A given date such as January 1st of 2014 should not allow its year, month or day to be changed. Therefore, the abstractions we use to model the time domain entities are immutable, they behave like “value objects”.
Immutable objects allow us to have a simpler model and not to worry about inconsistent objects, invalid modifications or invariance invalidity during a certain time.
The model also verifies, when creating an object, if the new instance will be valid. If that is true, the object is created, otherwise an exception is signalled. Therefore, the code that verifies if an object is valid is located in one place and ensures that no invalid time objects exist.

## How do I move trought the different time resolutions?
As we said before, a year can be seen as a point in the time line at a year resolution. Because the resolution is a year, that point contains other points of higher resolution such as months of a year, dates and time in a certain date. The model provides protocol to easily move between points of different resolutions (i.e., going from a year to the dates it contains or from a date to its year). Moving to points of smaller resolution looks natural (i.e., going from a date to its year) but moving to points of higher resolution is not so commonly provided on this type of models (i.e., going from a year to its dates). Messages to go from points of one scale to another are provided on each abstraction.
  
    year2014 := GregorianCalendar newYearNumber: 2014.
    
    “Going from years to months of year”
    year2014 firstMonth.              “Returns January of 2014”
    year2014 lastMonth.               “Returns December of 2014”
    year2014 months.                  “Returns all the months of year 2014”
    
    “Going from years to dates”
    year2014 firstDate.               “Returns January 1st, 2014”
    year2014 lastDate.                “Returns December 31st, 2014”
    year2014 dates.                   “Returns the 365 dates of the year 2014”
    year2014 firstDay.                “Returns Wednesday”
    year2014 lastDay.                 “It is also a Wednesday”
    
    “Going from years to date times”
    year2014 firstDate atMidnight.    “Returns January 1st, 2005 00:00:00”
    year2014 lastDate lastTimeOfDay.  “Returns December 31st, 2005 23:59:59”

## Are time entities comparable?
All the time point abstractions respond to the magnitude protocol with messages such as #<, #<=, #>, #>=, #min:, #max:, #between: and: among others. Because they are points in the time line of a certain resolution, they can be compared to see which one is closer or farther from the beginning of the time line. A total order can be defined for them.

    (GregorianCalendar newYearNumber: 2014) < (GregorianCalendar newYearNumber: 2015).  “Comparing years”
    (December of: 2014) < (July, 2015).                                                 “Comparing months of year”
    GregorianCalendar today < GregorianCalendar tomorrow.                               “Comparing dates”
    GregorianCalendar now < GregorianCalendar now next.                                 “Comparing datetimes”

Not only points on the time line can be compared. Instances of Day, DayOfMonth and ChaltenMonth can also be compared. When comparing days of the week the model assumes Sunday is the first day of the week but this can be changed to any other day such as Monday. January 1st is always the first gregorian DayOfMonth and January is always the first gregorian ChaltenMonth.

    Monday < Tuesday.                     “Comparing days”
    January < December.                   “Comparing months”
    January first < December twentyFifth. “Comparing days of month”

## How do I get the distance beetween two time entities?
Messages #distanceTo: aPointInTime and #distanceFrom: aPointInTime are used to obtain the distance between two points.
The same messages are used polymorphically for years, months of a year, dates, etc.
The model also provides behavior to obtain the distance between time entities like days, months and days of months.

    (GregorianCalendar newYearNumber: 2014) distanceTo: (GregorianCalendar newYearNumber: 2016). “Returns 2 years”
    (GregorianCalendar newYearNumber: 2014) distanceTo: (GregorianCalendar newYearNumber: 2010). “Returns -4 years”
    
    January first, 2014 distanceTo: January tenth, 2014.   “Returns 10 days”
    January first, 2014 distanceFrom: January tenth, 2014. ”Returns -10 days”

## What are the units that the model provides?
This model uses Aconcagua (http://github.com/mtaborda/aconcagua) to manage measures and time units.
The provided units are: month, year, decade, century, millennium, millisecond, second, minute, hour, day, week.
New units can be created as needed.

## How do I move from one point to another?
The model provides the #next, #next: aTimeMeasure, #previous and #previous: aTimeMeasure messages to move certain distance to and from a given point. #next and #previous messages assume that the distance to move is equal to the quantum of the timeline the point receiving the message belongs to. If the point is a year, the quantum is 1 year, if the point is a month of a year the quantum is 1 month, if the point is a date the quantum is 1 day and if the point is a datetime the quantum is 1 millisecond.
Moving certain distance to or from a point expects a measure of time as parameter because the distance between two points is expressed as a measure of time.

    (GregorianCalendar newYearNumber: 2014) next.                     “Returns the gregorian year number 2015”
    (GregorianCalendar newYearNumber: 2014) next: 1 yearMeasure.      “Returns the gregorian year number 2015”
    (GregorianCalendar newYearNumber: 2014) next: 12 monthsMeasure.   “Returns the gregorian year number 2015”
    (GregorianCalendar newYearNumber: 2014) next: 10 yearsMeasure.    “Returns the gregorian year number 2024”
    (GregorianCalendar newYearNumber: 2014) previous: 5 yearsMeasure. “Returns the gregorian year number 2009”

## Is there a way to represent timeline segments?
The class TimeSpan represents timeline segments. A segment begins on a specific point of the timeline and has certain duration and direction expressed as a measure. The starting point of a time span can be a point at any of the timeline resolutions. The duration and direction is given by a time measure that should be convertible to the unit of the scale the starting point belongs to. If the measure is positive, the direction is towards the end of time, if the measure is negative, the direction is towards the beginning of time.
Timespans are useful to represent relative time entities where the beginning of such an entity is known, but the end is not exactly known or can change. Examples of such entities are “I’ll see you in 10 working days from today” or “it happened 7 months before January”. Timespans are important to represent relative time entities such as relative dates which are explain further on.
Timespans can also be used with time objects that are not part of the timeline but have an order such as days, months and day of months.

    “Creates a timespan from January 1st, 2014 with 72 hours of duration”
    timespan := TimeSpan from: (January first, 2014) duration: 72 hoursMeasure.
    timespan to. “Returns January 4th, 2005”

    “Creates a timespan from year 2014 with a duration of 4 years”
    timespan := TimeSpan from: (GregorianCalendar newYearNumber: 2014) duration: 4 yearsMeasure.
    timespan to. “Returns year 2018”

    “Creates a timespan from now with a length of 3 weeks toward the beginning of time”
    timespan := TimeSpan from: GregorianCalendar now duration: -3 weeksMeasure.
    timespan to. “If now is January 1st, 2014 at 10 AM, returns December 11th, year 2013 at 10 AM”
    
    (TimeSpan from: GregorianCalendar today duration: 3 daysMeasure) to.          “Returns Thursday if today is Monday”
    (TimeSpan from: GregorianCalendar currentMonth duration: 6 monthsMeasure) to. “Returns July if current is January”

## How do I create time entities intervals?
The model reifies the concept of intervals for time entities with an order. Those intervals behave like collections between the specified starting and ending point. Measures are used to specify the step of those intervals.
The same protocol used to create intervals of numbers is used to create intervals of time entities. For example, an interval between two years can be created sending the message #to: anotherYear by: aDistance to an instance of ChaltenYear.

    “Returns an Interval with eleven elements, the years between 2005 and 2015 inclusive”.
    (GregorianCalendar newYearNumber: 2005) to: (GregorianCalnedar newYearNumber: 2015).

    “Returns an Interval with six elements, the years 2005, 2007, 2009, 2011, 2013 and 2015 inclusive”.
    (GregorianCalendar newYearnumber: 2005) to: (GregorianCalendar newYearNumber: 2015) by: 2 yearsMeasure.

    “Returns an Interval with six elements, the years 2015, 2014, 2013, 2012, 2011 and 2010 inclusive”.
    (GregorianCalendar newYearNumber: 2015) to: (GregorianCalendar newYearNumber: 2010) by: -1 year.

    “Returns all the leap years between 2005 and 2100”
    ((GregorianCalendar newYearNumber: 2005) to: (GregorianCalendar newYearNumber: 2100))
        select: [ :aYear | aYear isLeap ].

    “Returns all Sundays between January 1st, 2014 and the last date of February 2014”
    ((January first, 2014) to: (February of: 2014) lastDate) select: [ :aDate | aDate is: Sunday ].

The model also provides protocol to create collections of objects that are commonly used.

    “Returns all the Tuesdays between January 1st of 2014 and June 30th of 2014”
    (January first, 2014) to: (June thirtieth, 2014) everyDay: Tuesday.

    “Returns all dates whose day number is 10 between January 1st, 2014 and June 30th, 2014”
    (January first, 2014) to: (June thirtieth, 2014) everyDayNumber: 10.

    “Returns all dates whose day numbers are 10 or 20 between January 1st, 2014 and June 30th, 2014”
    (January first, 2014) to: (June thirtieth, 2014) everyDayNumbers: #(10 20).

## What is a TimelineFilter?
The model reifies the concept of timeline filter. A filter restricts the elements that belong to a timeline using rules to specify which objects should be filter or not.
Deciding the days that are working or not working is a common use for these filters. For example, a filter can be created to mark all Saturdays and Sundays as non working days, another filter can be created to filter the months where the season changes, etc..
The model provides different types of rules, such as a rule for days (i.e., to include all Saturdays), a rule for a given day in a month (i.e., all the 25th of May), a rule for specific time entities and different rule decorators.
Filters behave like collections, so they can be iterated, they can be queried for the inclusion of elements, etc.

    “Let’s create a filter for all dates...”
    nonWorkingDays := TimelineFilter universe: (TheBeginningOfTime to: TheEndOfTime).

    “Now, we want Saturdays to be on that filter”
    nonWorkingDays addDayRule: Saturday.

    “Now we want Sundays from January 1st of year 1000 to the end of time...”
    nonWorkingDays addDayRule: Sunday from: (January first, 1000) to: TheEndOfTime.

    “Now we want all July 9th since 1816 because is the Independence Day in Argentina”.
    nonWorkingDays addDayOfMonthRule: July ninth from: (July ninth, 1816) to: TheEndOfTime.

    “Now, we can make something like this”
    nonWorkingDays includes: (July ninth, 2014).   “Returns true”
    nonWorkingDays includes: (July eighth, 2014).  “Returns false”
    nonWorkingDays includes: (July twelfth, 2014). “Returns true, it is Saturday”

## What is a RelativeDate?
In the financial domain, settlement dates are usually expressed as a distance from the trade date in a given calendar. For example, a trader can buy bonds on a Thursday, but the settlement date is set to happen within 48 hours using the clearing house’s calendar. That usually means that the trader’s institution will receive the bonds on the next Monday, but this is true only if that Monday is a working day and it could have been true at the time the operation was done. But sometimes non-working days are created due to non-expected events (i.e., the death of some important person) and a working day is declared to be non-working.
In our example, if Monday is declared as non-working day, the new settlement date for the trade will be Tuesday. To model this new type of entity we created an abstraction called RelativeDate that is a date relative to a timeline filter given a certain timespan. Note that the settle date is declared using the negated non-working days filter because settlements can occur only on working days.

    “April 3rd, 2014 is a Thursday”
    timespan := TimeSpan from: (April third, 2014) duration: 48 hoursMeasure.
    settleDate := RelativeDate timespan: timespan calendar: nonWorkingDays negated.
    
    nonWorkingDays includes: (April seventh, 2014). “Returns false because Monday April 7th, 2014 is a working day”
    settleDate absoluteDate.                        “April 7th, 2014”

    ”Now a new non working day is added to the filter”
    nonWorkingDays addDateRuleFor: (April seventh, 2014).

    nonWorkingDays includes: (April seventh, 2014). “Return true. Now April 7th, 2014, is a not working day”
    settleDate absoluteDate.                        “Now it returns April 8th, 2014 because the filter has changed”

## How do I create a not ending segment?
The timeline does not have a known end or beginning, but the mere fact that we, as human, can think on them means that they have to be reified. Two objects are provided to represent these entities. They are “TheEndOfTime” and “TheBeginningOfTime”. The object “TheEndOfTime” is always greater than any point in time and “TheBeginningOfTime” is always less than any point in time.
These objects are useful to create open intervals towards infinite and minus infinite. They allow programmers to create intervals and filters on the whole timeline and to create streams with no end. When using these objects, the programmer has to have special care because iterating over an interval with no end and/or beginning will never stop.

## Wich Calendars the model support?
A Calendar is a way for counting the time. Along the history, differents cultures used differents ways of count the time, then we can find differents calendars.
The model support the Gregorian, Julian, Hebrew and Islamic calendars. Any other could be easily added.
The entities of one of the calendars could be converted to an entity of other calendar, and entities of differents calendar can interact between each other.

    "Converting a gregorian date"
    (April first, 2014) asJulian.  "Returns the Julian date March 19th, 2014"
    (April first, 2014) asHebrew.  "Returns the Hebrew date Nisan 1st, 5774"
    (April first, 2014) asIslamic. "Returns the Islamic date Jumada I (Jumada al-Ula) 30th, 1435"
    
    "Comparing dates"
    (April first, 2014) = (JulianMarch nineteenth, 2014). "Returns true"
    (Nisan first, 5774) = (JumadaI tirtieth, 1435).       "Retruns true"
    
    "Using a timeline filter with mixed dates"
    nonWorkingDays addDayOfMonthRule: Tishri first.         "Adds the Hebrew New Year Day as a non working day"
    nonWorkingDays includes: (Tishri first, 5775).          "Returns true, it is the hebrew new year (5775)"
    nonWorkingDays includes: (September twentyfifth, 2014). "Returns true, it is the hebrew new year (5775) in gregorian"

## What about time zones?
Time zones are used to split the globe to have regions that has a uniform standard time for legal, commercial, and social purposes. Chaltén has the entity DateTime anchored to a certain zone for represents a certain moment according to this zone.

    "Working with time zones"
    buenosAiresDateTime := DateTime
        date: April twentieth, 2014
        timeOfDay: (TimeOfDay hours: 19 minutes: 35)
        zone: TimeZones buenosAires.

    greenwichDateTime := DateTime
        date: April twentieth, 2014
        timeOfDay: (TimeOfDay hours: 22 minutes: 35)
        zone: TimeZones greenwich.

    buenosAiresDateTime = greenwichDateTime. "Returns true, it is the same instant but measured in different zone"
    buenosAiresDateTime distanceTo: greenwichDateTime. "Returns a measure <0 days>, because it is the same instant"

    buenosAiresDateTime := buenosAiresDateTime next: 3 chaltenHours.
    
    buenosAiresDateTime = greenwichDateTime.           "Returns false, the hour is the same but the zone is different"
    (buenosAiresDateTime distanceTo: greenwichDateTime)
        convertTo: TimeUnits hour.                     "Returns a measure <-3 hours>, just the offset between zones"

## How reliable is the model?
The model was developed using Test Driven Development (TDD) and it has more than 1600 tests.
The tests cover a 100 % of the model’s code.

## What are the Smalltalks where it runs?
The model has been tested and works on Pharo, VisualAge, Squeak, GemStone and VisualWorks. Surely also runs in Dolphin and Smalltalk-X.
Anyone is invited to port it to any other Smalltalk dialect.
The last version is always available first for Pharo.

## Are you going to port it to other languages?
It could be a nice challenge. I think Python, Ruby or Groovy could be one of the firsts tries.

## Are there other models of the same problem?
Yes there are other models, like Chronology, but neither so powerful like this one.

## Why did you created a new implementation instead of using an existing one?
At the time we wrote this model, there were no implementation that we liked. The Smalltalk implementation was not enough and Chronology did not satisfy our needs.

## What I need to use Chaltén?
Download a fresh Pharo image (http://www.pharo.org) and in a workspace do-it this:

#### In a 6.x image
      Metacello new
        baseline: 'Chalten';
        githubUser: 'ba-st' project: 'chalten' commitish: 'v6.0.0' path: 'repository';
        load

#### For 6.x previous images
go-to => https://github.com/mtaborda/chalten


## Why is it called Chaltén?
El Chaltén (http://www.elchalten.com/) is a village settled inside National Park Los Glaciares, in the heart of the patagonic southern mountains, at the foot of mythical Mt. Fitz Roy.
