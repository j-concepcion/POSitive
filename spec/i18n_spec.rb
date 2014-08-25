# spec/i18n_spec.rb:
require 'rails_helper'
require 'i18n/tasks'

describe 'I18n' do
  let(:i18n) { I18n::Tasks::BaseTask.new }

  it 'does not have missing keys' do
    expect(i18n.missing_keys).to be_empty
  end

  it 'does not have unused keys' do
    pending("implementation of localizaton")
    expect(i18n.unused_keys).to be_empty
  end
end