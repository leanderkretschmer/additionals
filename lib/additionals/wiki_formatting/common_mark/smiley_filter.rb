# frozen_string_literal: true

module Additionals
  module WikiFormatting
    module CommonMark
      class SmileyFilter < HTML::Pipeline::Filter
        include Additionals::Formatter

        def call
          ignore_ancestor_tags = %w[pre code].to_set
          doc.xpath('descendant-or-self::text()').each do |node|
            content = node.to_html
            next if has_ancestor? node, ignore_ancestor_tags

            html = render_inline_smileys content
            next if html == content

            node.replace html
          end
          doc
        end
      end
    end
  end
end
