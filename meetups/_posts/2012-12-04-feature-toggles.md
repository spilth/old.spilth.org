---
title: Feature Toggles
layout: meetup
category: meetups
meetup_url: http://www.meetup.com/ContinuousDeliveryNYC/events/909826120/

---

Presenter: [James Socol](http://jamessocol.com)

## What are Feature Flags?

- Branch in code based on a flag
  - do something old/new
  - maybe do something else

## Why use Feature Flags?

- Continuous Integration
- Everybody works on master/trunk
- Living on a feature branch for too long becomes troublesome
- Dark Launch
- A/B or Load Testing

## How do Feature Flags Change Development?

- Never break master
- More tests
- Delay deleting code

## Where and How?

### Server Side

When a feature is:

- new
- replacing an old feature
- changing implementation
- has unknown load characteristics

But not:

- is small and well tested
- only changing internally
- is small

### Client Side

- alter class of body to pull in different CSS

## Resources

- [Flipping Out - code.flickr.com](http://code.flickr.com/2009/12/02/flipping-out/)
- [django-waffle](https://crate.io/packages/django-waffle/)
- [gargoyle - Feature switches in Django](https://github.com/disqus/gargoyle)
- [Celery: Distributed Task Queue](http://celeryproject.org/)

<!--
## Questions

- good for Tech A vs. Tech B? (oracle vs. mysql)
- tests around feature toggles being on or off?
- functions to support detecting flags?
- global config object?
- it looks easy... what are the difficult parts?
-->

