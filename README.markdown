# Manifold Mock

A gem that generates templates for your rails app. It uses Bootstrap and Foundation.

# Runtime Dependencies:
Built with Rails 4.
```ruby
rails 4.0.0
```

# Installation

Add this to your Gemfile and run ```bundle install```:

```ruby
gem 'manifold_mock', '~> 0.0.1'
```
From latest build:
  
```ruby
gem 'manifold_mock', git: 'git@github.com:chabzlala29/manifold_mock.git'
```

# What's Next?

By default generator files set to Zurb Foundation front-end framework. To generate files run the following command.
```bash
rails generate manifold_mock:install  
```

###If your using HAML add ```--haml``` to generator:
```bash
rails generate manifold_mock:install --haml
```
##Foundation Rails
Manifold Mock provides different foundation layouts. To generate template just run the following command on your console:

```bash
rails generate manifold_mock:template
```
By default it will generate an erb layout file with blog style template. To specify a specific template just add the following to your template command:
```bash
rails generate manifold_mock:template --template=<name of template>
```
Here are the list of templates available for Foundation Rails (more are coming soon):
```bash
banded, blog, feed, grid, orbit, banner-home, sidebar
```

You can specify HAML just by adding ```--haml``` to template generator:
```bash
rails generate manifold_mock:template --haml
```

##Bootstrap Rails
Add ```--framework=bootstrap``` to generator:
```bash
rails generate manifold_mock:install --framework=bootstrap
```

Generate Fluid Layout(Only in Bootstrap):
```bash
rails generate manifold_mock:install --framework=bootstrap --fluid
```

Or Fixed Layout(Only in Bootstrap):
```bash
rails generate manifold_mock:install --framework=bootstrap --fixed
```


## The MIT License (MIT)

Copyright (c) 2013 Charles Darwin Pobre

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
