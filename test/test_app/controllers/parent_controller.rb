class TestApp::ParentController < RESTRack::ResourceController
  
  has_relationship_to :responses do |id|
    id
  end

  def index

  end
  
  def create

  end

  def replace

  end

  def destroy

  end

  def show(id)

  end

  def update(id)

  end

  def delete(id)

  end

  def add(id)

  end

end
