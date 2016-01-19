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

  # Returns all types of measure.
  def measure_types
    @measure_type = MeasureType.all
  end

end
