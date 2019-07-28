class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_initialize :default_values, if: :need_set_default_values?

  def default_values
    self.class::DEFAULT_VALUES.each do |column_name,  default_value|
      send(:"#{column_name}=", default_value) if send(column_name).blank?
    end
  end

  def need_set_default_values?
    new_record? && self.class.const_defined?('DEFAULT_VALUES')
  end

  def self.human_attribute_enum(enum_name, key_is_number = false)
    self.send(enum_name.pluralize).map do |enum_key, enum_value|
      key = if key_is_number
              enum_value
            else
              enum_key
            end
      [key, self.human_attribute_name("#{enum_name}.#{enum_key}")]
    end.to_h
  end

  def self.filter_search_conditions(conditions)
    columns = conditions.map { |condition| " #{condition[:column]} #{condition[:operator]} (?) "}.join(" AND ")
    values =  conditions.map { |condition| condition[:value] }

    where(columns, *values)
  end

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}/#{enum_name.to_s}.#{enum_value}")
  end


end
