---
title: Continuous Delivery - The Hard Parts
layout: meetup
meetup_url: http://www.meetup.com/ContinuousDeliveryNYC/events/73148732/
slides_url: http://www.slideshare.net/TimothyFitz/the-hard-problems-of-continuous-deployment
published: false
---

Presenter: [Timothy Fitz](http://timothyfitz.com)

## Mobile

- http://cisimple.com (w/GitHub)
- data-driven everything
  - ping server for updates
  - http://appgrok.com - let's you even deploy XIBs
- HTML App
  - use UIWebView
  - Clutch.io

- minimum version hook

## Scale

- "green SLA"
  - pipeline is 99% green
- poll engineers on a regular basis about their happiness
- make tests as fast as possible
  - testing pyramid
    - gui (small)
    - integration (medium)
    - unit (large)
      - shouldn't touch external state (database, time, memcache, etc)
- run tests in parallel (BuildBot over Jenkins)
  - multi-process
  - multi-machine
  - multi-VM
  - instant multi-VM: http://circleci.com/
- hardware scale
  - 10% of your cluster size

## People & Roles

### Sheriff

- designated reverter / problem troubleshooter

### Continuous Deployment "Product Owner"

- held accountable for SLA / Performance
- manage infrastructure backlog

## Questions

- feature toggles
  - necessary for CD & single trunk
- number of environments
- single trunk vs. release versions
- CD = every commit is deployable

### Group

- who's doing CD?
- how many different projects/technologies?
- number of environments?

## Misc

- hypothesis commit
  - will this code reduce performance?

## Ideas

- automatically start up IM group chat with developers on build failures

