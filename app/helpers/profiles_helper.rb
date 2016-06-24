module ProfilesHelper
  def role(user)
    ((user.admin?) ? "Administrateur" : "Membre")
  end

  def status(user)
    return "Étudiant" if user.status == 0
    return "Ancien" if user.status == 1
    return "Professeur" if user.status == 2
  end
end
