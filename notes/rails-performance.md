# Ruby on Rails Performance

## Tools

- [Bullet](https://github.com/flyerhzm/bullet)
- [MiniProfiler](https://github.com/SamSaffron/MiniProfiler/tree/master/Ruby)
- [New Relic](http://newrelic.com/ruby)
- [rack-insight](https://github.com/pboling/rack-insight)
	- [rack-bug](https://github.com/brynary/rack-bug)

- Apache Bench
- httperf

## Categories

- page responsiveness
	- route
	- controller
		- action
	- view

## Performance

- code performance
- database performance

## Caching

- page caching
- action caching
- fragment cachin
- memcached

## Figuring Out What's Slow

## Doing Something About It

## Common Slow-points

## Performance Tests

## Automating Performance Tests

## Resources

- [Scaling Rails](http://railslab.newrelic.com/scaling-rails)
- [RailsCasts - Three Profiling Tools](http://railscasts.com/episodes/161-three-profiling-tools)
- [RailsGuides - Performance Testing Rails Applications](http://guides.rubyonrails.org/performance_testing.html)






$ rails profiler --help
Usage: rails benchmarker 'Ruby.code' 'Ruby.more_code' ... [OPTS]
    -r, --runs N                     Number of runs.
                                     Default: 1
    -o, --output PATH                Directory to use when writing the results.
                                     Default: tmp/performance
    -m, --metrics a,b,c              Metrics to use.
                                     Default: process_time,memory,objects
    -f, --formats x,y,z              Formats to output to.
                                     Default: flat,graph_html,call_tree,call_stack

$ rails benchmarker --help
Usage: rails benchmarker 'Ruby.code' 'Ruby.more_code' ... [OPTS]
    -r, --runs N                     Number of runs.
                                     Default: 4
    -o, --output PATH                Directory to use when writing the results.
                                     Default: tmp/performance
    -m, --metrics a,b,c              Metrics to use.
                                     Default: wall_time,memory,objects,gc_runs,gc_time