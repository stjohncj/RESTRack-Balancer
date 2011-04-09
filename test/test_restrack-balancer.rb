require File.join( File.dirname(__FILE__ ), 'helper' )

class TestRESTRackBalancer < Test::Unit::TestCase

  context 'instantiation' do
    should 'accept a String URI' do
      assert_nothing_raised { client_1 = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293']) }
    end
    should 'accept a URI object' do
      uri_1 = URI.parse('http://localhost:9292')
      uri_2 = URI.parse('http://localhost:9293')
      uri = [uri_1, uri_2]
      assert_nothing_raised { client_2 = RESTRack::Balancer.new(uri) }
    end
  end

  should 'get a resource' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    get_response = nil
    assert_nothing_raised do
      get_response = client.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
  end
  should 'get a collection' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    get_response = nil
    assert_nothing_raised do
      get_response = client.responses.get
    end
    expected_response = { 'action' => 'index' }
    assert_equal expected_response, get_response
  end

  should 'delete a resource' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    delete_response = nil
    assert_nothing_raised do
      delete_response = client.responses(1).delete
    end
    expected_response = { 'action' => 'delete', 'id' => '1' }
    assert_equal expected_response, delete_response
  end
  should 'delete a collection' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    delete_response = nil
    assert_nothing_raised do
      delete_response = client.responses.delete
    end
    expected_response = { 'action' => 'destroy' }
    assert_equal expected_response, delete_response
  end

  should 'post a resource' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    post_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      post_response = client.responses(1).post(data)
    end
    expected_response = { 'action' => 'add', 'id' => '1', 'data' => data }
    assert_equal expected_response, post_response
  end
  should 'post a collection' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    post_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      post_response = client.responses.post(data)
    end
    expected_response = { 'action' => 'create', 'data' => data }
    assert_equal expected_response, post_response
  end

  should 'put a resource' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    put_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      put_response = client.responses(1).put(data)
    end
    expected_response = { 'action' => 'update', 'id' => '1', 'data' => data }
    assert_equal expected_response, put_response
  end
  should 'put a collection' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    put_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      put_response = client.responses.put(data)
    end
    expected_response = { 'action' => 'replace', 'data' => data }
    assert_equal expected_response, put_response
  end

  should 'send and parse response json data' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'], :JSON)
    post_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      post_response = client.responses(1).post(data)
    end
    expected_response = { 'action' => 'add', 'id' => '1', 'data' => data }
    assert_equal expected_response, post_response
  end
  should 'send and parse response xml data' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'], :XML)
    post_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      post_response = client.responses(1).post(data)
    end
    expected_response = { 'action' => 'add', 'id' => '1', 'data' => data }
    assert_equal expected_response, post_response
  end
  #should 'send and parse response yaml data' do
  #  client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'], :YAML)
  #  post_response = nil
  #  data = {
  #    'test' => 'data'
  #  }
  #  assert_nothing_raised do
  #    post_response = client.responses(1).post(data)
  #  end
  #  expected_response = { 'action' => 'add', 'id' => '1', 'data' => data }
  #  assert_equal expected_response, post_response
  #end
  should 'allow building of request path prior to request' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    object = client.responses(1)
    assert object.class.to_s, 'RESTRack::Balancer'
    assert object.const_get(:path), '/responses/1'
  end
  should 'pivot' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    object = client.responses(1)
    get_response = nil
    assert_nothing_raised do
      get_response = object.get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
  end
  should 'walk a relation path to a child resource' do
    client = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293'])
    post_response = nil
    data = {
      'test' => 'data'
    }
    assert_nothing_raised do
      post_response = client.parent(1).responses.post(data)
    end
    expected_response = { 'action' => 'add', 'id' => '1', 'data' => data }
    assert_equal expected_response, post_response
  end

end
