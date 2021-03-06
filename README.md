# Purpose
Describe how to install and use bs_ruby_regex.

# References

## Ruby User's Guide regular expressions
http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/regexp.html

## Regexp
http://ruby-doc.org/core-2.2.0/Regexp.html

## Rubular online Ruby regular expression parser
http://rubular.com

## Ruby Regular expressions
http://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm

## bundler
<http://bundler.io>

bs_team_ranker
<https://github.com/beepscore/bs_team_ranker.git>

# Requirements
Ruby 2.1
bundler (~> 1.10)

# Installation Instructions

## Get code
e.g. Clone git repository from github.

## Install gem dependencies
The app uses bundler to specify its dependency gem versions.

    $ cd <path>/bs_ruby_regex
    $ bundle install --deployment

## To run tests
    $ cd <path>/bs_ruby_regex

Note: Don't run $ "rake". It will show warnings!  
Instead run

    $ bundle exec rake

## To run app

### See command line help for further instructions
    $ cd <path>/bs_ruby_regex
    $ bundle exec bs_ruby_regex -h

---

# Appendices

## Troubleshooting

### If app doesn't run
Set file permission executable.
Probably this step will not be necessary.

    $ cd <path>/bs_ruby_regex/bin
    $ chmod u+x bs_ruby_regex

### If load path isn't configured correctly
As a workaround, can use ruby -I lib:

    $ cd <path>/bs_ruby_regex
    $ bundle exec ruby -I lib bin/bs_ruby_regex -h

## Package app as a gem
The app may be packaged as a gem and published.

    $ bundle package

See bundle.io for more info.
