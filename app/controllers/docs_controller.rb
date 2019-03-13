# frozen_string_literal: true

# DocksController to serve json docs for swagger documentation
class DocsController < ActionController::Base
  CONFIG_FILE = Rails.root.join('config', 'api.yml')

  def index
    render json: api_config
  end

  private

  def api_config
    @api_config ||= YAML.safe_load(ERB.new(CONFIG_FILE.read).result)
  end
end
