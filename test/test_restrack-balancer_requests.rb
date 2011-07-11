require File.expand_path( File.join( File.dirname(__FILE__), 'helper' ) )

class TestRESTRackBalancer < Test::Unit::TestCase

  should 'iterate over servers' do
    used_servers = []

    balancer = RESTRack::Balancer.new(['http://localhost:9292', 'http://localhost:9293', 'http://localhost:9294'])
    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    used_servers << balancer.last_client
    first = balancer.last_client

    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    assert !used_servers.include?(balancer.last_client)
    used_servers << balancer.last_client
    second = balancer.last_client

    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    assert !used_servers.include?(balancer.last_client)
    third = balancer.last_client

    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    assert_equal first, balancer.last_client

    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    assert_equal second, balancer.last_client

    get_response = nil
    assert_nothing_raised do
      get_response = balancer.responses(1).get
    end
    expected_response = { 'action' => 'show', 'id' => '1' }
    assert_equal expected_response, get_response
    assert_equal third, balancer.last_client
  end

end
