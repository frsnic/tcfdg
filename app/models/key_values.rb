module KeyValues

  class Base < ActiveHash::Base

    def self.options
      all.map {|t| [t.name, t.code]}
    end

    # {code1: name1, code2: name2}
    def self.hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end

    def self.find_by_code(code)
      super(code.to_s)
    end

  end

  module Post

    class Status < KeyValues::Base

      self.data = [
        { id: 1, name: '公開', code: 'publish' },
        { id: 2, name: '草稿', code: 'draft'   }
      ]

    end

  end

end
