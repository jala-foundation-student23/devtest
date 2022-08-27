class GlobalCat
  include HTTParty
  base_uri 'cataas.com/cat'

  def initialize
    @options = []
  end

  def get_cat
    self.class.get('/', @options)
  end

  def get_tag
    self.class.get('/cat/tag', @options)
  end
end