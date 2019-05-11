# frozen_string_literal: true

# OpenAPI schema
class ApiDocsBuilder
  CONFIG_FILES = Rails.root.join('config', 'docs').glob('**/*.yml')

  def self.config
    @config ||=
      CONFIG_FILES.map do |file|
        YAML.safe_load(ERB.new(file.read).result)
      end.inject(&:deep_merge)
  end

  def self.write(filename)
    File.write(filename, config.to_json)
  end
end
