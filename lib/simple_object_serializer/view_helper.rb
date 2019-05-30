module SimpleObjectSerializer
  class ViewHelper
    def serialize_objects(objects, parameters)
      new_object = {}
      parameters.each do |parameter_index, parameter|
        if parameter.empty?
          new_object[parameter_index] = objects[parameter_index]
        else
          parameter.each do |key|
            new_object[parameter_index] = {} if new_object[parameter_index].nil?
            new_object[parameter_index][key] = objects[parameter_index][key]
          end
        end
      end
      new_object
    end
  end
end
