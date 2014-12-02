module BooksHelper

  def image_for(book)
    if book.nil? || book.image_file_name.blank?
      image_tag('book.png')
    else
      image_tag(book.image_file_name)
    end
  end

end
