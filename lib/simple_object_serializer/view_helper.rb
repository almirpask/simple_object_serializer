module SimpleObjectSerializer
  module ViewHelper
    def serialize_objects(parameters, objects)
      new_object = {}
      parameters.each do |parameter_index, parameter|
        parameter.each do |key|
          new_object[parameter_index] = {} if new_object[parameter_index].nil?
          new_object[parameter_index][key] = objects[parameter_index][key]
        end
      end
      new_object
    end
  end
end
