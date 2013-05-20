Book = Struct.new(:title, :isbn, :rating) do
  def self.all
    [
      # goodreads.com

      new("To Kill a Mockingbird", "0061120081", 4.22),
      new("Pride and Prejudice", "0679783261", 4.23),
      new("Jane Eyre", "0142437204", 4.06),
      new("The Little Prince", "0156012197", 4.21)
    ]
  end
end
