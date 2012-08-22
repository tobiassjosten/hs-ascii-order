guard :shell do
  watch(%r{.+\.l?hs$}) do |m|
    `runghc #{m[0]}`
  end
end

# vim:ft=ruby
