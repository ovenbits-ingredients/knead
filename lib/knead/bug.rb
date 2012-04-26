# Utility class for logging bugs
module Knead
  class Bug
    class NoRedisStoreFound < StandardError; end

    def initialize(attributes = {})
      @attributes = attributes

      @id = @attributes[:id] if @attributes[:id]

      unless Redis.current
        raise NoRedisStoreFound
      end
    end

    def id
      @id ||= Time.now.to_i
    end

    def save
      @attributes.reverse_merge!({
        :id => id,
        :timestamp => Time.now.to_s(:db),
        :environment => Rails.env
      })

      attrs = @attributes.keys.map { |k| [ k.to_s, @attributes[k].to_s] }.flatten

      redis_store.hmset("knead:bugs:#{id}", *attrs)
      redis_store.lpush("knead:bugs:recent", id)
    end

    class << self
      def create(attributes)
        new(attributes).save
      end
    end

    private
      def redis_store
        @redis ||= Redis.current
      end
  end
end