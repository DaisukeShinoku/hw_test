1.upto(100) do |i|
  Message.create!(title: "Title#{i.to_s}", content: "Content#{i.to_s}")
end
