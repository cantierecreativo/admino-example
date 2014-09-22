class Page < SitePrism::Page
  element :notice, ".alert-info"
  element :alert, ".alert-error"

  def has_record?(record)
    element_exists? "##{ActionView::RecordIdentifier.dom_id(record)}"
  end
end

