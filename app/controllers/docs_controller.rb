# frozen_string_literal: true

# DocksController to serve json docs for swagger documentation
class DocsController < ActionController::Base
  def index
    render json: ApiDocsBuilder.config
  end
end
