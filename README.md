Sober
======


##Setup

Run by using the following commands:

```
gem install sober
irb
require 'sober'
```

Or add it to your Gemfile

```
gem 'sober'
```

##Usage

Available commands for current build (0.0.2)

`Sober.sentence`   (accepts params `:medium` (defualt), `:long`, and `:short`)

`Sober.paragraph`  (accepts params `:medium` (default), `:long`, and `:short`)

`Sober.sentences`  (accepts number as parameter. default is `3`)

`Sober.paragraphs` (accepts number as parameter. default is `3`)

`Sober.gender.random(one_letter: false) #=> 'male'`

`Sober.gender.smart('Ashley Smith') #=> 'female'`


Also supports generating names

```
Sober.name => (full name)
Sober.first_name
Sober.last_name
```

## Contributing

1. [Fork it](https://github.com/stevenspiel/sober/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



This project uses MIT-LICENSE.
