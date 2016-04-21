module Vasari
  class Embed < ActiveRecord::Base
    belongs_to :project, class_name: 'Vasari::Project', inverse_of: :embeds
    has_attached_file :preview, styles: { medium: "300x480#", thumb: "100x100" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/
    validates_presence_of :original_url
    before_save :set_embed_fields

    private

    def set_embed_fields
      response = EMBEDLY.extract(
        :url => self.original_url,
        :luxe => true
      )
      result = response[0].marshal_dump
      self.title = result[:title]
      self.provider = result[:provider_name]
      self.code = result[:media][:html]
      self.preview = URI.parse(result[:images][0]["url"]).open
    end
  end
end