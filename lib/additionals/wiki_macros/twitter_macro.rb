# frozen_string_literal: true

module Additionals
  module WikiMacros
    module TwitterMacro
      Redmine::WikiFormatting::Macros.register do
        desc <<-DESCRIPTION
    Creates link to twitter account page or topic.

    Syntax:

    {{twitter(name)}}

    Parameters:

      :param string profile: Twitter profile name with @. E.g. alphanodes

    Examples:

    {{twitter(alphanodes)}} - Show link to twitter profile `@alphanodes`
    {{twitter(#redmine)}} - Show link to hashtag `#redmine`
        DESCRIPTION

        macro :twitter do |_obj, args|
          raise 'The correct usage is {{twitter(<name>)}}' if args.empty?

          name = args[0].strip
          case name[0]
          when '@'
            link_to_external svg_icon_tag('twitter', label: name),
                             "https://twitter.com/#{name[1..]}",
                             class: 'twitter',
                             title: l(:label_twitter_account)
          when '#'
            link_to_external svg_icon_tag('twitter', label: name),
                             "https://twitter.com/hashtag/#{name[1..]}",
                             class: 'twitter',
                             title: l(:label_twitter_hashtag)
          else
            link_to_external svg_icon_tag('twitter', label: "@#{name}"),
                             "https://twitter.com/#{name}",
                             class: 'twitter',
                             title: l(:label_twitter_account)
          end
        end
      end
    end
  end
end
