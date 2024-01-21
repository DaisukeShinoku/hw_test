1.upto(3) do |i|
  Message.create!(title: "Title#{i.to_s}", content: "Content#{i.to_s}")
end
