# frozen_string_literal: true

class NodesController < ApplicationController
  # GET /v1/nodes/<id>
  def show
    not_implemented
  end

  # POST /v1/nodes/<id>/create_sensor
  def create_sensor
    not_implemented
  end

  # GET /v1/nodes/<id>/get_sensors
  def get_sensors
    not_implemented
  end

  # POST nodes/<id>/create_sensor_data?{ sensors : {{ mac : <mac>, sensor_data : {{ value:<value>, unity:<unity> },{ value:<value>, unity:<unity> }}}}}
  # TODO: test, check if sensor is owned by node, require params
  def create_sensor_data
    # permitted = params.permit(:id, :sensors => [:mac, :sensor_data => [:value, :unity]])
    # node = Node.find(params[:id])
    # render status: 404 and return if !node
    #
    # permitted[:sensors].each do |s|
    #   # find sensor and build up sensor_data
    #   sensor = node.sensors.find_by(mac: s[:mac])
    #   render status: 404 and return if !sensor
    #
    #   sensor_data = []
    #   s[:sensor_data].each do |data|
    #     #sensor_data << sensor.sensor_data.new(data)
    #     data = sensor.sensor_data.new(data)
    #     data.save!
    #   end
    #   # use bulk import for all the sensor_data
    #   # SensorDatum.import sensor_data
    # end
    # render status: 200
  end
end
