class Array
  def sequences
    a = sort.uniq.inject([]){|a, e|
      a.last && e == a.last.last + 1 ? a.last.push(e) : a.push([e])
      a
    }
    a.push([*a.pop, *a.shift]) if a.first.first == 1 && a.last.last == 13
    a
  end
end