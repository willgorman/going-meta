require 'builder'

b = Builder::XmlMarkup.new

b.person { |p|
  p.name "Link"
  p.home "Hyrule"
}

# => "<person><name>Link</name><home>Hyrule</home></person>"