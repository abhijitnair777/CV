module EducationsHelper
  def options_for_type
    options_for_select Qualification.all.map{ |type| [type.qualification_type, type.id] }
  end

  def options_for_id
    options_for_select current_user.resumes.all.map{ |resume| [resume.objective, resume.id] }
  end
end
