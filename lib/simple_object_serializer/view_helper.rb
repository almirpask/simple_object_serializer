module SimpleObjectSerializer
  module ViewHelper
    def serialize_objects(objects, parameters)
      new_object = {}
      parameters.each do |parameter_index, parameter|
        if parameter.empty?
          new_object[parameter_index] = objects[parameter_index]
        else
          if objects[parameter_index].kind_of?(Array)
            new_object[parameter_index] = []
            objects[parameter_index].each do |object|
              array_object = {}
              parameter.each do |key|
                array_object[parameter_index] = {} if array_object[parameter_index].nil?
                array_object[parameter_index][key] = object[key]
              end
              new_object[parameter_index] << array_object[parameter_index]
            end
          else
            parameter.each do |key|
              new_object[parameter_index] = {} if new_object[parameter_index].nil?
              new_object[parameter_index][key] = objects[parameter_index][key]
            end
          end
        end
      end
      new_object
    end
  end
end
