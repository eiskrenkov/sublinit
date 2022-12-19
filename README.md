[![Gem Version](https://badge.fury.io/rb/sublinit.svg)](https://badge.fury.io/rb/sublinit)

# Subl Init
It simplifies the process of new Sublime Text projects creation

## Installation
Install sublinit on your machine as any other Ruby Gem

```sh
$ gem install sublinit
```

## Demo
![sublinit](https://user-images.githubusercontent.com/39211838/128425310-47f89fdd-c1cf-43d3-8ed4-86b13d442902.gif)

## Usage

### Ruby
Executing `$ sublinit ruby --new --name newproject --gemset npr` will

1. Create `newproject` directory
2. Initialize git repository inside
3. Create `npr` gemset
4. Create `.versions.conf` RVM configuration inside
5. Create `newproject.sublime-project` with Gems folder reference inside
6. Open newly created project in Sublime Text

If you won't pass `--new` option, SublInit won't create any folders and will run inside of the current one

#### Other options
1. `--no-open` do not open the project in Sublime Text
2. `--origin` your project's default remote, e.g `git@github.com:eiskrenkov/sublinit.git`

### Plain
Executing `$ sublinit plain --new --name newproject` will

1. Create `newproject` directory
2. Create `newproject.sublime-project`
3. Open newly created project in Sublime Text

If you won't pass `--new` option, SublInit won't create any folders and will run inside of the current one

#### Other options
1. `--no-open` do not open the project in Sublime Text
