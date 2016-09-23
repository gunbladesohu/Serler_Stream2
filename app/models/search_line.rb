class SearchLine < ActiveRecord::Base
  belongs_to :search_query, foreign_key: :search_query_id
  belongs_to :field_table, foreign_key: :field_id

  attr_accessor :join_condition_txt, :search_field_txt, :opertator_txt, :value
end
