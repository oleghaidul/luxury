class Subdomain
  def self.matches?(request)
    request.subdomain(2).present? && request.subdomain(2) != "www"
  end
end