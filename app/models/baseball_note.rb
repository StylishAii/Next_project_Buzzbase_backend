class BaseballNote < ApplicationRecord
  belongs_to :user

  def extract_and_truncate_memo
    return "" unless self.memo.present?

    memo_data = JSON.parse(self.memo)
    texts = memo_data.map { |paragraph| paragraph["children"].map { |child| child["text"] }.join }.join
    texts.truncate(120)
  end
end
