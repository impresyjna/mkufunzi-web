module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Trener-Mkufunzi"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def card_indicies
    @card_indicies = CardIndex.all
  end

end
