class ContactPresenter < Showcase::Presenter
  include Showcase::Traits::Record

  GROUP_LABEL_CSS_CLASS = {
    work: 'label label-info',
    family: 'label label-success',
    friends: 'label label-primary',
  }.freeze

  def full_name
    [last_name, first_name].join(" ")
  end

  def group_label
    h.content_tag(:span, class: "label #{group_label_class}") do
      group_i18n
    end
  end

  def group_label_class
    GROUP_LABEL_CSS_CLASS[group.to_sym]
  end
end

