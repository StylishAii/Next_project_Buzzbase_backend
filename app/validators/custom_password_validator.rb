class CustomPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    return if value =~ /\A[a-zA-Z0-9]+\z/

    record.errors.add(attribute, :invalid, message: 'は半角英数字のみ使用できます')
  end
end
