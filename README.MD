# Simple Object Serializer

This gem transforms a sequence of objects into one by selecting only the desired properties of them

## Instalation

Add this line to your application's Gemfile:

```ruby
gem 'simple_object_serializer', '~> 0.1.0'
```
Then run the `bunlde` command

## Usage
For now this gem only provides to you a view helper which you can use to merge your objects eg:
```ruby
@user = User.find(2)
@product = Product.first
my_car = {
  brand: 'Ford',
  model: 'Mustang'
  fabrication_yar: '2010'
}
serialize_objects({user: @user, product: @product, my_car: my_car}, {user: [:name], product: [:name, :price], my_car: [:brand, :model]})

# =>
{
  user: {
    name: 'Nick Fury'
  },
  product: {
    name: 'Chair',
    price: '40.00'
  },
  my_car: {
    brand: 'Ford',
    model: 'Mustang'
  }
}
```

### Passing full objects
To pass full objecets you need to pass a object parameter empty like this:

```ruby
@user = User.find(2)
@product = Product.first
my_car = {
  brand: 'Ford',
  model: 'Mustang'
  fabrication_yar: '2010'
}
serialize_objects({user: @user, product: @product, my_car: my_car}, {user: [:name], product: [:name, :price], my_car: []})

# =>
{
  user: {
    name: 'Nick Fury'
  },
  product: {
    name: 'Chair',
    price: '40.00'
  },
  my_car: {
    brand: 'Ford',
    model: 'Mustang'
    fabrication_yar: '2010'
  }
}
```

### Passing a simple array

```ruby
@user = User.find(2)
@product = Product.first
animals = ['dog', 'cat', 'dolphin']
serialize_objects({user: @user, product: @product, animals: animals}, {user: [:name], product: [:name, :material], animals: []})

# =>
{
  user: {
    name: 'Nick Fury'
  },
  product: {
    name: 'Chair',
    price: '40.00'
  },
  animals: ['dog', 'cat', 'dolphin']
}
```

### Passing a array of objects

```ruby
users = User.all

serialize_objects({users: users}, {users: [:name]})

# =>
{
  users: [
    {
      name: 'Tonny Stark'
    },
    {
      name: 'Nick Fury'
    },
    {
      name: 'Steve Rogers'
    }
  ],
}

serialize_objects({users: users}, {users: []})


# =>
{
  users: [

    {
      id: 1
      name: 'Tonny Stark',
      email: 'tonny.stark@avengers.com'
    },
    {
      id: 2
      name: 'Nick Fury',
      email: 'nick.fury@avengers.com'
    },
    {
      id: 3
      name: 'Steve Rogers',
      email: 'steve.rogers@avengers.com'
    }
  ],
}
```


## TODO
1. Make this gem run with Active Record relationships
2. Extend the functionalities to controllers
3. Allow to pass parameters without having to specify the properties (if exist a parameter without the property specification just show this entire object on results)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/almirpask/simple_object_serializer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
