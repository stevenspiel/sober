TextEng
======

Run locally by going cloning and moving to the directory.

Run by using the following commands:

```
gem install text_eng-0.0.1.gem
irb
require 'text_eng'
```

Available commands for current build (0.0.1)

```
TextEng.sentence   (accepts params :medium(defualt), :long, and :short)
TextEng.paragraph  (accepts params :medium(default), :long, and :short)
TextEng.sentences  (accepts number as parameter. default is 3)
TextEng.paragraphs (accepts number as parameter. default is 3)
```

Also supports generating names

```
TextEng.name (full name)
TextEng.first_name
TextEng.last_name
```

This project uses MIT-LICENSE.
