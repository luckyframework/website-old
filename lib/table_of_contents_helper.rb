module TableOfContentsHelper
  def body_for(resource)
    resource.render(layout: nil)
  end

  def doc_for(resource)
    html = body_for(resource)
    Nokogiri::HTML::DocumentFragment.parse(html)
  end

  def toc_link(heading)
    content_tag(:a, heading.text, href: "#" + heading[:id], class: "intro-card__link")
  end

  def toc_item(heading)
    content_tag(:li, toc_link(heading))
  end

  def heading_nodes(resource)
    doc_for(resource).css('h2')
  end

  def table_of_contents(resource)
    list = heading_nodes(resource).map do |heading|
      toc_item(heading)
    end.join

    content_tag(:ul, list)
  end
end
