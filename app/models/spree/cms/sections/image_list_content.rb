module Spree::Cms::Sections
  class ImageListContent < Spree::CmsSection
    after_initialize :default_values
    validate :reset_multiple_link_attributes

    LINKED_RESOURCE_TYPE = ['Spree::Taxon', 'Spree::Product'].freeze

    store :content, accessors: [:link_type_one, :link_one, :title, :description], coder: JSON

    store :settings, coder: JSON

    #
    # img_one sizing
    def img_one_sm(dimensions = '170x170>')
      super
    end

    def img_one_md(dimensions = '170x170>')
      super
    end

    def img_one_lg(dimensions = '170x170>')
      super
    end

    private

    def reset_multiple_link_attributes
      if link_type_one_changed?
        return if link_type_one_was.nil?

        self.link_one = nil
      end
    end

    def default_values
      self.fit ||= 'Container'
      self.link_type_one ||= 'Spree::Taxon'
    end
  end
end