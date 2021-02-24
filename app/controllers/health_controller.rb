require_relative "../healthchecker"

class HealthController < ApplicationController

  def index
    @checks = Hash[Healthchecker.metrics(
      Rails.application.config.x.healthchecks)]

    result = ERB.new(Rails.application.config.x.template).result(binding)

    render plain: result
  end

  def details

    render json:  Healthchecker.overview(
      Rails.application.config.x.healthchecks)
  end

  def health
    render json: {status: "ok"}
  end
end