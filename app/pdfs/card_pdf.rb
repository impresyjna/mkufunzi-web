class CardPdf < Prawn::Document
  def initialize(card, mto,current_user)
    super()
    @current_user = current_user
    @card = card
    @measureTypeInfo = mto
    text_content
    table_content
  end

  def text_content
    text "Kartoteka uzytkownika ", :inline_format => true
    text @current_user.name.force_encoding("cp1252").encode("utf-8", undef: :replace), :inline_format => false
    text @current_user.surname.force_encoding("cp1252").encode("utf-8", undef: :replace), :inline_format => true
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

  def product_rows
    if @measureTypeInfo.extra_field == false
      [['#', @measureTypeInfo.name.force_encoding("cp1252").encode("utf-8", undef: :replace) , 'Data']] +
        @card.map.with_index do |data, index|
        [index+1, data.value, data.created_at.strftime("%Y-%m-%d %H:%M")]
      end
    else 
      [['#', @measureTypeInfo.name.force_encoding("cp1252").encode("utf-8", undef: :replace) , 'Data']] +
        @card.map.with_index do |data, index|
        [index+1, data.value.to_s + "/" + data.second_value.to_s , data.created_at.strftime("%Y-%m-%d %H:%M")]
      end
    end
  end
end