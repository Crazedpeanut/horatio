# Horatio

[![Build Status](https://travis-ci.org/pmyjavec/horatio.svg?branch=master)](https://travis-ci.org/pmyjavec/horatio)

Horatio helps you build a Docker image for the project you're working on and produces an artifact (JSON document) which
contains meta-data about the image produced, this artifact than can be used in your build pipeline to do things like
deploy containers with a configuration management tool / scheduler of your choice, Ansible for example.

Horatio's advantage is that it stays out of your way and let's you get on with building great software.

Horatio is most handy if you have an existing build pipeline and just want to try Docker containers out for your project with
minimal fuss or have a lot of services to build, especially in different languages.

## Automatic Project Detection

If, for example, you have a Java project which you build and manage with maven Horatio can parse a POM for you, strip the name and
version and build and push a Docker container to a registry for you.

The automatic project detection is also good if you're nailing up several services in different languages, this helps
automate building of Docker containers in a fast and simple manner, it's been used this way in the past.

### Supported project types

Horatio automatically detects the kind of project you're working with and acts accordingly so far it supports:

* Maven
* Ruby Gems
* Node JS

If you use a Horatio document then Horatio will increment the version, commit
and push it back the source repository for you. In all other cases Horatio will
leave your existing version management alone.

## Arbitrary Container Builds

This workflow is best if you just would like to build something like a Redis image.

If you just need to get an arbitrary project built and pushed somewhere you can simply create a horatio.json, like so:

To get started, Create a Horatio spec `horatio.json` in your project root with the contents `{'name': 'misc-project', 'version': '0.0.1'}`

_This workflow automatically increments the 'version' in the spec and pushes it back to your repository, this will be
configurable soon_

## Usage

To install

```
$ gem install horatio
$ horatio
```

To prevent caching of a build, export the following environment variable before running horatio
`DOCKER_BUILD_NO_CACHE=1`

## Dev

```
bundle install
guard
```

## Why do versions contain source repository revisions

Unfortunately the Docker registry handles tags as mutable objects. If you push a
image to the registry with the same name and version tag you will overwrite the
previous tag.  Inserting the revision from the latest git commit ensures
we don't end up with collisions.

## Horatio?

In honour of [Horatio McAllister](http://simpsons.wikia.com/wiki/Horatio_McCallister)
