class Diary

  def initialize
    @locked = true
    @entry = ''
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(entry = "")
    raise "#{self.class.name} is locked" if @locked
    @entry.concat(entry)
  end

  def get_entry
    raise "#{self.class.name} is locked" if @locked
    @entry
  end

end
