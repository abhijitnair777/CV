module EducationsHelper
  def options_for_type
    options_for_select Qualification.all.map{ |type| [type.qualification_type, type.id] }
  end
end
