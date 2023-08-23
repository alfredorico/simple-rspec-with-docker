This project intend to show a ruby docker/compose setup to play with RSpec. This is not a production project. The goal is to not have any Ruby installation in the host computer.

### Building the image:
Run the following command:

```shell
UID=$(id -u) GID=$(id -g) docker-compose build --no-cache 
```

NOTE: The Gemfile.lock will not be present until you add a new gem to the Gemfile (after the initial image build)


### Run ruby commands:
By default the docker image runs a bash shell:

```shell
docker-compose run --rm ruby
ruby@9fd3f3393f79:/app$
```

To start irb:

```shell
docker-compose run --rm ruby irb
irb(main):001:0> 
```

To run the specs:

```shell
docker-compose run --rm ruby rspec --format progresss
..

Finished in 0.00217 seconds (files took 0.06995 seconds to load)
2 examples, 0 failures
```

