# Subl Init
It simplifies the process of new Sublime Text projects creation

## Installation
Install sublinit on your machine as any other Ruby gem

```sh
$ gem install sublinit --source "https://rubygems.pkg.github.com/eiskrenkov"
```

## Usage

### Ruby
Executing `$ sublinit ruby --name newproject --gemset npr` will

1. Create `newproject` directory
2. Initialize git repository inside
3. Create `npr` gemset
4. Create `.versions.conf` RVM configuration inside
5. Create `newproject.sublime-project` with Gems folder reference inside
6. Open newly created project in Sublime Text

#### Other options
1. `--no-open` do not open the project in Sublime Text
2. `--origin` your project's default remote, e.g `git@github.com:eiskrenkov/sublinit.git`
