def circle_area(radius)
  # TODO: Implement the `circle_area` method
  if radius.negative?
    return 0
  else
    return 3.14 * (radius * radius)
  end
end
