namespace :swagger do
  desc 'start the swagger server instance'
  task start: :environment do
    ENV['API_URL'] ||= 'http://localhost:3000/docs'

    port = ENV['PORT'].presence || 80

    puts "starting swagger-ui at 'http://localhost:#{port}' against '#{ENV['API_URL']}'"
    exec("docker run -p #{port}:8080 -e API_URL swaggerapi/swagger-ui")
  end

  task install: :environment do
    exec('docker pull swaggerapi/swagger-ui')
  end
end
