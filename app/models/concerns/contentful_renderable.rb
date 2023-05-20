module ContentfulRenderable
  extend ActiveSupport::Concern

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def client
      @client ||= Contentful::Client.new(
        access_token: Rails.application.credentials.contentful.access_token,
        space: Rails.application.credentials.contentful.space_id,
        dynamic_entries: :auto,
        raise_errors: true
      )
    end

    def render(entry_id)
      client.entry(entry_id, include: 2)
    end

    def render_all(content_type_id)
      client.entries(content_type: content_type_id, include: 2)
    end
  end
end
