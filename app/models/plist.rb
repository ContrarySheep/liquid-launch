class Plist
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :filename,
                :executable,
                :month,
                :weekday,
                :day,
                :hour,
                :minute,
                :argument_1,
                :argument_2,
                :argument_3,
                :argument_4,
                :argument_5
  
  validates_presence_of :filename, :executable
  validate :schedule_validation
  validate :filename_is_plist, :if => Proc.new { |plist| !plist.filename.blank? }
  validate :executable_is_posix, :if => Proc.new { |plist| !plist.executable.blank? }
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
  def filename_as_title
    if filename
      filename.gsub(/.plist\Z/,'')
    end
  end
  
  def filename_as_plist
    if filename
      filename
    end
  end
  
  private
  
  def schedule_validation
    if month && weekday && day && hour && minute
      if month.empty? && weekday.empty? && day.empty? && hour.empty? && minute.empty?
        errors.add :schedule, "can't be blank"
      end 
    end 
  end
  
  def filename_is_plist
    if !filename.match(/.plist\Z/)
      errors.add :filename, "should end with the '.plist' suffix"
    end
  end
  
  def executable_is_posix
    if !executable.match(/\A[\/|~\/]/)
      errors.add :executable, "should be entered with its full path"
    end
  end
  
end