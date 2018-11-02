require 'lock'

class Diary

  attr_accessor :lock

  def initialize
    @entry = ''
    @lock = Lock.new
  end

  def add_entry(entry = "")
    raise "#{self.class.name} is locked" if @lock.locked
    @entry.concat(entry)
  end

  def get_entry
    raise "#{self.class.name} is locked" if @lock.locked
    @entry
  end

end
