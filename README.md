# ActsAsEstimate

## Description

Allow a field value to be entered as a time or story point estimate.

## Installation

In your Gemfile:

    gem 'acts_as_estimate'

## Example

```ruby
class WorkItem < ActiveRecord::Base
  acts_as_estimate :work_done, :units_field => :work_units
end

```
## Copyright

Copyright (c) 2013 Chris Waters, released under the MIT license
