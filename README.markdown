# RESTRack::Balancer

A library for interacting with RESTful web services with automatic load balancing across a cluster.
This gem was written to communicate with RESTRack based services, although it provides a convenient API to any RESTful service.


## Usage
    
    uri = URI.new('http://foobar-provider.example.com')
    provider = RESTRack::Balancer.new(uri)
    provider = RESTRack::Balancer.new('http://foobar-provider.example.com')
    foo = provider.foo(123).get                                       # request is made to GET /foo/123
    foo_resource = provider.foo(123)                                  # pivot object that hasn't yet made request
    foo = foo_resource.get( { :data => 'something_here' } )           # request is made to GET /foo/123
    bar = provider.foo(123).bar                                       # pivot object that hasn't yet made request
    bar.delete                                                        # request is made to DELETE /foo/123/bar
    bar = provider.foo(123).bar.post( { :data => 'something_here' } ) # request is made to POST /foo/123/bar


## License

Copyright (c) 2011 Chris St. John

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
