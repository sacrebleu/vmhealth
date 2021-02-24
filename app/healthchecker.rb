class Healthchecker

  def self.evaluate(endpoint)
    begin
      response = HTTParty.get(endpoint, timeout: 3)

      [response.code, response.body]
    rescue StandardError => e
      Rails.logger.error "Timeout connecting to #{endpoint}"
      [503, "Network error connecting to #{endpoint}"]
    end
  end

  def self.metrics(cfg)
    keys = cfg.keys

    res = []
    keys.map do |key|
      res <<
        [key.to_sym, {
          available: cfg[key].collect { |endpoint| Healthchecker.evaluate(endpoint)[0] == 200 ? 1 : 0 }.reduce(&:+),
          total: cfg[key].length
        }]
    end
    res
  end

  def self.overview(cfg)
    keys = cfg.keys

    res = {}
    keys.map do |key|
      res[key.to_sym] = {
          endpoints: cfg[key].collect { |endpoint| v = Healthchecker.evaluate(endpoint); v[0] == 200 ? "#{endpoint} - ok" : "#{endpoint}: error -  #{v[1]}" }
        }
    end

    pp res
    res

  end
end