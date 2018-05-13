class ActiveRecord::Base

  # need this now that we are using the strong_parameters gem
  include ActiveModel::ForbiddenAttributesProtection

  # new method by brian to delegate scope to an association.
  # use it just like delegate, e.g.
  #   delegate_scope :scope_name, :to => :association_name
  def self.delegate_scope(*methods)
    options = methods.pop
    raise "Need to pass in :to => :delegatee" unless options[:to]

    association = options[:to]
    delegatee_class = self.reflect_on_association(association).class_name.constantize

    # merging in the association's scope method, but removing the association class' default_scope,
    # as that default_scope is not relevant to the delegator class
    methods.each do |method|
      scope method, lambda { self.joins(association).merge(delegatee_class.unscoped.send(method)) }
    end
  end

  # didn't want to have to include the whole javascript helper - copied from the rails source
  def self.escape_javascript(text)
    return '' unless text
    text.gsub('\\','\0\0').gsub('</','<\/').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
  end

  # we're always using this
  def self.field_names
    fields = self.columns.map(&:name).map(&:to_sym) - [:id]
    resource_names = fields.map{ |field|
      field_string = field.to_s
      field_string.match(/_id$/) ? field_string.gsub(/(_id)$/, '').to_sym : nil
    }.compact
    fields + resource_names
  end

  # pass in a hash with many attributes/key-value pairs that are not part of this model.
  # the return value will be any matching model attribute keys in the passed-in hash.
  # IMPORTANT! the original hash will have these matching key-value pairs removed.
  def self.valid_attributes_from(hash)
    valid_hash = hash.with_indifferent_access.slice(*self.field_names)
    valid_hash.keys.each do |key|
      hash.delete(key.to_s)
      hash.delete(key.to_sym)
    end
    # hash.except!(*valid_hash.keys)  # doesn't work with symbol keys
    valid_hash
  end

  def self.select_options_to_hash(select_options)
    select_options.inject({}) { |hash, (name, type)|
      hash[type] = name
      hash
    }
  end

  def escape_javascript(text)
    self.class.escape_javascript(text)
  end

  # making the I18n.translate helper available in models
  # these should be in active record too!!!
  def self.t(translation, options = {})
    I18n.t(translation, options)
  end

  def t(translation, options = {})
    I18n.t(translation, options)
  end

  def self.create_method(use_transaction = false)
    use_transaction ? :create! : :create
  end

  def self.save_method(use_transaction = false)
    use_transaction ? :save! : :save
  end

  # utility methods to get the translated field name on an active record model
  include I18nSupplementalHelper
  extend I18nSupplementalHelper

  # this method will take a list of primary ids
  # and set the 'position' field values in the sequence of the array.
  # it uses a little documented method in MySQL 5.0:
  # ORDER BY FIELD(field_name, comma_separated_list_of_field_values)
  def self.set_order_by_ids(ids)
    return if ids.empty?
    ids_string = ids.compact.map { |id| id.to_i }.join(',')
    self.connection.execute("SET @row = 0;")
    sql = <<-SQL
      UPDATE #{self.table_name}
      SET position = @row := (@row + 1)
      WHERE (id IN (#{ids_string}))
      ORDER BY FIELD(id, #{ids_string});
    SQL
    self.connection.execute(sql.to_single_line)
  end

  def self.reset_all_callbacks
    [:validate, :save, :update, :create, :destroy].each do |action|
      self.reset_callbacks(action)
    end
  end

end
