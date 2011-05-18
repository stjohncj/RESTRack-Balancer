class TestApp::ResponsesController < RESTRack::ResourceController

  def method_missing(method_name, *args)
    {
      :method_called => method_name.to_s,
      :args => args.join(':')
    }
  end

  def index
    {
      :action => :index
    }
  end
  
  def create
    {
      :action => :create,
      :data => @input
    }
  end

  def replace
    {
      :action => :replace,
      :data => @input
    }
  end

  def drop
    {
      :action => :destroy
    }
  end

  def show(id)
    {
      :action => :show,
      :id => id
    }
  end

  def update(id)
    {
      :action => :update,
      :id => id,
      :data => @input
    }
  end

  def destroy(id)
    {
      :action => :delete,
      :id => id
    }
  end

  def add(id)
    {
      :action => :add,
      :id => id,
      :data => @input
    }
  end

end
