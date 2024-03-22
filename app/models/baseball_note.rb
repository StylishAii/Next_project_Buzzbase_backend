class BaseballNote < ApplicationRecord
  belongs_to :user

  def extract_and_truncate_memo
    return '' if memo.blank?

    memo_data = JSON.parse(memo)
    texts = memo_data.map { |paragraph| paragraph['children'].pluck('text').join }.join
    texts.truncate(120)
  end
end
