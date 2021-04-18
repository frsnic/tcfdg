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
      def handle_valid(title, records) # make sure only one
        self.handle = title if handle.blank?
        handle = unique_handle = Models::Handle.handleize(self.handle)
        number = 1
        condition = ''
        condition = "id != #{id}" unless new_record?
        while records.where(condition).where(handle: unique_handle).any?
          unique_handle = "#{handle}-#{number}"
          number += 1
        end
        self.handle = unique_handle
      end
    end
  end
end
