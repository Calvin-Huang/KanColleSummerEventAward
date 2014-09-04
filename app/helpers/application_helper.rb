module ApplicationHelper
  def nav_item(link, options = nil, &block)
    options ||= {}
    options[:class] ||= ''

    if options[:rule].nil?
      # set up active
      options[:class] << ' active' if current_page?(link)
    else
      options[:class] << ' active' if request.env['PATH_INFO'] =~ options[:rule] || request.env['REQUEST_URI'] =~ options[:rule]
      options[:rule] = nil
    end

    if block_given?
      content_tag_string(:li, capture(&block), options, true)
    else
      content_tag_string(:li, nil, options, true)
    end
  end
end
