actions :create, :update, :delete

attribute :filename, :kind_of => String

def initialize(name, run_context=nil)
  super
  @action = :update
  @filename = name
end
