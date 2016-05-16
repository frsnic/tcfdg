module Models

  module Handle

    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end

    def self.handleize(input) # 中文轉拼音、去掉首尾空格、轉小寫、空白和小數點轉為橫槓(-)、删除其他特殊字符
      Pinyin.t(input).gsub(/[^\w\-\s\.]/, '').strip.downcase.gsub(/\s+|\./, '-')
    end

    module ClassMethods
    end

    module InstanceMethods

      def handle_valid(records) # make sure only one
        self.handle = self.title if self.handle.blank?
        unique_handle = Models::Handle.handleize(self.handle)
        number = 1
        condition = {}
        condition[:id.not_eq] = self.id unless self.new_record?
        while records.exists?(condition.merge(handle: unique_handle))
          unique_handle = "#{unique_handle}-#{number}"
          number += 1
        end
        self.handle = unique_handle
      end

    end

  end

end
