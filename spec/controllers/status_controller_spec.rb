# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatusController do
  describe '#index' do
    subject(:action) do
      get :index, params: { format: :json }
    end

    context 'without login' do
      it 'works' do
        action
        expect(response).to be_successful
      end
    end
  end
end
