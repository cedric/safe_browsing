module Google
  
  class SafeBrowsing
    
    attr_accessor :api_key
    
    def initialize(api_key)
      @api_key ||= api_key
    end
    
    protected
    
      def getkey
      end
      
      def update
      end
    
  end
  
end
