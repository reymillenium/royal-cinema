class Reference < ApplicationRecord

  # Trix ActionText
  has_rich_text :letter

  #  Relations
  has_one :action_text_rich_text,
          class_name: 'ActionText::RichText',
          as: :record

end
