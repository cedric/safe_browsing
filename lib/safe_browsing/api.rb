module SafeBrowsing
  
  class API
    
    HOST = 'sb-ssl.google.com'
    
    attr_accessor :api_key
    attr_accessor :client_key
    attr_accessor :wrapped_key
    attr_accessor :version
    
    def initialize(api_key)
      @api_key ||= api_key
    end
    
    def getkey
      status, response = query("https://#{HOST}/safebrowsing/getkey?client=api")
      if status.code.eql?('200')
        @client_key, @wrapped_key = response.split.map { |k| k.split(':').last }
      end
    end
    
    def update(*args)
      # construct api arguments
      args = { :client => 'api' }
      args.merge!({ :apikey => @api_key })
      args.merge!({ :version => 'goog-black-hash:1:-1' })
      args.merge!({ :wrkey => @wrapped_key })
      args = args.map { |key, value| "#{key.to_s}=#{value}" }.join('&')
      # execute api query
      status, response = query("http://#{HOST}/safebrowsing/update?#{args}")
      # parse results
      results = response.to_a.map{|line|line.strip}.compact
      results.first.scan(/^\[goog-(black|malware)-hash (\d+\.\d+) ?(update|)\](\[mac=(.*)\])?/)
      # verify api query
      # getkey if @verify
      # verify if @verify
      # goog-black-hash:1:-1
      # goog-black-hash:1:-1,goog-malware-hash:1:-1
    end
    
    protected
      
      def query(uri)
        uri = URI.parse(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme.eql?('https')
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http.get([uri.path, uri.query].join('?'))
      end
      
      def verify
        client_key = Base64.decode64(@client_key)
        # s = "+8070465bdf3b9c6ad6a89c32e8162ef1\t\n+86fa593a025714f89d6bc8c9c5a191ac\t\n+bbbd7247731cbb7ec1b3a5814ed4bc9d\t\n"
        # client_key = "8eirwN1kTwCzgWA2HxTaRQ==".decode('base64')                            
        # hashlib.md5("%s%s%s%s%s" % (client_key, ":coolgoog:", s, ":coolgoog:", c)).digest().encode("base64")
        # 'dRalfTU+bXwUhlk0NCGJtQ==\n'
      end
  
  end
  
end
