# Subl Init
It simplifies the process of new Sublime Text projects creation

## Installation
Install sublinit on your machine as any other Ruby gem

```sh
gem install sublinit --source "https://rubygems.pkg.github.com/eiskrenkov"
```

## Usage

### Ruby
Executing `$ sublinit ruby --name newproject --gemset npr` will

1. Create `newproject` directory
2. Initialize git repository inside
3. Create `npr` gemset
2. Create `.versions.conf` RVM configuration inside
3. Create `newproject.sublime-project` with Gems folder reference inside
