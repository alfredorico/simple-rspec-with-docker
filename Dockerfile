FROM ruby:slim

LABEL Name=testing-rspec Version=0.0.1

WORKDIR /app

# If we need OS dependency for some gem, install it here: 
# RUN apt-get update \
#   && apt-get install -y --no-install-recommends build-essential \
#   && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
#   && apt-get clean
ARG GID
ARG UID

# For linux users (like me) we need a user with the same UID/GID to avoid docker generated files owned by root.
# This issue doesn't happen in MacOs
RUN groupadd -g "${GID}" ruby \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" ruby \
  && chown ruby:ruby -R /app

USER ruby

COPY --chown=ruby:ruby Gemfile ./

RUN bundle install

COPY --chown=ruby:ruby . /app

CMD ["bash"]